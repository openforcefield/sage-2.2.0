# Benchmarking the performance of the Sage 2.2.0 fit

## Environment
The python environment for the benchmarking is included as `ib-env.yaml`. After setting up that environment, you have to download the internal benchmarking package from here. This work was done with version ibstore-0+untagged.112.gde80859, specifically this [commit](https://github.com/mattwthompson/ib/commit/de80859f37b345845f9a7ba5240a4279e5913458).

Once you've cloned the internal benchmarking package, go to that directory, activate your conda environment, and install the benchmarking package using `pip instsall -e .`
