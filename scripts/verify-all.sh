#!/usr/bin/env bash
# Run full repository checks for Markdown and Memory Bank files.
# Cross-Reference: .clinerules/verification.md.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Running full repository verification"

scripts/fix-markdown.sh
scripts/check-markdown.sh
scripts/check-dependencies.sh
scripts/check-memory-bank.sh

log_info "Verification complete"

# Verification
# This script performs all repository checks.
