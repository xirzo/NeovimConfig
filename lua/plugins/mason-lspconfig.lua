return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = true,
    ensure_installed = { "clangd" },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
  },
}