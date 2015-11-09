" switch on line numbering
set number
call pathogen#helptags()
execute pathogen#infect()
syntax on
filetype plugin indent on

" reqired by nerdcommenter
filetype plugin on

" Syntax highlighting with Solarized {{{
" (requires correct presets for iTerm2/Terminal too:  http://blog.pangyanhan.com/posts/2013-12-13-vim-install-solarized-on-mac-os-x.html)
syntax enable
set background=dark
" colorscheme solarized
" colorscheme vwilight
colorscheme Monokai

"keymapping
map <C-n> :NERDTreeToggle<CR>
noremap ; :

"let g:nerdtree_tabs_open_on_console_startup=1

set omnifunc=csscomplete#CompleteCSS

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

set autoindent " always set autoindenting on
set noesckeys " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeoutlen=1 " (Hopefully) removes the delay when hitting esc in insert mode
"set list
""set listchars=tab:┊\ 
set tabstop=4 " The default is 8 which is MASSIVE!!
 "   "

set showmatch " highlight matching [{()}]
set foldenable " enable folding
set foldlevel=0
set modelines=1
set foldmethod=marker
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folders max
set shiftwidth=4
set wrap linebreak nolist
"set spell
set virtualedit=onemore
set smartcase "don't ignore Captials when present
set ignorecase "don't need correct case when searching
set splitbelow " puts new splits to the bottom
set splitright " ensures new splits are to the right of current

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?


" Set up CTRL P {{{
" First set up patterns to ignore
set wildignore+=*/tmp/*,*.so,*/node_modules,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_map = '<c-p>'
" Open CTRL+P to search MRU (most recently used), files and buffers
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Make CTRL+P only look for filenames by default
let g:ctrlp_by_filename = '1'

"""""""""  CTRL+P Mappings """""""""
" Make CTRL+B open buffers
nnoremap <C-b> :CtrlPBuffer<CR>
" Make CTRL+F open Most Recently Used files
nnoremap <C-f> :CtrlPMRU<CR>
" }}}

" Windows managment shortcuts {{{
" Make it possible to switch to left pane with ,z
:nmap <Leader>z <C-w>h 
" Switch to right pane with ,x
:nmap <Leader>x <C-w>l 

"" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>
" }}}	

" Airline {{{
" Make sure powerline fonts are used
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme="molokai"
let g:airline#extensions#tabline#enabled = 1 "enable the tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename of buffers in the tab line
let g:airline_detect_modified=1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}


" Quick Buffer switch mappings {{{
" The idea is to press <leader> and then the number from normal mode to switch
" e.g. `,2` would switch to the second buffer (listed at the top of the
" airline strip
 
":nnoremap <silent> <Leader> :<C-u>try \| execute "b" . v:count \| catch \| endtry<CR>
for i in range(1, 99)
    execute printf('nnoremap <Leader>%d :%db<CR>', i, i)
endfor
for i in range(1, 99)
    execute printf('nnoremap <Leader>d%d :Bdelete %d<CR>', i, i)
endfor

" Function to trim trailing whitespace on save {{{
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction
" }}}

set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

augroup omni_complete
  " clear commands before resetting
  autocmd!
  " Enable omnicomplete for supported filetypes
  autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
" vim:foldmethod=marker:foldlevel=0

"asshole mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <Enter> o<ESC>
map <CR-Enter> O<ESC>

 "When jump to next match also center screen
 noremap n nzz
 noremap N Nzz

 " Same when moving up and down
 noremap <C-d> <C-d>zz
 noremap <C-u> <C-u>zz

 " Remap H and L (top, bottom of screen to left and right end of line)
 nnoremap H ^
 nnoremap L $
 vnoremap H ^
 vnoremap L g_

 " Yank and paste from clipboard
  nnoremap ,y "+y
  vnoremap ,y "+y
  nnoremap ,yy "+yy
  nnoremap ,p "+p
" Automatically reload change files on disk
set autoread                                
set wrapscan                                " Search again from top when reached the bottom
