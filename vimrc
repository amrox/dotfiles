"---------- SCRIPTS ----------


"---------- FUNCTIONS ---------- 

function! s:FTobjch()
	let n = 1
	while n < 25
		let line = getline(n)
		if line =~'^\s*\(@\s*class\|@\s*interface\|#import\)'
			setf objc
			return
		endif
		let n = n + 1
	endwhile
endfun

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

"switch to directory of open file

autocmd BufNewFile,BufRead *.h call s:FTobjch()
autocmd FileType objc set makeprg=xcodebuild\ -activeconfiguration

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

"set guitablabel=%N\ %{GetTabLabel2()}\ %t

"Remove .h files from the low priority suffixes list in file browse mode
let g:netrw_sort_sequence='[\/]$,*,\.bak$,\.o$,\.info$,\.swp$,\.obj$' 
let g:CodeReviewer_reviewer="ARM"  

"load doxygen syntax highlighting
let g:load_doxygen_syntax=1

" objc language for Taglist
"let s:tlist_def_objc_settings = 'objch;c:class;m:method;v:variable'

syn on
filetype indent on
filetype plugin on

" ---------- TESTING ----------
