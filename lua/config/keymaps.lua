-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<tab>", ":bnext<Return>", opts)
keymap.set("n", "<s-tab>", ":bprev<Return>", opts)
keymap.set("n", "<s-q>", ":bp|bd #<Return>", opts)
keymap.set("n", "<s-b>", ":BuildProject<Return>", { desc = "Build Project" })

keymap.set("n", "<s-z>", ":Compile<Return>", { desc = "Compile" })
keymap.set("n", "<c-z>", ":Recompile<Return>", { desc = "Recompile" })

vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { expr = true, desc = "Paste without losing register" })
