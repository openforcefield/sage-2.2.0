from collections import defaultdict, Counter
import functools
import json
import logging
import multiprocessing
import random
import typing

import numpy as np
import click
import tqdm

from openff.qcsubmit.results.filters import ResultRecordFilter

# suppress stereochemistry warnings
logging.getLogger("openff").setLevel(logging.ERROR)

from qcportal.models import TorsionDriveRecord, OptimizationRecord
from openff.qcsubmit.results import TorsionDriveResultCollection, OptimizationResultCollection
from openff.toolkit import ForceField, Molecule

def check_torsion_is_in_ring(
    molecule: "Molecule",
    indices: typing.Tuple[int, int, int, int],
) -> bool:
    """
    Check if a torsion is in a ring.

    If a torsion I-J-K-L is given, it checks
    whether all bonds I-J, J-K, and K-L are in a ring.
    
    """
    i, j, k, l = indices
    return (
        molecule.get_bond_between(i, j).is_in_ring()
        and molecule.get_bond_between(j, k).is_in_ring()
        and molecule.get_bond_between(k, l).is_in_ring()
    )


def label_and_tag_ids(
    record_and_molecule: typing.Tuple[
        typing.Union["TorsionDriveRecord", "OptimizationRecord"],
        "Molecule"
    ],
    force_field: "ForceField",
    parameter_types: typing.List[str],
    explicit_ring_torsions: typing.Optional[str] = None,
) -> typing.Set[typing.Tuple[str, str, int]]:
    from qcportal.models import TorsionDriveRecord

    if explicit_ring_torsions is not None:
        ring_torsions = np.loadtxt(explicit_ring_torsions, dtype=str)
    else:
        ring_torsions = []

    record, molecule = record_and_molecule
    mol_labels = force_field.label_molecules(molecule.to_topology())[0]
    parameter_ids = set()

    for parameter_type in parameter_types:
        parameter_labels = mol_labels[parameter_type]

        for indices, parameter in parameter_labels.items():
            # remove mismatching torsiondrives
            if isinstance(record, TorsionDriveRecord):
                # check central bond, i.e. middle 2 atoms
                record_atoms = record.keywords.dihedrals[0]
                if set(indices[1:3]) != set(record_atoms[1:3]):
                    continue
            
                # some general parameters overlap with in-ring torsions and
                # there are many torsion scans from Gen1 sets that have
                # in-ring torsions and we want to exclude them in training
                # as they result in higher k values unless the parameters
                # have smirks explicitly for an in-ring torsion. It is to be
                # noted that training on in-ring torsions is needed to
                # properly model puckering in rings with hetero atoms
                if parameter.id not in ring_torsions:
                    if check_torsion_is_in_ring(molecule, indices):
                        continue
            
            n_heavy_atoms = sum(
                1 for atom in molecule.atoms if atom.atomic_number != 1
            )
            parameter_ids.add((parameter.id, record.id, n_heavy_atoms))
    return parameter_ids


def get_parameter_distribution(
    dataset: typing.Union["TorsionDriveResultCollection", "OptimizationResultCollection"],
    parameter_types: typing.List[str],
    force_field: "ForceField",
    explicit_ring_torsions: typing.Optional[str] = None,
    n_processes: int = 4,
) -> typing.Tuple[Counter, typing.Dict[str, typing.List[typing.Tuple[int, str]]]]:
    coverage = Counter()
    parameter_records = defaultdict(list)

    func = functools.partial(
        label_and_tag_ids,
        force_field=force_field,
        parameter_types=parameter_types,
        explicit_ring_torsions=explicit_ring_torsions,
    )
    with multiprocessing.Pool(n_processes) as pool:
        for parameter_ids in tqdm.tqdm(
            pool.imap(func, dataset.to_records()),
            total=dataset.n_results,
        ):
            for parameter_id, record_id, n_heavy_atoms in parameter_ids:
                coverage[parameter_id] += 1
                parameter_records[parameter_id].append((n_heavy_atoms, record_id))
    
    return coverage, dict(parameter_records)



