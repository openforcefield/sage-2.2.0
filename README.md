# sage-2.2.0
Repository for re-fitting Sage 2.2.0

## Fitting pipeline
The code that was used to produce the fit is all included here, and should be reproducible. The fit is performed in several steps, with instructions for how to run each step in the `README` file in each directory:

1. `01_generate-forcefield`: Generate an initial "template" force field, which contains the desired SMIRKs patterns for all bond/angle terms, the desired SMIRKs patterns and initial values for all torsion terms, and the desired final value for all other parameters such as electrostatics.

2. `02_curate-data`: Download and filter/curate the optimized geometry and torsion drive datasets to use for the fit. Determine which parameters to optimize based on dataset coverage.

3. `03_generate-initial-ff`: Generate initial values for the bond and angle terms of the force field using the Modified Seminario Method.

4. `04_fit-forcefield`: Fit the force field to the data using ForceBalance.

5. `05_benchmark_forcefield`: Benchmark the force field.

## Python environment
Steps 1-4 were performed with the attached conda environment, `fb_196_ic_0318.yaml`.

This can be installed using `mamba env create -f fb_196_ic_0318.yaml`

The full environment that the force field was fit using is included in the file `fb_196_ic_0318_full.yaml`.

Step 5, benchmarking, was performed with several different environments due to developments in our evolving benchmarking software package. Details can be found in the README file for that directory.

## Changes

Changes were made to small ring internal angle parameters and to the "priors" for the force field fit, restricting how far the parameter can optimize away from its starting guess.
This led to improved small ring and sulfonamide geometries.

### Small ring angles
The following changes were made to the small ring angles:

* `a3 [*;r3:1]1~;@[*;r3:2]~;@[*;r3:3]1` moved to the end of the angle list, in order to supersede parameter `a28` which was being used for epoxy internal angles prior to Sage 2.2. `a28`'s equilibrium angle value is around 112 degrees, while the epoxy internal angle should be around 60 degrees. This was causing numerous issues with epoxy ring geometries, which have been remedied here.

* `a13a [*;r6:1]~;@[*;r5;x4,*;r5;X4:2]~;@[*;r5;x2:3]` was split off from `a13 [*;r6:1]~;@[*;r5:2]~;@[*;r5;x2:3]` to handle cases where the atoms involved are all singly bonded, instead of aromatic.

* `a41 [*;r5:1]1@[*;r5:2]@[*;r5:3]@[*;r5]@[*;r5]1` was created as a new parameter to handle 5-membered ring internal angles.

* `a41a [*;r5:1]1@[#16;r5:2]@[*;r5:3]@[*;r5]@[*;r5]1` was created as a new parameter to handle 5-membered ring internal angles where S is the central atom.
