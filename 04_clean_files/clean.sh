#!/bin/bash
# arg1: input file
# arg2: input directory
# arg3: work directory
# arg4: output directory
# arg5: transformation directory

input_file=${1}
input_directory=${2}
work_directory=${3}
output_directory=${4}
transformation_full_path=${5}

echo '#'
echo '#  Cleaning using Graftenizer: ', ${input_file}
echo '#'

# Construct Paths
file_name=${input_file##*/}
file_name_no_ext=${file_name%.*}
file_name_transformed="${file_name_no_ext}-tr.csv"
work_path_transformed=${work_directory}/${file_name_transformed}


# Debug: Show Paths
echo "!! work_path_transformed", ${work_path_transformed}

# Transforming
echo "   Transforming"
java -Xmx4g -jar ${transformation_full_path} \
    ${input_file} \
    ${work_path_transformed}

echo '   Done'


