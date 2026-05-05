vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess:append('c')

-- <Tab> to navigate the completion menu
local map = vim.keymap.set
map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<Tab>"', { expr = true })
map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
