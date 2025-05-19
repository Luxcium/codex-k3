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

This Memory Bank is initialized to provide a template for documenting all technologies and tools used in a project. Update this section as soon as specific technologies are chosen.

## Development Setup

- Document environment setup and configuration.
- Ensure instructions are clear for onboarding new agents or contributors.
- Update as tooling or setup changes.

## Technical Constraints

- List any known limitations or requirements.
- Update as new constraints are discovered or resolved.

## Dependencies

- Document all dependencies and their purposes.
- Update this section as dependencies are added, removed, or updated.
- **All setup and file/folder creation must be performed via scripts in the `scripts/` directory, never manually.**
- **Scripts must be idempotent, must not overwrite existing files, and must warn or skip if files/folders exist.**
- **All rules and intentions must be documented in the README before implementation.**
- **The README and all scripts must remain markdown-lint strict mode compliant at all times.**

## Dependencies and Relationships

- **Depends On:** _[List upstream dependencies, e.g., systemPatterns.md, projectbrief.md, etc.]_
- **Required By:** _[List downstream dependencies, e.g., activeContext.md, progress.md, etc.]_
- **Why This Order:** _[Explain why techContext.md must be established before active or progress tracking]_
- **Impact Analysis:** _[Describe what happens if this file is not kept up to date or if dependencies change]_

## Call to Action

> **All agents and contributors must review, update, and self-regulate this file as the technical context evolves.**  
> **Do not proceed with technical implementation until this file is aligned with the current technology stack and constraints.**  
> **Update this file immediately upon any change in technologies, setup, constraints, or dependencies.**

**See [memory-bank/rules/pattern-examples.md](../rules/pattern-examples.md), [memory-bank/rules/reading-protocol.md](../rules/reading-protocol.md), and [memory-bank/rules/verification.md](../rules/verification.md) for required protocols and implementation patterns.**

---
