#!/bin/bash
# arg1: output directory
# arg2 ... : files to move

output_directory=${1}

# Remove the first argument to make it easy to loop through files
shift

echo "output_directory: ${output_directory}"
#echo $@
echo '***'

echo '#'
echo '#   Starting: move_to_output'
echo '#'


# Loop through all files in argument list
while [ "$1" ]
do
    from_file_path=${1}
    file_name=${from_file_path##*/}
    to_file_path=${output_directory}/${file_name}
    shift
    
    echo "   Moving file ${from_file_path} to ${to_file_path}"
    mv ${from_file_path} ${to_file_path}    

done


