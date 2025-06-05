# `scripts/` Directory

This folder contains automation scripts used by all AI agents and contributors.
Every script integrates with the Memory Bank paradigm defined in
`.clinerules/main-rules.md`.
When scripts modify documentation they must run `markdownlint` in strict mode.

All scripts source a shared logging helper located in `scripts/lib/logging.sh`.
This provides timestamped `log_info`, `log_warn`, `log_error`, and
`log_success` functions with colored output.

## Conventions

1. **Shebang & Strict Mode**

   ```bash
   #!/usr/bin/env bash
   set -euo pipefail
   ```

1. **Idempotent Operations**
   Before creating a directory or file, check if it already exists:

   ```bash
   if [ ! -d "some_dir" ]; then
     mkdir -p "some_dir"
     echo "[`date '+%Y-%m-%dT%H:%M:%S%z'`] Created some_dir"
   else
     echo "[`date '+%Y-%m-%dT%H:%M:%S%z'`] some_dir already exists"
   fi
   ```

1. **Timestamped Logging**
   Every major step must echo a log line in [YYYY-MM-DDThh:mm:ssZ] format.

1. **Markdown-lint Verification**
   If a script modifies any *.md, it must run:

   ```bash
   markdownlint --config .markdownlint.yaml <path/to/file>.md
   ```

   and exit non-zero if lint errors occur.

## Script Index

Each script is referenced by Memory Bank files for reproducible setup.

- `setup_project.sh` — create base scaffolding without overwriting files
- `setup_python_env.sh` — route to local or Docker setup via `ENV_MODE`
- `setup_python_local.sh` — build a virtual environment in `python/.venv`
- `setup_python_docker_isolated.sh` — build isolated container image
- `setup_python_docker_volume.sh` — run Docker with a mounted work directory
- `setup_python_docker.sh` — helper image build used by other scripts
- `check-dependencies.sh` — verify `memory-bank/dependencies.md`
- `check-memory-bank.sh` — lint all `memory-bank/*.md` files
- `check-markdown.sh` — run markdownlint on all tracked Markdown files
- `validate-instructions.sh` — lint `.github/instructions/*.instructions.md`
- `validate-prompt.sh` — lint `.github/prompts/*.prompt.md`
- `generate-instruction-file.sh` — scaffold new instruction templates (use `--force` or `FORCE=yes` to skip overwrite prompts)
- `generate-prompt-file.sh` — scaffold new prompt templates (supports `--force` or `FORCE=yes`)
- `autonomous-state-manager.sh` — scan repository changes and update memory-bank records
- `init-empty-copilot-project.sh` — bootstrap minimal Copilot project files
- `verify-all.sh` — execute common verification scripts

## Verification

Run the following before committing:

```bash
markdownlint --config .markdownlint.yaml scripts/README.md
scripts/verify-all.sh
```
