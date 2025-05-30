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

Documenting and enforcing the code organization standard across the Memory Bank and project documentation. Ensuring all references, rationale, and compliance steps are clearly recorded and cross-referenced.

## Recent Changes

- Added project root code organization standard to systemPatterns.md (Architecture Overview, Key Technical Decisions).
- Updated techContext.md (Development Setup, Technical Constraints) to reference and enforce the standard.
- Began propagation of the standard to all relevant documentation and compliance sections.

## Next Steps

- Update progress.md to track this documentation update as an outstanding and then completed task.
- Review all Memory Bank and .clinerules files for cross-reference and compliance.
- Verify markdown-lint compliance for all updated documentation.
- Communicate the new standard to all contributors and ensure script-driven enforcement.

## Active Decisions

- Adopted and documented a standardized project root organization by language and framework.
- All setup and file/folder creation must be performed via scripts in the `scripts/` directory, never manually.
- Scripts must be idempotent, must not overwrite existing files, and must warn or skip if files/folders exist.
- All documentation and scripts must be markdown-lint strict mode compliant.

## Dependencies and Relationships

- **Depends On:** _[List upstream dependencies, e.g., techContext.md, systemPatterns.md, etc.]_
- **Required By:** _[List downstream dependencies, e.g., progress.md, etc.]_
- **Why This Order:** _[Explain why activeContext.md must be established before progress tracking]_
- **Impact Analysis:** _[Describe what happens if this file is not kept up to date or if dependencies change]_

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
