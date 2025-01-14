return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          on_attach = function(client, bufnr)
            local orig_log_handler = vim.lsp.handlers["window/logMessage"]
            vim.lsp.handlers["window/logMessage"] = function(err, method, params, client_id, bnr, config)
              if params.params.logMessage:match("Set CWD") then
                return
              end
              orig_log_handler(err, method, params, client_id, bnr, config)
            end
          end,
        },
        rust_analyzer = {
          cmd = { "rust-analyzer" }, -- Use global installation or `rustup`-managed version
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
