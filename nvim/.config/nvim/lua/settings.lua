-- 
-- began to pull stuff from https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/settings.lua#L8

local utils = require('utils')

local cmd = vim.cmd
local opt = vim.opt
local indent = 4

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'
opt.clipboard = 'unnamed,unnamedplus'
opt.swapfile = false

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true             -- show line number
opt.relativenumber = true     -- show relative line number
opt.showmatch = true          -- highlight matching parenthesis
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary

-----------------------------------------------------------

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
