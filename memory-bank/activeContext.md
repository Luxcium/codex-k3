## [2025-02-06]

# activeContext.md

## Purpose

This file tracks the current work focus, recent changes, next steps, and active decisions for any project. It is the primary reference for understanding the present state of the project, independent of any specific topic at initialization.

## Structure

- **Current Work Focus:** What is being worked on right now.
- **Recent Changes:** Summary of the latest updates.
- **Next Steps:** Planned actions and priorities.
- **Active Decisions:** Key choices and considerations.
- **Call to Action:** Instructions for agents to update and self-regulate this file.

---

## Current Work Focus

Completed linting and formatting infrastructure setup with comprehensive automated code quality enforcement. Moved from `files/` staging directory to project root, implementing VS Code integration, pre-commit hooks, and automated formatting standards. This foundational quality infrastructure supports all future development work across the project.

Current work focuses on validating the linting setup and ensuring all Memory Bank files are compliant with the new markdown-lint and prettier standards. The infrastructure includes automated format-on-save, pre-commit validation, and AI agent-compatible configuration.

## Recent Changes

- **Linting & Formatting Infrastructure**: Implemented comprehensive automated code quality system:
  - Moved configuration files from `files/` staging directory to project root
  - `.editorconfig` - Cross-editor consistency configuration
  - `.prettierrc.yaml` - Prettier formatting rules and standards
  - `.markdownlint.yaml` - Strict markdown linting configuration
  - `.husky/pre-commit` - Git pre-commit hooks for automated validation
  - `setup-linting.sh` - Automated setup script for linting infrastructure
- **VS Code Integration**: Enhanced development environment configuration:
  - Format-on-save enabled for all file types
  - Prettier as default formatter with config path specification
  - Enhanced Copilot Chat settings with instruction/prompt file support
  - Markdown-specific formatting rules and validation
  - Terminal environment variables for Codex integration
- **Documentation Standards**: Established automated quality enforcement:
  - `LINTING.md` - Comprehensive documentation of linting standards
  - Updated `README.md` with linting and formatting section
  - Mandatory autofix requirements for all contributors and AI agents
  - Integration with existing script-driven creation protocols
- **Project Infrastructure**: Foundational quality improvements:
  - Removed staging files after successful migration to project root
  - Automated pre-commit validation prevents non-compliant commits
  - All future development must meet formatting and linting standards
  - Enhanced VS Code extensions configuration for recommended tooling

## Next Steps

### Infrastructure Validation

- Test linting infrastructure across all project files
- Validate markdown-lint compliance for all Memory Bank documentation
- Verify prettier formatting consistency across configuration files
- Confirm pre-commit hooks function correctly with sample commits

### Memory Bank Compliance

- Review all Memory Bank files for new linting standards
- Update cross-references to match formatting requirements
- Ensure all documentation meets strict markdown-lint rules
- Validate VS Code settings integration with AI agent workflows

### Quality Enforcement

- Test automated format-on-save functionality
- Verify AI agent compatibility with new linting standards
- Document best practices for maintaining code quality
- Create validation workflows for ongoing compliance monitoring

## Active Decisions

- Adopted and documented a standardized project root organization by language and framework.
- All setup and file/folder creation must be performed via scripts in the `scripts/` directory, never manually.
- Scripts must be idempotent, must not overwrite existing files, and must warn or skip if files/folders exist.
- All documentation and scripts must be markdown-lint strict mode compliant.
- **Automated Code Quality**: All code and documentation must pass linting and formatting validation before commit.
- **Format-on-Save Standard**: VS Code configuration enforces automatic formatting to maintain consistency.
- **Pre-Commit Validation**: Git hooks prevent commits that don't meet quality standards.
- **Documentation Standards**: All markdown files must comply with strict linting rules and prettier formatting.

## Dependencies and Relationships

- **Depends On:** techContext.md, systemPatterns.md, projectbrief.md
- **Required By:** progress.md, all prompt and instruction file creation
- **Why This Order:** activeContext.md must reflect current AI Agent Framework understanding before implementing new conditional prompt patterns
- **Impact Analysis:** Changes to prompt file protocols affect all AI agents (Cline AI, Codex CLI, VS Code Copilot) and their collaborative workflows

## Call to Action

> **All agents and contributors must review, update, and self-regulate this file as work progresses.**  
> **Do not proceed with new work or changes until this file accurately reflects the current state and priorities.**  
> **Update this file immediately upon any change in work focus, plans, or decisions.**

## AI Agent Instructions

This project supports three AI agents with specific entry points:

- **Cline AI** → `.clinerules/main-rules.md` (Cline AI's primary instruction file)
- **Codex CLI** → `AGENTS.md` (Codex CLI's primary instruction file)
- **VS Code Copilot** → `.github/copilot-instructions.md` (VS Code Copilot's primary instruction file)

**See [.clinerules/process-evolution.md](../.clinerules/process-evolution.md), [.clinerules/verification.md](../.clinerules/verification.md), and [.clinerules/learning-journal.md](../.clinerules/learning-journal.md) for required protocols and self-regulation guidance.**

---
