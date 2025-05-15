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
4. All rules and intentions must be documented in the README before implementation.
5. The README must always be markdown-lint strict mode compliant.
6. All scripts must be idempotent and resilient to repeated runs.
7. All new rules must be added to the README before being implemented.

## Setup Instructions

1. Run `bash scripts/setup_project.sh` to create the required files and folders.
2. The script will not overwrite any existing files or folders.
3. Place all future shell scripts in the `scripts/` directory.
4. Update this README with any new rules before implementing them.

---

> This README and all scripts must remain markdown-lint strict mode compliant at all times.
