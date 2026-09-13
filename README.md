# Neovim Config

A Neovim port of [VimConfig](https://github.com/xirzo/VimConfig), rebuilt on [lazy.nvim](https://github.com/folke/lazy.nvim) with the closest modern plugin equivalents.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/xirzo/NeovimConfig ~/.config/nvim
   ```

2. Start Neovim to let `lazy.nvim` bootstrap and install the plugins:
   ```sh
   nvim
   ```

3. (Optional) LSP servers are installed via [Mason](https://github.com/mason-org/mason.nvim):
   ```sh
   :Mason
   ```

## Keybindings

| Keys | Action |
|---|---|
| `<Space><Space>` | Clear search highlight |
| `<leader>y/Y/p/P` | System clipboard yank/paste |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>1`–`<leader>0` | Jump to buffer 1–10 |
| `<S-q>` / `Q` | Close buffer |
| `<C-p>` / `<leader>ff` | Find files |
| `<leader>/` / `:Rg` | Live grep |
| `<M-k>` / `<M-j>` | Move line / selection up / down |
| `<S-z>` / `<C-z>` | Compile / recompile |
| `<F2>` / `<S-F2>` | Next / previous diagnostic |
| `<F3>` | Syntax highlight stack |
| `<F5>` / `<F6>` / `<F7>` | Make / dispatch / copen |
| `K`, `gd`, `gr`, `gi`, `gs` | LSP hover / definition / references / implementation / symbols |
| `<leader>rn` / `<leader>ca` / `<leader>f` | Rename / code action / format |
| `<leader>e` | oil file explorer |
| visual `( { [ " '` | Wrap selection in brackets / quotes |

