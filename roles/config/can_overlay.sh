#!/bin/bash

# Define the file path
file_path="/boot/firmware/config.txt"

# Define lines to add as variables
line1="dtparam=spi=on"
line2="dtoverlay=mcp2515-can1,oscillator=16000000,interrupt=25"
line3="dtoverlay=mcp2515-can0,oscillator=16000000,interrupt=23"

# Define the comment line to identify the section
comment_line="# socketCAN config for CANHAT"

# Combine the lines into an array
lines_to_add=("$line1" "$line2" "$line3")

# Check if the file exists
if [ ! -f "$file_path" ]; then
  echo "File $file_path does not exist."
  exit 1
fi

# Check if the comment line is already present in the file
if ! grep -qFx "$comment_line" "$file_path"; then
  # Add a new line after the comment
  echo "" >> "$file_path"
  # If the comment line is not found, add it to the end of the file
  echo "$comment_line" >> "$file_path"
  echo "Added comment: $comment_line"
fi

# Ensure that lines are present in the file
for line in "${lines_to_add[@]}"; do
  # Check if the line is present in the file
  if ! grep -qFx "$line" "$file_path"; then
    # If the line is not found, add it to the end of the file
    echo "$line" >> "$file_path"
    echo "Added: $line"
  else
    echo "Already present: $line"
  fi
done

echo "Operation complete."
