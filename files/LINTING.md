# Linting & Formatting Guide

This project enforces strict code quality standards through automated linting and formatting. All contributors, including AI agents, must adhere to these standards.

## Tools & Configuration

### Markdownlint

[Markdownlint](https://github.com/DavidAnson/markdownlint) is used for Markdown linting.

- **Config file**: `.markdownlint.yaml`
- **Autofixable rules**: Enabled and required

```bash
# Lint and fix all Markdown files
npm run lint:md
```

### Prettier

[Prettier](https://prettier.io/) is used for code formatting.

- **Config file**: `.prettierrc.yaml`
- **Supported files**: Markdown, JSON, YAML, etc.

```bash
# Format all files
npm run format:prettier
```

## Automated Workflows

### VS Code Integration

Install the recommended extensions (will be prompted automatically):
- `esbenp.prettier-vscode`
- `davidanson.vscode-markdownlint`

VS Code is configured to:
- Format on save
- Apply autofix on save
- Show linting errors inline

### Command Line Usage

```bash
# Check formatting without fixing
npm run lint

# Fix all linting and formatting issues
npm run format

# Run before committing changes
npm run format
```

### Git Hooks

The project uses Husky and lint-staged to:
- Automatically lint and format files on pre-commit
- Prevent commits with unfixable linting errors

## Requirements for Contributors

1. **All code must pass linting**: Failure to comply will block commits
2. **Autofixable issues must be fixed**: Use `npm run format` before committing
3. **Minimize the need for autofixes**: Write compliant code from the start

## For AI Agents

AI agents (GitHub Copilot, etc.) must:
- Write code that follows all linting rules to minimize autofix needs
- Include proper formatting for all generated content
- Be aware of the project's linting rules when suggesting code
- Ensure Markdown content has proper heading structure, spacing, and formatting