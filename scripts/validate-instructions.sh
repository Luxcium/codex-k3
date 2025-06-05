#!/usr/bin/env bash
# Lint instruction files used by AI agents
# Cross-Reference: .github/instructions/README.md and .clinerules/main-rules.md.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

pattern=".github/instructions/*.instructions.md"

log_info "Linting instructions files"
markdownlint --config .markdownlint.yaml $pattern || {
  echo "[ERROR] instructions markdownlint failed"
  exit 1
}

# Verification
# Run `scripts/verify-all.sh` after updating instruction files.
