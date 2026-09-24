#!/bin/bash
set -e

# detect OS
OS="$(uname -s)"
case "$OS" in
    Linux*)     OS_NAME="linux";;
    Darwin*)    OS_NAME="macos";;
    *)          echo "Unsupported OS: $OS"; exit 1;;
esac

# detect architecture
ARCH="$(uname -m)"
case "$ARCH" in
    x86_64|amd64)   ARCH_NAME="x86_64";;
    aarch64|arm64)  ARCH_NAME="arm64";;
    *)              echo "Unsupported architecture: $ARCH"; exit 2;;
esac

# construct URL
FILENAME="nvim-${OS_NAME}-${ARCH_NAME}.tar.gz"
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/latest/download/${FILENAME}"

# create temporary directory to download file into
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# download tarball
echo "Downloading neovim from ${DOWNLOAD_URL}"
curl -fL "$DOWNLOAD_URL" -o "${TMP_DIR}/${FILENAME}"

# create binary directory if it does not yet exist
INSTALL_DIR="${HOME}/.local/nvim"
BIN_DIR="${HOME}/.local/bin"
mkdir -p "$BIN_DIR"

# remove any previous neovim installation
rm -rf "$INSTALL_DIR"

# create installation directory and extract
mkdir -p "$INSTALL_DIR"
tar -C "$INSTALL_DIR" --strip-components=1 -xzf "${TMP_DIR}/${FILENAME}"

# prevent security from blocking executable on macos
if [ "$OS_NAME" = "macos" ]; then
    xattr -c "$INSTALL_DIR/bin/nvim" 2> /dev/null || true
fi

# create symbolic links to binary directory
ln -sf "$INSTALL_DIR/bin/nvim" "$BIN_DIR/nvim"

# check path
case ":$PATH:" in
    *":${BIN_DIR}:"*)
        ;;
    *)
        echo "WARNING: ${BIN_DIR} is not currently in your \$PATH."
        echo "Add the following line to your ~/.bashrc or ~/.zshrc:"
        echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
        ;;
esac
