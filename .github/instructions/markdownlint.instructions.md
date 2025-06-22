---
applyTo: "**/*.md"
---

# Markdownlint Standards

## Purpose

Provide consistent Markdown formatting across the repository.

## Usage

- Install the CLI tools with `npm install --save-dev markdownlint markdownlint-cli`.
- Run `npx markdownlint --fix "**/*.md"` to automatically apply fixes.
- Repository verification uses `scripts/check-markdown.sh`.
- VS Code users should install the `DavidAnson.vscode-markdownlint` extension for auto-fix on save.

See <https://github.com/DavidAnson/markdownlint> for complete documentation.
