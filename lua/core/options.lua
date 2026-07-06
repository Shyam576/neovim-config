-- Basic editor options
local o = vim.opt
vim.g.mapleader = ' '

o.termguicolors = true
o.number = true
o.relativenumber = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.cursorline = true
o.scrolloff = 8
o.smartcase = true
o.ignorecase = true
o.clipboard = 'unnamedplus'
o.mouse = 'a'
o.mousescroll = 'ver:1,hor:6' -- scroll 1 line per wheel tick (default is 3) to tame fast trackpad scrolling
o.updatetime = 300
o.timeoutlen = 300 -- faster which-key popup (default 1000ms)
o.undofile = true -- persist undo history across restarts
o.confirm = true -- prompt to save instead of erroring on :q with unsaved changes
vim.o.signcolumn = 'yes'
