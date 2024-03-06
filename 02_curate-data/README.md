# Obtaining QM data

The scripts here download and curate QM data for fitting the valence parameters of the force field. These are copied with minor modification from [valence-fitting](https://github.com/lilyminium/valence-fitting) which is in turn a modified version of the [Sage 2.1.0 fitting procedure](https://github.com/openforcefield/sage-2.1.0)

Steps include:

* downloading records from QCArchive
* filtering records
* pruning iodine records from particular datasets, as they may have poor results
* facility for adding additional QM records as needed for fitting particular parameters
* facility for *removing* particular QM records that may not be suitable for various reasons, e.g. inconsistent IDs, charge assignment failures, and other errors.
* we include a file with manually coded torsions that encode rings. QM data for in-ring-torsions should only be used to train these ring torsions
* saving a list of SMIRKs corresponding to which parameters to fit, based on the data coverage

The dataset can be downloaded and curated using the following command:

```bash
sbatch download-and-curate.sh
```

Which runs the following command:

```bash
source ~/.bashrc
conda activate fb_196_ic_0318

# Download and curate the optimized geometry dataset
python curate-dataset.py download-opt                                           \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 1 Roche"                      \ # datasets that need iodine filtered out
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 2 Coverage"                   \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 3 Pfizer Discrepancy"         \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 4 eMolecules Discrepancy"     \
    --core-opt-dataset      "OpenFF Gen 2 Opt Set 5 Bayer"                      \
    --core-opt-dataset      "OpenFF Optimization Set 1"                         \
    --core-opt-dataset      "SMIRNOFF Coverage Set 1"                           \
    --core-opt-dataset      "OpenFF Aniline Para Opt v1.0"                      \
    --iodine-opt-dataset    "OpenFF Gen2 Optimization Dataset Protomers v1.0"   \ # datasets with valid iodine molecules
    --iodine-opt-dataset    "OpenFF Iodine Chemistry Optimization Dataset v1.0" \
    --opt-records-to-remove "opt_records_to_remove.dat"                         \ # any record IDs that need to be removed
    --max-opt-conformers    12                                                  \ # max number of conformers to be kept by ConformerRMSDFilter
    --output                "output/optimization-training-set.json"             \ # where to save the dataset
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field.offxml" \ # file with the initial force field template, to determine parameter coverage
    --output-parameter-smirks  "output/training-valence-smirks.json"            \ # file to save list of SMIRKs to train
    --verbose


# Download and curate the torsion drive dataset
python curate-dataset.py download-td                                                \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 1 Roche 2"                    \ # Primary dataset
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 2 Coverage 2"                 \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 3 Pfizer Discrepancy 2"       \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 4 eMolecules Discrepancy 2"   \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 5 Bayer 2"                    \
    --core-td-dataset       "OpenFF Gen 2 Torsion Set 6 supplemental 2"             \
    --aux-td-dataset        "SMIRNOFF Coverage Torsion Set 1"                       \ # dataset to add additional data from; will be capped to cap-size additional TDs per parameter
    --aux-td-dataset        "OpenFF Group1 Torsions"                                \
    --aux-td-dataset        "OpenFF Group1 Torsions 2"                              \
    --aux-td-dataset        "OpenFF Group1 Torsions 3"                              \
    --aux-td-dataset        "Pfizer discrepancy torsion dataset 1"                  \
    --aux-td-dataset        "OpenFF Gen3 Torsion Set v1.0"                          \
    --aux-td-dataset        "OpenFF Amide Torsion Set v1.0"                         \
    --aux-td-dataset        "OpenFF WBO Conjugated Series v1.0"                     \
    --aux-td-dataset        "OpenFF DANCE 1 eMolecules t142 v1.0"                   \
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field.offxml" \ # file with the initial force field template, to determine parameter coverage
    --td-records-to-remove  "td_records_to_remove.dat"                              \ # record IDs that need to be removed
    --additional-td-records "additional_td_records.json"                            \ # record IDs to be added
    --cap-size              5                                                       \ # number of datapoints per parameter to include for the aux-td-datasets
    --cap-method            "pick_random"                                           \ # Method to cap the torsions in the aux-td-datasets
    --n-processes           8                                                       \ # Number of cores
    --output                "output/torsion-training-set.json"                      \ # Where to save the training data
    --output-parameter-smirks "output/training-torsion-smirks.json"                 \ # Where to save the SMIRKs to train
    --verbose

```

We downloaded and filtered the dataset based on the FF template `../01_generate-forcefield/output/initial-force-field.offxml`. However, we found an issue with the form of this force field, leading us to re-do the fit using the FF template `../01_generate-forcefield/output/initial-force-field_nor4.offxml`.
Downloading and filtering the dataset is by far the bottleneck of setting up the FF fit.
Once the dataset is downloaded and filtered, if you change any parameters for the force field (e.g. adding a new bond term), you can generate new training SMIRKs files using:

```bash
sbatch generate_params.sh
```

This script takes in a force field template as generated in `01_generate-forcefield` and generates the list of SMIRKs to train for that template, given the parameter coverage in the pre-existing dataset.

```bash
conda activate fb_196_ic_0318

# Generate SMIRKs to train for optimization dataset
python select_parameters_from_filtered_ds.py download-opt                                           \
    --filtered_opt_dataset     "output/optimization-training-set.json"                      \ # existing filtered opt dataset
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field_nor4.offxml" \ # new FF template file
    --output-parameter-smirks  "output/training-valence-smirks_nor4.json"            \ # where to save SMIRKs to train
    --n-processes 4

# Generate SMIRKs to train for TD dataset
python select_parameters_from_filtered_ds.py download-td                                           \
    --filtered-td-dataset        "output/torsion-training-set.json"                   \
    --initial-forcefield    "../01_generate-forcefield/output/initial-force-field_nor4.offxml" \
    --n-processes           4                                                       \
    --output-parameter-smirks "output/training-torsion-smirks_nor4.json"                 \

```

This is how we generated the training SMIRKs here.
