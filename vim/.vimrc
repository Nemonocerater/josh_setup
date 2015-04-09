" For first time install of Vundle packages run :PluginInstall in vim

set nocompatible						" be iMproved, required for Vundle
filetype off							" required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim		" set the runtime path to include Vundle and initialize

call vundle#begin() " where Vundle should install plugins: vundle#begin('~/some/path/here')
Plugin 'gmarik/Vundle.vim'				" let Vundle manage Vundle, required

" Color Schemes
"Plugin 'morhetz/gruvbox'
"Plugin 'Guardian'
Plugin 'flazz/vim-colorschemes'
call vundle#end()

filetype plugin indent on    " required for Vundle
" To ignore plugin indent changes, instead use: filetype plugin on

"      ~~~~~ Brief help ~~~~~
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ




" Basic Settings
syntax on
set hidden				" hides buffers instead of closes them to allow switching files with :e
set nocompatible		" Not compatible with vi.  This allows better use of vim features
set number				" Turns on line numbers
set smartindent			" Automatically maintains indentation
set autoindent			" May not need both of these (auto, smart)
set copyindent			" Makes copy not auto/smart indent
set tabstop=4 			" Sets tabs to be 4 spaces wide
set shiftwidth=4		" 
set nowrap				" Stops text from wrapping
set ruler 				" Show cursor position in bottom right of screen
set showcmd				" Show partial commands in bottom right of screen
set incsearch			" Show partial matches for search phrases
set hlsearch			" Highlight matching search phrases
set clipboard=unnamed	" Sets the clipboard
set history=1000		" remember more commands and search history
set undolevels=1000		" have lots undo

" Swapfiles into backup
set backupdir=./.backup,~/.backup,.
set directory=./.backup,~/.backup,.

" mouse scroll
set mouse=a


" Use TAB to complete when typing words, else inserts TABs as usual.
" Uses dictionary and source files to find matching words to complete.
" See help completion for source,
" Use the Linux dictionary when spelling is in doubt.
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
map <F3> :set paste<CR> :r !pbpaste<CR> :set nopaste<CR>


" Setup templates for certain filetypes
:autocmd BufNewFile *.c 0r ~/.vimtemplates/skeleton.c
:autocmd BufNewFile *.html 0r ~/.vimtemplates/skeleton.html

" Default syntax highlighting
"filetype on				" Allows vim to detect filetyps for syntax highlighting
:autocmd BufRead,BufNewFile *_css.resource setlocal syntax=css
:autocmd BufRead,BufNewFile *_js.resource setlocal syntax=js
:autocmd BufRead,BufNewFile *.cls setlocal syntax=cs
:autocmd BufRead,BufNewFile *.page setlocal syntax=html

:autocmd BufRead,BufNewFile *.coffee setlocal syntax=python
:autocmd BufRead,BufNewFile *.less setlocal syntax=css
