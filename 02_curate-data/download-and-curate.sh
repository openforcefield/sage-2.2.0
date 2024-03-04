#!/bin/bash
#SBATCH -J filter_sage_220_opt
#SBATCH -p standard
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o filter_sage_220_opt.out
#SBATCH -e filter_sage_220_opt.err

date
hostname

source ~/.bashrc
conda activate fb_196_ic_0318

python curate-dataset.py download-opt                                           \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 1 Roche"                      \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 2 Coverage"                   \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 3 Pfizer Discrepancy"         \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 4 eMolecules Discrepancy"     \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 5 Bayer"                      \
    --core-opt-dataset      "OpenFF Optimization Set 1"                         \
    --core-opt-dataset      "SMIRNOFF Coverage Set 1"                           \
    --core-opt-dataset      "OpenFF Aniline Para Opt v1.0"                      \
    --iodine-opt-dataset    "OpenFF Gen2 Optimization Dataset Protomers v1.0"   \
    --iodine-opt-dataset    "OpenFF Iodine Chemistry Optimization Dataset v1.0" \
    --opt-records-to-remove "opt_records_to_remove.dat"                         \
    --max-opt-conformers    12                                                  \
    --output                "output/optimization-training-set.json"             \
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field.offxml" \
    --output-parameter-smirks  "output/training-valence-smirks.json"            \
    --verbose



python curate-dataset.py download-td                                                \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 1 Roche 2"                    \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 2 Coverage 2"                 \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 3 Pfizer Discrepancy 2"       \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 4 eMolecules Discrepancy 2"   \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 5 Bayer 2"                    \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 6 supplemental 2"             \
    --aux-td-dataset        "SMIRNOFF Coverage Torsion Set 1"                       \
    --aux-td-dataset        "OpenFF Group1 Torsions"                                \
    --aux-td-dataset        "OpenFF Group1 Torsions 2"                              \
    --aux-td-dataset        "OpenFF Group1 Torsions 3"                              \
    --aux-td-dataset        "Pfizer discrepancy torsion dataset 1"                  \
    --aux-td-dataset        "OpenFF Gen3 Torsion Set v1.0"                          \
    --aux-td-dataset        "OpenFF Amide Torsion Set v1.0"                         \
    --aux-td-dataset        "OpenFF WBO Conjugated Series v1.0"                     \
    --aux-td-dataset        "OpenFF DANCE 1 eMolecules t142 v1.0"                   \
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field.offxml" \
    --td-records-to-remove  "td_records_to_remove.dat"                              \
    --additional-td-records "additional_td_records.json"                            \
    --cap-size              5                                                       \
    --cap-method            "pick_random"                                           \
    --n-processes           8                                                       \
    --output                "output/torsion-training-set.json"                      \
    --output-parameter-smirks "output/training-torsion-smirks.json"                 \
    --verbose

date
