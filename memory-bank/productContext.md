# productContext.md

## Purpose
This file explains the underlying motivation, intended outcomes, and user experience goals for any project. It provides context for why the project exists and how it should function, independent of any specific topic at initialization.

## Structure
- **Why:** The rationale for the project’s existence.
- **Problems to Solve:** General challenges or needs addressed.
- **How It Should Work:** Principles for operation and user experience.
- **Call to Action:** Instructions for agents to update and self-regulate this file.

---

## Why

This Memory Bank is established to ensure every project begins with a clear understanding of its purpose and intended impact. It is designed to be updated as soon as a project context is defined.

## Problems to Solve

- Lack of clear, replicable documentation for new projects.
- Difficulty onboarding new agents or contributors.
- Inconsistent understanding of project goals and user needs.

## How It Should Work

- Documentation must be clear, concise, and accessible to all agents.
- User experience goals should be defined and updated as the project evolves.
- All contributors must align on the intended outcomes before proceeding with implementation.
- **All setup and file/folder creation must be performed via scripts in the `scripts/` directory, never manually.**
- **Scripts must be idempotent, must not overwrite existing files, and must warn or skip if files/folders exist.**
- **All rules and intentions must be documented in the README before implementation.**
- **The README and all scripts must remain markdown-lint strict mode compliant at all times.**

## Dependencies and Relationships

- **Depends On:** _[List upstream dependencies, e.g., projectbrief.md, systemPatterns.md, etc.]_
- **Required By:** _[List downstream dependencies, e.g., other Memory Bank files]_
- **Why This Order:** _[Explain why productContext.md is required before other documentation]_
- **Impact Analysis:** _[Describe what happens if this file is not kept up to date or if dependencies change]_

## Call to Action

> **All agents and contributors must review, update, and self-regulate this file as soon as a project context is established.**  
> **Do not proceed with project-specific design or development until this file is aligned with the current project context.**  
> **Update this file immediately upon any change in project goals or user experience requirements.**

**See [.clinerules/reading-protocol.md](../.clinerules/reading-protocol.md), [.clinerules/writing-protocol.md](../.clinerules/writing-protocol.md), and [.clinerules/verification.md](../.clinerules/verification.md) for required protocols.**

---
