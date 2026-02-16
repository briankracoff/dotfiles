#!/bin/bash

# Dotfiles setup script
# Creates symlinks for configuration files

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Setting up dotfiles from $REPO_DIR"

# Function to backup and symlink a file
setup_symlink() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        if [ -L "$target" ]; then
            echo "  Removing existing symlink: $target"
            rm "$target"
        else
            echo "  Backing up existing file: $target"
            mkdir -p "$BACKUP_DIR"
            mv "$target" "$BACKUP_DIR/"
            echo "    Backup saved to: $BACKUP_DIR/$(basename "$target")"
        fi
    fi

    echo "  Creating symlink: $target -> $source"
    ln -s "$source" "$target"
}

# Setup zsh configuration
echo ""
echo "Setting up zsh configuration..."
setup_symlink "$REPO_DIR/src/zsh" "$HOME/.zsh"
setup_symlink "$REPO_DIR/src/zshrc" "$HOME/.zshrc"

# Setup gitconfig
echo ""
echo "Setting up git configuration..."
setup_symlink "$REPO_DIR/src/gitconfig" "$HOME/.gitconfig"

echo ""
echo "✓ Setup complete!"
echo ""
echo "Changes to files in $REPO_DIR/src/ will now automatically"
echo "apply to your shell and git configuration."
echo ""

if [ -d "$BACKUP_DIR" ]; then
    echo "Original files backed up to: $BACKUP_DIR"
    echo ""
fi

echo "Next steps:"
echo "  • Run 'source ~/.zshrc' or restart your terminal to apply changes"
echo "  • Git configuration is already active"
echo "  • Optional: Create ~/.zshrc.local for machine-specific settings (not tracked in git)"
