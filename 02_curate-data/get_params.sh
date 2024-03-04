#!/bin/bash
#SBATCH -J filter_sage220_nor4
#SBATCH -p standard
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o filter_sage220_nor4.out
#SBATCH -e filter_sage220_nor4.err

date
hostname

source ~/.bashrc
conda activate fb_196_ic_0318

python select_parameters_from_filtered_ds.py download-opt                                           \
    --filtered_opt_dataset     "output/optimization-training-set.json"                      \
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field_nor4.offxml" \
    --output-parameter-smirks  "output/training-valence-smirks_nor4.json"            \
    --n-processes 4


python select_parameters_from_filtered_ds.py download-td                                           \
    --filtered-td-dataset        "output/torsion-training-set.json"                   \
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field_nor4.offxml" \
    --n-processes           4                                                       \
    --output-parameter-smirks "output/training-torsion-smirks_nor4.json"                 \

date
