# Project Setup Rules and Instructions

> **All project setup and file/folder creation must be performed via scripts, never manually.**

## Laws (Rules)

1. All setup actions (mkdir, touch, etc.) must be performed via scripts in the `scripts/` directory.
2. Scripts must never overwrite existing files or folders; they must check for existence and skip or warn if present.
3. The following structure must exist at the project root:
    - `.github/` (directory)
    - `.vscode/` (directory)
    - `memory-bank/` (empty directory)
    - `.gitignore` (file)
    - `.clinerules` (file)
    - `README.md` (file)
    - `AGENTS.md` (file, replaces any use of `codex.md`)
    - `memory-bank/dependencies.md` (file)
## AGENTS.md Migration

- `AGENTS.md` is now the default repository context/instructions markdown file for Codex CLI and related tools.
- All references to `codex.md` in scripts, documentation, and templates must be replaced with `AGENTS.md`.
- New and existing projects must include an `AGENTS.md` file at the root.
- Workflows and automation should ignore `codex.md` and use `AGENTS.md` exclusively.

4. All rules and intentions must be documented in the README before implementation.
5. The README must always be markdown-lint strict mode compliant.
6. All scripts must be idempotent and resilient to repeated runs.
7. All new rules must be added to the README before being implemented.
8. All dependencies and relationships must be tracked in `memory-bank/dependencies.md` and referenced in all Memory Bank files.
9. Every dependency must include a "why" explanation and an impact analysis. Circular dependencies must be justified. Bidirectional tracking is required.

## Dependency Tracking

- All files, components, and processes must explicitly document what they depend on, what depends on them, and why.
- The `memory-bank/dependencies.md` file serves as the registry for all explicit, implicit, and reverse dependencies.
- Each Memory Bank file must include a "Dependencies and Relationships" section, listing:
  - **Depends On:** Upstream dependencies
  - **Required By:** Downstream dependencies
  - **Why This Order:** Rationale for dependency order
  - **Impact Analysis:** Consequences of changes or reversals

## Setup Instructions

1. Run `bash scripts/setup_project.sh` to create the required files and folders.
2. The script will not overwrite any existing files or folders.
3. Place all future shell scripts in the `scripts/` directory.
4. Update this README with any new rules before implementing them.

## Script Validation and Logging

The `scripts/setup_project.sh` script now includes:
- File existence and size checks before writing
- Directory creation with `mkdir -p` and validation
- Logging of all actions (creation, skipping, size reporting)
- Never overwrites existing files; only adds placeholders if files are empty
- Clear annotations and comments explaining each validation step

All actions are self-documented and resilient to repeated runs. Review the script for detailed logic and intent.

---

> This README and all scripts must remain markdown-lint strict mode compliant at all times.
