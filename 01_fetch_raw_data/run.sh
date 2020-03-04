#!/bin/bash
# arg1: output_directory

output_directory=${1}

echo "output_directory: ${output_directory}"

echo '#'
echo '#  Starting Process: fetch_raw_data'
echo '#'

# Download movies data
wget https://www.dropbox.com/s/3gcvo75m64zv681/imdb.name.basics.zip -P ${output_directory}

echo '   Done'



