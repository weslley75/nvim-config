vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.updatetime = 250  -- Faster update time for CursorHold events

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

-- Add to vim-options.lua
vim.opt.scrolloff = 8                -- Keep 8 lines above/below cursor
vim.opt.undofile = true             -- Persistent undo
vim.opt.ignorecase = true           -- Ignore case in search
vim.opt.smartcase = true            -- Override ignorecase when search includes uppercase
vim.opt.splitbelow = true           -- New splits below
vim.opt.splitright = true           -- New splits right
