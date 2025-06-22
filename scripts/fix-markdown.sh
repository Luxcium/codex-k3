#!/usr/bin/env bash
# fix-markdown.sh: Auto-fix Markdown lint issues
# Cross-Reference: memory-bank/dependencies.md
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Auto-fixing markdown files"
files=$(git ls-files '*.md')
if markdownlint --help | grep -q -- '--fix'; then
  markdownlint --config .markdownlint.yaml --fix $files
else
  log_warn "markdownlint --fix not supported; running without fix"
  markdownlint --config .markdownlint.yaml $files
fi
if [ $? -ne 0 ]; then
  log_error "markdownlint fix failed"
  exit 1
fi
