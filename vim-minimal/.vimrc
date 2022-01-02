"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins via vim-plug
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Sensible
Plug 'tpope/vim-sensible'

" Detect Identation
Plug 'tpope/vim-sleuth'

" Initialize plugin system
call plug#end() 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some sane defaults for vim
" via https://www.rosipov.com/blog/sane-vim-defaults-from-neovim/
" TODO: determine if these are redundant with vim-sensible
if !has('nvim')
  set nocompatible
  syntax on

  set autoindent
  set autoread
  set backspace=indent,eol,start
  set belloff=all
  set complete-=i
  set display=lastline
  set formatoptions=tcqj
  set history=10000
  set incsearch
  set laststatus=2
  set ruler
  set sessionoptions-=options
  set showcmd
  set sidescroll=1
  set smarttab
  set ttimeoutlen=50
  set ttyfast
  set viminfo+=!
  set wildmenu
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings

set mouse=a

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
set clipboard^=unnamed,unnamedplus

" try to move .netrwhist file
" https://stackoverflow.com/questions/9850360/what-is-netrwhist
let g:netrw_home=$HOME.'.cache/vim'

" Fix auto-indentation for YAML files
" https://stackoverflow.com/a/54747794
" TODO: determine if this is necessary with vim-sleuth
augroup yaml_fix
  autocmd!
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END

