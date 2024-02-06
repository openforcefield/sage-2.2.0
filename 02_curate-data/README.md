# Obtaining QM data

The scripts here download and curate QM data for fitting the valence parameters of the force field. The script automates a lot of manual modifications and may need future modifying if we discover more issues. Steps include:

* pruning iodine records from particular datasets, as they may have poor results
* facility for adding additional QM records as needed for fitting particular parameters
* facility for *removing* particular QM records that may not be suitable for various reasons, e.g. inconsistent IDs, charge assignment failures, and other errors.
* we include a file with manually coded torsions that encode rings. QM data for in-ring-torsions should only be used to train these ring torsions

```bash
./download-and-curate.sh
```