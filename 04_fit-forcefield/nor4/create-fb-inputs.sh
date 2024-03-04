#!/bin/bash
#SBATCH -J sage_220_nor4_fbinp
#SBATCH -p standard
#SBATCH -t 1-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o sage_220_nor4_fbinp.out
#SBATCH -e sage_220_nor4_fbinp.err

date
hostname

source ~/.bashrc
conda activate fb_196_ic_0318    

python create-fb-inputs.py                                                                          \
    --tag                       "fb-fit"                                                            \
    --optimization-dataset      "../../02_curate-data/output/optimization-training-set.json"           \
    --torsion-dataset           "../../02_curate-data/output/torsion-training-set.json"                \
    --forcefield                "../../03_generate-initial-ff/output/initial-force-field-msm_nor4.offxml"   \
    --valence-to-optimize       "../../02_curate-data/output/training-valence-smirks_nor4.json"             \
    --torsions-to-optimize      "../../02_curate-data/output/training-torsion-smirks_nor4.json"             \
    --smiles-to-exclude         "smiles-to-exclude.dat"                                             \
    --smarts-to-exclude         "smarts-to-exclude.dat"                                             \
    --max-iterations            100                                                                 \
    --port                      55487                                                               \
    --output-directory          "output"                                                            \
    --verbose

