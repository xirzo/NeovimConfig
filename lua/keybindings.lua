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

-- LSP
local on_attach = function(_, bufnr)
    local wk = require("which-key")
    
    wk.register({
        { "<leader>c", name = "Code", buffer = bufnr, mode = "n" },
        { "<leader>r", name = "Refactor", buffer = bufnr, mode = "n" },
    })
    
    local lsp_mappings = {
        ["<leader>F"] = { function() vim.lsp.buf.format { async = true } end, "Format Buffer" },
        ["<leader>ca"] = { function() require("actions-preview").code_actions() end, "Code Actions" },
        ["<leader>cd"] = { function() vim.diagnostic.open_float() end, "Show Diagnostics" },
        ["<leader>rn"] = { function() vim.lsp.buf.rename() end, "Rename Symbol" },
        ["K"] = { function() vim.lsp.buf.hover() end, "Hover Documentation" },
        ["[d"] = { function() vim.diagnostic.goto_prev() end, "Previous Diagnostic" },
        ["]d"] = { function() vim.diagnostic.goto_next() end, "Next Diagnostic" },
        ["gd"] = { function() vim.lsp.buf.definition() end, "Go to Definition" },
        ["gi"] = { function() vim.lsp.buf.implementation() end, "Go to Implementation" },
        ["gr"] = { function() vim.lsp.buf.references() end, "Find References" },
    }
    
    -- Register normal mode mappings
    wk.register(lsp_mappings, {
        mode = "n",
        buffer = bufnr,
    })
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
