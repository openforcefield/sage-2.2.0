#!/bin/bash


source ~/.bashrc
conda activate fb_196_ic_0318

python generate-forcefield_nor4.py                                           \
    --force-field-name          "openff_unconstrained-2.1.0.offxml"     \
    --output                    "output/initial-force-field_nor4.offxml"
