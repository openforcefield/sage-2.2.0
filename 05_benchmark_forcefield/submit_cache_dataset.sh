#!/bin/bash
#SBATCH -J cache_dataset 
#SBATCH -p standard
#SBATCH -t 2-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6GB
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o cache_dataset.out 
#SBATCH -e cache_dataset.err

date
hostname

source ~/.bashrc
conda activate yammbs

python cache_dataset.py 8
