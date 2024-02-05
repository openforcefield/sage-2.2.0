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

    # Remove redundant torsions
    torsions_to_remove = ["t123"]
    torsion_handler = force_field.get_parameter_handler("ProperTorsions")
    for parameter_id in torsions_to_remove:
        parameters = torsion_handler.get_parameter({"id": parameter_id})
        assert len(parameters) == 1
        torsion_handler.parameters.remove(parameters[0])

    # Fix t65
    torsion = torsion_handler.get_parameter({"id": "t65"})[0]
    torsion.smirks = "[*:1]-[#6X4:2]-[#7X3:3](~[#8X1])~[#8X1:4]"

    # Write out file
    force_field.to_file(output_path)


if __name__ == "__main__":
    download_force_field()