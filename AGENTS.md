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
- Remove (or ignore) any legacy `codex.md` files when the AGENTS.md exists, merging content automatically.
- Ensure all contributors are aware of this change.

## Compliance

- All agents and contributors must follow the instructions and context provided in this file.
- Update this file as project context or operational rules evolve.

---

> This file is the single source of truth for agent and repository context. Do not reference or maintain `codex.md` going forward, deprecate it and remove it keeping the instruction in AGENTS.md before any deletion.

## Project Context
- **Project Name**: Codex CLI (v3 or k3), use to discover how to maintain a project that leverage Codex CLI toolings along with cline ai and the vscode copilot agents and tools. We will create together, not only code and scripts to automate workflows, but also enhance the overall development experience by discovering how to optimize instruction creation on how to process and generate code, scripts, and documentation.

- **Team Work**: the user is the team leader and will be working as the only human in the team... please understand the configuration files of the other agents so that you can decide when to read the context for the other agents and when to not read it.

## Agents Context
- **Codex CLI**: The main agent that will be used to create and maintain the project. It will be responsible for generating code, scripts, and documentation. It will also be used to automate workflows and enhance the overall development experience. must keep the integrity of the AGENTS.md file, must not wip this file and must do modification in a conservative manner to learn and to rememeber, as always the highest level of markdon-lit strictness must be used.

- **Cline AI**: An agent that will assist in vscode, the main instructions to cline ai are in the `.clinerules/` folder. Cline AI must absolutely follow these instructions on how to maintain their own instruction files to remember and learn from . It will be used to generate code, scripts, and documentation. It will also be used to automate workflows and enhance the overall development experience. It will not be used to create or maintain the AGENTS.md file.