#!/bin/bash

# AI Agent Framework - Instruction File Generator
# This script creates new .instructions.md files using the instruction-generator prompt template

set -euo pipefail

# Configuration
INSTRUCTIONS_DIR=".github/instructions"
PROMPTS_DIR=".github/prompts"
GENERATOR_PROMPT="$PROMPTS_DIR/instruction-generator.prompt.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if generator prompt exists
check_generator_prompt() {
    if [[ ! -f "$GENERATOR_PROMPT" ]]; then
        log_error "Generator prompt not found: $GENERATOR_PROMPT"
        log_info "Please ensure the AI agent framework is properly set up."
        exit 1
    fi
}

# Create instructions directory if it doesn't exist
ensure_instructions_dir() {
    if [[ ! -d "$INSTRUCTIONS_DIR" ]]; then
        log_info "Creating instructions directory: $INSTRUCTIONS_DIR"
        mkdir -p "$INSTRUCTIONS_DIR"
    fi
}

# Validate instruction file name
validate_filename() {
    local filename="$1"
    
    if [[ ! "$filename" =~ ^[a-z][a-z0-9-]*\.instructions\.md$ ]]; then
        log_error "Invalid filename format: $filename"
        log_info "Expected format: [lowercase-with-dashes].instructions.md"
        log_info "Example: vue-component-standards.instructions.md"
        return 1
    fi
    
    return 0
}

# Check if file already exists
check_file_exists() {
    local filepath="$1"
    
    if [[ -f "$filepath" ]]; then
        log_warning "File already exists: $filepath"
        read -p "Do you want to overwrite it? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log_info "Operation cancelled."
            exit 0
        fi
    fi
}

# Generate instruction file template
generate_instruction_template() {
    local filename="$1"
    local apply_to="$2"
    local description="$3"
    local filepath="$INSTRUCTIONS_DIR/$filename"
    
    cat > "$filepath" << EOF
---
applyTo: "$apply_to"
---

# $description

## Overview

<!-- Brief description of the purpose and scope of these instructions -->

## Standards

### General Guidelines
- Follow project-wide coding standards
- Maintain consistency with existing codebase
- Document all significant decisions and rationales
- Reference relevant memory-bank files for context

### Specific Requirements
<!-- Add specific requirements here -->

### Code Quality
- Write self-documenting code with clear variable and function names
- Include appropriate error handling and input validation
- Add unit tests for all new functionality
- Follow established patterns from the existing codebase

### Documentation
- Add JSDoc/docstring comments for public APIs
- Update relevant documentation when making changes
- Cross-reference related files and dependencies
- Follow markdown-lint strict mode for all documentation

## Cross-Reference Integration

### Memory Bank Connections
- Reference relevant files in memory-bank/ directory
- Update dependencies.md when creating new interdependencies
- Follow reading protocol from .clinerules/reading-protocol.md
- Maintain bidirectional links between components

### Related Files
<!-- List related instruction files, prompt files, and documentation -->

## Quality Checklist

- [ ] Code follows established patterns and conventions
- [ ] All functions/methods include appropriate documentation
- [ ] Error handling is implemented where needed
- [ ] Dependencies are properly tracked in memory-bank/dependencies.md
- [ ] Cross-references are accurate and bidirectional
- [ ] File follows markdown-lint strict mode requirements
EOF

    log_success "Generated instruction file: $filepath"
}

# Update dependencies.md with new instruction file
update_dependencies() {
    local filename="$1"
    local dependencies_file="memory-bank/dependencies.md"
    
    if [[ -f "$dependencies_file" ]]; then
        log_info "Don't forget to update $dependencies_file with the new instruction file dependencies"
        log_info "Add entry for: .github/instructions/$filename"
    else
        log_warning "Dependencies file not found: $dependencies_file"
    fi
}

# Display usage information
show_usage() {
    cat << EOF
AI Agent Framework - Instruction File Generator

Usage: $0 [OPTIONS]

This script generates new .instructions.md files using standardized templates
that integrate with the AI agent framework.

OPTIONS:
    -h, --help          Show this help message
    -n, --name FILE     Name of the instruction file (required)
    -a, --apply-to GLOB Apply to files matching this pattern (required)
    -d, --desc TEXT     Description for the instruction file (required)

EXAMPLES:
    $0 -n "vue-standards.instructions.md" -a "**/*.vue" -d "Vue.js Component Standards"
    $0 -n "api-design.instructions.md" -a "**/*api*.ts" -d "API Design Guidelines"
    $0 -n "test-standards.instructions.md" -a "**/*.test.ts,**/*.spec.ts" -d "Testing Standards"

The generated file will be placed in $INSTRUCTIONS_DIR/ and will include:
- Standard instruction file structure
- Memory bank integration sections
- Cross-reference templates
- Quality checklist

EOF
}

# Main function
main() {
    local filename=""
    local apply_to=""
    local description=""
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_usage
                exit 0
                ;;
            -n|--name)
                filename="$2"
                shift 2
                ;;
            -a|--apply-to)
                apply_to="$2"
                shift 2
                ;;
            -d|--desc)
                description="$2"
                shift 2
                ;;
            *)
                log_error "Unknown option: $1"
                show_usage
                exit 1
                ;;
        esac
    done
    
    # Validate required arguments
    if [[ -z "$filename" || -z "$apply_to" || -z "$description" ]]; then
        log_error "Missing required arguments"
        show_usage
        exit 1
    fi
    
    # Validate and process
    log_info "Generating instruction file: $filename"
    
    check_generator_prompt
    ensure_instructions_dir
    validate_filename "$filename" || exit 1
    
    local filepath="$INSTRUCTIONS_DIR/$filename"
    check_file_exists "$filepath"
    
    generate_instruction_template "$filename" "$apply_to" "$description"
    update_dependencies "$filename"
    
    log_success "Instruction file generation completed!"
    log_info "Next steps:"
    log_info "1. Edit the generated file to add specific requirements"
    log_info "2. Update memory-bank/dependencies.md with new relationships"
    log_info "3. Test the instruction file with AI-assisted development tools"
}

# Run main function if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
