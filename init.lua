vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop=4
vim.opt.shiftwidth=4

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- persistent undo
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir
vim.fn.mkdir(undodir, "p")

require("config.lazy")
require("keybindings")
