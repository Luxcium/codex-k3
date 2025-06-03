# Scripts Directory

This directory contains all automation and setup scripts for the project.

## Purpose
- Automate environment setup for local and Docker workflows
- Ensure idempotent, safe, and repeatable setup
- Store only shell scripts related to project automation

## Structure
- `setup_python_local.sh` — Local Python venv setup
- `setup_python_docker.sh` — Docker image build for Python

All scripts are idempotent and do not overwrite existing environments or files.

See [../.github/instructions/python-environment.instructions.md](../.github/instructions/python-environment.instructions.md) for standards.
