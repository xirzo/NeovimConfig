vim.opt.clipboard:append({ "unnamed", "unnamedplus" })
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop=4
vim.opt.shiftwidth=4

-- cursor line indenting
vim.opt.number = true
vim.opt.cursorline = true           
vim.opt.cursorlineopt = 'number'  

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- persistent undo
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.fn.mkdir(undodir, "p")

require("config.lazy")
require("keybindings")

-- no visual wrapping
vim.opt.wrap = false

vim.o.background = "dark"
vim.opt.termguicolors = true
vim.cmd([[colorscheme moonfly]])
