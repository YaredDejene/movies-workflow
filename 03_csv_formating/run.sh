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
echo '#  Starting Process: TSV to CSV '
echo '#'
    
nfiles="$(find "${input_directory}" -name *.tsv | wc -l)"
if [ "${nfiles}" -gt "0" ]; then
    echo "// Found ${nfiles} Files"

    for file in ${input_directory}/*.tsv; do
        [ -e "$file" ] || continue
        "./format_csv.sh" "$file" "$@"       
    done

fi

# Move the files to output
./move_to_output.sh ${output_directory} ${work_directory}/*

# Cleanup
rm -rf ${work_directory}/*