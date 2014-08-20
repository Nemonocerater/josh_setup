
" Basic Settings
syntax on
set nocompatible	" Not compatible with vi.  This allows better use of vim features
set number			" Turns on line numbers
set smartindent		" Automatically maintains indentation
set autoindent " May not need both of these (auto, smart)
set tabstop=4 		" Sets tabs to be 4 spaces wide
set shiftwidth=4	" 
set nowrap			" Stops text from wrapping
set ruler 			" Show cursor position in bottom right of screen
set showcmd			" Show partial commands in bottom right of screen
set incsearch		" Show partial matches for search phrases
set hlsearch		" Highlight matching search phrases

filetype on			" Allows vim to detect filetyps for syntax highlighting


"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
	if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
		return "\<C-N>"
	else
		return "\<Tab>"
	endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


" Copy and paste
map <F2> :.w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>


" Setup templates for certain filetypes
:autocmd BufNewFile *.c 0r ~/.vimtemplates/skeleton.c
:autocmd BufNewFile *.html 0r ~/.vimtemplates/skeleton.html
