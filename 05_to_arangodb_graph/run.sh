#!/bin/bash
# arg1: input directory
# arg2: work directory
# arg3: output directory
# arg4: code directory
# arg5: transformation json directory

input_directory=${1}
work_directory=${2}
output_directory=${3}
code_directory=${4}
transformation_json_full_path=${5}

echo "input_directory: ${input_directory}"
echo "work_directory: ${work_directory}"
echo "output_directory: ${output_directory}"
echo "code_directory: ${code_directory}"
echo "transformation_json: ${transformation_directory}"
echo '***'

echo '#'
echo '#  Starting Process: Convert to ArangoDB Graph'
echo '#'
    
nfiles="$(find "${input_directory}" -name *.csv | wc -l)"
if [ "${nfiles}" -gt "0" ]; then
    echo "// Found ${nfiles} Files"

    for file in ${input_directory}/*.csv; do
        [ -e "$file" ] || continue
        "./to_arangodb.sh" "$file" "$@"       
    done

fi

# Move the files to output
./move_to_output.sh ${output_directory} ${work_directory}/*

# Cleanup
rm -rf ${work_directory}/*
