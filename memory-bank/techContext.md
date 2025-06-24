# techContext.md

## Purpose

This file documents the technologies, development setup, technical constraints, and dependencies for any project. It provides a clear reference for all technical aspects, independent of any specific project topic at initialization.

## Structure

- **Technologies Used:** General categories and rationale.
- **Development Setup:** Environment and tooling guidelines.
- **Technical Constraints:** Known limitations or requirements.
- **Dependencies:** How to manage and document them.
- **Call to Action:** Instructions for agents to update and self-regulate this file.

---

## Technologies Used

- **Node.js 22**
- **TypeScript 5.7**
- **Python 3.11**
- **Next.js 14**

### Code Quality & Formatting

- **markdownlint** - Markdown linting with strict rules
- **Prettier** - Code and document formatting
- **Husky** - Git hooks for pre-commit validation
- **EditorConfig** - Cross-editor consistency configuration

## Development Setup

- The project root must be organized by language and framework as specified in [systemPatterns.md](./systemPatterns.md):
  - `src/` for TypeScript sources
  - `web/` for Next.js apps (when coexisting)
  - `scripts/` for shell scripts only
  - `python/` for Python code
  - `notebooks/` for Jupyter notebooks
  - All directory and file creation must be performed via scripts in `scripts/`, never manually.

### Automated Code Quality Setup

- **Linting Infrastructure**: Run `setup-linting.sh` to configure automated quality tools
- **VS Code Configuration**: Enhanced settings with format-on-save and linting integration
- **Pre-commit Hooks**: Automatic validation prevents non-compliant commits
- **Documentation Standards**: All files must pass markdownlint and prettier validation

### Required VS Code Extensions

- `esbenp.prettier-vscode` - Prettier formatting
- `DavidAnson.vscode-markdownlint` - Markdown linting

Refer to the centralized directory structure diagram in [systemPatterns.md](./systemPatterns.md) for the latest and authoritative version.

- Document environment setup and configuration.
- Ensure instructions are clear for onboarding new agents or contributors.
- Update as tooling or setup changes.

## Technical Constraints

- Codebase organization must follow the standard described in [systemPatterns.md](./systemPatterns.md).
- All setup and file/folder creation must follow the patterns in [.clinerules/pattern-examples.md](../.clinerules/pattern-examples.md).
- **Code Quality Requirements**: All code and documentation must pass linting and formatting validation
- **Pre-commit Validation**: Git commits are blocked if files don't meet quality standards
- **Format-on-Save Mandatory**: VS Code must be configured for automatic formatting
- **Documentation Compliance**: All markdown files must comply with strict markdownlint rules
- List any known limitations or requirements.
- Update as new constraints are discovered or resolved.

## Dependencies

### Core Development Dependencies

- markdownlint and markdownlint-cli for markdown validation
- prettier for code and document formatting
- husky for git hook management
- lint-staged for pre-commit file processing

### VS Code Extensions (Recommended)

- esbenp.prettier-vscode
- DavidAnson.vscode-markdownlint

- Document all dependencies and their purposes.
- Update this section as dependencies are added, removed, or updated.

## Dependencies and Relationships

- **Depends On:** [systemPatterns.md](./systemPatterns.md), [projectbrief.md](./projectbrief.md)
- **Required By:** [activeContext.md](./activeContext.md), [progress.md](./progress.md)
- **Why This Order:** techContext.md establishes tools and constraints before active work or progress tracking.
- **Impact Analysis:** Outdated tooling information causes misaligned setups and wasted effort.

## Call to Action

> **All agents and contributors must review, update, and self-regulate this file as the technical context evolves.**  
> **Do not proceed with technical implementation until this file is aligned with the current technology stack and constraints.**  
> **Update this file immediately upon any change in technologies, setup, constraints, or dependencies.**

**See [.clinerules/pattern-examples.md](../.clinerules/pattern-examples.md), [.clinerules/reading-protocol.md](../.clinerules/reading-protocol.md), and [.clinerules/verification.md](../.clinerules/verification.md) for required protocols and implementation patterns.**

---
