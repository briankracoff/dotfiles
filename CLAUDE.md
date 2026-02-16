# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files for development tools and shell environment on macOS. All configuration files are located in the `src/` directory.

## Prerequisites

Before running the setup script, ensure the following are installed:

- **[Oh-My-ZSH](https://ohmyz.sh)**: Zsh framework (required for shell configuration)
- **[Zsh Autocomplete](https://github.com/marlonrichert/zsh-autocomplete)**: Shell autocomplete plugin
- **[ASDF](https://asdf-vm.com)**: Version manager (referenced in PATH configuration)
- **[Claude Code](https://claude.ai/code)**: AI-powered development assistant
- **VSCode** (optional): Code editor - will be configured if installed at `/Applications/Visual Studio Code.app`
- **Xcode** (optional): Apple's IDE - will be configured if installed at `/Applications/Xcode.app`
- **Ghostty** (optional): Terminal emulator - will be configured if config directory exists

## Configuration Files

### Shell Configuration (zshrc)
- Main config: `src/zshrc` (sources modular files)
- Modular files in `src/zsh/`:
  - `oh-my-zsh.zsh`: Oh-My-Zsh setup, plugins (asdf, dotenv, git, zsh-autosuggestions)
  - `prompt.zsh`: Custom prompt (shows current directory and git branch)
  - `aliases.zsh`: Command aliases (general, iOS, Postgres)
  - `paths.zsh`: PATH and environment variables (asdf, PostgreSQL, Android SDK)
- Install: Run `setup.sh` to symlink files to home directory
- Optional: Create `~/.zshrc.local` for machine-specific settings (not tracked in git)

### Git Configuration (gitconfig)
- Location: `src/gitconfig`
- Contains user info (Brian Kracoff <bkracoff@gmail.com>), git aliases, and settings
- Notable aliases: lgpp (pretty log), clean-branches (prune merged branches)
- Install: Run `setup.sh` to symlink to `~/.gitconfig`

### Terminal Emulator Configurations
- **Ghostty**: `src/ghostty` → Symlinked to `~/.config/ghostty/config`
- **macOS Terminal**: `src/terminal.terminal` (theme file, manual import)

### Editor Configurations
- **VSCode**: `src/vscode/settings.json` and `src/vscode/keybindings.json`
  - Install: Run `setup.sh` (auto-configured if VSCode is installed)
- **Xcode**: `src/xcode/Midnight-Large.dvtcolortheme` (color theme) and `src/xcode/lldbinit`
  - Install: Run `setup.sh` (auto-configured if Xcode is installed)

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
│   ├── vscode/            # VSCode settings and keybindings
│   │   ├── settings.json
│   │   └── keybindings.json
│   └── xcode/             # Xcode color theme and lldb config
│       ├── Midnight-Large.dvtcolortheme
│       └── lldbinit
├── setup.sh               # Main setup script (creates symlinks for all configs)
└── README.md
```

## Installation

Run the main setup script to configure all dotfiles:

```bash
./setup.sh
```

This will create symlinks for:
- Shell configuration (zsh)
- Git configuration
- Ghostty terminal configuration
- VSCode settings (if VSCode is installed)
- Xcode color theme and lldb config (if Xcode is installed)

Any existing files will be backed up to `~/.dotfiles_backup_<timestamp>/` before being replaced.

## Working with Configuration Files

When modifying configuration files:
- Zsh configs are organized modularly in `src/zsh/` for easier maintenance
- Changes are live immediately (files are symlinked via setup.sh)
- For shell changes, either restart terminal or run `source ~/.zshrc`
- For VSCode changes, restart VSCode to see changes take effect
- For Xcode changes, restart Xcode to see theme changes
- Git configuration changes take effect immediately
- Use `~/.zshrc.local` for machine-specific overrides (not tracked in git)
