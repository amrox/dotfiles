
return require('packer').startup(function()
    
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  ---------------------
  -- General Plugins --
  ---------------------

  -- Vimpeccable for vim keybindings
  use { 'svermeulen/vimpeccable' }

  -------------------------
  -- Native-Only Plugins --
  -------------------------
  
  -- TODO: there has to be a better way that tacking on "no vim.g.vscode" to every plugin

  use { 'nvim-treesitter/nvim-treesitter',  cond = function() return not vim.g.vscode end }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    cond = function() return not vim.g.vscode end
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig', cond = function() return not vim.g.vscode end }
  use { 'nvim-lua/completion-nvim', cond = function() return not vim.g.vscode end }

  -- Lua development
  use { 'tjdevries/nlua.nvim', cond = function() return not vim.g.vscode end }

  -- Vim dispatch
  use { 'tpope/vim-dispatch', cond = function() return not vim.g.vscode end }

  -- Fugitive for Git
  use { 'tpope/vim-fugitive', cond = function() return not vim.g.vscode end }

  -- Comment stuff out
  use { 'tpope/vim-commentary', cond = function() return not vim.g.vscode end }

end)
