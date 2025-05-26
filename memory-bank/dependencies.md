# dependencies.md

## Purpose

This file serves as the explicit registry of all dependencies and relationships within the project. It enables agents and contributors to understand what depends on what, why the order exists, and the impact of any changes. This is essential for project self-consciousness and continuous improvement.

---

## Structure

- **Explicit Dependencies:** Direct, declared relationships between files, components, or processes.
- **Implicit Dependencies:** Inferred or indirect relationships.
- **Reverse Dependencies:** What depends on this element.
- **Impact Analysis:** Consequences of changing or reversing dependencies.
- **Dependency Types:** Technical, logical, documentation, test, infrastructure, etc.

---

## Explicit Dependencies

_List all direct dependencies here. For each, specify:_
- **Source:** The dependent file/component/process
- **Target:** The dependency
- **Why:** Rationale for the dependency
- **Impact:** What happens if the dependency is changed or reversed

### Docker Workflow Documentation
- **Source:** docker-workflow.md
- **Target:** projectbrief.md, systemPatterns.md, techContext.md
- **Why:** Docker workflow must align with project requirements and technical architecture
- **Impact:** Changes to project scope or technical patterns require workflow updates

### Directory Structure Guidelines
- **Source:** README.md (Directory Structure Guidelines section)
- **Target:** Project setup and organization standards
- **Why:** Provides standardized language and framework organization for consistent project structure
- **Impact:** Changes to directory structure require updates to setup scripts, documentation, and development workflows

### AI Agent Framework - Prompt Files
- **Source:** `.github/prompts/*.prompt.md` files
- **Target:** `.github/instructions/*.instructions.md` files, memory-bank/ files
- **Why:** Prompt files reference instruction files for standards application and memory bank for context
- **Impact:** Changes to instruction files require prompt file updates; memory bank changes affect prompt contexts

### AI Agent Framework - Instruction Files
- **Source:** `.github/instructions/*.instructions.md` files
- **Target:** Project coding standards, TypeScript/Python style guides, memory-bank/dependencies.md
- **Why:** Instruction files enforce project-wide coding standards and must track their own dependencies
- **Impact:** Changes to coding standards require instruction file updates and dependency tracking updates

### Parametric Prompt System
- **Source:** All `.prompt.md` files with `${input:name:default}` syntax
- **Target:** VS Code Copilot, Cline AI, Codex CLI workflow systems
- **Why:** Enables reusable, configurable prompt templates for consistent AI-assisted development
- **Impact:** Changes to parametric syntax require updates across all prompt files and tool integrations

### Cross-Reference System
- **Source:** All prompt and instruction files
- **Target:** memory-bank/ files, README.md, related documentation
- **Why:** Maintains bidirectional links between AI framework components and project documentation
- **Impact:** Changes to any referenced file require updates to cross-reference links in all dependent files

---

## Implicit Dependencies

_List inferred or indirect dependencies here, with explanations._

---

## Reverse Dependencies

_For each file/component/process, list what depends on it and why._

### README.md
- **Required By:** Setup scripts, documentation standards, AI agent framework usage guidelines
- **Why:** Central documentation hub that all project components reference

### .github/instructions/*.instructions.md
- **Required By:** All .prompt.md files, AI-assisted development workflows, code generation processes
- **Why:** Provide the coding standards that must be applied during automated code generation

### .github/prompts/*.prompt.md  
- **Required By:** VS Code Copilot workflows, Cline AI workflows, Codex CLI automation
- **Why:** Template definitions that enable consistent, reusable AI-assisted development patterns

### memory-bank/dependencies.md
- **Required By:** All AI framework components, prompt files, instruction files, project documentation
- **Why:** Central registry that all components must reference and update when creating new dependencies

### TypeScript and Python Standards
- **Required By:** All .instructions.md files, code generation workflows, project setup scripts
- **Why:** Foundational coding standards that ensure consistency across all generated and manual code

---

## Impact Analysis

_For every dependency, analyze the consequences of changes, removals, or reversals._

---

## Dependency Types

- **Technical Chain:** Code, tests, infrastructure
- **Logical Chain:** Requirements, design, implementation
- **Documentation Chain:** Project brief, context, progress

---

## Call to Action

> All agents and contributors must update this file whenever dependencies or relationships change. Every change must include a "why" explanation and an impact analysis. Circular dependencies must be justified. Bidirectional tracking is required for all dependencies.

---

## Example Entry

### Explicit Dependency

- **Source:** memory-bank/progress.md
- **Target:** memory-bank/activeContext.md
- **Why:** Progress tracking depends on current active work context.
- **Impact:** If activeContext.md is not updated, progress.md may become inaccurate.

### Reverse Dependency

- **Source:** memory-bank/activeContext.md
- **Required By:** memory-bank/progress.md
- **Why:** Progress reporting requires up-to-date active context.
