#!/bin/bash
# Idempotent Docker Python environment setup script
set -e
cd "$(dirname "$0")/../python"
docker build -t my-python-app .
echo "Docker Python image built."
