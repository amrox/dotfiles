""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some sane defaults for vim
" via https://www.rosipov.com/blog/sane-vim-defaults-from-neovim/
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
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Detect Identation
Plug 'tpope/vim-sleuth'

" Initialize plugin system
call plug#end()
