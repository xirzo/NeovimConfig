local opts = { noremap = true, silent = true }

local keymaps = {
    -- Move line
    { 'n', '<M-k>', ':MoveLine(-1)<CR>', opts },
    { 'n', '<M-j>', ':MoveLine(1)<CR>', opts },
    { 'v', '<M-k>', ':MoveBlock(-1)<CR>', opts },
    { 'v', '<M-j>', ':MoveBlock(1)<CR>', opts },
    -- Telescope
    { 'n', '<leader>ff', '<cmd>Telescope find_files<cr>', vim.tbl_extend('force', opts, { desc = "Find Files" }) },
    { 'n', '<leader>/', '<cmd>Telescope live_grep<cr>', vim.tbl_extend('force', opts, { desc = "Live Grep" }) },
    -- Buffer navigation
    { 'n', '<C-h>', '<C-w>h', vim.tbl_extend('force', opts, { desc = "Move Left" }) },
    { 'n', '<C-j>', '<C-w>j', vim.tbl_extend('force', opts, { desc = "Move Down" }) },
    { 'n', '<C-k>', '<C-w>k', vim.tbl_extend('force', opts, { desc = "Move Up" }) },
    { 'n', '<C-l>', '<C-w>l', vim.tbl_extend('force', opts, { desc = "Move Right" }) },
    -- Barbar
    { 'n', '<tab>', ':BufferNext<CR>', opts },
    { 'n', '<s-tab>', ':BufferPrevious<CR>', opts },
    { 'n', '<s-q>', ':BufferClose<CR>', { desc = 'Close current tab' } },
    -- Terminal mode
    { 't', '<Esc>', '<C-\\><C-n>', vim.tbl_extend('force', opts, { desc = "Exit Terminal" }) },
    { 't', '<C-q>', '<C-\\><C-n>:q<CR>', vim.tbl_extend('force', opts, { desc = "Close Terminal" }) },
    -- Compile mode
    { 'n', '<s-z>', ':Compile<Return>', vim.tbl_extend('force', opts, { desc = "Compile" }) },
    { 'n', '<c-z>', ':Recompile<Return>', vim.tbl_extend('force', opts, { desc = "Recompile" }) },
    -- LazyGit
    -- { 'n', "<leader>gg", "<cmd>LazyGit<cr>", vim.tbl_extend('force', opts, { desc = "Lazy Git" }) },
}

vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<Esc>', {noremap = true, silent = true}) 

for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4])
end

local wk = require("which-key")

wk.add({
    -- Move line mappings
    { mode = "n", "<M-k>", ":MoveLine(-1)<CR>", desc = "Move Line Up" },
    { mode = "n", "<M-j>", ":MoveLine(1)<CR>", desc = "Move Line Down" },
    { mode = "v", "<M-k>", ":MoveBlock(-1)<CR>", desc = "Move Selection Up" },
    { mode = "v", "<M-j>", ":MoveBlock(1)<CR>", desc = "Move Selection Down" },
    
    -- Telescope mappings
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    
    -- Buffer navigation
    { "<C-h>", "<C-w>h", desc = "Move Left" },
    { "<C-j>", "<C-w>j", desc = "Move Down" },
    { "<C-k>", "<C-w>k", desc = "Move Up" },
    { "<C-l>", "<C-w>l", desc = "Move Right" },
    
    -- Barbar mappings
    { "<tab>", ":BufferNext<CR>", desc = "Next Buffer" },
    { "<s-tab>", ":BufferPrevious<CR>", desc = "Previous Buffer" },
    { "<s-q>", ":BufferClose<CR>", desc = "Close Current Tab" },
    
    -- Terminal mode mappings
    { mode = "t", "<Esc>", "<C-\\><C-n>", desc = "Exit Terminal" },
    { mode = "t", "<C-q>", "<C-\\><C-n>:q<CR>", desc = "Close Terminal" },
    
    -- Compile mappings
    { "<s-z>", ":Compile<Return>", desc = "Compile" },
    { "<c-z>", ":Recompile<Return>", desc = "Recompile" },

    { "<leader>c", desc = "Code", mode = "n" },
    { "<leader>r", desc = "Refactor", mode = "n" },
    { "<leader>F", function() vim.lsp.buf.format { async = true } end, desc = "Format Buffer" },
    { "<leader>ca", function() require("actions-preview").code_actions() end, desc = "Code Actions" },
    { "<leader>cd", function() vim.diagnostic.open_float() end, desc = "Show Diagnostics" },
    { "<leader>rn", function() vim.lsp.buf.rename() end, desc = "Rename Symbol" },
    { "K", function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
    { "[d", function() vim.diagnostic.goto_prev() end, desc = "Previous Diagnostic" },
    { "]d", function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic" },
    { "gd", function() vim.lsp.buf.definition() end, desc = "Go to Definition" },
    { "gi", function() vim.lsp.buf.implementation() end, desc = "Go to Implementation" },
    { "gr", function() vim.lsp.buf.references() end, desc = "Find References" },
    
    { "g", desc = "LSP Navigation" },
    { "gr", desc = "References" },
    { "gri", function() vim.lsp.buf.implementation() end, desc = "Go to Implementation" },
    { "grt", function() vim.lsp.buf.type_definition() end, desc = "Go to Type Definition" },
    { "grn", function() vim.lsp.buf.rename() end, desc = "Rename Symbol" },
    { "gra", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
    { "grr", function() vim.lsp.buf.references() end, desc = "Find References" },
})

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        on_attach(nil, ev.buf)
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
    },
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
