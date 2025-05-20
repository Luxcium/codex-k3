# Project-Wide Guidelines for Codex CLI

## General Coding Standards

### TypeScript Standards
- Use TypeScript for all new scripts and application code
- Follow the Airbnb TypeScript style guide
- Use strict type checking with `"strict": true` in tsconfig.json
- Prefer interfaces over type aliases for object shapes
- Use descriptive, semantic variable and function names
- Add JSDoc comments for public APIs and complex logic

### Python Standards
- Follow PEP 8 style guidelines
- Use type hints for all function parameters and return types
- Organize imports: standard library, third-party, local
- Document functions and classes with docstrings
- Use virtual environments for dependency isolation

### Code Organization
- Create small, single-purpose functions (≤25 lines)
- Implement modular architecture with clear separation of concerns
- Place related functionality in separate files under dedicated directories
- Use dependency injection where appropriate
- Add meaningful comments for complex algorithms

## Project-Specific Guidelines

### Memory Bank Principles
- Reference appropriate memory bank files when making changes
- Update dependency relationships in dependencies.md when adding new features
- Follow the reading protocol from .clinerules/reading-protocol.md
- Document all design decisions and their rationales
- Cross-reference related documents using markdown links

### ML Model Standards
- Include model cards for all ML models (input format, output format, limitations)
- Document dataset preprocessing steps and rationale
- Prefer reproducible model training with fixed random seeds
- Include evaluation metrics and performance characteristics
- Document all hyperparameters used during training

### Dependency Management
- Track all dependencies in dependencies.md
- Justify every dependency with a clear "why" explanation
- Analyze impact of dependency changes throughout the system
- Avoid circular dependencies; if unavoidable, provide strong justification
- Implement bidirectional tracking for all dependencies

### File and Directory Management
- All file/directory creation must be done via scripts
- Scripts must be idempotent and never overwrite existing files
- Document all file structure rules in README.md before implementation
- Follow markdown-lint strict mode requirements for all documentation

## Machine Learning Notebook Guidelines

### Vision Transformer Standards
- Provide clear documentation of model architecture parameters
- Include data preprocessing and augmentation explanations
- Document inference procedures and post-processing steps
- Include performance metrics and comparative benchmarks
- Create visualization helpers to interpret model outputs

## Documentation Requirements

- Update documentation before making code changes
- Follow markdown-lint strict mode requirements
- Keep memory bank files current and cross-referenced
- Document all system patterns and technical context updates
- Ensure proper dependency tracking in dependencies.md
