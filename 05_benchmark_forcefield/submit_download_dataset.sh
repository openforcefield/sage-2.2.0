#!/bin/bash
#SBATCH -J download_filter_dataset 
#SBATCH -p standard
#SBATCH -t 1-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=48
#SBATCH --mem=32gb
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o download_filter_dataset.out 
#SBATCH -e download_filter_dataset.err

date
hostname

source ~/.bashrc
conda activate yammbs-env


python download_filter_dataset_parallel.py 
    --input                         "raw-optimization-datasets.json"        \
    --output                        "filtered.json"         \
    --charge-backend                "ambertools"            \
    --n-workers                     300                     \
    --worker-type                   "slurm"                 \
    --batch-size                    10                      \
    --memory                        2                       \
    --walltime                      24                      \
    --queue                         "free"                  \
    --conda-environment             "yammbs-env"
