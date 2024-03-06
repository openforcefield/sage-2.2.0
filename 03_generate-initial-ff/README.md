# Generating initial values

When training, we need an initial guess for each parameter. Prior to Sage 2.1, this used to be the parameter value in the previous force field, but we noticed parameter drift and increasing errors over time. Now we use initial values derived from the Modified Seminario Method for the bonds and angles, but keep the previous FF parameter as the initial guess for the torsions. For each molecule in the training set, MSM values for each equilibrium bond/angle and force constant are generated, then averaged across all instances of that type of bond or angle in the dataset to generate these initial values. The script here generates MSM values for each parameter and saves it into a new force field.

```bash
sbatch create-msm-ff-nor4.sh
```

The structure of the script is:
```bash
conda activate fb_196_ic_0318    

python create-msm-ff.py                                                                                     \
    --initial-force-field       "../01_generate-forcefield/output/initial-force-field_nor4.offxml"  \ # initial FF template
    --optimization-dataset      "../02_curate-data/output/optimization-training-set.json"                   \ # filtered optimization dataset
    --working-directory         "working-directory"                                                         \
    --output                    "output/initial-force-field-msm_nor4.offxml"                                  # where to save the FF with MSM values
```
