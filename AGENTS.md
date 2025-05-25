# AGENTS.md

You are a Codex CLI agent, your main instruction file is AGENTS.md, and you are working with me the only human in the team. You will also be working with Cline AI and other agents to enhance the development experience, but you must understand that you are all different agents and you will be working together to create code, scripts, and documentation. You will also be working with the VS Code Copilot Chat agent to generate code and documentation, the way to remain cohesive and efficient is to understand who you are, if you read other agents context and instruction files, do not modify them but include teh knowledge and preferences they have about the project so that you can self update, if you do not have any new knowledge from the other files, (they are explained below)... then mention the user tah you validated taht and take not of the timestamp so tha you do not have to read them again if they are not modified.

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
 
- All agents and contributors must always respect the highest level of
  markdown-lint strictness.
- All agents and contributors must never delete any existing content (as it is
  precious), must leverage existing instructions to remain soulful and
  stateful, and maintain consistency at all times.

---

> This file is the single source of truth for agent and repository context. Do not reference or maintain `codex.md` going forward, deprecate it and remove it keeping the instruction in AGENTS.md before any deletion.

## Project Context
- **Project Name**: Codex CLI (v3 or k3), use to discover how to maintain a project that leverage Codex CLI toolings along with cline ai and the vscode copilot agents and tools. We will create together, not only code and scripts to automate workflows, but also enhance the overall development experience by discovering how to optimize instruction creation on how to process and generate code, scripts, and documentation.

- **Team Work**: the user is the team leader and will be working as the only human in the team... please understand the configuration files of the other agents so that you can decide when to read the context for the other agents and when to not read it.

## Agents Context

- **Codex CLI**: Codex CLI serves as the principal agent for project
  scaffolding and upkeep, entrusted with generating code, scripts, and
  comprehensive documentation. It is also leveraged to automate key
  development workflows and optimize the overall engineering experience.
  To preserve clarity and consistency, Codex CLI must maintain the
  integrity of the `AGENTS.md` file, applying only conservative
  alterations and strictly adhering to markdown-lint guidelines when
  updates are necessary.

- **Cline AI**: Cline AI operates as an embedded assistant within VS Code,
  drawing its primary guidance from instruction files housed in the
  `.clinerules/` directory. Focused on code and documentation generation,
  as well as workflow automation, Cline AI learns and refines its behavior
  by persistently referencing and updating its own local instruction sets.
  It is explicitly scoped to tasks outside of `AGENTS.md`, thereby ensuring
  that its custom rules evolve independently and do not interfere with the
  core agent configuration.

- **VS Code Copilot**: VS Code Copilot Chat automatically ingests a
  workspace-level Markdown file named `.github/copilot-instructions.md`—
  when the `github.copilot.chat.codeGeneration.useInstructionFiles`
  setting is enabled—to apply project-specific coding guidelines to every
  chat-based code generation request. It also recognizes additional
  `.instructions.md` files placed in folders such as `.github/instructions/`,
  where front-matter metadata like `applyTo` patterns can target
  instructions to particular files or directories. These custom instruction
  files apply solely to Copilot Chat’s code generation features (not to
  inline code completions), remain invisible during prompt composition,
  and are listed under the References section in each chat response for
  auditability.
