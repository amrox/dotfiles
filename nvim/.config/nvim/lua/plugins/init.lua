-- Plugin specifications for lazy.nvim
-- Note: lazy.nvim manages itself, no need to list it

local not_vscode = function()
  return not vim.g.vscode
end

return {
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cond = not_vscode,
    main = 'nvim-treesitter',
    opts = {
      ensure_installed = { 'lua', 'bash', 'vim', 'vimdoc' },
      highlight = { enable = true },
    },
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cond = not_vscode,
  },

  -- LSP config (provides server configurations for vim.lsp)
  {
    'neovim/nvim-lspconfig',
  },

  -- Vim dispatch
  {
    'tpope/vim-dispatch',
    cond = not_vscode,
  },

  -- Fugitive for Git
  {
    'tpope/vim-fugitive',
    cond = not_vscode,
  },
}
