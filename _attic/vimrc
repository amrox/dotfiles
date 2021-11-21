set nocompatible               " be iMproved

" ---------- VUNDLE ----------
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'fugitive.vim'
Plugin 'SuperTab'
Plugin 'The-NERD-tree'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tfnico/vim-gradle'

Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set modeline
set modelines=1
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ---------- SETTINGS ----------
set sm
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set nocompatible
set magic
set wmh=0
set mouse=a
set hlsearch
set ruler
set showcmd
set laststatus=2
set tags=tags;/
set backspace=2
set grepprg=grep\ -nH\ $*
set hidden
set directory=~/tmp/.vimtmp,/tmp
set nowrap
set noexpandtab
set listchars=tab:\|\ ,extends:>,precedes:< "These only show when 'list' is set
set suffixes-=.h "Remove .h files from the low priority suffixes list on command line completion
set number
set bg=light
set clipboard=unnamed
set undofile
set undodir=~/.vim/undodir

" ---------- MAPPINGS ----------

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" mappings to always show search result in the center of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

nmap <F9> :QFix<CR>

"---------- COMMANDS ----------

autocmd FileType java set softtabstop=4|set shiftwidth=4|set expandtab
autocmd FileType cs set softtabstop=4|set shiftwidth=4|set expandtab

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview

"Remove .h files from the low priority suffixes list in file browse mode
let g:netrw_sort_sequence='[\/]$,*,\.bak$,\.o$,\.info$,\.swp$,\.obj$' 

"load doxygen syntax highlighting
let g:load_doxygen_syntax=1

" pyflakes
" let g:pyflakes_use_quickfix = 0

syn on
filetype plugin indent on

" ---------- TESTING ----------
"
"let g:syntastic_python_flake8_args='--ignore=E501,E128,E127,E124,E701,E211,E226,E265,E131,E201,E202,E203,E126,E121,E123,E401,E251,E231,E225'

let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes' "not _exec!
"let g:syntastic_python_flake8_exec = 'python3'
"let g:syntastic_python_flake8_args = ['-m', 'flake8']
"let g:syntastic_python_flake8_args='--ignore=E501,E128,E265'
let g:syntastic_python_checker_args='--ignore=E501,E128,E265'

