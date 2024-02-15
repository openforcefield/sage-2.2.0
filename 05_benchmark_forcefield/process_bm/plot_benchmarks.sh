#!/bin/bash

# DDE benchmarks
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'

# DDE with RMSD filter--this doesn't work with filtering rn
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde'

# python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'

#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
#python plot_benchmarks.py --dir 'Sage_220_benchmark' --rmsd_filter True --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'


# RMSD benchmarks
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'


# TFD benchmarks
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd'

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt --filter_pattern 'small_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt --filter_pattern '3_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt --filter_pattern '4_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt --filter_pattern '5_membered_rings'
#
# python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt --filter_pattern 'sulfonamides'
