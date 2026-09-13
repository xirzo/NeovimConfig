return {
  "neovim/nvim-lspconfig",
  config = function()
    require("config.lsp")
  end,
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
}