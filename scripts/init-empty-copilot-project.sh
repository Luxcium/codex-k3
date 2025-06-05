#!/usr/bin/env bash
# Initialize a minimal project structure for VS Code Copilot.
# Cross-Reference: memory-bank/systemPatterns.md and .clinerules/main-rules.md.

# Create necessary directories
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

mkdir -p .github/prompts
mkdir -p memory-bank
mkdir -p .vscode
mkdir -p .clinerules

# Must not introduce noticeable side-effects.
# Must be pure unless the things that must exist do not exist.
# Create necessary files without overwriting existing ones.
[ -f .github/copilot-instructions.md ] || touch .github/copilot-instructions.md
[ -f AGENTS.md ] || touch AGENTS.md
[ -f .github/prompts/default.prompt.md ] || touch .github/prompts/default.prompt.md
[ -f .vscode/settings.json ] || touch .vscode/settings.json

log_success "VSCode Copilot structure created safely."

# Verification
# Run `scripts/verify-all.sh` after initialization.
