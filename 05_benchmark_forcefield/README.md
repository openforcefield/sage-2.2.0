# Benchmarking the performance of the Sage 2.2.0 fit

## Environment
The python environment that can be used to run the benchmarking suite is included as `yammbs-env.yaml`. 
All data here was generated and analyzed with this environment. THe full environment is included as `yammbs-env-full.yaml` 

## Downloading and caching the benchmark dataset
We benchmark using the dataset `OpenFF-Industry-Benchmark-Season-1-v1.1`. 
First, we download this file from QCArchive, and filter out incomplete records or molecules with connectivity changes, using the script `download_dataset.py`.
We then use the script `filter_dataset_parallel.py` to filter out molecules that cannot be assigned charges, or do not have full parameter coverage with our force fields.
These scripts can be run with the submit script `submit_download_dataset.sh`.
Alternatively, the filtered dataset is included in `datasets/OpenFF-Industry-Benchmark-Season-1-v1.1-filtered-charge-coverage.json`.

We then cache the dataset, for faster use with the YAMMBS benchmarking code. 
This can be accomplished with the script `cache_dataset.py`, run using `submit_cache_dataset.sh`. 

## Benchmarking the force fields
To generate the benchmarking data, you can use one of the `submit.sh` scripts. As an example, here is `submit_sage220.sh`, which was used to generate benchmarking data for this release candidate:

```bash
savedir="openff_unconstrained-2.2.0-rc1"

python -u  benchmark.py -f "openff_unconstrained-2.2.0-rc1.offxml" -d "datasets/OpenFF-Industry-Benchmark-Season-1-v1.1-filtered-charge-coverage-cache.json" -s "openff_unconstrained-2.2.0-rc1.sqlite" -o $savedir --procs 16

date
```

This code will benchmark the forcefield specified with the `-f` option, on the dataset specified by `-d`, and save the optimized geometries and energies to an SQLite database specified by `-s`.
It will also create the `savedir` directory, and save files with the DDE, RMSD, TFD, and ICRMSD for each molecule, organized by QCArchive ID.

## Analyzing the benchmarks
The directory `process_bm` contains scripts to process and analyze the benchmarking data. `process_bm/filter_ids` contains files that hold the QCArchive ID's of different subsets of the data, which can be useful for plotting benchmarks for certain functional groups (e.g. 3-membered rings with O, or sulfonamides). `process_bm/outlier_ids` contain files with the QCArchive IDs of known problematic molecules in the benchmarking dataset, which should be removed before analyzing the benchmarks.

The included script `plot_benchmarks_nor4.py` can be used to plot the results of the benchmarking run. Example usage is in `plot_benchmarks_nor4.sh`, which shows how to plot the ICRMSD, DDE, RMSD, TFD, as well as filtered versions of all of these for different subsets of the data, and how to exclude known problematic molecules ("outliers") from the plots.

Benchmark plots can be found in `Sage_220_nor4_benchmark`.

## Canary/smoke tests

We have run a number of "smoke tests" to ensure the performance of Sage 2.2.0 on a few known problem cases.

`geometries` contains Jupyter notebooks showing the minimization of three problem chemistries that were addressed in Sage 2.2.0: sulfonamides, sulfamides, and 3-membered rings with heteroatoms.

`hmr` contains the result of an HMR simulation, ensuring it does not return NaN energies.

`ligand_in_water_test` contains two jupyter notebooks, one for a sulfonamide and one for a sulfamide, being equlibrated in a box of water. The associated trajectories show that even in the presence of explicit solvent, these geometries which were problematic in Sage 2.0 and Sage 2.1 retain the correct structure with Sage 2.2.

## Other files

There are a few other files in this directory. `openff_unconstrained-2.2.0-rc1-nor4.offxml` is a copy of the new Sage 2.2.0 force field, copied from `04_fit-forcefield/nor4/fb-fit/result/optimize/force-field.offxml`. `remove_cosmetic_attributes.py` removes cosmetic attributes from `openff_unconstrained-2.2.0-rc1-nor4.offxml` and adds the Xe van der Waals parameters, as well as creates the constrained version and ensures both the constrained and unconstrained versions of Sage 2.2.0 can be loaded.
