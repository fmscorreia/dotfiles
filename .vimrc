" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

call plug#end()


" load system wide defaults
unlet! skip_default_vim
source $VIMRUNTIME/defaults.vim

" enable filetype plugins
filetype plugin on
filetype indent on

" set to autoread when a file is changed from the outside
set autoread

" always show current position
set ruler

" ignore case when searching
set ignorecase

" try to be smart about cases when searching
set smartcase

" highlight search results
set hlsearch

" make search act like in modern browsers
set incsearch

" don't redraw while executing macros
set lazyredraw

" show matching brackets when cursor is over them
set showmatch

" no sound on errors
set noerrorbells
set novisualbell

" enable syntax highlighting
syntax on

" set encoding to utf-8
set encoding=utf8

" use spaces instead of tabs
set expandtab

" smart tabs
set smarttab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2

set ai " auto indent
set si " smart indent
set wrap " wrap lines

" in visual mode, pressing * searches for current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" always show the status line
set laststatus=2

" indicate line continuation
set showbreak=>

" show line numbers
set number
set relativenumber

" highlight options
set cursorline
set cursorcolumn
highlight CursorColumn ctermbg=236
highlight LineNr ctermfg=grey
highlight clear SignColumn

" show trailing spaces
set list listchars=tab:»\ ,extends:>,precedes:<,nbsp:•,trail:•

" NERDTreeToggle shortcut
map <C-n> :NERDTreeToggle<CR>
