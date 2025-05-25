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

---

## Implicit Dependencies

_List inferred or indirect dependencies here, with explanations._

---

## Reverse Dependencies

_For each file/component/process, list what depends on it and why._

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
