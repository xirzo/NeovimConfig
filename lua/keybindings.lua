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
    -- Terminal mode
    { 't', '<Esc>', '<C-\\><C-n>', vim.tbl_extend('force', opts, { desc = "Exit Terminal" }) },
    { 't', '<C-q>', '<C-\\><C-n>:q<CR>', vim.tbl_extend('force', opts, { desc = "Close Terminal" }) },
    -- Compile mode
    { 'n', '<s-z>', ':Compile<Return>', vim.tbl_extend('force', opts, { desc = "Compile" }) },
    { 'n', '<c-z>', ':Recompile<Return>', vim.tbl_extend('force', opts, { desc = "Recompile" }) },
}

for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3], keymap[4])
end

-- LSP
local on_attach = function(_, bufnr)
    local wk = require("which-key")
    wk.register({
        ["<leader>"] = {
            c = {
                name = "Code",
                a = { require("actions-preview").code_actions, "Code Actions", buffer = bufnr },
                d = { vim.diagnostic.open_float, "Show Diagnostics", buffer = bufnr },
            },
            r = {
                name = "Refactor",
                n = { vim.lsp.buf.rename, "Rename Symbol", buffer = bufnr },
            },
            F = { function() vim.lsp.buf.format { async = true } end, "Format Buffer", buffer = bufnr },
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
