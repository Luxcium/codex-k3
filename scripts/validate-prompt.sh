#!/usr/bin/env bash
# Lint prompt files used for AI workflows
# Cross-Reference: .github/instructions/ai-prompt-creation.instructions.md
# and .clinerules/main-rules.md.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

pattern=".github/prompts/*.prompt.md"

log_info "Linting prompt files"
markdownlint --config .markdownlint.yaml $pattern || {
  log_error "prompt markdownlint failed"
  exit 1
}

# Verification
# Run `scripts/verify-all.sh` after updating prompt files.
