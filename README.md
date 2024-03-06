# sage-2.2.0
Repository for re-fitting Sage 2.2.0

## Fitting pipeline
The code that was used to produce the fit is all included here, and should be reproducible. The fit is performed in several steps, with instructions for how to run each step in the `README` file in each directory:

1. `01_generate-forcefield`: Generate an initial "template" force field, which contains the desired SMIRKs patterns for all bond/angle terms, the desired SMIRKs patterns and initial values for all torsion terms, and the desired final value for all other parameters such as electrostatics.

2. `02_curate-data`: Download and filter/curate the optimized geometry and torsion drive datasets to use for the fit. Determine which parameters to optimize based on dataset coverage.

3. `03_generate-initial-ff`: Generate initial values for the bond and angle terms of the force field using the Modified Seminario Method.

4. `04_fit-forcefield`: Fit the force field to the data using ForceBalance.

5. `05_benchmark_forcefield`: Benchmark the force field.

### Python environment
Steps 1-4 were performed with the attached conda environment, `fb_196_ic_0318.yaml`.

This can be installed using `mamba env create -f fb_196_ic_0318.yaml`

The full environment that the force field was fit using is included in the file `fb_196_ic_0318_full.yaml`.

Step 5, benchmarking, was performed with several different environments due to developments in our evolving benchmarking software package. Details can be found in the README file for that directory.
