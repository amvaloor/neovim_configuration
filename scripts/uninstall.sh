#!/bin/bash

INSTALL_DIR="${HOME}/.local/nvim"
BIN_DIR="${HOME}/.local/bin"
SYMLINK="${BIN_DIR}/nvim"

echo "Uninstalling Neovim..."

# remove symlink if it exists
if [ -L "$SYMLINK" ] || [ -f "$SYMLINK" ]; then
    rm -f "$SYMLINK"
    echo "Removed symlink: ${SYMLINK}"
else
    echo "Symlink not found at ${SYMLINK}, skipping"
fi

# removed installation
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    echo "Removed installation directory: $INSTALL_DIR"
else
    echo "Installation directory not found at ${INSTALL_DIR}, skipping"
fi

echo "Neovim binary and runtime successfully uninstalled"
echo "Note: your configuration (~/.config/nvim) was preserved"
