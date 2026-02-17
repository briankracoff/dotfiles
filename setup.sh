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

# Setup tmux configuration
echo ""
echo "Setting up tmux configuration..."
setup_symlink "$REPO_DIR/src/tmux.conf" "$HOME/.tmux.conf"

# Setup ghostty configuration
echo ""
echo "Setting up ghostty configuration..."
mkdir -p "$HOME/.config/ghostty"
setup_symlink "$REPO_DIR/src/ghostty" "$HOME/.config/ghostty/config"

# Setup VSCode configuration
echo ""
echo "Setting up VSCode configuration..."
VSCODE_USER="$HOME/Library/Application Support/Code/User"
if [ -d "/Applications/Visual Studio Code.app" ]; then
    mkdir -p "$VSCODE_USER"
    setup_symlink "$REPO_DIR/src/vscode/settings.json" "$VSCODE_USER/settings.json"
    setup_symlink "$REPO_DIR/src/vscode/keybindings.json" "$VSCODE_USER/keybindings.json"
else
    echo "  VSCode not installed, skipping..."
fi

# Setup Xcode configuration
echo ""
echo "Setting up Xcode configuration..."
if [ -d "/Applications/Xcode.app" ]; then
    mkdir -p "$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"
    setup_symlink "$REPO_DIR/src/xcode/lldbinit" "$HOME/.lldbinit"
    for theme in "$REPO_DIR/src/xcode"/*.dvtcolortheme; do
        if [ -f "$theme" ]; then
            theme_name=$(basename "$theme")
            setup_symlink "$theme" "$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes/$theme_name"
        fi
    done
else
    echo "  Xcode not installed, skipping..."
fi

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
echo "  • Run 'source ~/.zshrc' or restart your terminal to apply shell changes"
echo "  • Restart VSCode to apply settings (if installed)"
echo "  • Restart Ghostty to apply configuration"
echo "  • Restart Xcode to apply color theme (if installed)"
echo "  • Git configuration is already active"
echo "  • Optional: Create ~/.zshrc.local for machine-specific settings (not tracked in git)"
