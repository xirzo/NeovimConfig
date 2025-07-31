local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local moveline = require('moveline')

-- Moving lines with Alt
vim.keymap.set('n', '<M-k>', moveline.up)
vim.keymap.set('n', '<M-j>', moveline.down)
vim.keymap.set('v', '<M-k>', moveline.block_up)
vim.keymap.set('v', '<M-j>', moveline.block_down)

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

-- Harpoon setup
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon.list:add() end, { desc = "Add File" })
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon.list) end, { desc = "Toggle Menu" })
vim.keymap.set("n", "<C-1>", function() harpoon.list:select(1) end, { desc = "Go to Harpoon 1" })
vim.keymap.set("n", "<C-2>", function() harpoon.list:select(2) end, { desc = "Go to Harpoon 2" })
vim.keymap.set("n", "<C-3>", function() harpoon.list:select(3) end, { desc = "Go to Harpoon 3" })
vim.keymap.set("n", "<C-4>", function() harpoon.list:select(4) end, { desc = "Go to Harpoon 4" })
vim.keymap.set("n", "<tab>", function() harpoon.list:prev() end, { desc = "Harpoon Prev" })
vim.keymap.set("n", "<s-tab>", function() harpoon.list:next() end, { desc = "Harpoon Next" })

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
            e = { vim.diagnostic.open_float, "Show Diagnostics", buffer = bufnr },
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
