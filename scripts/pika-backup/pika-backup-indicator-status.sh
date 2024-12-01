#!/bin/bash

file_path="/home/giorgos/.cache/pika-backup/progress.txt"

if [ ! -f "$file_path" ]; then
    echo "Error: File $file_path not found."
    exit 1
fi

content=$(cat "$file_path")

if [[ "$content" == *"COMPLETED"* ]]; then
    exit 0
elif [[ "$content" == *"RUNNING"* ]]; then
    exit 1
else
    exit 2
fi
