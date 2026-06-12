# nvim

Personal Neovim configuration powered by lazy.nvim.

## Installation

### Neovim (0.11+ required)
```
brew install neovim
```

### Git
```
brew install git
```

### ripgrep (for Telescope search)
```
brew install ripgrep
```

### glow (for Markdown preview)
```
brew install glow
```

### Python (recent version recommended)
```
brew install python@3.14
echo 'export PATH="/opt/homebrew/opt/python@3.14/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### LSP servers

Ruff (Python)
```
uv tool install ruff
```

Rust
```
rustup component add rust-analyzer
```

Go
```
go install golang.org/x/tools/gopls@latest
```

C/C++
```
brew install llvm
```

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
