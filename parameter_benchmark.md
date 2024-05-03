# Comparing geometric performance across parameters added in Sage 2.1.0 and 2.2.0

## Bonds
-  b13a added guanadinium specific bond in Sage 2.1.0
![b13a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/a1e16995-d49e-4ae5-ac66-4a8a35df765a)

-  b43 changed from [#8X2:1]-[#8X2:2] to [#8X2:1]-[#8X2,#8X1-1:2] in Sage 2.1.0
![b43](https://github.com/openforcefield/sage-2.2.0/assets/29759281/e9265eb0-8f06-4c16-9868-69967501d8c5)

-  b53 changed from [#16X2:1]-[#7:2] to [#16X2,#16X1-1:1]-[#7:2] in Sage 2.1.0
![b53](https://github.com/openforcefield/sage-2.2.0/assets/29759281/862e4db2-4a06-44dc-9ec6-3506b810f3eb)

-  b57a child parameter to separate out double bonds from b57 in Sage 2.1.0
![b57a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/b2c617d4-25f9-4ec4-8b1b-a12e5d6e7680)


## Angles
-  a18 changed from [*:1]-[#7X4,#7X3,#7X2-1:2]-[*:3] to [*:1]~[#7X4,#7X3,#7X2-1:2]~[*:3] in Sage 2.1.0; a18a child parameter to separate out 4-, 5-, and 7-membered ring matches from a18 in Sage 2.1.0, 5-membered ring matches drained in Sage 2.2.0
  ![a18a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/24ecac07-9483-41dc-862e-ad64c44c2fba)
Note here that the degredation in performance in Sage 2.2.0 suggests the 4- and 7-membered rings should be separated into separate parameters.
  
-  a32 smirks definition changed to drain [*]-[S]=[*] matches from a31 in Sage 2.1.0
![a31a32](https://github.com/openforcefield/sage-2.2.0/assets/29759281/c0d341d1-6bbd-443d-819b-5b66fc11b2c3)

## Proper Torsions
-  added carboxylate torsions t18a to address delocalized charges 
-  added amidinium torsion t18b to address delocalized charges 
-  added carboxylate torsions t19a to address delocalized charges 
-  added carboxylate torsions t31a to address delocalized charges 
-  added carboxylate torsions t42a to address delocalized charges 
-  added carboxylate torsions t48a to address delocalized charges 
-  t51 changed from [*:1]-[#6X4:2]-[#7X3:3]-[*:4] to [*:1]~[#6X4:2]-[#7X3:3]~[*:4] 
-  added nitro torsion t82a to address delocalized charges 
-  added nitro torsion t83a to address delocalized charges 
-  added guanidinium torsion t87a to address delocalized charges 
-  t123a added with a periodicity of 3 to better match that chemistry 
-  t124, changed periodicity from 1 with phase_0, to periodicity of 2 with phase_0, and 3 with phase_0 
-  t130 changed from [*:1]-[#7X4,#7X3:2]-[#7X4,#7X3:3]-[*:4] to [*:1]~[#7X4,#7X3:2]-[#7X4,#7X3:3]~[*:4] 
-  t138a as a child parameter to include [#7X2]-[#7X4] chemistry, other general force fields can parameterize this 
-  new parameter t141a for bridgehead Nitrogen chemistry based on t134 and tweaking the central Nitrogen to be 7x3 
-  new parameter t141b for bridgehead Nitrogen chemistry based on t138 and tweaking the central Nitrogen to be 7x3 
-  t141c, bridgehead carbons with a heteroatom neighbor has non-planar geometry, so a specific torsion term for that 
-  t159, additional periodicities of 1 with phase_0, and 2 with phase_0 
-  t160, additional periodicity of 1 with phase_0 
-  t161 changed from "[*:1]~[#7X3:2]-[#15:3]~[*:4]" to "[*:1]~[#7:2]-[#15:3]~[*:4]" to make it more general 
-  additional periodicities for t143 and t157 based on QM profiles for sulfonamides 
