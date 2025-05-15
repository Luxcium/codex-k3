#!/bin/bash
# setup_project.sh: Idempotent project setup script
# Creates required directories and files without overwriting existing content

set -e

# Directories to create
DIRS=(".github" ".vscode" "memory-bank" "scripts")

# Files to create (with placeholders if empty)
FILES=(".gitignore" ".clinerules" "README.md")

# Create directories
for dir in "${DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    echo "Created directory: $dir"
  else
    echo "Directory already exists: $dir"
  fi
done

# Create files and add placeholder if empty
for file in "${FILES[@]}"; do
  if [ ! -f "$file" ]; then
    touch "$file"
    echo "Created file: $file"
  else
    echo "File already exists: $file"
  fi
  if [ ! -s "$file" ]; then
    echo "# Placeholder for $file" > "$file"
    echo "Added placeholder to $file"
  fi
done

# Make script itself executable
chmod +x "$0"

echo "Project structure setup complete."
