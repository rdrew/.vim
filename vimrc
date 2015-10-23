" switch on line numbering
set number
call pathogen#helptags()
execute pathogen#infect()
syntax on
filetype plugin indent on

" reqired by nerdcommenter
filetype plugin on

colorscheme Monokai
"nerdtree dirs always show

"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"keymapping
map <C-n> :NERDTreeToggle<CR>
noremap ; :

"let g:nerdtree_tabs_open_on_console_startup=1

"only open closetag for relavent files
"autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

set omnifunc=csscomplete#CompleteCSS

"autocmd BufNewFile,BufRead *.scss
"set ft=scss.css

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

let g:airline#extensions#tabline#enabled = 1 "ailine tabs enable
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
  endif

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
" ctrlp stuff
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
