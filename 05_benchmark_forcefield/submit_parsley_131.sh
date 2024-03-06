#!/bin/bash
#SBATCH -J openff_unconstrained-1.3.1
#SBATCH -p standard
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64gb
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o openff_unconstrained-1.3.1.out
#SBATCH -e openff_unconstrained-1.3.1.err

date
hostname

source ~/.bashrc
conda activate ib-env2

savedir="openff_unconstrained-1.3.1"
mkdir $savedir

python  benchmark.py -f "openff_unconstrained-1.3.1.offxml" -d "datasets/filtered-industry.json" -s "openff_unconstrained-1.3.1.sqlite" -o $savedir --procs 8

date
