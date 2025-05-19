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

This Memory Bank is initialized to provide a template for tracking active work and decisions. Update this section as soon as work begins or priorities shift.

## Recent Changes

- Migrated all project rules and protocols from a monolithic `.clinerules` file to modular files in `.clinerules/`.
- Updated AGENTS.md, README.md, and all Memory Bank files to reference the new rules folder and protocols.
- Ensured all rules are discoverable, cross-referenced, and markdown-lint compliant.
- Aligned the project with prompt-engineering best practices and Memory Bank guidelines.

## Next Steps

- Clearly outline upcoming actions and priorities.
- Update as plans evolve.

## Active Decisions

- Document important choices and their rationale.
- Update as new decisions are made or previous ones are revised.
- **All setup and file/folder creation must be performed via scripts in the `scripts/` directory, never manually.**
- **Scripts must be idempotent, must not overwrite existing files, and must warn or skip if files/folders exist.**
- **All rules and intentions must be documented in the README before implementation.**
- **The README and all scripts must remain markdown-lint strict mode compliant at all times.**

## Dependencies and Relationships

- **Depends On:** _[List upstream dependencies, e.g., techContext.md, systemPatterns.md, etc.]_
- **Required By:** _[List downstream dependencies, e.g., progress.md, etc.]_
- **Why This Order:** _[Explain why activeContext.md must be established before progress tracking]_
- **Impact Analysis:** _[Describe what happens if this file is not kept up to date or if dependencies change]_

## Call to Action

> **All agents and contributors must review, update, and self-regulate this file as work progresses.**  
> **Do not proceed with new work or changes until this file accurately reflects the current state and priorities.**  
> **Update this file immediately upon any change in work focus, plans, or decisions.**

**See [.clinerules/process-evolution.md](../.clinerules/process-evolution.md), [.clinerules/verification.md](../.clinerules/verification.md), and [.clinerules/learning-journal.md](../.clinerules/learning-journal.md) for required protocols and self-regulation guidance.**

---
