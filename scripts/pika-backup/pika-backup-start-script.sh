#!/bin/bash

file_path="/home/giorgos/.cache/pika-backup/progress.txt"

# Check if the directory exists
if [ ! -d "$(dirname "$file_path")" ]; then
  echo "Error: Directory /home/giorgos/.cache/pika-backup does not exist."
  exit 1
fi

# Create the file or overwrite existing content
echo "$OUTCOME" > "$file_path"
