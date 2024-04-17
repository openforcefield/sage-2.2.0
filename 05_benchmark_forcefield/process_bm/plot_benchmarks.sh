# !/bin/bash












####
# ICRMSD -- BONDS
####
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd'
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt

# Filtering
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern 'small_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\,r4\,r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '3_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '4_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '5_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern 'sulfonamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern 'sulfamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\#7\:3\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '4r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '4r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '3r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '3r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --filter_pattern '5r_S' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\*\;r5\:1\]1\@\[\#16\;r5\:2\]\@\[\*\;r5\:3\]\@\[r5\]\@\[r5\]1.txt


####
# ANGLES
####

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle'
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt

# Filtering
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern 'small_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\,r4\,r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '3_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '4_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '5_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern 'sulfonamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern 'sulfamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\#7\:3\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '4r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '4r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '3r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '3r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'angle' --filter_pattern '5r_S' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\*\;r5\:1\]1\@\[\#16\;r5\:2\]\@\[\*\;r5\:3\]\@\[r5\]\@\[r5\]1.txt


####
# DIHEDRALS
####

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral'
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt

# Filtering
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern 'small_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\,r4\,r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '3_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '4_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '5_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern 'sulfonamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern 'sulfamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\#7\:3\].txt


python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '4r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '4r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '3r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '3r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'dihedral' --filter_pattern '5r_S' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\*\;r5\:1\]1\@\[\#16\;r5\:2\]\@\[\*\;r5\:3\]\@\[r5\]\@\[r5\]1.txt

####
# Impropers
####

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper'
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt

# Filtering
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern 'small_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\,r4\,r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '3_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '4_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '5_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern 'sulfonamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern 'sulfamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\#7\:3\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '4r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '4r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '3r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '3r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'icrmsd' --ic_type 'improper' --filter_pattern '5r_S' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\*\;r5\:1\]1\@\[\#16\;r5\:2\]\@\[\*\;r5\:3\]\@\[r5\]\@\[r5\]1.txt

####
# DDE benchmarks
####
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde'
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt

# Filtering
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern 'small_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\,r4\,r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern '3_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern '4_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern '5_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern 'sulfonamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern 'sulfamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\#7\:3\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern '4r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern '4r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern '3r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde' --filter_pattern '3r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'dde'  --filter_pattern '5r_S' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\*\;r5\:1\]1\@\[\#16\;r5\:2\]\@\[\*\;r5\:3\]\@\[r5\]\@\[r5\]1.txt

###
# RMSD benchmarks
####

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd'
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt

# Filtering
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern 'small_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\,r4\,r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern '3_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern '4_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern '5_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern 'sulfonamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern 'sulfamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\#7\:3\].txt


python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern '4r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern '4r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern '3r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd' --filter_pattern '3r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'rmsd'  --filter_pattern '5r_S' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\*\;r5\:1\]1\@\[\#16\;r5\:2\]\@\[\*\;r5\:3\]\@\[r5\]\@\[r5\]1.txt

####
# TFD benchmarks
####

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd'
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt

# Filtering
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern 'small_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\,r4\,r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern '3_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r3\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern '4_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern '5_membered_rings' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[r5\:1\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern 'sulfonamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\*\:3\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern 'sulfamides' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#7\:1\]-\[\#16X4\:2\]\(\=\[\#8\]\)\(\=\[\#8\]\)~\[\#7\:3\].txt

python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern '4r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#8\;r4\,\#7\;r4\:1\].txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern '4r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r4\:1\]1\@\[\#6\;r4\:2\]\@\[\#6\;r4\:3\]\@\[\#6\;r4\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern '3r_heteroatoms' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\!\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd' --filter_pattern '3r_C' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\#6\;r3\:1\]1\@\[\#6\;r3\:2\]\@\[\#6\;r3\:3\]1.txt
python plot_benchmarks.py --dir 'Sage_220_benchmark' --type 'tfd'  --filter_pattern '5r_S' --problem_files problem_ids/all_r7_outliers.txt --problem_files problem_ids/sx4_outliers.txt --filter_file filter_ids/filtered_ids_\[\*\;r5\:1\]1\@\[\#16\;r5\:2\]\@\[\*\;r5\:3\]\@\[r5\]\@\[r5\]1.txt
