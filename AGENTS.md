# AGENTS.md

## Purpose

This file serves as the default repository context and instructions markdown file for Codex CLI and related tools. It replaces any previous use of `codex.md` and must be referenced in all instructions, scripts, and templates going forward.

## Usage

- All project and agent instructions, context, and operational rules should be documented here.
- The primary entry point for project rules and protocols is `.clinerules/`. All agents must read and follow the modular rule files in this folder at the start of every session and before any planning or implementation.
- Any reference to `codex.md` in scripts, documentation, or templates must be replaced with `AGENTS.md`.
- New projects must include this file at the root.
- Workflows and automation should ignore `codex.md` and use `AGENTS.md` exclusively.

## Migration Guidance

- Search for and replace all references to `codex.md` with `AGENTS.md` in scripts, documentation, and templates.
- Remove or ignore any legacy `codex.md` files.
- Ensure all contributors are aware of this change.

## Compliance

- All agents and contributors must follow the instructions and context provided in this file.
- Update this file as project context or operational rules evolve.

---

> This file is the single source of truth for agent and repository context. Do not reference or maintain `codex.md` going forward.
