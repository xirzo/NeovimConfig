return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
}
