#!/usr/bin/env bash
# Validate Prettier formatting across the repository
# Cross-Reference: .clinerules/verification.md
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Checking Prettier formatting"
files=$(git ls-files '*.js' '*.ts' '*.tsx' '*.jsx' '*.json' '*.yaml' '*.yml' '*.md')
if npx prettier --version >/dev/null 2>&1; then
  npx prettier --check $files || {
    log_error "Prettier formatting issues found"
    exit 1
  }
else
  log_error "Prettier is not installed"
  exit 1
fi

# Verification
# Run `scripts/verify-all.sh` to include this check.
