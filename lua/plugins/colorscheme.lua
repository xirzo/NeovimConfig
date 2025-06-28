return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- vim.cmd("colorscheme rose-pine")
        -- vim.cmd("colorscheme gruber-darker")
        -- vim.cmd("colorscheme quiet")
        vim.cmd("colorscheme moonfly")
      end,
    },
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
  {
    "blazkowolf/gruber-darker.nvim",
    name = "gruber-darker",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
}
