from openff.interchange.drivers.all import get_openmm_energies
from openff.toolkit import ForceField, Molecule, Topology
from openff.toolkit.typing.engines.smirnoff import LibraryChargeHandler, vdWHandler, ConstraintHandler
from openff.units import Quantity, unit

# Delete cosmetic attributes
force_field = ForceField('openff_unconstrained-2.2.0-rc1-nor4.offxml',allow_cosmetic_attributes=True)
bond_handler = force_field.get_parameter_handler("Bonds")
angle_handler = force_field.get_parameter_handler("Angles")
prop_handler = force_field.get_parameter_handler("ProperTorsions")
improp_handler = force_field.get_parameter_handler("ImproperTorsions")

for bond in bond_handler:
    try:
        bond.delete_cosmetic_attribute('parameterize')
    except AttributeError:
        pass

for angle in angle_handler:
    try:
        angle.delete_cosmetic_attribute('parameterize')
    except AttributeError:
        pass

for prop in prop_handler:
    try:
        prop.delete_cosmetic_attribute('parameterize')
    except AttributeError:
        pass

for improp in improp_handler:
    try:
        improp.delete_cosmetic_attribute('parameterize')
    except AttributeError:
        pass


# Add the new parameters, from:
# Tang, K.T., Toennies, J.P. New combining rules for well parameters and shapes
# of the van der Waals potential of mixed rare gas systems. Z Phys D - Atoms,
# Molecules and Clusters 1, 91–101 (1986). https://doi.org/10.1007/BF01384663
# epsilon is converted from Hartrees using 0.894e-3 Ha * 627.5094740631 kcal/mol / Ha = 0.560993470 kcal/mol
# --> 0.561 kcal/mol preserving the initial number of significant figures
xe_vdw_param = vdWHandler.vdWType(
    smirks="[#54:1]",
    epsilon=0.561 * unit.kilocalorie / unit.mole,
    sigma=4.363 * unit.angstrom,
    id="n36",
)

xe_charge_param = LibraryChargeHandler.LibraryChargeType(
    smirks="[#54:1]", charge1=0.0 * unit.elementary_charge, id="Xe"
)

force_field.get_parameter_handler("vdW").parameters.append(xe_vdw_param)
force_field.get_parameter_handler("LibraryCharges").parameters.append(xe_charge_param)

# Save unconstrained version
force_field.to_file('../openff_unconstrained-2.2.0-rc1.offxml')

# Add constraints
constraint_handler = force_field.get_parameter_handler('Constraints')
constraint_param = constraint_handler.ConstraintType(smirks="[#1:1]-[*:2]", id="c1")
constraint_handler.add_parameter(parameter=constraint_param,before=0)
force_field.to_file('../openff-2.2.0-rc1.offxml')

# Make sure new FF loads with most recent toolkit version
test_uc = ForceField(
    "../openff_unconstrained-2.2.0-rc1.offxml"
)
test_c = ForceField('../openff-2.2.0-rc1.offxml')

# make sure that Xe is treated correctly
topology = Topology.from_molecules(
    [
        Molecule.from_smiles("[Xe]"),
        Molecule.from_smiles("[Xe]"),
    ]
)

x = 5
# Place them a few A apart
topology.set_positions(
    Quantity(
        [
            [0.0, 0.0, 0.0],
            [
                x,
                0.0,
                0.0,
            ],
        ],
        unit.angstrom,
    )
)

interchange = test_c.create_interchange(topology)

get_openmm_energies(interchange)['Nonbonded'].magnitude
