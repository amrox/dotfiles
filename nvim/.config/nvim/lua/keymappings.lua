local utils = require('utils')
-- local vimp = require('vimp')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape

if(vim.g.vscode) then
    -- TODO: move to separate file? Or just use vscode.vim?

    -- vim-commentary -like functionality
    -- via: https://github.com/asvetliakov/vscode-neovim#vim-commentary
    utils.map('x', 'gc', '<Plug>VSCodeCommentary', {noremap=false})
    utils.map('n', 'gc', '<Plug>VSCodeCommentary', {noremap=false})
    utils.map('o', 'gc', '<Plug>VSCodeCommentary', {noremap=false})
    utils.map('n', 'gcc', '<Plug>VSCodeCommentaryLine', {noremap=false})
    -- or via vimpeccable
    -- TODO: I was getting remap errors even with override?
    -- vimp.xmap({'override'}, 'gc', '<Plug>VSCodeCommentary')
    -- vimp.nmap({'override'}, 'gc', '<Plug>VSCodeCommentary')
    -- vimp.omap({'override'}, 'gc', '<Plug>VSCodeCommentary')
    -- vimp.nmap({'override'}, 'gcc', '<Plug>VSCodeCommentaryLine')

    -- Keep selection after toggling comment
    -- via: https://github.com/asvetliakov/vscode-neovim/issues/199#issuecomment-640284496
    -- note: surrounding in parens '(VSCodeCommentary)gv' does not seem to work
    utils.map('x', '<C-/>', '<Plug>VSCodeCommentarygv', {noremap=false})
    utils.map('n', '<C-/>', '<Plug>VSCodeCommentaryLine', {noremap=false})
    -- or via vimpeccable
    -- TODO: I was getting remap errors even with override?
    -- vimp.xmap({'override'}, '<C-/>', '<Plug>VSCodeCommentarygv')
    -- vimp.nmap({'override'}, '<C-/>', '<Plug>VSCodeCommentaryLine')

end
