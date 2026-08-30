# nvim

My personal Neovim configuration, tailored to my own workflow. Built on [lazy.nvim](https://github.com/folke/lazy.nvim). Used on macOS — other operating systems may require adjustments.

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

### Neovim (0.11+ required)
```bash
brew install neovim
```

### Git
```bash
brew install git
```

### ripgrep (for Telescope search)
```bash
brew install ripgrep
```

### glow (for Markdown preview)
```bash
brew install glow
```

### Python (recent version recommended)
```bash
brew install python@3.14
echo 'export PATH="/opt/homebrew/opt/python@3.14/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

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
brew install llvm
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
