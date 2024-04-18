import typing
import click
from openff.qcsubmit.results.filters import (
    ConnectivityFilter,
    RecordStatusFilter,
    CoverageFilter)

from qcportal.record_models import RecordStatusEnum

@click.command()
@click.option(
    "--name",
    "names",
    multiple=True,
    type=str,
    help="Name of the dataset/s to download"
)
@click.option(
    "--type",
    "dataset_type",
    type=click.Choice(["optimization", "torsiondrive"]),
    help="dataset type"
)
@click.option(
    "--output",
    "output_path",
    type=click.Path(exists=False, file_okay=True, dir_okay=False),
    help="Output path"
)
@click.option(
    "--filter_output",
    "filter_output",
    type = click.Path(exists=False,file_okay=True,dir_okay=False),
    help = "Output path for filtered ds"
)
def download_dataset(
    names: list[str],
    dataset_type: typing.Literal["optimization", "torsiondrive"],
    output_path: str,
    filter_output: str
):
    from qcportal import PortalClient
    from openff.qcsubmit.results import OptimizationResultCollection, TorsionDriveResultCollection

    client = PortalClient("https://api.qcarchive.molssi.org:443")
    COLLECTIONS = {
        "optimization": OptimizationResultCollection,
        "torsiondrive": TorsionDriveResultCollection,
    }
    dataset = COLLECTIONS[dataset_type.lower()].from_server(
        client=client,
        datasets=names,
        spec_name="default",
    )
    with open(output_path, "w") as f:
        f.write(dataset.json(indent=2))

    dataset_filtered = dataset.filter( RecordStatusFilter(status=RecordStatusEnum.complete),
                                       ConnectivityFilter(tolerance=1.2)
                                     )

    with open(filter_output,'w') as f: 
        f.write(dataset_filtered.json(indent=2))

if __name__ == "__main__":
    download_dataset()
