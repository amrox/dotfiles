"---------- SCRIPTS ----------

"source python vim script
"au FileType python "~/.vim/scripts/python.vim"

"---------- FUNCTIONS ---------- 

" Sends current file to OS X open command
"function! OpenCurrentFile()
"	let cur_buffer = bufname("%")
"	let ret = system("open " . cur_buffer)
"endfunction

"" TODO - figure out <SID> flag
"function! GetTabLabel()
"	let label=''
"	let bufnrlist = tabpagebuflist(v:lnum)
"
"	" add the tab page number
"	let label = label . tabpagenr() . ' '
"
"	" if the name variable is set, add it now
"	if exists('t:TabName')
"		let label = label . '[' . t:TabName . ']'
"	endif
"
"	" Add '+' if one of the buffers in the tab page is modified
"	for bufnr in bufnrlist
"		if getbufvar(bufnr, "&modified")
"			let label = label . ' +'
"			break
"		endif
"	endfor
"
"	return label
"endfunction

"function! GetTabLabel2()
"	let label=''
"	if GetTabName() != ''
"		let label = label . '<' . GetTabName() . '>'
"	endif
"	return label
"endfunction

"function! SetTabName(name)
"	let t:TabName=a:name
"	exec("tabnext")
"	exec("tabprevious")
"endfunction

"function! GetTabName()
"	if exists('t:TabName')
"		return t:TabName
"	else
"		return ''
"	endif
"endfunction


""this lets you close a buffer without closing the window its in
"function! <SID>BufcloseCloseIt()
"	let l:currentBufNum = bufnr("%")
"	let l:alternateBufNum = bufnr("#")
"	
"	if buflisted(l:alternateBufNum)
"		buffer #
"	else
"		bnext
"	endif
"	
"	if bufnr("%") == l:currentBufNum
"		new
"	endif
"
"	if buflisted(l:currentBufNum)
"		execute("bdelete ".l:currentBufNum)
"	endif
"endfunction

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

" use <C-J> and <C-K> to cycle between open buffers in split windows
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" mapping for my open function
"map <f8> :call OpenCurrentFile()<cr>
"map <f9> :WMToggle<cr>

" mappings to always show search result in the center of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

nmap <F9> :QFix<CR>

"inoremap <silent><Esc>      <C-r>=pumvisible()?"\<lt>C-e>":"\<lt>Esc>"<CR>
"inoremap <silent><CR>       <C-r>=pumvisible()?"\<lt>C-y>":"\<lt>CR>"<CR>
"inoremap <silent><Down>     <C-r>=pumvisible()?"\<lt>C-n>":"\<lt>Down>"<CR>
"inoremap <silent><Up>       <C-r>=pumvisible()?"\<lt>C-p>":"\<lt>Up>"<CR>
"inoremap <silent><PageDown> <C-r>=pumvisible()?"\<lt>PageDown>\<lt>C-p>\<lt>C-n>":"\<lt>PageDown>"<CR>
"inoremap <silent><PageUp>   <C-r>=pumvisible()?"\<lt>PageUp>\<lt>C-p>\<lt>C-n>":"\<lt>PageUp>"<CR>

"---------- COMMANDS ----------

"switch to directory of open file

autocmd BufNewFile,BufRead *.h call s:FTobjch()
autocmd FileType objc set makeprg=xcodebuild\ -activeconfiguration

"command! Bclose call <SID>BufcloseCloseIt() 
"command! -nargs=1 TabName :call SetTabName(<q-args>)
"command! -nargs=0 TabName :call GetTabName()


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
"set t_Co=256
set nowrap
set noexpandtab
set listchars=tab:\|\ ,extends:>,precedes:< "These only show when 'list' is set
set suffixes-=.h "Remove .h files from the low priority suffixes list on command line completion
set number
set bg=light

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
"colorscheme ps_color
"colorscheme default
"set bg=dark
"hi visual ctermbg=White
"colorscheme satori
let Tlist_Ctags_Cmd="/opt/diy/bin/ctags"
"let Tlist_Show_One_File=1
"let TE_Ctags_Path="/opt/diy/bin/ctags"
