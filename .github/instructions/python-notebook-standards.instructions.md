---
applyTo: "**/*.py,**/*.ipynb"
---
# Python and Jupyter Notebook Standards

## Python Coding Style

- Follow PEP 8 style guidelines for all Python code
- Use 4 spaces for indentation (not tabs)
- Limit lines to 88 characters (compatible with Black formatter)
- Use descriptive variable and function names in snake_case
- Use CamelCase for class names
- Use UPPER_SNAKE_CASE for constants
- Import organization: standard library, third-party, local
- Add docstrings to all functions and classes (Google style)
- Use type hints for function parameters and return types

## Jupyter Notebook Structure

- Begin each notebook with a markdown cell containing the title and description
- Include a "Model Architecture" section with key parameters
- Organize notebooks with clear section headers
- Include markdown cells to explain code blocks
- Keep code cells focused on a single task
- Include visualization cells to illustrate key concepts
- Document hyperparameters and experiment configurations
- End with a summary of results and next steps

## Machine Learning Best Practices

- Document random seeds for reproducibility
- Include model cards with complete specifications
- Document data preprocessing steps in detail
- Separate data preparation, model training, and evaluation
- Include performance metrics and evaluation criteria
- Document all hyperparameters and configuration choices
- Include visualization of model results and performance
- Use proper train/validation/test splits

## Vision Transformer Implementation Guidelines

- Document model architecture parameters clearly
- Include references to original papers and implementations
- Document patch size, embedding dimensions, and other key parameters
- Include visualization of the attention mechanism
- Provide clear examples of image preprocessing steps
- Document inference procedures and post-processing
- Include performance benchmarks and comparisons
- Create visualization helpers to interpret model outputs

## Memory Bank Compliance

- Update dependencies.md for new Python libraries or frameworks
- Document technical constraints in techContext.md
- Record experiment results and findings in progress.md
- Follow the project's dependency tracking protocols
- Ensure all notebook changes are properly documented
- Reference relevant memory bank files in notebook documentation

Remember to maintain consistency with the project's memory bank files and keep all documentation up-to-date.
