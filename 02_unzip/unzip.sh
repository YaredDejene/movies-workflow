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
echo '#  Unzipping ', ${input_file}
echo '#'

# Construct Paths
file_name=${input_file##*/}
file_name_no_ext=${file_name%.*}
extract_directory=${work_directory}/${file_name_no_ext}


# Debug: Show Paths
echo "!! extract_directory", ${extract_directory}

# Extract Zip
echo "   Extracting without folder structure"
unzip -j ${input_file} -d ${extract_directory}

# Move the files to output
./move_to_output.sh ${output_directory} ${extract_directory}/*

echo '   Done'

