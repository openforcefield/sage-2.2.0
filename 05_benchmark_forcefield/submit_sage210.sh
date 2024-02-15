#!/bin/bash
#SBATCH -J openff_unconstrained-2.1.0
#SBATCH -p standard
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64gb
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o openff_unconstrained-2.1.0.out
#SBATCH -e openff_unconstrained-2.1.0.err

date
hostname

source ~/.bashrc
conda activate ib-env

savedir="openff_unconstrained-2.1.0"
mkdir $savedir

python  benchmark.py -f "openff_unconstrained-2.1.0.offxml" -d "datasets/filtered-industry.json" -s "openff_unconstrained-2.1.0.sqlite" -o $savedir --procs 8

date
