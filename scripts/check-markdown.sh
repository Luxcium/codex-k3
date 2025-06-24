#!/usr/bin/env bash
# Lint all Markdown files in the repository
# Cross-Reference: .clinerules/verification.md for lint protocol.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Running markdownlint on all tracked markdown files"
files=$(git ls-files '*.md')
if npx markdownlint --help | grep -q -- '--strict'; then
  npx markdownlint --config .markdownlint.yaml --strict $files
else
  log_warn "markdownlint --strict not supported; running without strict mode"
  npx markdownlint --config .markdownlint.yaml $files
fi
if [ $? -ne 0 ]; then
  log_error "markdownlint failed"
  exit 1
fi

# Verification
# Run `scripts/verify-all.sh` to execute this lint step.
