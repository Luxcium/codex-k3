#!/usr/bin/env bash
# Format all Markdown files using Prettier and markdownlint --fix
# Cross-Reference: .clinerules/verification.md for lint protocol.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Formatting Markdown files with Prettier"
files=$(git ls-files '*.md')
if command -v npx >/dev/null 2>&1; then
  npx prettier --write $files
else
  log_warn "npx not found; skipping Prettier formatting"
fi

log_info "Applying markdownlint fixes"
if markdownlint --help | grep -q -- '--fix'; then
  markdownlint --fix --config .markdownlint.yaml $files
else
  markdownlint --config .markdownlint.yaml $files
fi

log_success "Markdown formatting complete"

# Verification
# Run `scripts/verify-all.sh` to execute this lint step.
