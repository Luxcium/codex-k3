#!/bin/bash
# Idempotent local Python environment setup script
set -e
cd "$(dirname "$0")/../python"
if [ ! -d .venv ]; then
  python3 -m venv .venv
fi
source .venv/bin/activate
if [ -f requirements.txt ]; then
  pip install -r requirements.txt
fi
echo "Local Python environment ready."
