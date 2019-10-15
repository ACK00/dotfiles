set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


" YAML, YML, XML
au BufNewFile,BufRead *.{yaml,yml,xml},Dockerfile
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4


set nu 				" line numbering
set hlsearch 			" highlight search matched
set foldlevel=99 		" code unfolded when opened
set encoding=utf-8 		" output encoding shown in terminal
set backspace=indent,eol,start	" for mac

" color scheme
colorscheme gruvbox
set background=dark
syntax on

" Disable rope for faster python autocomplete
let g:pymode_rope=0

let python_highlight_all=1

" Ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" See the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Close VIM if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" F9 to run execute python code in Vim
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

" Move between split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding/unfolding with spacebar
nnoremap <space> za
vnoremap <space> zf
