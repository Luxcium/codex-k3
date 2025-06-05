#!/usr/bin/env bash
# Python Local Virtual Environment Setup
# Purpose: create a local virtual environment for Python development.
# Cross-Reference: memory-bank/activeContext.md and .clinerules/main-rules.md.

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/logging.sh"

# Import environment variables from main script
PYTHON_DIR="${PYTHON_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../python" && pwd)}"
PYTHON_VERSION="${PYTHON_VERSION:-3.11}"
PROJECT_NAME="${PROJECT_NAME:-my-python-app}"

# Colors for output
# Logging handled by scripts/lib/logging.sh

log_info "Setting up local Python virtual environment..."
log_info "Python Directory: $PYTHON_DIR"
log_info "Python Version: $PYTHON_VERSION"
log_info "Project Name: $PROJECT_NAME"

# Check if Python is available
if ! command -v python3 &> /dev/null; then
    log_error "python3 is not installed or not in PATH"
    log_error "Please install Python 3.11+ and try again"
    exit 1
fi

# Check Python version
PYTHON_ACTUAL_VERSION=$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1,2)
log_info "Found Python version: $PYTHON_ACTUAL_VERSION"

# Create requirements.txt if it doesn't exist
REQUIREMENTS_FILE="$PYTHON_DIR/requirements.txt"
if [ ! -f "$REQUIREMENTS_FILE" ]; then
    log_info "Creating requirements.txt..."
    cat > "$REQUIREMENTS_FILE" << EOF
# Python dependencies for local virtual environment
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

# Navigate to python directory
cd "$PYTHON_DIR"

# Create virtual environment if it doesn't exist
if [ ! -d .venv ]; then
    log_info "Creating virtual environment..."
    python3 -m venv .venv
    log_success "Virtual environment created"
else
    log_info "Virtual environment already exists"
fi

# Activate virtual environment
log_info "Activating virtual environment..."
source .venv/bin/activate

# Upgrade pip
log_info "Upgrading pip..."
pip install --upgrade pip

# Install dependencies if requirements.txt exists and has content
if [ -f requirements.txt ] && [ -s requirements.txt ]; then
    # Check if requirements.txt has actual dependencies (not just comments)
    if grep -v '^#' requirements.txt | grep -v '^$' | grep -q .; then
        log_info "Installing dependencies from requirements.txt..."
        pip install -r requirements.txt
        log_success "Dependencies installed"
    else
        log_info "requirements.txt contains no dependencies, skipping installation"
    fi
else
    log_info "No requirements.txt found or file is empty"
fi

# Update python/README.md with local instructions
README_FILE="$PYTHON_DIR/README.md"
log_info "Updating README.md with local environment instructions..."

cat > "$README_FILE" << EOF
# Python Environment - Local Virtual Environment Mode

This Python environment is configured for **Local Virtual Environment** mode, providing direct host development.

## Environment Details

- **Mode:** Local Virtual Environment
- **Python Version:** ${PYTHON_ACTUAL_VERSION}
- **Project Name:** ${PROJECT_NAME}
- **Virtual Environment:** .venv/

## Quick Start

### Activate the virtual environment:
\`\`\`bash
source .venv/bin/activate
\`\`\`

### Install dependencies:
\`\`\`bash
pip install -r requirements.txt
\`\`\`

### Run your Python code:
\`\`\`bash
python your_script.py
\`\`\`

### Deactivate when done:
\`\`\`bash
deactivate
\`\`\`

## Development Workflow

1. **Activate environment:** \`source .venv/bin/activate\`
2. **Edit code** using your favorite editor/IDE
3. **Run/test** your code directly
4. **Install new packages:** \`pip install package_name\`
5. **Update requirements:** \`pip freeze > requirements.txt\`
6. **Deactivate when done:** \`deactivate\`

## Environment Variables

Copy \`.env.example\` to \`.env\` and update with your values:
\`\`\`bash
cp .env.example .env
# Edit .env with your settings
\`\`\`

Load environment variables in your Python code:
\`\`\`python
from dotenv import load_dotenv
import os

load_dotenv()
my_var = os.getenv('MY_VARIABLE')
\`\`\`

## Adding Dependencies

1. **Activate environment:** \`source .venv/bin/activate\`
2. **Install package:** \`pip install package_name\`
3. **Update requirements:** \`pip freeze > requirements.txt\`
4. **Commit requirements.txt** to version control

## IDE Integration

### VS Code
1. Open project in VS Code
2. Select Python interpreter: \`Ctrl+Shift+P\` → "Python: Select Interpreter"
3. Choose: \`./python/.venv/bin/python\`

### PyCharm
1. Open project in PyCharm
2. Go to: File → Settings → Project → Python Interpreter
3. Add interpreter: \`./python/.venv/bin/python\`

## Advantages of Local Mode

- ✅ **Direct IDE integration** and debugging
- ✅ **Fast iteration** cycles
- ✅ **Native filesystem access**
- ✅ **No Docker complexity**

## Considerations

- ❌ **Host Python dependency** (requires Python 3.11+)
- ❌ **Potential system conflicts** with other projects
- ❌ **Platform differences** (Windows vs Linux/Mac)

## Switching Modes

To switch to a different environment mode:

\`\`\`bash
# Switch to Docker isolated
../scripts/setup_python_env.sh --mode docker_isolated

# Switch to Docker volume-mounted
../scripts/setup_python_env.sh --mode docker_volume
\`\`\`

## Troubleshooting

### Virtual Environment Issues
- Delete and recreate: \`rm -rf .venv && python3 -m venv .venv\`
- Check Python version: \`python3 --version\`
- Ensure pip is updated: \`pip install --upgrade pip\`

### Package Installation Issues
- Clear pip cache: \`pip cache purge\`
- Install with verbose output: \`pip install -v package_name\`
- Check for conflicting versions: \`pip check\`

### Environment Variable Issues
- Install python-dotenv: \`pip install python-dotenv\`
- Check .env file exists and has correct format
- Verify file permissions: \`ls -la .env\`

## File Structure

\`\`\`
python/
├── .venv/                 # Virtual environment (auto-generated)
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

log_info "Verifying Markdown compliance…"
markdownlint --config .markdownlint.yaml "$README_FILE" || {
  echo "[ERROR] $README_FILE failed markdownlint."
  exit 1
}

log_success "Updated README.md with local environment instructions"

# Test the environment
log_info "Testing Python installation..."
if python --version; then
    log_success "Python is working correctly in virtual environment"
else
    log_error "Python test failed"
    exit 1
fi

log_success "Local Python virtual environment setup completed!"
log_info ""
log_info "Next steps:"
log_info "  1. Navigate to the python/ directory: cd python/"
log_info "  2. Copy .env.example to .env: cp .env.example .env"
log_info "  3. Edit .env with your environment variables"
log_info "  4. Add your Python code to the python/ directory"
log_info "  5. Always activate before working: source .venv/bin/activate"
log_info "  6. Install packages as needed: pip install package_name"
log_info "  7. Update requirements: pip freeze > requirements.txt"
log_info "  8. Deactivate when done: deactivate"
log_info ""
log_info "Virtual environment is ready at: $PYTHON_DIR/.venv"
log_info "To activate: source $PYTHON_DIR/.venv/bin/activate"

# Verification
# Run `scripts/verify-all.sh` after environment creation.
