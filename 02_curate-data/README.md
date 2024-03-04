# Obtaining QM data

The scripts here download and curate QM data for fitting the valence parameters of the force field. These are copied with minor modification from [valence-fitting](https://github.com/lilyminium/valence-fitting) which is in turn a modified version of the [Sage 2.1.0 fitting procedure](https://github.com/openforcefield/sage-2.1.0) 

Steps include:

* downloading records from QCArchive
* filtering records
* pruning iodine records from particular datasets, as they may have poor results
* facility for adding additional QM records as needed for fitting particular parameters
* facility for *removing* particular QM records that may not be suitable for various reasons, e.g. inconsistent IDs, charge assignment failures, and other errors.
* we include a file with manually coded torsions that encode rings. QM data for in-ring-torsions should only be used to train these ring torsions

```bash
./download-and-curate.sh
```

Once the dataset is downloaded and filtered, if you change the parameters for the force field, you can generate new training SMIRKs files using

```bash
./generate_params.sh
```

Which is how we generated the training SMIRKs here.
