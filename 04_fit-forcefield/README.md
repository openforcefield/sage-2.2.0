This is the directory where the FF fit happens. The directory contains a few files and directories:

`fb_196_ic_0318.tar.gz` is the compressed conda environment for the fit. Using a compressed environment reduces overhead on the cluster.

`nor4` is the directory where `openff_unconstrained-2.2.0-rc1.offxml` was fit. It is called `nor4` due to not having a specific 4-membered ring heteroatom internal angle. Within this directory are:

  `create-fb-inputs.py` and `create-fb-inputs.sh` are scripts to set up the ForceBalance run, described below.

  `output` is the directory where the optimized FF will be saved.

  `scripts` is the directory with the HPC3 submit scripts.

  `smarts-to-exclude.dat` and `smiles-to-exclude.dat` are files with SMARTs/SMILES strings to exclude from fitting.

  `fb-fit` is the directory where the FF fit will run. Within this directory are:

      `optimize.in` is the ForceBalance input file

      `master.out.gz` is the compressed ForceBalance output file

      `result` is where the optimized force field is saved

      `forcefield` is where the initial force field is saved

      `targets.tar.gz` is a compressed directory with all the ForceBalance targets, generated as described below.


To begin the fit, first, we must create the Force Balance input file and targets directory. This can be done using

```bash
sbatch create-fb-inputs.sh
```

This script is structured as follows:

```bash
conda activate fb_196_ic_0318    

python create-fb-inputs.py                                                                          \
    --tag                       "fb-fit"                                                            \ # directory to do the fitting in
    --optimization-dataset      "../../02_curate-data/output/optimization-training-set.json"           \ # path to filtered optimized geometry dataset
    --torsion-dataset           "../../02_curate-data/output/torsion-training-set.json"                \ # path to filtered TD dataset
    --forcefield                "../../03_generate-initial-ff/output/initial-force-field-msm_nor4.offxml"   \ # path to initial FF with MSM values
    --valence-to-optimize       "../../02_curate-data/output/training-valence-smirks_nor4.json"             \ # path to file with bond/angle SMIRKs to be optimized
    --torsions-to-optimize      "../../02_curate-data/output/training-torsion-smirks_nor4.json"             \ # path to file with torsion SMIRKs to be optimized
    --smiles-to-exclude         "smiles-to-exclude.dat"                                             \ # file listing any SMILES strings to exclude from the dataset
    --smarts-to-exclude         "smarts-to-exclude.dat"                                             \ # file listing any SMARTs patterns to exclude from the dataset
    --max-iterations            100                                                                 \ # max number of fitting iterations
    --port                      55487                                                               \ # port for workers to communicate on
    --output-directory          "output"                                                            \ # where to save final FF
    --verbose
```

This will generate the input file for the ForceBalance fit (`fb-fit/optimize.in`) and the `targets` directory which tells ForceBalance what to optimize.

Once you have generated these files, go to the `fb-fit` directory, and you can submit the ForceBalance fit using the following script (from the `fb-fit` directory):

```bash
sbatch ../scripts/submit_all.sh
```

This will submit the "master" job, as well as several batches of worker CPU jobs linked to the "master" job.

If you need to submit any more worker jobs throughout the optimization, you can use the following:

```bash
sbatch ../scripts/submit_hpc3_worker_local.sh
```

```bash
sbatch ../scripts/submit_hpc3_worker_local_free.sh
```

If you submit to the free queue, you can also submit dependency jobs, that will start automatically if your worker job is pre-empted:

```bash
sbatch ../scripts/submit_free_dep.sh [jobid of free worker job]
```
