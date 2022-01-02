# This file was created when I couldn't get init.lua working via VS Code
# (https://github.com/asvetliakov/vscode-neovim/issues/768#issuecomment-1003659648)
# Right now, it is unhooked, but leaving it around for now in case it's useful

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
set clipboard^=unnamed,unnamedplus

" vim-commentary -like functionality
" via: https://github.com/asvetliakov/vscode-neovim#vim-commentary
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Keep selection after toggling comment
" via: https://github.com/asvetliakov/vscode-neovim/issues/199#issuecomment-640284496
" note: surrounding in parens '(VSCodeCommentary)gv' does not seem to work
xmap <C-/> <Plug>VSCodeCommentarygv
nmap <C-/> <Plug>VSCodeCommentaryLine

