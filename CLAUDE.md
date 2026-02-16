# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for development tools and shell environment on macOS. All configuration files are located in the `src/` directory.

## Configuration Files

### Shell Configuration (zshrc)
- Main config: `src/zshrc` (sources modular files)
- Modular files in `src/zsh/`:
  - `oh-my-zsh.zsh`: Oh-My-Zsh setup, plugins (asdf, dotenv, git, zsh-autosuggestions)
  - `prompt.zsh`: Custom prompt (shows current directory and git branch)
  - `aliases.zsh`: Command aliases (general, iOS, Postgres)
  - `paths.zsh`: PATH and environment variables (asdf, PostgreSQL, Android SDK)
- Install: Run `setup.sh` to symlink `src/zshrc` → `~/.zshrc` and `src/zsh/` → `~/.zsh/`
- Prerequisites: [Oh-My-ZSH](https://ohmyz.sh), [Zsh Autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
- Optional: Create `~/.zshrc.local` for machine-specific settings (not tracked in git)

### Git Configuration (gitconfig)
- Location: `src/gitconfig`
- Install: Copy to `~/.gitconfig`
- Contains user info (Brian Kracoff <bkracoff@gmail.com>), git aliases, and settings
- Notable aliases: lgpp (pretty log), clean-branches (prune merged branches)

### Terminal Emulator Configurations
- **Ghostty**: `src/ghostty` → Install location varies by Ghostty config
- **macOS Terminal**: `src/terminal.terminal` (theme file)

### Editor Configurations
- **VSCode**: `src/vscode/settings.json` and `src/vscode/keybindings.json`
  - Install: Run `src/vscode/setup.sh` to copy to `~/Library/Application Support/Code/User/`
- **Xcode**: `src/xcode/Midnight-Large.dvtcolortheme` (color theme) and `src/xcode/lldbinit`
  - Install: Run `src/xcode/setup.sh` to copy theme and lldbinit files

## Key Aliases and Environment

The zshrc defines several development-related aliases:

**iOS Development:**
- `recordSimulator`: Record simulator video
- `rmDerivedData`: Clean Xcode derived data
- `sysDiagnoseSimulator`: Run system diagnostics on simulator
- `videoToGif`: Convert recorded video to GIF

**PostgreSQL:**
- `psqlStart` / `psqlStop`: Control PostgreSQL server

**Path Configuration:**
- Uses asdf for version management (`/opt/homebrew/opt/asdf`)
- PostgreSQL@15 in PATH
- Android SDK tools (emulator, platform-tools)
- Local bin directory (`~/.local/bin`)

## Repository Structure

```
dotfiles/
├── src/
│   ├── gitconfig          # Git configuration
│   ├── zshrc              # Main zsh config (sources modular files)
│   ├── zsh/               # Modular zsh configuration
│   │   ├── oh-my-zsh.zsh # Oh-My-Zsh setup and plugins
│   │   ├── prompt.zsh    # Custom prompt
│   │   ├── aliases.zsh   # Command aliases
│   │   └── paths.zsh     # PATH and environment variables
│   ├── ghostty            # Ghostty terminal config
│   ├── terminal.terminal  # macOS Terminal theme
│   ├── vscode/           # VSCode settings and keybindings
│   │   └── setup.sh      # Installation script
│   └── xcode/            # Xcode color theme and lldb config
│       └── setup.sh      # Installation script
├── setup.sh               # Main setup script (creates symlinks)
└── README.md
```

## Working with Configuration Files

When modifying configuration files:
- Zsh configs are organized modularly in `src/zsh/` for easier maintenance
- Test changes locally before committing (files are symlinked via setup.sh)
- For shell changes, either restart terminal or run `source ~/.zshrc`
- For VSCode changes, restart VSCode to see changes take effect
- Git configuration changes take effect immediately
- Use `~/.zshrc.local` for machine-specific overrides (not tracked in git)
