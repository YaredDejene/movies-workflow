#!/bin/bash
# arg1: input file
# arg2: input directory
# arg3: work directory
# arg4: output directory

input_file=${1}
input_directory=${2}
work_directory=${3}
output_directory=${4}

echo '#'
echo '#  Converting tsv to csv ', ${input_file}
echo '#'

# Construct Paths
file_name=${input_file##*/}
file_name_no_ext=${file_name%.*}
file_name_csv="${file_name_no_ext}.csv"
input_file_csv=${work_directory}/${file_name_csv}


echo "!! input_file_csv", ${input_file_csv}

# Files are now in the work dir ... ready to be processed

# Converting TSV -> CSV
echo "   Converting TSV > CSV"
tr '\t' , < ${input_file} > ${input_file_csv}


