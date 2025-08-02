# Neovim Config

> [!NOTE]
> Completion was added, you may add LSPs through Mason

This repository contains my minimal configuration for [Neovim](https://neovim.io).

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/xirzo/NeovimConfig ~/.config/nvim
   ```

2. Start Neovim to let [lazy.nvim](https://github.com/folke/lazy.nvim) bootstrap and install the necessary plugins:
   ```sh
   nvim
   ```

## Custom Keybindings

### Moving Lines
- `<M-k>` (Normal): Move current line up
- `<M-j>` (Normal): Move current line down
- `<M-k>` (Visual): Move selected block up
- `<M-j>` (Visual): Move selected block down

### Telescope
- `<leader>ff`: Find files with Telescope
- `<leader>/`: Live grep with Telescope

### Buffer/Window Navigation
- `<C-h>`: Move to left window
- `<C-j>`: Move to window below
- `<C-k>`: Move to window above
- `<C-l>`: Move to right window

### Barbar (Bufferline)
- `<Tab>`: Go to next buffer
- `<S-Tab>`: Go to previous buffer
- `<S-q>`: Close current buffer/tab

### Terminal Mode
- `<Esc>` (Terminal): Exit to normal mode
- `<C-q>` (Terminal): Close terminal buffer

### Compile Plugin
- `<S-z>`: `:Compile`
- `<C-z>`: `:Recompile`

### Oil (File Explorer)
- `<leader>e`: Open Oil file explorer
- Inside Oil:
  - `<CR>` or `l`: Open/select file or enter directory
  - `h` or `-`: Go to parent directory
  - `_`: Open CWD
  - `~`: Change to home directory
  - `gs`: Change sort
  - `g.`: Toggle hidden files
  - `<C-s>`: Open in vertical split
  - `<C-h>`: Open in horizontal split
  - `<C-t>`: Open in new tab
  - `<C-p>`: Preview file
  - `<C-c>`: Close Oil
  - `<C-l>`: Refresh

### LSP
- `<leader>c a`: Code Actions
- `<leader>c d`: Show Diagnostics in a floating window
- `<leader>r n`: Rename symbol
- `<leader>F`: Format buffer
- `gd`: Go to definition
- `gi`: Go to implementation
- `gr`: Find references
- `K`: Hover documentation
- `[d`: Go to previous diagnostic
- `]d`: Go to next diagnostic
