#!/bin/bash
#
# # ICRMSD -- BONDS
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd'
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
# #
# # # Filtering for small rings
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern 'small_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern '3_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern '4_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern '5_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern 'sulfonamides' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern '4r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern '4r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern '3r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --filter_pattern '3r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

#
# # ANGLES
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle'
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
# #
# # # Filtering for small rings
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern 'small_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '3_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '4_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '5_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern 'sulfonamides' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '4r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '4r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '3r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '3r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

#
# # DIHEDRALS
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral'
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
# #
# # # Filtering for small rings
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern 'small_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '3_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '4_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '5_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern 'sulfonamides' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '4r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '4r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '3r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '3r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt


# Impropers
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper'
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
# #
# # # Filtering for small rings
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern 'small_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '3_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '4_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '5_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern 'sulfonamides' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '4r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '4r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '3r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '3r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt


# # DDE benchmarks
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde'
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
# #
# # # Filtering for small rings
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern 'small_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern '3_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern '4_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern '5_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern 'sulfonamides' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern '4r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern '4r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt
#
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern '3r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'dde' --filter_pattern '3r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

#
#
# # RMSD benchmarks
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd'
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
# #
# # # Filtering for small rings
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern 'small_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern '3_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern '4_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern '5_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern 'sulfonamides' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern '4r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern '4r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern '3r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'rmsd' --filter_pattern '3r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

#
# # TFD benchmarks
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd'
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt
# #
# # # Filtering for small rings
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern 'small_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\]\[r4\]\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern '3_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern '4_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern '5_membered_rings' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern 'sulfonamides' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
#
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern '4r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
# python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern '4r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern '3r_heteroatoms' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_and_nor4_benchmark' --type 'tfd' --filter_pattern '3r_C' --outlier_files outlier_ids/all_r7_outliers.txt --outlier_files outlier_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt 
