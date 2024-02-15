#!/bin/bash
#SBATCH -J test 
#SBATCH -p standard
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64gb
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o test.out
#SBATCH -e test.err

date
hostname

source ~/.bashrc
conda activate ib-env

savedir="test"
mkdir $savedir

python  benchmark.py -f "../openff_unconstrained-2.2.0-rc1.offxml" -d "../datasets/OpenFF-Aniline-Para-Opt-v1.0.json" -s "test.sqlite" -o $savedir --procs 8

date
