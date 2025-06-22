#!/usr/bin/env bash
# format-code.sh: Format repository code with Prettier
# Cross-Reference: memory-bank/dependencies.md
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Running Prettier on repository"
files=$(git ls-files '*.js' '*.ts' '*.tsx' '*.jsx' '*.json' '*.yaml' '*.yml' '*.md')
prettier --config .prettierrc.yaml --write $files || {
  log_error "Prettier formatting failed"
  exit 1
}
