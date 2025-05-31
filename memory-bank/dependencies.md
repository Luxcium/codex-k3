# dependencies.md

## Purpose
This file tracks all project dependencies, their relationships, and integration points. It serves as a comprehensive dependency map for any project, enabling proper management and coordination between components.

## Structure
- **Core Dependencies:** Essential project dependencies and their purposes.
- **Development Dependencies:** Tools and utilities for development workflow.
- **AI Agent Dependencies:** Files and systems required for AI agent collaboration.
- **Cross-References:** How dependencies relate to each other and to Memory Bank files.
- **Call to Action:** Instructions for agents to update and self-regulate this file.

---

## Core Dependencies

### Docker and Containerization
- **Docker Engine**: Container runtime and management
- **Docker Compose**: Multi-container orchestration
- **Container Images**: Base images for development and production
  - `node:18-alpine` - Minimal Node.js runtime
  - `postgres:14-alpine` - PostgreSQL database
  - `redis:7-alpine` - Redis cache/message broker
- **Container Registries**: Image storage and distribution

### AI Agent Framework
- **Memory Bank System**: Cross-referencing and documentation framework
- **Prompt Files**: Executable workflow templates in `.github/prompts/`
- **Instruction Files**: Coding standards and guidelines in `.github/instructions/`
- **Script System**: Automation tools in `scripts/` directory

### Project Structure Dependencies
- **TypeScript Runtime**: Core language support in `src/`
- **Python Environment**: Module support in `python/`
- **Jupyter Notebooks**: Research and analysis in `notebooks/`
- **Shell Scripts**: Automation and setup in `scripts/`
- **Web Framework**: Next.js application in `web/` (when applicable)

## Development Dependencies

### Docker Workflow Dependencies
- **Dockerfile Variants**:
  - `Dockerfile.dev` - Development container configuration
  - `Dockerfile.prod` - Production-optimized multi-stage build
- **Docker Compose Configurations**:
  - `docker-compose.yml` - Base orchestration
  - `docker-compose.override.yml` - Development overrides
- **Dev Container Configuration**:
  - `.devcontainer/devcontainer.json` - VS Code integration
  - `.devcontainer/docker-compose.yml` - Dev container orchestration

### Security and Compliance
- **Vulnerability Scanning**: Container security validation
- **Non-root User Configuration**: Security best practices
- **Minimal Base Images**: Attack surface reduction
- **Secret Management**: Secure configuration handling

## AI Agent Dependencies

### Prompt Files (`.github/prompts/`)
- **docker-exotic-generator.prompt.md**: Advanced Docker configuration generation
  - **Depends On**: `memory-bank/docker-workflow.md`, instruction files
  - **Required By**: Container setup workflows, multi-environment deployments
  - **Integration**: Four-phase Docker workflow, exotic pattern implementation
- **docker-consolidated-template.prompt.md**: Consolidated Docker workflow template
  - **Depends On**: Validated four-phase approach, security best practices
  - **Required By**: Standardized Docker implementations across all AI agents
  - **Integration**: Simplified template following consolidated recommendations from external agent evaluation

### Instruction Files (`.github/instructions/`)
- **typescript-standards.instructions.md**: TypeScript coding standards
- **python-standards.instructions.md**: Python coding guidelines
- **file-organization.instructions.md**: Project structure standards
- **no_dummy-no_placeholders.instruction.md**: Real configuration requirements

### Memory Bank Files
- **docker-workflow.md**: Enhanced four-phase containerization workflow
  - **Depends On**: `systemPatterns.md`, `techContext.md`, `projectbrief.md`
  - **Required By**: Docker prompt files, container automation scripts
  - **Integration**: AI agent collaboration, exotic pattern documentation

## Cross-References and Relationships

### Docker Ecosystem Integration
```
memory-bank/docker-workflow.md
├── Defines: Four-phase containerization approach
├── Integrates: AI agent collaboration patterns
└── Enables: .github/prompts/docker-exotic-generator.prompt.md
    ├── Generates: Docker configurations
    ├── Updates: memory-bank/dependencies.md (this file)
    ├── References: instruction files for coding standards
    └── Creates: Complete containerization workflow
```

### AI Agent Collaboration Flow
```
User Request → GitHub Copilot
├── Reads: .github/prompts/docker-exotic-generator.prompt.md
├── Applies: .github/instructions/*.instructions.md
├── References: memory-bank/docker-workflow.md
├── Generates: Docker configurations
└── Updates: Memory Bank documentation
```

### Project Structure Dependencies
```
Project Root
├── src/ (TypeScript) → Containerized in Docker
├── python/ (Python) → Containerized in Docker
├── web/ (Next.js) → Containerized in Docker
├── scripts/ (Shell) → Container automation
├── memory-bank/ → Documentation and context
└── .github/
    ├── prompts/ → Workflow automation
    └── instructions/ → Coding standards
```

## Dependencies and Relationships

- **Depends On**: projectbrief.md (project scope), systemPatterns.md (architecture), techContext.md (technical context)
- **Required By**: All AI agents, prompt files, instruction files, automation scripts
- **Why This Order**: Dependencies must be documented before implementation to ensure proper integration
- **Impact Analysis**: Changes to dependencies affect entire AI Agent Framework and development workflow

## Recent Additions

### Docker Exotic Configuration System
- **Added**: `docker-exotic-generator.prompt.md` - Advanced Docker workflow automation
- **Enhanced**: `docker-workflow.md` - Four-phase approach with exotic patterns
- **Integration**: Multi-environment support, security-first approach, AI agent collaboration
- **Dependencies**: Node.js runtime, PostgreSQL, Redis, container orchestration tools

### AI Agent Framework Enhancement
- **Improved**: Cross-referencing between prompt files and Memory Bank
- **Added**: Parametric input system for dynamic configuration generation
- **Enhanced**: Quality assurance checklists for Docker configurations
- **Integration**: VS Code Copilot, Cline AI, and Codex CLI collaboration

## Call to Action

> **All agents and contributors must review, update, and self-regulate this file as dependencies evolve.**  
> **Do not add new dependencies without documenting them here and their relationships.**  
> **Update this file immediately upon any change in project dependencies, tools, or integration points.**

## AI Agent Instructions

This project supports three AI agents with specific dependency management responsibilities:
- **Cline AI** → Updates `.clinerules/` dependencies and learning protocols
- **Codex CLI** → Updates `AGENTS.md` context and script dependencies  
- **VS Code Copilot** → Updates `.github/copilot-instructions.md` and instruction files

**All agents must maintain dependency tracking in this file and ensure cross-references remain accurate.**

---

**Last Updated**: 2025-05-31 (Docker exotic configuration system integration)  
**Status**: Active tracking of AI Agent Framework and Docker workflow dependencies  
**Next Review**: After any new dependency additions or architectural changes
