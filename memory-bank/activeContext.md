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

Completed comprehensive documentation updates for both `.github/prompts/README.md` and `.github/instructions/README.md`, ensuring both directories have accurate, complete documentation reflecting all files and their purposes within the AI Agent Framework.

## Recent Changes

- **Prompts Documentation**: Updated `.github/prompts/README.md` to include all 13 prompt files with proper categorization
- **Instructions Documentation**: Updated `.github/instructions/README.md` to include all 10 instruction files with logical grouping:
  - Language Standards: typescript-standards, python-standards, python-notebook-standards
  - Project Organization: file-organization
  - AI Agent Workflow: ai-instruction-creation, ai-prompt-creation
  - Documentation & Standards: instruction-authoring-standards, self-documentation
  - Code Quality: no_dummy-no_placeholders
- Enhanced cross-references between prompts and instructions directories
- Added special `ai-agents` pattern documentation for AI agent behavior modification
- Improved documentation structure for complete AI Agent Framework coverage

## Next Steps

- Update progress.md to track both README.md updates as completed
- Continue reviewing all Memory Bank and .clinerules files for cross-reference and compliance
- Verify markdown-lint compliance for all updated documentation
- Test both updated documentation sets to ensure all cross-references work correctly
- Monitor for any additional prompt or instruction files that may be added to maintain comprehensive coverage

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
