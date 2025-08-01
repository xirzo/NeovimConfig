local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local move_ok, move = pcall(require, 'move')
if not move_ok then
    vim.notify("move plugin not found", vim.log.levels.WARN)
    return
end

-- Moving lines with Alt
vim.keymap.set('n', '<M-k>', ':MoveLine(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-j>', ':MoveLine(1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<M-k>', ':MoveBlock(-1)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<M-j>', ':MoveBlock(1)<CR>', { noremap = true, silent = true })

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true, desc = "Find Files" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Live Grep" })

-- Buffer navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move Left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move Up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move Right" })

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit Terminal" })
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:q<CR>", { noremap = true, silent = true, desc = "Close Terminal" })

-- Compile (plugin) mode
vim.keymap.set("n", "<s-z>", ":Compile<Return>", { noremap = true, silent = true, desc = "Compile" })
vim.keymap.set("n", "<c-z>", ":Recompile<Return>", { noremap = true, silent = true, desc = "Recompile" })

-- LSP
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local on_attach = function(client, bufnr)
    local wk = require("which-key")
    wk.register({
        ["<leader>"] = {
            c = {
                name = "Code",
                a = { vim.lsp.buf.code_action, "Code Actions", buffer = bufnr },
            },
            r = {
                name = "Refactor",
                n = { vim.lsp.buf.rename, "Rename Symbol", buffer = bufnr },
            },
            F = { function() vim.lsp.buf.format { async = true } end, "Format Buffer", buffer = bufnr },
            d = { vim.diagnostic.open_float, "Show Diagnostics", buffer = bufnr },
        },
        g = {
            d = { vim.lsp.buf.definition, "Go to Definition", buffer = bufnr },
            i = { vim.lsp.buf.implementation, "Go to Implementation", buffer = bufnr },
            r = { vim.lsp.buf.references, "Find References", buffer = bufnr },
        },
        K = { vim.lsp.buf.hover, "Hover Documentation", buffer = bufnr },
        ["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic", buffer = bufnr },
        ["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic", buffer = bufnr },
    }, { buffer = bufnr })
end

lspconfig.ts_ls.setup({ on_attach = on_attach })
lspconfig.clangd.setup({ on_attach = on_attach })
