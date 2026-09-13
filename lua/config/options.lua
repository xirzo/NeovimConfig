local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.clipboard:append({ "unnamed", "unnamedplus" })

opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.ruler = true
opt.laststatus = 2
opt.mouse = "a"
opt.hidden = true
opt.scrolloff = 3
opt.termguicolors = true
opt.background = "dark"
opt.modelines = 0
opt.backspace = "indent,eol,start"

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false

opt.wrap = true
opt.textwidth = 79
opt.formatoptions = "tcqrn1"

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.matchpairs:append("<:>")

opt.list = true
opt.listchars = { tab = "▸ ", eol = "¬" }

local undodir = vim.fn.stdpath("state") .. "/undo"
opt.undofile = true
opt.undodir = undodir
vim.fn.mkdir(undodir, "p")