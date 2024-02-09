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
    from openff.units import unit

    force_field = ForceField(force_field_name)

    angle_handler = force_field.get_parameter_handler("Angles")
    # Create a41, for internal r5 angles
    # Initial value taken from eyeballing the MSM distribution, but will be overwritten by actual MSM value.
    a41_param = angle_handler.AngleType(smirks = '[*;r5:1]1@[*;r5:2]@[*;r5:3]@[*;r5]@[*;r5]1', angle=105.0*unit.degree,k=250.0*unit.kilocalories_per_mole / (unit.radian**2),id='a41')
    angle_handler.add_parameter(parameter=a41_param)

    # Create a41a, for internal r5 angles with S as the central atom
    a41a_param = angle_handler.AngleType(smirks = '[*;r5:1]1@[*;r5:2]@[*;r5:3]@[*;r5]@[*;r5]1', angle=105.0*unit.degree,k=250.0*unit.kilocalories_per_mole / (unit.radian**2),id='a41a')
    angle_handler.add_parameter(parameter=a41a_param)

    # Move a7 to the end, make more general
    a7_param = angle_handler.get_parameter({'id':'a7'})[0]
    angle_handler.parameters.remove(a7_param)
    a7_param.smirks = '[*;r4:1]1-;@[*;r4:2]-;@[*;r4:3]-;@[*;r4]1'
    angle_handler.add_parameter(parameter=a7_param)
   
    # Change a8 and a9 SMIRKs
    a8_param = angle_handler.get_parameter({'id':'a8'})[0]
    a8_param.smirks = '[!#1:1]-[*;r4:2]-;!@[!#1:3]'
    a9_param = angle_handler.get_parameter({'id':'a9'})[0]
    a9_param.smirks = '[!#1:1]-[*;r4:2]-;!@[#1:3]'

    # Move a3 to the end
    a3_param = angle_handler.get_parameter({'id':'a3'})[0]
    angle_handler.parameters.remove(a3_param)
    angle_handler.add_parameter(parameter=a3_param)

    # Remove a22a
    a22a_param = angle_handler.get_parameter({'id':'a22a'})[0]
    angle_handler.parameters.remove(a22a_param)

    # Create a13a
    a13_param = angle_handler.get_parameter({'id':'a13'})[0]
    a13_smirks = a13_param.smirks
    a13a_param = angle_handler.AngleType(smirks='[*;r6:1]~;@[*;r5;x4,*;r5;X4:2]~;@[*;r5;x2:3]',angle=a13_param.angle,k=a13_param.k,id='a13a')
    angle_handler.add_parameter(parameter=a13a_param,after=a13_smirks)

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
