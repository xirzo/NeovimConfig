# Neovim Config

> [!NOTE]
> Currently does not have any LSP/CMP plugins, maybe will be added later

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

### Terminal
- `<Esc>` (in terminal mode): Exit to normal mode
- `<C-q>` (in terminal mode): Close terminal buffer

### Compile Plugin
- `<S-z>`: `:Compile`
- `<C-z>`: `:Recompile`

