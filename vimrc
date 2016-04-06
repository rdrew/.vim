" switch on line numbering
"
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
 colorscheme solarized
" colorscheme vwilight
"colorscheme Monokai

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

" NerdTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" " Multiple cursors
let g:multi_cursor_start_key='<F5>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'
" Syntactic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_shell = "/bin/zsh"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_css_checkers = ["csslint"]
let g:syntastic_scss_checkers = ["sass"]
"let g:syntastic_sass_checkers=["sass_lint"]
"let g:syntastic_scss_checkers=["sass_lint"]
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
"autoformat
noremap <F3> :Autoformat<CR>
"startify

autocmd User Startified setlocal cursorline

let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_list_order = [
			\ ['   LRU:'],
			\ 'files',
			\ ['   LRU within this dir:'],
			\ 'dir',
			\ ['   Sessions:'],
			\ 'sessions',
			\ ['   Bookmarks:'],
			\ 'bookmarks',
			\ ]

"let g:startify_skiplist = [
"\ 'COMMIT_EDITMSG',
"\ 'bundle/.*/doc',
"\ '/data/repo/neovim/runtime/doc',
"\ '/Users/mhi/local/vim/share/vim/vim74/doc',
"\ ]

let g:startify_bookmarks = [ '~/.vim/vimrc' ]

let g:startify_custom_header = [
			\ ' .______        ______   .______    __     _______.                                ',
			\ ' |   _  \      /  __  \  |   _  \  (_ )   /       |                                ',
			\ ' |  |_)  |    |  |  |  | |  |_)  |  |/   |   (----`                                ',
			\ ' |      /     |  |  |  | |   _  <         \   \                                    ',
			\ ' |  |\  \----.|  `--''  | |  |_)  |    .----)   |                                   ',
			\ ' | _| `._____| \______/  |______/     |_______/                                    ',
			\ '                                                                                   ',
			\ '      ___   ____    __    ____  _______     _______.  ______   .___  ___.  _______ ',
			\ '     /   \  \   \  /  \  /   / |   ____|   /       | /  __  \  |   \/   | |   ____|',
			\ '    /  ^  \  \   \/    \/   /  |  |__     |   (----`|  |  |  | |  \  /  | |  |__   ',
			\ '   /  /_\  \  \            /   |   __|     \   \    |  |  |  | |  |\/|  | |   __|  ',
			\ '  /  _____  \  \    /\    /    |  |____.----)   |   |  `--''  | |  |  |  | |  |____ ',
			\ ' /__/     \__\  \__/  \__/     |_______|_______/     \______/  |__|  |__| |_______|',
			\ '                                                                                   ',
			\ ' ____    ____  __  .___  ___.                                                      ',
			\ ' \   \  /   / |  | |   \/   |                                                      ',
			\ '  \   \/   /  |  | |  \  /  |                                                      ',
			\ '   \      /   |  | |  |\/|  |                                                      ',
			\ '    \    /    |  | |  |  |  |                                                      ',
			\ '     \__/     |__| |__|  |__|                                                      ',
			\ ]

let g:startify_custom_footer = [
			\ '	    ____            .    _  .   ',
			\ '	   /# /_\_          |\_|/__/|	',
			\ '	  |  |/o\o\        / / \/ \  \	',
			\ '	  |  \\_/_/       /__|O||O|__ \	',
			\ '	 / |_   |        |/_ \_/\_/ _\ |',
			\ '	|  ||\_ ~|       | | (____) | ||',
			\ '	|  ||| \/        \/\___/\__/  //',
			\ '	|  |||_          (_/         ||	',
			\ '	 \//  |           |          ||	',
			\ '	  ||  |           |          ||\',
			\ '	  ||_  \           \        //_/',
			\ '	  \_|  o|           \______//	',
			\ '	  /\___/          __ || __|| 	',
			\ '	 /  ||||__       (____(____) 	',
			\ '	    (___)_)  					',
			\ ]

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

"let g:neocomplete#enable_at_startup = 1
""Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim

let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

highlight Pmenu ctermbg=8 guibg=#ffffff
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif


" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Compatible with ranger 1.4.2 through 1.7.*
"
" Add ranger as a file chooser in vim
"
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
	let temp = tempname()
	" The option "--choosefiles" was added in ranger 1.5.1. Use the next line
	" with ranger 1.4.2 through 1.5.0 instead.
	"exec 'silent !ranger --choosefile=' . shellescape(temp)
	if has("gui_running")
		exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
	else
		exec 'silent !ranger --choosefiles=' . shellescape(temp)
	endif
	if !filereadable(temp)
		redraw!
		" Nothing to read.
		return
	endif
	let names = readfile(temp)
	if empty(names)
		redraw!
		" Nothing to open.
		return
	endif
	" Edit the first item.
	exec 'edit ' . fnameescape(names[0])
	" Add any remaning items to the arg list/buffer list.
	for name in names[1:]
		exec 'argadd ' . fnameescape(name)
	endfor
	redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>r :<C-U>RangerChooser<CR>



