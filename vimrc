""""""""""""""""""""""""""""""""""
" basic settings
""""""""""""""""""""""""""""""""""
set nocompatible
set number
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


""""""""""""""""""""""""""""""""""""
" To run script
""""""""""""""""""""""""""""""""""""
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
	let mp = &makeprg
	let ef = &errorformat
	let exeFile = expand("%:t")
	setlocal makeprg=python\ -u
	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line \%l%.%#,%Z%[%^\ ]%\\@=%m
	silent make %
	copen
	let &makeprg
	let &errorformat = ef
endfunction

