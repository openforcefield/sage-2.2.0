# Generating ForceBalance inputs

We use [ForceBalance](https://github.com/leeping/forcebalance) to fit our force fields. The script here generates all input files necessary for fitting.

```bash
./create-fb-inputs.sh
```

Once all inputs are generated, you can run ForceBalance:

```bash
conda activate fb-195-tk-014-py39
cd fb-fit
ForceBalance.py optimize.in
```

This is good for a local test run. However, to run properly, you'll also need [Work Queue workers](https://cctools.readthedocs.io/en/latest/work_queue/). Therefore to run properly on HPC3, it's advised to submit this "master" job as its own script. Templates are available in the `scripts` folder, although they will require modification with account and path details. They also depend on some conda environment set-up beforehand with conda-pack to optimize environment usage.

