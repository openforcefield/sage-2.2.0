#!/bin/bash


source ~/.bashrc
micromamba activate fb-195-tk-014-py310


python create-fb-inputs.py                                                                          \
    --tag                       "fb-fit"                                                            \
    --optimization-dataset      "../02_curate-data/output/optimization-training-set.json"           \
    --torsion-dataset           "../02_curate-data/output/torsion-training-set.json"                \
    --forcefield                "../03_generate-initial-ff/output/initial-force-field-msm.offxml"   \
    --valence-to-optimize       "../02_curate-data/output/training-valence-smirks.json"             \
    --torsions-to-optimize      "../02_curate-data/output/training-torsion-smirks.json"             \
    --smiles-to-exclude         "smiles-to-exclude.dat"                                             \
    --smarts-to-exclude         "smarts-to-exclude.dat"                                             \
    --max-iterations            1                                                                   \
    --port                      55387                                                               \
    --output-directory          "output"                                                            \
    --verbose

