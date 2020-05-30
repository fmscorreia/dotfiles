" vim-plug
call plug#begin('~/.vim/plugged')

" Plug 'itchyny/lightline.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'obreitwi/vim-sort-folds'

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

" allow pattern matching
set magic

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2

set ai " auto indent
set si " smart indent
set wrap " wrap lines

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

" buffer configs
set hidden


"""""" MAPPINGS

" auto close parens / brackets / quotes / etc
inoremap " ""<left>
inoremap "" ""
inoremap ' ''<left>
inoremap '' ''
inoremap ( ()<left>
inoremap () ()
inoremap (<CR> (<CR>)<ESC>O
inoremap [ []<left>
inoremap [] []
inoremap [<CR> [<CR>]<ESC>O
inoremap { {}<left>
inoremap {} {}
inoremap {<CR {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" in visual mode, pressing * searches for current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" quick buffer change
nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <C-L> :bn<CR>
nmap <C-P> :bp<CR>

" NERDTreeToggle shortcut
map <C-N> :NERDTreeToggle<CR>


"""""" PLUGINS CONFIGS

" airline configs
let g:airline_theme='wombat'
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=9

