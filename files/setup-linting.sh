#!/bin/bash

# Install dependencies
npm install --save-dev markdownlint markdownlint-cli prettier husky lint-staged

# Initialize husky
npx husky install

# Make the pre-commit hook executable
chmod +x .husky/pre-commit

# Install recommended VS Code extensions if VS Code is installed and extensions CLI is available
if command -v code &> /dev/null; then
  code --install-extension esbenp.prettier-vscode
  code --install-extension davidanson.vscode-markdownlint
  code --install-extension editorconfig.editorconfig
  code --install-extension streetsidesoftware.code-spell-checker
  echo "VS Code extensions installed successfully."
else
  echo "VS Code not found or extensions CLI not available. Install the recommended extensions manually."
fi

echo "Linting and formatting setup complete!"