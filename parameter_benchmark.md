# Comparing geometric performance across parameters added in Sage 2.1.0

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
-  added carboxylate torsions t18a to address delocalized charges in Sage 2.1.0
  ![t18a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/dbca205d-25ea-4668-9e1b-21b4332fa20e)

-  added amidinium torsion t18b to address delocalized charges in Sage 2.1.0
  ![t18b](https://github.com/openforcefield/sage-2.2.0/assets/29759281/afd5edc2-93c8-4f73-879e-afb0ef261338)

-  added carboxylate torsions t19a to address delocalized charges in Sage 2.1.0
  ![t19a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/e5e2a55d-0035-4702-b8f0-d7b9f9f257fa)

-  added carboxylate torsions t31a and t42a to address delocalized charges in Sage 2.1.0, though these aren't represented in our benchmark dataset
-  added carboxylate torsions t48a to address delocalized charges in Sage 2.1.0
  ![t48a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/fa61b0d6-40a3-4ba1-bb84-200e015b1d10)

-  t51 changed from [*:1]-[#6X4:2]-[#7X3:3]-[*:4] to [*:1]~[#6X4:2]-[#7X3:3]~[*:4] in Sage 2.1.0
  ![t51](https://github.com/openforcefield/sage-2.2.0/assets/29759281/f903f1b6-93db-40c8-8ee3-e6246f60c751)

-  added nitro torsion t82a to address delocalized charges in Sage 2.1.0
  ![t82a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/76172aba-d8f0-4c1b-811e-4ec25880bbbc)

-  added nitro torsion t83a to address delocalized charges in Sage 2.1.0
  ![t83a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/c7c7e843-13ac-46a8-892e-efa10241bc9e)

-  added guanidinium torsion t87a to address delocalized charges in Sage 2.1.0
  ![t87a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/6e1330a6-bd55-4cef-9c2a-c9ebba20cc22)

-  t123a added with a periodicity of 3 to better match that chemistry in Sage 2.1.0
  ![t123a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/8f5d6649-a73c-4b17-b441-06516313e8b3)

-  t124, changed periodicity from 1 with phase_0, to periodicity of 2 with phase_0, and 3 with phase_0 in Sage 2.1.0
  ![t124](https://github.com/openforcefield/sage-2.2.0/assets/29759281/728d509a-8440-47aa-b746-1a363b3f145d)

-  t130 changed from [*:1]-[#7X4,#7X3:2]-[#7X4,#7X3:3]-[*:4] to [*:1]~[#7X4,#7X3:2]-[#7X4,#7X3:3]~[*:4] in Sage 2.1.0
  ![t130](https://github.com/openforcefield/sage-2.2.0/assets/29759281/cbd0ae23-046c-45a8-876c-aaedb472cb46)

-  t138a as a child parameter to include [#7X2]-[#7X4] chemistry, other general force fields can parameterize this in Sage 2.1.0
  
-  new parameter t141a for bridgehead Nitrogen chemistry based on t134 and tweaking the central Nitrogen to be 7x3 in Sage 2.1.0
  ![t141a](https://github.com/openforcefield/sage-2.2.0/assets/29759281/87c101df-0586-46f3-b24a-320f72499966)

-  new parameter t141b for bridgehead Nitrogen chemistry based on t138 and tweaking the central Nitrogen to be 7x3 in Sage 2.1.0
  ![t141b](https://github.com/openforcefield/sage-2.2.0/assets/29759281/92792847-fd77-4da9-b5f4-e1a1b6dad906)

-  t141c, bridgehead carbons with a heteroatom neighbor has non-planar geometry, so a specific torsion term for that in Sage 2.1.0
  ![t141c](https://github.com/openforcefield/sage-2.2.0/assets/29759281/82c81f48-91bd-408d-a386-22de99da21ca)

-  t159, additional periodicities of 1 with phase_0, and 2 with phase_0 in Sage 2.1.0
  ![t159](https://github.com/openforcefield/sage-2.2.0/assets/29759281/b7b43197-2e4d-4f42-8094-ce0fd16670fd)

-  t160, additional periodicity of 1 with phase_0 in Sage 2.1.0
  ![t160](https://github.com/openforcefield/sage-2.2.0/assets/29759281/1715c8ca-b39d-4376-8462-0312d2365be0)

-  t161 changed from "[*:1]~[#7X3:2]-[#15:3]~[*:4]" to "[*:1]~[#7:2]-[#15:3]~[*:4]" to make it more general in Sage 2.1.0
  ![t161](https://github.com/openforcefield/sage-2.2.0/assets/29759281/5be03035-26ae-4713-bf2c-d2236b47118c)

-  additional periodicities for t143 and t157 based on QM profiles for sulfonamides in Sage 2.1.0
  ![t143](https://github.com/openforcefield/sage-2.2.0/assets/29759281/fb15e2c1-3914-41ae-9e4d-8a6294194774)

![t157](https://github.com/openforcefield/sage-2.2.0/assets/29759281/8b3c1c32-1f29-4106-8459-06a49149077c)
