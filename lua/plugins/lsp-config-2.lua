-- lua/plugins/lspconfig.lua
local lspconfig = require("lspconfig")

-- Define capabilities (for autocompletion, etc.)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Define `clangd` options
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),
  on_attach = function(client, bufnr)
    -- Enable auto-formatting on save if desired
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format current buffer with LSP" })

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end

    -- Keybindings and other on_attach configurations
    -- Example:
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  end,
})
