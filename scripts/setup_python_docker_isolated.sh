#!/usr/bin/env bash
# Python Docker Isolated Environment Setup
# Purpose: create a Docker container without volume mounts for Python code.
# Cross-Reference: memory-bank/docker-workflow.md and .clinerules/main-rules.md.

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"
FORCE="${FORCE:-no}"

# Import environment variables from main script
PYTHON_DIR="${PYTHON_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../python" && pwd)}"
PYTHON_VERSION="${PYTHON_VERSION:-3.11}"
PROJECT_NAME="${PROJECT_NAME:-my-python-app}"

# Logging handled by scripts/lib/logging.sh

log_info "Setting up Docker isolated Python environment..."
log_info "Python Directory: $PYTHON_DIR"
log_info "Python Version: $PYTHON_VERSION"
log_info "Project Name: $PROJECT_NAME"

# Check if Docker is available
if ! command -v docker &> /dev/null; then
    log_error "Docker is not installed or not in PATH"
    log_error "Please install Docker and try again"
    exit 1
fi

# Create requirements.txt if it doesn't exist
REQUIREMENTS_FILE="$PYTHON_DIR/requirements.txt"
if [ ! -f "$REQUIREMENTS_FILE" ]; then
    log_info "Creating requirements.txt..."
    cat > "$REQUIREMENTS_FILE" << EOF
# Python dependencies for isolated Docker environment
# Add your project dependencies below

# Example common dependencies:
# requests>=2.28.0
# python-dotenv>=1.0.0
# pytest>=7.0.0
EOF
    log_success "Created requirements.txt"
else
    log_info "requirements.txt already exists"
fi

# Create Dockerfile for isolated environment
DOCKERFILE="$PYTHON_DIR/Dockerfile"
if [ -f "$DOCKERFILE" ]; then
    log_warn "Dockerfile already exists"
    if [[ "$FORCE" != "yes" ]]; then
        read -p "Do you want to overwrite it? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log_info "Skipping Dockerfile creation"
        else
            rm "$DOCKERFILE"
        fi
    else
        log_warn "Overwriting Dockerfile due to FORCE=yes"
        rm "$DOCKERFILE"
    fi
fi

if [ ! -f "$DOCKERFILE" ]; then
    log_info "Creating Dockerfile for isolated environment..."
    cat > "$DOCKERFILE" << EOF
# Python Docker Isolated Environment
FROM python:${PYTHON_VERSION}-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \\
    build-essential \\
    curl \\
    git \\
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \\
    && pip install --no-cache-dir -r requirements.txt

# Copy all application code
COPY . .

# Create non-root user for security
RUN useradd --create-home --shell /bin/bash app \\
    && chown -R app:app /app
USER app

# Set default command
CMD ["python", "--version"]
EOF
    log_success "Created Dockerfile for isolated environment"
fi

# Create .dockerignore if it doesn't exist
DOCKERIGNORE="$PYTHON_DIR/.dockerignore"
if [ ! -f "$DOCKERIGNORE" ]; then
    log_info "Creating .dockerignore..."
    cat > "$DOCKERIGNORE" << EOF
# Docker ignore file for Python isolated environment
.git
.gitignore
.venv
__pycache__
*.pyc
*.pyo
*.pyd
.Python
env
pip-log.txt
pip-delete-this-directory.txt
.tox
.coverage
.coverage.*
.pytest_cache
.cache
nosetests.xml
coverage.xml
*.cover
*.log
.DS_Store
.vscode
.idea
README.md
Dockerfile
.dockerignore
EOF
    log_success "Created .dockerignore"
else
    log_info ".dockerignore already exists"
fi

# Update python/README.md with isolated instructions
README_FILE="$PYTHON_DIR/README.md"
log_info "Updating README.md with Docker isolated instructions..."

cat > "$README_FILE" << EOF
# Python Environment - Docker Isolated Mode

