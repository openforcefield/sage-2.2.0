#!/bin/bash
#SBATCH -J openff_unconstrained-2.2.0-rc1-nor4
#SBATCH -p standard
#SBATCH -t 4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64gb
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o openff_unconstrained-2.2.0-rc1-nor4.out
#SBATCH -e openff_unconstrained-2.2.0-rc1-nor4.err

date
hostname

source ~/.bashrc
conda activate ib-env2

savedir="openff_unconstrained-2.2.0-rc1-nor4"
mkdir $savedir

python  benchmark.py -f "../04_fit-forcefield/nor4/fb-fit/result/optimize/force-field.offxml" -d "datasets/filtered-industry.json" -s "openff_unconstrained-2.2.0-rc1-nor4.sqlite" -o $savedir --procs 8

date
