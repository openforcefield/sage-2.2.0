#!/bin/bash
#SBATCH -J openff-2.2.0-rc1
#SBATCH -p standard
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=64gb
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o openff-2.2.0-rc1.out
#SBATCH -e openff-2.2.0-rc1.err

date
hostname

source ~/.bashrc
conda activate ib-env

savedir="openff-2.2.0-rc1"
mkdir $savedir

python  benchmark.py -f "openff-2.2.0-rc1.offxml" -d "datasets/filtered-industry.json" -s "openff-2.2.0-rc1.sqlite" -o $savedir --procs 24

date
