#!/usr/bin/env bash
# Idempotent Docker Python environment setup script
# Purpose: build the base Docker image for Python workflows.
# Cross-Reference: memory-bank/docker-workflow.md and .clinerules/main-rules.md.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

cd "$(dirname "$0")/../python"

if docker image inspect my-python-app >/dev/null 2>&1; then
  log_info "Docker image 'my-python-app' already exists"
else
  log_info "Building Docker image 'my-python-app'"
  docker build -t my-python-app .
  log_info "Docker Python image built"
fi

# Verification
# Run `scripts/verify-all.sh` after building the Docker image.
