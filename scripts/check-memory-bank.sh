#!/usr/bin/env bash
# Lint all Memory Bank documentation
# Cross-Reference: memory-bank/README.md and .clinerules/main-rules.md.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

dir="memory-bank"

if [ ! -d "$dir" ]; then
  log_error "$dir not found"
  exit 1
fi

log_info "Running markdownlint on $dir/*.md"
markdownlint --config .markdownlint.yaml "$dir"/*.md || {
  log_error "Markdownlint failed for $dir"
  exit 1
}

# Verification
# Run `scripts/verify-all.sh` before committing documentation changes.
