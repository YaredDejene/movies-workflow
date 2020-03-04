#!/bin/bash
# arg1: input directory
# arg2: work directory
# arg3: output directory

input_directory=${1}
work_directory=${2}
output_directory=${3}

echo "input_directory: ${input_directory}"
echo "work_directory: ${work_directory}"
echo "output_directory: ${output_directory}"
echo '***'

echo '#'
echo '#  Starting Process: Main Unzip'
echo '#'
    
nfiles="$(find "${input_directory}" -name *.zip | wc -l)"
if [ "${nfiles}" -gt "0" ]; then
    echo "// Found ${nfiles} Files"

    for file in ${input_directory}/*.zip; do
        [ -e "$file" ] || continue
        "./unzip.sh" "$file" "$@"       
    done

fi

# Move the files to output
./move_to_output.sh ${output_directory} ${work_directory}/*

# Cleanup
rm -rf ${work_directory}/*