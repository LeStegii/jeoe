#!/bin/bash

# Read and parse the manifest.json file
read -r -d '' json_data << EOF
$(<manifest.json)
EOF

# Extract the name and version from the JSON data
name=$(echo "$json_data" | grep -o '"name": *"[^"]*"' | cut -d '"' -f 4)
version=$(echo "$json_data" | grep -o '"version": *"[^"]*"' | cut -d '"' -f 4)

# Convert name and version to lowercase and replace spaces with dashes
name_lowercase=$(echo "$name" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
version_lowercase=$(echo "$version" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Define the name of the output ZIP file
output_zip="${name_lowercase}-${version_lowercase}.zip"

# List of files to include in the ZIP
files_to_zip=("overrides/*" "manifest.json" "modlist.html")

# Create the ZIP archive
zip -r "build/$output_zip" "${files_to_zip[@]}"

echo "Created ZIP file '$output_zip' for modpack '$name' version '$version'."