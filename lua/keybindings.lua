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

-- Compile (plugin) mode
vim.keymap.set("n", "<s-z>", ":Compile<Return>", { desc = "Compile" })
vim.keymap.set("n", "<c-z>", ":Recompile<Return>", { desc = "Recompile" })

-- Buffers
-- vim.keymap.set("n", "<tab>", ":bnext<Return>", opts)
-- vim.keymap.set("n", "<s-tab>", ":bprev<Return>", opts)
vim.keymap.set("n", "<s-q>", ":bp|bd #<Return>", opts)

-- Harpoon
local harpoon = require("harpoon")

harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<tab>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<s-tab>", function() harpoon:list():next() end)
