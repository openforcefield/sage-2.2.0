# Force field generation

This directory contains the script for generating the initial force field and parameters to fit. Example usage:

```bash
micromamba activate fb-195-tk-014-py310

python generate-forcefield.py                                   \
    --force-field-name  "openff_unconstrained-2.1.0.offxml"     \
    --output            "output/initial-force-field.offxml"

```