-- Map leader to space (must be before lazy)
vim.g.mapleader = ' '

-- Sensible defaults
require('settings')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require('lazy').setup('plugins')

-- Key mappings
require('keymappings')

-- Setup language servers
require('lsp')

-- Other config
require('config')
