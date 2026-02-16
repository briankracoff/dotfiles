# dotfiles

Personal configuration files for development tools and shell environment on macOS.

## Quick Start

### Prerequisites

Before running the setup script, ensure you have:
- [Oh-My-ZSH](https://ohmyz.sh) installed
- [Zsh Autocomplete](https://github.com/marlonrichert/zsh-autocomplete) plugin
- [asdf](https://asdf-vm.com) version manager

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/Repositories/dotfiles
   cd ~/Repositories/dotfiles
   ```

2. Run the setup script to create symlinks:
   ```bash
   ./setup.sh
   ```

3. Restart your terminal or run `source ~/.zshrc`

The setup script creates symlinks for:
- `src/zsh/` → `~/.zsh/` (modular zsh configuration files)
- `src/zshrc` → `~/.zshrc` (main zsh config that sources modules)
- `src/gitconfig` → `~/.gitconfig`

Any existing files will be backed up automatically. After setup, pulling updates from this repository will automatically apply to your configuration.

## Configuration Files

### Core (Automatically Symlinked)
- **zshrc**: Main shell configuration that sources modular zsh files
- **zsh/**: Modular zsh configuration split into:
  - `oh-my-zsh.zsh`: Oh-My-Zsh setup and plugins
  - `prompt.zsh`: Custom prompt configuration
  - `aliases.zsh`: Command aliases (general, iOS, Postgres)
  - `paths.zsh`: PATH and environment variables
- **gitconfig**: Git configuration with aliases and user settings

### Additional Configurations
- **Ghostty**: `src/ghostty` (terminal emulator config)
- **macOS Terminal**: `src/terminal.terminal` (theme file)
- **VSCode**: `src/vscode/` - Run `src/vscode/setup.sh` to install
- **Xcode**: `src/xcode/` - Run `src/xcode/setup.sh` to install

## Updating

To get the latest configuration updates:
```bash
cd ~/Repositories/dotfiles
git pull
```

Changes will automatically apply due to symlinks. For shell changes, run `source ~/.zshrc` or restart your terminal.

## Machine-Specific Configuration

You can create a `~/.zshrc.local` file for machine-specific settings that shouldn't be shared across computers. This file is automatically sourced by the main zshrc if it exists and is not tracked in the repository.

Example use cases:
- Local development paths
- Company-specific aliases
- Private API keys or tokens
- Machine-specific tool configurations