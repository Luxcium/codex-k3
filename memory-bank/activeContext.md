- [2025-06-02T12:35:00Z] Current State: Python environment standards, scripts, Dockerfile, compose, and documentation created; Last Action: Enacted full agentic setup for both local and Docker Python environments, supporting both isolated and volume-attached workflows; Rationale: User required flexible, non-prescriptive environment setup with full documentation and automation; Next Intent: Update memory bank files and dependencies.md per self-documentation and file-organization protocols.
Note: Executing Self-Documentation Protocol. This entry reaffirms that all actions and context changes must be documented and that this rule itself is part of the ongoing protocol.
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

Completed comprehensive Docker ecosystem with three complementary workflow approaches: exotic patterns, consolidated templates, and modular build/run strategies. Successfully integrated valuable concepts from external AI agent evaluation while maintaining superior AI Agent Framework protocols.

## Recent Changes

- **Complete Docker Ecosystem**: Created three complementary Docker workflow approaches:
  - `docker-exotic-generator.prompt.md` - Advanced patterns with security-first approach
  - `docker-consolidated-template.prompt.md` - Validated template from external agent evaluation
  - `docker-modular-workflow.prompt.md` - Build/run separation with volume mounting strategies
- **External Agent Integration**: Successfully evaluated and integrated French template concepts:
  - Modular Dockerfile approach (separate build and run containers)
  - Volume-first development strategy instead of copy-heavy approaches
  - CLI parameterization with extensive build args and environment variables
  - Fedora Linux KDE + fnm environment compatibility
- **AI Agent Framework Enhancement**: Advanced integration capabilities:
  - Cross-referencing between all three Docker approaches
  - Memory Bank dependency tracking for modular patterns
  - Quality assurance checklists specific to each workflow type
  - Script-driven automation for development and production workflows
- **Protocol Validation**: Confirmed robustness of AI Agent Framework:
  - Successfully integrated external concepts without breaking established patterns
  - Maintained script-driven generation and no-placeholder principles
  - Enhanced cross-agent collaboration patterns across multiple workflow types

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
