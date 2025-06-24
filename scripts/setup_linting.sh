#!/usr/bin/env bash
# Set up linting and formatting tools
# Cross-Reference: LINTING.md
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

log_info "Installing lint dependencies"
npm install --save-dev markdownlint markdownlint-cli prettier husky lint-staged

log_info "Initializing Husky"
npx husky install

log_info "Ensuring pre-commit hook is executable"
chmod +x .husky/pre-commit || true

if command -v code >/dev/null; then
  log_info "Installing recommended VS Code extensions"
  code --install-extension esbenp.prettier-vscode
  code --install-extension davidanson.vscode-markdownlint
  code --install-extension editorconfig.editorconfig
  code --install-extension streetsidesoftware.code-spell-checker
else
  log_warn "VS Code not found. Install extensions manually."
fi

log_success "Linting and formatting setup complete!"

