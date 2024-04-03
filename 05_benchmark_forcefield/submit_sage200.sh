#!/bin/bash
#SBATCH -J openff_unconstrained-2.0.0
#SBATCH -p standard
#SBATCH -t 1-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=48
#SBATCH --mem=32gb
#SBATCH --account dmobley_lab
#SBATCH --export ALL
#SBATCH --constraint=fastscratch
#SBATCH -o openff_unconstrained-2.0.0.out
#SBATCH -e openff_unconstrained-2.0.0.err

date
hostname

source ~/.bashrc
conda activate yammbs-env

savedir="openff_unconstrained-2.0.0"
mkdir $savedir

python -c "from openff.toolkit.utils import *; assert OpenEyeToolkitWrapper().is_available"

python -u  benchmark.py -f "openff_unconstrained-2.0.0.offxml" -d "datasets/filtered-industry.json" -s "openff_unconstrained-2.0.0.sqlite" -o $savedir --procs 48

date
