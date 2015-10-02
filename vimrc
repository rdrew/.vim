" switch on line numbering
set number

execute pathogen#infect()
syntax on
filetype plugin indent on

" reqired by nerdcommenter
filetype plugin on

"nerdtree dirs always show
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"keymapping
map <C-n> :NERDTreeToggle<CR>
noremap ; :

"let g:nerdtree_tabs_open_on_console_startup=1

"only open closetag for relavent files
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

set omnifunc=csscomplete#CompleteCSS

autocmd BufNewFile,BufRead *.scss             
set ft=scss.css

set wildmenu            " visual autocomplete for command menu "

"relative number setup"

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

let mapleader=","       " leader is comma "
set hlsearch 		" search hiligh "

"wild menu setup
set wildmenu
set wildmode=longest:full,full


"  Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch
