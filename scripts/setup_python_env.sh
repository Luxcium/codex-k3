#!/usr/bin/env bash
# Python Environment Setup - Main Entry Script
# Purpose: route Python environment creation based on ENV_MODE.
# Cross-Reference: memory-bank/activeContext.md and .clinerules/main-rules.md.
# Handles conditional setup based on ENV_MODE parameter.

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

# Script directory and project root
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PYTHON_DIR="$PROJECT_ROOT/python"

# Default values
ENV_MODE="${ENV_MODE:-local}"
PYTHON_VERSION="${PYTHON_VERSION:-3.11}"
PROJECT_NAME="${PROJECT_NAME:-my-python-app}"

# Logging handled by scripts/lib/logging.sh

# Usage function
usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Python Environment Setup Script

Options:
    -m, --mode MODE         Environment mode: local, docker_isolated, docker_volume
    -v, --version VERSION   Python version (default: 3.11)
    -n, --name NAME         Project name for containers (default: my-python-app)
    -h, --help             Show this help message

Environment Variables:
    ENV_MODE               Same as --mode
    PYTHON_VERSION         Same as --version
    PROJECT_NAME           Same as --name

Examples:
    $0 --mode local
    $0 --mode docker_volume --version 3.12 --name my-project
    ENV_MODE=docker_isolated $0

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--mode)
            ENV_MODE="$2"
            shift 2
            ;;
        -v|--version)
            PYTHON_VERSION="$2"
            shift 2
            ;;
        -n|--name)
            PROJECT_NAME="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            log_error "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Validate ENV_MODE
case "$ENV_MODE" in
    local|docker_isolated|docker_volume)
        log_info "Environment mode: $ENV_MODE"
        ;;
    *)
        log_error "Invalid ENV_MODE: $ENV_MODE"
        log_error "Must be one of: local, docker_isolated, docker_volume"
        exit 1
        ;;
esac

# Create python directory if it doesn't exist
if [ ! -d "$PYTHON_DIR" ]; then
    log_info "Creating python directory..."
    mkdir -p "$PYTHON_DIR"
fi

# Export variables for sub-scripts
export ENV_MODE
export PYTHON_VERSION
export PROJECT_NAME
export PYTHON_DIR
export PROJECT_ROOT

log_info "Starting Python environment setup..."
log_info "Mode: $ENV_MODE"
log_info "Python Version: $PYTHON_VERSION"
log_info "Project Name: $PROJECT_NAME"
log_info "Python Directory: $PYTHON_DIR"

# Route to appropriate setup script
case "$ENV_MODE" in
    local)
        log_info "Setting up local virtual environment..."
        "$SCRIPT_DIR/setup_python_local.sh"
        ;;
    docker_isolated)
        log_info "Setting up Docker isolated environment..."
        "$SCRIPT_DIR/setup_python_docker_isolated.sh"
        ;;
    docker_volume)
        log_info "Setting up Docker volume-mounted environment..."
        "$SCRIPT_DIR/setup_python_docker_volume.sh"
        ;;
esac

# Create or update .env.example if it doesn't exist
ENV_EXAMPLE="$PYTHON_DIR/.env.example"
if [ ! -f "$ENV_EXAMPLE" ]; then
    log_info "Creating .env.example file..."
    cat > "$ENV_EXAMPLE" << EOF
# Python Environment Variables
# Copy this file to .env and update with your values

# Example application settings
# DEBUG=true
# LOG_LEVEL=info

# Database settings (if needed)
# DATABASE_URL=postgresql://user:password@localhost:5432/dbname

# API keys (never commit real values)
# API_KEY=your_api_key_here
# SECRET_KEY=your_secret_key_here

# Environment mode used for setup
ENV_MODE=$ENV_MODE
PYTHON_VERSION=$PYTHON_VERSION
PROJECT_NAME=$PROJECT_NAME
EOF
    log_success "Created .env.example"
else
    log_info ".env.example already exists, skipping creation"
fi

# Update .gitignore if needed
GITIGNORE="$PROJECT_ROOT/.gitignore"
if [ -f "$GITIGNORE" ]; then
    if ! grep -q "python/.venv" "$GITIGNORE"; then
        log_info "Adding Python-specific entries to .gitignore..."
        cat >> "$GITIGNORE" << EOF

# Python environment files
python/.venv/
python/.env
python/__pycache__/
python/*.pyc
python/*.pyo
python/*.egg-info/
EOF
        log_success "Updated .gitignore"
    else
        log_info ".gitignore already contains Python entries"
    fi
fi

log_success "Python environment setup completed for mode: $ENV_MODE"
log_info "Next steps:"
log_info "  1. Navigate to the python/ directory"
log_info "  2. Copy .env.example to .env and update with your values"
log_info "  3. Follow mode-specific instructions in python/README.md"

case "$ENV_MODE" in
    local)
        log_info "  4. Activate the virtual environment: source python/.venv/bin/activate"
        ;;
    docker_isolated)
        log_info "  4. Build and run the container: docker build -t $PROJECT_NAME python/ && docker run --rm -it $PROJECT_NAME"
        ;;
    docker_volume)
        log_info "  4. Use docker-compose: cd python/ && docker-compose up"
        ;;
esac

# Verification
# Run `scripts/verify-all.sh` after choosing the environment mode.
