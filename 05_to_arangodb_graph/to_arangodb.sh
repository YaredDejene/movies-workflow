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
code_directory=${5}
transformation_json_full_path=${6}

echo '#'
echo '#  Converting to ArangoDB Graph: ', ${input_file}
echo '#'

# Construct Paths
file_name=${input_file##*/}
file_name_no_ext=${file_name%.*}
file_name_transformed="${file_name_no_ext}-tr.csv"
work_path_results=${work_directory}/results


# # Debug: Show Paths
# echo "!! work_path_results", ${work_path_results}

# Making Results Directory
mkdir -p ${work_path_results}

# Transforming
echo "   Transforming to Arango Graph"
cd ${work_directory}
node \
    ../code/Datagraft-RDF-to-Arango-DB/transformscript.js \
    -t ${transformation_json_full_path} \
    -f ${input_file}

cd ..

move_to_output.sh ${output_directory} ${work_path_results}/${file_name_no_ext}*

echo '   Done'
