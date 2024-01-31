import click


@click.command()
@click.option(
    "--output",
    "output_path",
    type=click.Path(exists=False, dir_okay=False, file_okay=True),
    required=True,
    help="The path to the output force field file.",
)
@click.option(
    "--force-field-name",
    type=str,
    default="openff_unconstrained-2.1.0.offxml",
    help="The name of the force field to download.",
    show_default=True,
)
def download_force_field(
    output_path: str,
    force_field_name: str = "openff_unconstrained-2.1.0.offxml",
):
    from openff.toolkit import ForceField

    force_field = ForceField(force_field_name)
    force_field.to_file(output_path)


if __name__ == "__main__":
    download_force_field()