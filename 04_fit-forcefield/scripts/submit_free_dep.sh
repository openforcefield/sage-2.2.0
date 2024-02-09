#!/bin/bash

# run this after free wq starts. will start second wq with that one as dependency if it's preempted

jobid=$1

jid2=$(sbatch --account dmobley_lab --export ALL -p free --dependency=afterany:$jobid ../scripts/submit_hpc3_worker_local_free.sh)

jobid2=$(echo $jid2 | awk '{print $NF}')
echo $jobid2

