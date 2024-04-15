#!/bin/bash
#SBATCH -J download_filter_dataset 
#SBATCH -p standard
#SBATCH -t 2-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6GB
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o download_filter_dataset.out 
#SBATCH -e download_filter_dataset.err

date
hostname

source ~/.bashrc
conda activate yammbs


#python download_dataset.py                                          \
#    --name      "OpenFF Industry Benchmark Season 1 v1.1"                      \
#    --type      "optimization"                                      \
#    --output    "datasets/OpenFF-Industry-Benchmark-Season-1-v1.1.json" \
#    --filter_output "datasets/OpenFF-Industry-Benchmark-Season-1-v1.1-intermediate.json"


python filter_dataset_parallel.py \
    --input                         "datasets/OpenFF-Industry-Benchmark-Season-1-v1.1-intermediate.json"        \
    --output                        "datasets/OpenFF-Industry-Benchmark-Season-1-v1.1-filtered-charge-coverage.json"         \
    --charge-backend                "openeye"            \
    --forcefield                    "openff_unconstrained-2.0.0.offxml" \
    --n-workers                     300                     \
    --worker-type                   "slurm"                 \
    --batch-size                    10                      \
    --memory                        6                       \
    --walltime                      48                      \
    --queue                         "free"                  \
    --conda-environment             "yammbs"
