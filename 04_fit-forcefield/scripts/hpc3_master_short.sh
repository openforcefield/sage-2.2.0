#!/bin/bash

rm -rf /tmp/$SLURM_JOB_NAME
source $HOME/.bashrc
#eval "$(/opt/apps/anaconda/2020.07/bin/conda shell.bash hook)"

# special code to copy conda environment over
# relies on having set up a conda environment and compressed it

CONDA_ENVIRONMENT_NAME="fb_196_ic_0318"
COMPRESSED_CONDA_ENVIRONMENT="/pub/amcisaac/sage-2.2.0/04_fit-forcefield/${CONDA_ENVIRONMENT_NAME}.tar.gz"
export SLURM_TMPDIR=/tmp
export TMPDIR=$SLURM_TMPDIR/$SLURM_JOB_NAME

mkdir  -p  $TMPDIR
rsync -avzIi $COMPRESSED_CONDA_ENVIRONMENT $TMPDIR
mkdir  -p  $TMPDIR/$CONDA_ENVIRONMENT_NAME
cd $TMPDIR
tar -xzf "${CONDA_ENVIRONMENT_NAME}.tar.gz" -C $CONDA_ENVIRONMENT_NAME
source "${CONDA_ENVIRONMENT_NAME}/bin/activate"
echo $(python -V)

rsync  -avzIi  $SLURM_SUBMIT_DIR/optimize.in  $SLURM_TMPDIR/$SLURM_JOB_NAME
rsync  -avzIi  $SLURM_SUBMIT_DIR/targets  $SLURM_TMPDIR/$SLURM_JOB_NAME
rsync  -avzIi  $SLURM_SUBMIT_DIR/forcefield  $SLURM_TMPDIR/$SLURM_JOB_NAME


datadir=$(pwd)
mkdir -p $SLURM_SUBMIT_DIR/worker_logs
echo $(hostname) > $SLURM_SUBMIT_DIR/host

export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1

if ForceBalance.py optimize.in ; then
   tar -czvf optimize.tmp.tar.gz optimize.tmp
   rsync  -avzIi --exclude="optimize.tmp" --exclude="optimize.bak" --exclude="fb_196*" --exclude="targets*" $TMPDIR/* $SLURM_SUBMIT_DIR > copy.log
   rm -rf $TMPDIR
fi

echo "All done"
