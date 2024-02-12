#!/bin/bash

# find a good env

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde'

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd'

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd'
