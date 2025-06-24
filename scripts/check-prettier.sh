#!/usr/bin/env bash
# Verify Prettier formatting
# Cross-Reference: LINTING.md
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Running Prettier check"
prettier --check . || {
  log_error "Prettier formatting failed"
  exit 1
}

# Verification
# Run `scripts/verify-all.sh` to execute this lint step.

