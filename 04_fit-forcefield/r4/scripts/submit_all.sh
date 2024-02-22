#!/bin/bash

# submit master
jid1=$(sbatch -J valence-fit -p standard -t 7-00:00:00 --nodes=1 --cpus-per-task=1 --mem=10000mb --account dmobley_lab --export ALL --constraint=fastscratch -o master.out -e master.err ../scripts/hpc3_master_short.sh)

jobid=$(echo $jid1 | awk '{print $NF}')
echo $jobid

sbatch --account dmobley_lab --export ALL -p free --dependency=after:$jobid ../scripts/submit_hpc3_worker_local.sh
sbatch --account dmobley_lab --export ALL -p free --dependency=after:$jobid ../scripts/submit_hpc3_worker_local.sh
sbatch --account dmobley_lab --export ALL -p free --dependency=after:$jobid ../scripts/submit_hpc3_worker_local.sh
sbatch --account dmobley_lab --export ALL -p free --dependency=after:$jobid ../scripts/submit_hpc3_worker_local.sh
sbatch --account dmobley_lab --export ALL -p free --dependency=after:$jobid ../scripts/submit_hpc3_worker_local.sh
