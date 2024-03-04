#!/bin/bash -x

USERNAME=$(whoami)
CONDA_ENVIRONMENT_NAME="fb_196_ic_0318"
MYTMPDIR="/tmp/${USERNAME}/${CONDA_ENVIRONMENT_NAME}"
COMPRESSED_CONDA_ENVIRONMENT="/pub/amcisaac/sage-2.2.0/04_fit-forcefield/${CONDA_ENVIRONMENT_NAME}.tar.gz"


mkdir -p $MYTMPDIR
cd "/tmp/${USERNAME}"
while [ -f state.COPYING ] ; do sleep 100 ; done
if [ ! -f "${CONDA_ENVIRONMENT_NAME}.tar.gz" ] ; then 
	touch state.COPYING
	cp $COMPRESSED_CONDA_ENVIRONMENT .
    tar -xzf "${CONDA_ENVIRONMENT_NAME}.tar.gz" -C $CONDA_ENVIRONMENT_NAME
    rm state.COPYING
fi
source "${CONDA_ENVIRONMENT_NAME}/bin/activate"
export MKL_NUM_THREADS=1
export OMP_NUM_THREADS=1

work_queue_worker $@
