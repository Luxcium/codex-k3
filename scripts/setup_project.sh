#!/bin/bash
# setup_project.sh: Idempotent project setup script
# Creates required directories and files without overwriting existing content

set -e

# Directories to create
DIRS=(".github" ".vscode" "memory-bank" "scripts")

# Files to create (with placeholders if empty)
FILES=(".gitignore" ".clinerules" "README.md" "AGENTS.md")

# Create directories
for dir in "${DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    echo "Created directory: $dir"
  else
    echo "Directory already exists: $dir"
  fi
done

# Create files and add placeholder if empty, with size and content validation
for file in "${FILES[@]}"; do
  # Check if file exists
  if [ ! -f "$file" ]; then
    touch "$file"
    echo "Created file: $file"
  else
    # File exists, check size and log details
    size=$(stat -c%s "$file")
    if [ "$size" -eq 0 ]; then
      echo "File $file exists but is empty (size=0)."
    else
      echo "File $file already exists (size=$size bytes)."
    fi
  fi

  # Only add placeholder if file is empty
  if [ ! -s "$file" ]; then
    echo "# Placeholder for $file" > "$file"
    echo "Added placeholder to $file"
  else
    echo "File $file is not empty, skipping placeholder."
  fi
done

# Make script itself executable
chmod +x "$0"

echo "Project structure setup complete."
