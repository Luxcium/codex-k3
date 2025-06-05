#!/usr/bin/env bash
# Validate Memory Bank dependency structure
# Cross-Reference: memory-bank/dependencies.md and .clinerules/main-rules.md.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

FILE="memory-bank/dependencies.md"

if [ ! -f "$FILE" ]; then
  log_error "$FILE not found"
  exit 1
fi

if grep -q "Dependencies and Relationships" "$FILE"; then
  log_info "dependencies.md structure valid"
else
  log_error "dependencies.md missing structure"
  exit 1
fi

log_info "Verifying Markdown compliance…"
markdownlint --config .markdownlint.yaml "$FILE" || {
  log_error "$FILE failed markdownlint."
  exit 1
}

# Verification
# Run `scripts/verify-all.sh` to ensure repository consistency.
