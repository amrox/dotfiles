local utils = require('utils')
local vimp = require('vimp')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape

if(vim.g.vscode) then

    -- utils.map('i', '<C-/>', '<Plug>VSCodeCommentarygv')
    -- utils.map('n', '<C-/>', '<Plug>VSCodeCommentaryLine')

    vimp.xmap('<C-/>', '<Plug>VSCodeCommentarygv')
    vimp.nmap('<C-/>', '<Plug>VSCodeCommentaryLine')

    -- vimp.xmap('gc', '<Plug>VSCodeCommentary')
    -- vimp.nmap('gc', '<Plug>VSCodeCommentary')
    -- vimp.omap('gc', '<Plug>VSCodeCommentary')
    -- vimp.nmap('gcc', '<Plug>VSCodeCommentaryLine')
end
