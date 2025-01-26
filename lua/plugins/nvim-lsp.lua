return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},

        rust_analyzer = {
          cmd = { "rust-analyzer" },
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      },
    },
  },
}
