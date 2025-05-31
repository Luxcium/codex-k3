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

Understanding and documenting AI Agent Framework prompt file protocol for creating conditional prompt files that GitHub Copilot can execute based on user-provided context.

## Recent Changes

- **Comprehensive System Analysis**: Analyzed the complete AI Agent Framework including:
  - Memory Bank system and cross-referencing protocols
  - Script-driven file creation via `scripts/generate-prompt-file.sh`
  - Instruction files system (`.github/instructions/`) for passive coding standards
  - Prompt files system (`.github/prompts/`) for executable workflows
- **Protocol Documentation**: Documented the distinction between:
  - **Instructions** - Passive, automatic application via `applyTo` patterns
  - **Prompts** - Active, manual execution via `/promptname` commands
- **Conditional Execution Capabilities**: Identified GitHub Copilot's conditional execution mechanisms:
  - `applyTo` patterns for instructions (`**/*.ts`, `**/src/**`, `ai-agents`, etc.)
  - Variable system for prompts (`${workspaceFolder}`, `${file}`, `${selection}`, `${input:name:default}`)
  - Context-aware workflow design possibilities

## Next Steps

- Create conditional prompt files that GitHub Copilot can execute based on user-provided external context
- Design prompts with intelligent context detection and conditional logic
- Integrate with existing Memory Bank and instruction file systems
- Implement script-driven creation following established protocols
- Document new prompt file patterns and cross-references

## Active Decisions

- Adopted and documented a standardized project root organization by language and framework.
- All setup and file/folder creation must be performed via scripts in the `scripts/` directory, never manually.
- Scripts must be idempotent, must not overwrite existing files, and must warn or skip if files/folders exist.
- All documentation and scripts must be markdown-lint strict mode compliant.
- **New**: Prompt files for conditional execution must leverage GitHub Copilot's `applyTo` patterns and variable system for context-aware behavior.

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
