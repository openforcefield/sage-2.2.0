#!/bin/bash

host=$1
port=$2
shift
shift

CONDA_ENVIRONMENT_NAME="fb-195-tk-014-py310"
USERNAME=$(whoami)
COMPRESSED_CONDA_ENVIRONMENT="/dfs4/.../${CONDA_ENVIRONMENT_NAME}.tar.gz"
export SLURM_TMPDIR=/tmp
export MYTMPDIR="/tmp/${USERNAME}"
export TMPDIR=$SLURM_TMPDIR/$SLURM_JOB_NAME


cmd=$(mktemp)
cat << EOF > $cmd
#!/usr/bin/env bash
#SBATCH -J wq-$port
#SBATCH -p free
#SBATCH -t 48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
# SBATCH --array=1-100
#SBATCH --account dmobley_lab
# SBATCH --export ALL
#SBATCH -o /dev/null

#export OMP_NUM_THREADS=1
#export MKL_NUM_THREADS=1
if ! diff -q ${MYTMPDIR}/${CONDA_ENVIRONMENT_NAME}.tar.gz $COMPRESSED_CONDA_ENVIRONMENT > /dev/null 2>&1;
then 
   rm -rf ${MYTMPDIR}/${CONDA_ENVIRONMENT_NAME}*
fi

mkdir ${MYTMPDIR} -p
for i in \$(seq  \$SLURM_NTASKS ); do
        echo $i
        ./wq_worker_local.sh --cores 1 -s ${MYTMPDIR} --disk-threshold=0.002 --disk=3000 --memory-threshold=1000 -t 3600  -b 20 --memory=1000 $host:$port &
done
wait
EOF

sbatch $@ $cmd 
rm $cmd
