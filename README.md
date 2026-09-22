# nvim

My personal Neovim configuration, tailored to my own workflow. Built on [lazy.nvim](https://github.com/folke/lazy.nvim). Tested on macOS and Linux.

## Table of Contents

- [Installation](#installation)
- [Dependencies](#dependencies)
- [LSP Servers](#lsp-servers)
- [Structure](#structure)
- [Plugins](#plugins)
- [Keymaps](#keymaps)

## Installation

```bash
git clone https://github.com/costynus/nvim.git ~/.config/nvim
nvim
```

## Dependencies

### macOS

#### Neovim (0.11+ required)

```bash
brew install neovim
```

#### Git

```bash
brew install git
```

#### ripgrep (for Telescope search)

```bash
brew install ripgrep
```

#### tree-sitter CLI

```bash
brew install tree-sitter-cli
```

#### glow (for Markdown preview)

```bash
brew install glow
```

#### Python (recent version recommended)

```bash
brew install python@3.14
echo 'export PATH="/opt/homebrew/opt/python@3.14/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Linux

#### Debian / Ubuntu

Install the base dependencies:

```bash
sudo apt update
sudo apt install git ripgrep python3 python3-pip curl build-essential npm
```

The Neovim version in the default repositories may be older than 0.11. The
official stable Snap package provides a current version:

```bash
sudo snap install nvim --classic
```

Install the remaining tools:

```bash
sudo npm install -g tree-sitter-cli
sudo snap install glow
```

#### Fedora

```bash
sudo dnf install neovim git ripgrep python3 gcc gcc-c++ make npm golang
sudo npm install -g tree-sitter-cli
go install github.com/charmbracelet/glow/v2@latest
```

Make sure `~/go/bin` is in `PATH` so Neovim can find `glow`:

```bash
echo 'export PATH="$HOME/go/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

#### Arch Linux

```bash
sudo pacman -S neovim git ripgrep python base-devel npm glow
sudo npm install -g tree-sitter-cli
```

After installing the dependencies, clone the configuration as described in
[Installation](#installation), start Neovim, and let `lazy.nvim` install the
plugins automatically.

## LSP Servers

Ruff (Python)
```bash
uv tool install ruff
```

Rust
```bash
rustup component add rust-analyzer
```

Go
```bash
go install golang.org/x/tools/gopls@latest
```

C/C++
```bash
# macOS
brew install llvm

# Debian / Ubuntu
sudo apt install clangd

# Fedora
sudo dnf install clang-tools-extra

# Arch Linux
sudo pacman -S clang
```

## Structure

```
~/.config/nvim
├── init.lua          # entry point
├── lua/
│   ├── plugins/      # plugin configuration (lazy.nvim)
│   └── config/       # general settings, keymaps, autocmds
```

## Plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — file/text search
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — git integration
- Built-in LSP + `nvim-lspconfig`
- Terminal integration

## Keymaps

### Leader

- `<leader>` = Space

### Search (Telescope)

- `<leader>ff` - Find file
- `<leader>fg` - Search project with grep
- `<leader>fw` - Search word under cursor or selection

### Diagnostics (LSP/Ruff)

- `<leader>e` - Show diagnostic
- `[d` - Previous diagnostic
- `]d` - Next diagnostic

### Documentation (LSP)

- `K` - Show information about the symbol under the cursor (Normal mode)
- `<C-s>` - Show function signature at the cursor (Insert mode)

### Git (Gitsigns)

- `]g` - Next git hunk
- `[g` - Previous git hunk
- `<leader>gp` - Preview hunk changes
- `<leader>gb` - Show blame for current line
- `<leader>gd` - Open diff for current file
- `<leader>gs` - Stage hunk
- `<leader>gr` - Reset hunk
- `<leader>gS` - Stage entire buffer
- `<leader>gR` - Reset entire buffer
- `<leader>gB` - Toggle current-line blame
- `<leader>gl` - Toggle changed-line highlight
- `<leader>gn` - Toggle changed-line number highlight
- `<leader>gw` - Toggle word diff
- `ih` - Git hunk text object (visual/operator-pending)

### Terminal

- `<leader>tt` - Open/close terminal
- `<leader>py` - Python REPL
- `<leader>tb` - Open terminal at the bottom
- `<leader>md` - Preview the current Markdown file with `glow` on the right
- `<C-q>` - Close terminal window
