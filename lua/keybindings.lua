local moveline = require('moveline')
local opts = { noremap = true, silent = true }

-- moving lines with alt
vim.keymap.set('n', '<M-k>', moveline.up)
vim.keymap.set('n', '<M-j>', moveline.down)
vim.keymap.set('v', '<M-k>', moveline.block_up)
vim.keymap.set('v', '<M-j>', moveline.block_down)

-- telesope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", opts)

-- buffers navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>:q<CR>", opts)
