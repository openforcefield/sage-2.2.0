# Benchmarking the performance of the Sage 2.2.0 fit

## Environment
The python environment that can be used to run the benchmarking suite is included as `ib-env.yaml`. 

The `sqlite` databases and dde, rmsd, and tfd data were all generated with the environment `ib-env-full.yaml` which contains slightly different packages than the included environment. After setting up that environment, we downloaded the IBStore code version ibstore-0+untagged.112.gde80859, specifically this [commit](https://github.com/mattwthompson/ib/commit/de80859f37b345845f9a7ba5240a4279e5913458) and installed it with `pip install -e .`.

The internal coordinate rmsd data was generated using the environment `ib-env2-full.yaml`, but should be able to be generated with the enclosed environment.

The conda environment for analyzing the benchmarks is `ib-env-analysis.yaml`.

## Benchmarking the force fields
To generate the benchmarking data, you can use one of the `submit.sh` scripts. As an example, here is `submit_sage220_nor4.sh`, which was used to generate benchmarking data for this release candidate:

```bash
savedir="openff_unconstrained-2.2.0-rc1-nor4"

python  benchmark.py -f "../04_fit-forcefield/nor4/fb-fit/result/optimize/force-field.offxml" -d "datasets/filtered-industry.json" -s "openff_unconstrained-2.2.0-rc1-nor4.sqlite" -o $savedir --procs 8
```

This code will benchmark the forcefield specified with the `-f` option, on the dataset specified by `-d`, and save the optimized geometries and energies to an SQLite database specified by `-s`.
It will also create the `savedir` directory, and save files with the DDE, RMSD, and TFD for each molecule, organized by QCArchive ID.

## Analyzing the benchmarks
The directory `process_bm` contains scripts to process and analyze the benchmarking data. `process_bm/filter_ids` contains files that hold the QCArchive ID's of different subsets of the data, which can be useful for plotting benchmarks for certain functional groups (e.g. 3-membered rings with O, or sulfonamides). `process_bm/outlier_ids` contain files with the QCArchive IDs of known problematic molecules in the benchmarking dataset, which should be removed before analyzing the benchmarks.

The included script `plot_benchmarks_nor4.py` can be used to plot the results of the benchmarking run. Example usage is in `plot_benchmarks_nor4.sh`, which shows how to plot the ICRMSD, DDE, RMSD, TFD, as well as filtered versions of all of these for different subsets of the data, and how to exclude known problematic molecules ("outliers") from the plots.

Benchmark plots can be found in `Sage_220_nor4_benchmark`.

## Canary/smoke tests

We have run a number of "smoke tests" to ensure the performance of Sage 2.2.0 on a few known problem cases.

`geometries` contains Jupyter notebooks showing the minimization of three problem chemistries that were addressed in Sage 2.2.0: sulfonamides, sulfamides, and 3-membered rings with heteroatoms.

`hmr` contains the result of an HMR simulation, ensuring it does not return NaN energies.

`ligand_in_water_test` contains two jupyter notebooks, one for a sulfonamide and one for a sulfamide, being equlibrated in a box of water. The associated trajectories show that even in the presence of explicit solvent, these geometries which were problematic in Sage 2.0 and Sage 2.1 retain the correct structure with Sage 2.2.