def select_parameters(
    dataset: typing.Union["TorsionDriveResultCollection", "OptimizationResultCollection"],
    parameter_types: typing.List[str],
    force_field: "ForceField",
    explicit_ring_torsions: typing.Optional[str] = None,
    n_processes: int = 1,
    min_coverage: int = 5,
):
    # determine parameter coverage in the dataset
    coverage, _ = get_parameter_distribution(
        dataset=dataset,
        parameter_types=parameter_types,
        force_field=force_field,
        explicit_ring_torsions=explicit_ring_torsions,
        n_processes=n_processes,
    )

    selected_parameters = defaultdict(list)
    for parameter_type in parameter_types:
        handler = force_field.get_parameter_handler(parameter_type)

        for parameter_id, count in coverage.items():
            # skip this parameter if it doesn't meet our coverage requirements
            if count < min_coverage:
                continue
            parameters = handler.get_parameter({"id": parameter_id})
            # skip if this isn't a valid parameter
            if not len(parameters):
                continue
            # otherwise save SMIRK to list of parameters to train
            selected_parameters[parameter_type].append(parameters[0].smirks)
    return selected_parameters




@click.group()
def cli():
    pass

@cli.command("download-td")
@click.option(
    "--output-parameter-smirks",
    "output_parameter_smirks_path",
    required=True,
    type=click.Path(exists=False, dir_okay=False, file_okay=True),
    help="The path to write the dataset to. Should be a JSON",
)
@click.option(
    "--filtered-td-dataset",
    "filtered_td_datasets",
    required=True,
    type=str,
    help="The name of a torsiondrive dataset to download.",
)
@click.option(
    "--initial-forcefield",
    required=True,
    type=str,
    help=(
        "The name of the initial force field to use. "
        "Alternatively, the path to a force field"
    )
)
@click.option(
    "--explicit-ring-torsions",
    type=click.Path(exists=True, dir_okay=False, file_okay=True),
    help=(
        "The path to a file containing a list of parameter IDs that are ring torsions. "
        "This should be a text file with one ID per line."
    ),
)
@click.option( # For TD dataset, ConformerRMSD is never applied, so can use more than one process
    "--n-processes",
    type=int,
    default=4,
    show_default=True,
    help="The number of processes to use when processing the data.",
)
@click.option(
    "--min-record-coverage",
    type=int,
    default=5,
    show_default=True,
    help=(
        "The minimum number of records a parameter must have to be included in the "
        "force field optimization."
    ),
)
def get_selected_params_td(output_parameter_smirks_path,filtered_td_datasets,initial_forcefield,explicit_ring_torsions,n_processes,min_record_coverage):

    filtered_td_datasets_oc = TorsionDriveResultCollection.parse_file(filtered_td_datasets)

    # Save SMIRKs patterns where there is enough coverage to train
    selected_parameters = select_parameters(
        filtered_td_datasets_oc,
        ["ProperTorsions"],
        force_field=ForceField(initial_forcefield,allow_cosmetic_attributes=True),
        explicit_ring_torsions=explicit_ring_torsions,
        n_processes=n_processes,
        min_coverage=min_record_coverage,
    )
    with open(output_parameter_smirks_path, "w") as file:
        json.dump(selected_parameters, file, indent=2)



@cli.command("download-opt")
@click.option(
    "--output-parameter-smirks",
    "output_parameter_smirks_path",
    required=True,
    type=click.Path(exists=False, dir_okay=False, file_okay=True),
    help="The path to write the dataset to. Should be a JSON",
)
@click.option(
    "--initial-forcefield",
    required=True,
    type=str,
    help=(
        "The name of the initial force field to use. "
        "Alternatively, the path to a force field"
    )
)
@click.option(
    "--filtered_opt_dataset",
    "filtered_opt_datasets",
    required=True,
    type=str,
    help=(
        "The name of an optimization dataset to download. "
        "These will have iodine molecules filtered out."
    ),
)
@click.option( # Due to Conformer RMSD filter, can only use 1 core for filtering
    "--n-processes",
    type=int,
    default=1,
    show_default=True,
    help="The number of processes to use when processing the data.",
)
@click.option(
    "--min-record-coverage",
    type=int,
    default=5,
    show_default=True,
    help=(
        "The minimum number of records a parameter must have to be included in the "
        "force field optimization."
    ),
)
def get_selected_params_opt(output_parameter_smirks_path,initial_forcefield,filtered_opt_datasets,n_processes,min_record_coverage):
    # identify parameters that have enough coverage to train
    filtered_opt_dataset_oc = OptimizationResultCollection.parse_file(filtered_opt_datasets)
    selected_parameters = select_parameters(
        filtered_opt_dataset_oc,
        ["Bonds", "Angles"],
        force_field=ForceField(initial_forcefield,allow_cosmetic_attributes=True),
        n_processes=n_processes,
        min_coverage=min_record_coverage,
    )
    with open(output_parameter_smirks_path, "w") as file:
        json.dump(selected_parameters, file, indent=2)


if __name__ == "__main__":
    cli()
