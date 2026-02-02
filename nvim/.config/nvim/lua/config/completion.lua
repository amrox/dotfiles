vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess:append('c')

vim.g.completion_confirm_key = ""
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

-- <Tab> to navigate the completion menu
local map = vim.keymap.set
map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<Tab>"', { expr = true })
map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
