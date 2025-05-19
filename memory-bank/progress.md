# progress.md

## Purpose
This file tracks what works, what remains to be built, current status, and known issues for any project. It provides a clear, up-to-date snapshot of project progress, independent of any specific topic at initialization.

## Structure
- **What Works:** Features or components that are complete and functional.
- **What's Left:** Remaining tasks or features to build.
- **Current Status:** Overall project health and milestones.
- **Known Issues:** Bugs, blockers, or technical debt.
- **Call to Action:** Instructions for agents to update and self-regulate this file.

---

## What Works

- Migration to modular rules system complete: All project rules and protocols are now maintained in `.clinerules/` as modular, cross-referenced markdown files.
- AGENTS.md, README.md, and all Memory Bank files updated to reference the new rules folder and protocols.
- Project is now fully aligned with prompt-engineering best practices and Memory Bank guidelines.

## What's Left

- List outstanding tasks, features, or improvements here.

## Current Status

- Summarize the current state of the project.

## Known Issues

- Document bugs, blockers, or technical debt here.

## Compliance with Project Setup Rules

- **All setup and file/folder creation must be performed via scripts in the `scripts/` directory, never manually.**
- **Scripts must be idempotent, must not overwrite existing files, and must warn or skip if files/folders exist.**
- **All rules and intentions must be documented in the README before implementation.**
- **The README and all scripts must remain markdown-lint strict mode compliant at all times.**

## Dependencies and Relationships

- **Depends On:** _[List upstream dependencies, e.g., activeContext.md, techContext.md, etc.]_
- **Required By:** _[List downstream dependencies, if any]_
- **Why This Order:** _[Explain why progress.md depends on active context and technical context]_
- **Impact Analysis:** _[Describe what happens if this file is not kept up to date or if dependencies change]_

## Call to Action

> **All agents and contributors must review, update, and self-regulate this file as progress is made.**  
> **Do not proceed with new work or mark tasks as complete until this file accurately reflects the current project status.**  
> **Update this file immediately upon any change in progress, status, or known issues.**

**See [.clinerules/process-evolution.md](../.clinerules/process-evolution.md), [.clinerules/verification.md](../.clinerules/verification.md), and [.clinerules/learning-journal.md](../.clinerules/learning-journal.md) for required protocols and self-regulation guidance.**

---
