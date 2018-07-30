""""""""""""""""""""""""""""""""""
" basic settings
""""""""""""""""""""""""""""""""""
set nocompatible
set number
set fileformat=unix
syntax enable
syntax on


"""""""""""""""""""""""""""""""""""
" Indent Settings
"""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4 " the number of space characters inserted for indentation
set expandtab " To insert space characters whenever the tab key is pressed
set autoindent
set cindent
set smartindent
set showmatch " show matched bracket

""""""""""""""""""""""""""""""""""""
" Encoding
""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=gb18030
set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1

set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

""""""""""""""""""""""""""""""""""""
" To Compile or Run Code
""""""""""""""""""""""""""""""""""""
"nnoremap <F9> :echo system('python2 "' . expand('%') . '"')<cr>
"nnoremap <F10> :echo system('python3 "' . expand('%') . '"')<cr>
map <F5> :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	echo &filetype
	if &filetype == 'python'
		echo system('python3 "' . expand('%') . '"')
	elseif &filetype == 'c' || &filetype == 'cpp'
		echo system('g++ "' .expand('%') . '" -o ' .expand('%<'))
		echo system('g++ "' .expand('%<'))
	elseif &filetype == 'java'
		echo system('javac ' .expand('%'))
		echo system('java ' . expand('%<'))
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

""""""""""""""""""""""""""""""""""""
" Plugin 
""""""""""""""""""""""""""""""""""""
filetype plugin indent on

if has('mouse')
	set mouse=a
endif