This Python environment is configured for **Docker Isolated** mode, providing complete environment isolation.

## Environment Details

- **Mode:** Docker Isolated
- **Python Version:** ${PYTHON_VERSION}
- **Project Name:** ${PROJECT_NAME}
- **Isolation Level:** Complete (no host dependencies)

## Quick Start

### Build the Docker image:
\`\`\`bash
docker build -t ${PROJECT_NAME} .
\`\`\`

### Run the container:
\`\`\`bash
# Interactive bash session
docker run --rm -it ${PROJECT_NAME} bash

# Run a specific Python script
docker run --rm -it ${PROJECT_NAME} python your_script.py

# Run with environment variables
docker run --rm -it --env-file .env ${PROJECT_NAME} python your_script.py
\`\`\`

## Development Workflow

1. **Make code changes** on your host system
2. **Rebuild the image** to include changes: \`docker build -t ${PROJECT_NAME} .\`
3. **Run the updated container** with your changes

## Environment Variables

Copy \`.env.example\` to \`.env\` and update with your values:
\`\`\`bash
cp .env.example .env
# Edit .env with your settings
\`\`\`

## Adding Dependencies

1. **Edit requirements.txt** to add new packages
2. **Rebuild the Docker image** to install new dependencies
3. **Test the updated environment**

## Advantages of Isolated Mode

- ✅ **Complete isolation** from host system
- ✅ **Reproducible** across all systems
- ✅ **No version conflicts** with host Python
- ✅ **Perfect for CI/CD** and deployment

## Considerations

- ❌ **Slower iteration** (requires rebuild for code changes)
- ❌ **No live editing** without rebuilds
- ❌ **Debugging complexity** (requires container-aware tools)

## Switching Modes

To switch to a different environment mode:

\`\`\`bash
# Switch to local virtual environment
../scripts/setup_python_env.sh --mode local

# Switch to Docker volume-mounted
../scripts/setup_python_env.sh --mode docker_volume
\`\`\`

## Troubleshooting

### Build Issues
- Check Docker is running: \`docker info\`
- Check requirements.txt syntax
- Verify Python version availability

### Runtime Issues
- Check environment variables in .env
- Verify file permissions
- Check container logs: \`docker logs <container_id>\`

## File Structure

\`\`\`
python/
├── Dockerfile              # Container definition
├── .dockerignore          # Files excluded from build
├── requirements.txt       # Python dependencies
├── .env.example          # Environment variable template
├── .env                  # Your environment variables (create from example)
├── README.md             # This file
└── your_code.py          # Your Python application code
\`\`\`

For more information, see:
- Instructions: \`../.github/instructions/python-environment-conditional.instructions.md\`
- Prompt: \`../.github/prompts/python-environment-setup.prompt.md\`
EOF

log_success "Updated README.md with Docker isolated instructions"

# Build the Docker image to verify everything works
log_info "Building Docker image to verify setup..."
cd "$PYTHON_DIR"

if docker build -t "$PROJECT_NAME" .; then
    log_success "Docker image built successfully!"
    log_info "Testing Python installation..."
    if docker run --rm "$PROJECT_NAME" python --version; then
        log_success "Python is working correctly in the container"
    else
        log_warn "Python test failed, but image was built"
    fi
else
    log_error "Docker build failed"
    exit 1
fi

log_success "Docker isolated environment setup completed!"
log_info ""
log_info "Next steps:"
log_info "  1. Navigate to the python/ directory: cd python/"
log_info "  2. Copy .env.example to .env: cp .env.example .env"
log_info "  3. Edit .env with your environment variables"
log_info "  4. Add your Python code to the python/ directory"
log_info "  5. Rebuild when you make changes: docker build -t $PROJECT_NAME ."
log_info "  6. Run your code: docker run --rm -it $PROJECT_NAME python your_script.py"

# Verification
# Run `scripts/verify-all.sh` after the image build completes.
