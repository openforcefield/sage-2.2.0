#!/bin/bash


source ~/.bashrc
micromamba activate fb-195-tk-014-py310


python create-msm-ff.py                                                                                     \
    --initial-force-field       "../01_generate-forcefield/output/initial-force-field-openff-2.1.0.offxml"  \
    --optimization-dataset      "../02_curate-data/output/optimization-training-set.json"                   \
    --working-directory         "working-directory"                                                         \
    --output                    "output/initial-force-field-msm.offxml"