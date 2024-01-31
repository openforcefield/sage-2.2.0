# Generating initial values

When training, we need an initial guess for each parameter. This used to be the previous force field, but we noticed parameter drift and increasing errors over time. Now we use initial values derived from the Modified Seminario Method. The script here generates MSM values for each parameter and saves it into a new force field.

```bash
./create-msm-ff.sh
```