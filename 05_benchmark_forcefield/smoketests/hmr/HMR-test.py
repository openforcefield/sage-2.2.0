# Create an openforcefield Molecule object from SMILES
from openff.toolkit.topology import Molecule
import logging
import click

offlogger = logging.getLogger("openff")
offlogger.setLevel(logging.ERROR)
offlogger.propagate = False


@click.command()
@click.option(
    "-ff",
    "--ff",
    "ff_name",
    type=click.STRING,
    default="force-field-no-cosmetic-params.offxml",
)
def main(ff_name):
    hmr_mols = Molecule.from_file(
        "propynes.smi",
        file_format="smi",
        allow_undefined_stereo=True,
    )
    # Append coverage set, with known failures stripped out
    hmr_mols += Molecule.from_file(
        "coverage.smi",
        file_format="smi",
        allow_undefined_stereo=True,
    )

    # Define the keyword arguments to feed to ForceField; use heavy hydrogens and constrained X-H bonds
    # (Note that this differs a bit from allowing SMIRNOFF to control masses and cosntraints)
    fails = 0
    for ind, molecule in enumerate(hmr_mols):
        print(
            f"Running HMR with force field {ff_name} and molecule {ind} with SMILES {molecule.to_smiles()}"
        )
        try:
            from simtk import openmm, unit
            from simtk.openmm import app

            forcefield_kwargs = {
                "constraints": app.HBonds,
                "rigidWater": True,
                "removeCMMotion": False,
                "hydrogenMass": 4 * unit.amu,
            }
            # Initialize a SystemGenerator using GAFF
            from openmmforcefields.generators import SystemGenerator

            system_generator = SystemGenerator(
                small_molecule_forcefield=ff_name,
                forcefield_kwargs=forcefield_kwargs,
                molecules=molecule,
            )
            # Create an OpenMM System from an Open Force Field toolkit Topology object
            system = system_generator.create_system(molecule.to_topology().to_openmm())
            # Run a simulation
            temperature = 300 * unit.kelvin
            collision_rate = 1.0 / unit.picoseconds
            timestep = 4.0 * unit.femtoseconds
            # Use BAOAB
            integrator = openmm.LangevinMiddleIntegrator(
                temperature, collision_rate, timestep
            )
            context = openmm.Context(system, integrator)
            molecule.generate_conformers()
            conf_coords = molecule.conformers[0].to_openmm()#.m_as(unit.nanometer)
            context.setPositions(conf_coords)
            # Integrate
            niterations = 1000
            nsteps_per_iteration = 250
            for iteration in range(niterations):
                integrator.step(nsteps_per_iteration)
                state = context.getState(getEnergy=True)
        #             print(f'{state.getTime()/unit.picoseconds:12.3f} ps :  potential {state.getPotentialEnergy()/unit.kilocalories_per_mole:16.3f} kcal/mol')
        except Exception as err:
            # print(type(err),err)
            fails = +1
            print(ind, molecule.to_smiles(), "Failed HMR test")

    print("Total failures = ", fails)


if __name__ == "__main__":
    main()
