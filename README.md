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
This led to improved small ring and sulfamide geometries.

### Small ring angles
The following changes were made to the small ring angles:

* `a3 [*;r3:1]1~;@[*;r3:2]~;@[*;r3:3]1` moved to the end of the angle list, in order to supersede parameter `a28` which was being used for epoxy internal angles prior to Sage 2.2. `a28`'s equilibrium angle value is around 112 degrees, while the epoxy internal angle should be around 60 degrees. 

* `a13a [*;r6:1]~;@[*;r5;x4,*;r5;X4:2]~;@[*;r5;x2:3]` was split off from `a13 [*;r6:1]~;@[*;r5:2]~;@[*;r5;x2:3]` to handle cases where the atoms involved are all singly bonded, instead of aromatic.

* `a41 [*;r5:1]1@[*;r5:2]@[*;r5:3]@[*;r5]@[*;r5]1` was created as a new parameter to handle 5-membered ring internal angles.

* `a41a [*;r5:1]1@[#16;r5:2]@[*;r5:3]@[*;r5]@[*;r5]1` was created as a new parameter to handle 5-membered ring internal angles where S is the central atom.

### Decreased ForceBalance priors improve sulfamide geometries.

For this force field, the Force Balance priors, which control how far the parameters can optimize away from the initial value, were reduced to the following:

```
priors
   Angles/Angle/k :  20.0
   Angles/Angle/angle :  1.0
   Bonds/Bond/k :  20.0
   Bonds/Bond/length :  0.01
   ProperTorsions/Proper/k :  5.0
   ImproperTorsions/Improper/k :  5.0
/priors
```

### Other changes
- `t65` SMIRKs was changed from `[*:1]-[#6X4:2]-[#7X3$(*~[#8X1]):3]~[#8X1:4]` to `[*:1]-[#6X4:2]-[#7X3:3](~[#8X1])~[#8X1:4]`
- `t123` was removed, as it was redundant with `t123a` and `t124`.
  

## Benchmarking results

### Overall performance
We benchmarked the Sage 2.2.0 release candidate on the industry benchmarking dataset. The results can be seen below for the ddEs, RMSD, and TFD. 

![whole_ds](https://github.com/openforcefield/sage-2.2.0/assets/29759281/5e8b48e1-9c33-4d52-95d4-6f1e89d96563)

Overall, Sage 2.2.0 performs very similarly to Sgae 2.1.0, but a few specific geometry errors have been fixed, as described below. These improvements can be seen in the internal coordinate RMS error, shown below. Each datapoint shows the RMS error in bond length (angle, dihedral angle, and improper dihedral angle) across all bonds (angles, dihedrals, impropers) in a given molecule.
![icrmsd](https://github.com/openforcefield/sage-2.2.0/assets/29759281/e8f661dc-bb95-4c46-8cd8-cc136b52c1b4)


### Heteroatomic 3-membered ring improvements

Treating the C-O-C epoxy internal angle with `a28` in Sage 2.1.0 led to a distorted geometry that has been remedied in Sage 2.2.0. The plot below shows the internal coordinate RMS error for molecules with heteroatomic 3-membered rings, and an example geometry with the problematic bonds and angles listed.
![3r_heteroatom_icrmsd](https://github.com/openforcefield/sage-2.2.0/assets/29759281/7136b4eb-89f4-4bde-8e89-c3215059ad94)



### Sulfamide improvements
The plots below show the value of the angles assigned to parameter `a32` for molecules in the benchmark set that contain the sulfamide functional group, predicted with QM (y axis) and MM using Sage 2.2.0 (x-axis). The data points highlighted in purple correspond to the N-S=O angle, those in green correspond to the N-S-N angle, and the gray data corresponds to other angles covered by this parameter (e.g. C-S=O). In Sage 2.1.0, there are a number of data points that are far to the left of the diagonal, indicating that Sage 2.1.0 is vastly underestimating the angles. In Sage 2.2.0, this has been remedied. 

Additionally, we show an example sulfamide molecule that highlights the improvement in these geometries with its problematic angles listed.
![sulfamides](https://github.com/openforcefield/sage-2.2.0/assets/29759281/2355f22b-d802-41ca-9409-584606293a06)

This improvement can also be seen in the internal coordinate RMS error for molecules that have the sulfamide moiety.
![sulfamide_icrmsd](https://github.com/openforcefield/sage-2.2.0/assets/29759281/210c9e07-3a7b-49e2-b6f4-02216ee9d12a)


