local map = vim.keymap.set

map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
map('i', 'jk', '<Esc>')           -- jk to escape

if vim.g.vscode then
  -- vim-commentary-like functionality for VSCode-Neovim
  local opts = { remap = true }
  map('x', 'gc', '<Plug>VSCodeCommentary', opts)
  map('n', 'gc', '<Plug>VSCodeCommentary', opts)
  map('o', 'gc', '<Plug>VSCodeCommentary', opts)
  map('n', 'gcc', '<Plug>VSCodeCommentaryLine', opts)

  -- Keep selection after toggling comment
  map('x', '<C-/>', '<Plug>VSCodeCommentarygv', opts)
  map('n', '<C-/>', '<Plug>VSCodeCommentaryLine', opts)
end
