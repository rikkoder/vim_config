"use vim's packmanagerto load every packages/plugins
packloadall

""""""""""""""""""""""""""""""""""""""""""
""""latex""""

"" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT. win32 users will need to have 'shellslash' set so that latex can
" be callend correctly.
set shellslash

" OPTIONAL. This enables automatic indentation as you type
filetype indent on


" OPTIONAL. Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
""""""""""""""""""""""""""""""""""""""""""""""""


"turn off the annoying bell
set belloff=all

syntax on

"for defaulting g flag in :substitute command
set gdefault 
set nu "no lines
set noexpandtab "dont convert tabs into spaces

"indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
filetype plugin indent on

"visual-feedback in find/search
set incsearch
set hlsearch

"statusbar lightline
set laststatus=2
set noshowmode

"leader key
let mapleader=','

"""""""""""""""""
"some shortcuts
map <Leader>nh :new
map <Leader>nv :vert new
map <Leader>th :terminal<CR>
map <Leader>tv :vert terminal<CR>
"""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vifm -file_manager
map <Leader>v :Vifm /home/rikku pwd<CR>
map <Leader>vh :SplitVifm /home/rikku pwd<CR>
map <Leader>vv :VsplitVifm /home/rikku pwd<CR>
map <Leader>vd :DiffVifm /home/rikku pwd<CR>
map <Leader>vt :TabVifm /home/rikku pwd<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
"tabline
let g:tablineclosebutton=1
""""""""""

"position of new split
set splitbelow splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"rainbow plugin for nested brackets
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"submode -for reapeating some actions
let g:submode_timeoutlen=700

" A message will appear in the message line when you're in a submode
" and stay there until the mode has existed.
let g:submode_always_show_submode = 1

" We're taking over the default <C-w> setting. Don't worry we'll do
" our best to put back the default functionality.
call submode#enter_with('window', 'n', '', '<C-w>')

" Note: <C-c> will also get you out to the mode without this mapping.
" Note: <C-[> also behaves as <ESC>
call submode#leave_with('window', 'n', '', '<ESC>')

" Go through every letter
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
\           'n','o','p','q','r','s','t','u','v','w','x','y','z']
  " maps lowercase, uppercase and <C-key>
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor
" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor

" Old way, just in case.
"nnoremap <Leader>w <C-w>


" I don't like <C-w>q, <C-w>c won't exit Vim when it's the last window.
call submode#map('window', 'n', '', 'q', '<C-w>c')
call submode#map('window', 'n', '', '<C-q>', '<C-w>c')

" <lowercase-pipe> sets the width to 80 columns, pipe (<S-\>) by default
" maximizes the width.
call submode#map('window', 'n', '', '\', ':vertical resize 80<CR>')

" Resize faster
"call submode#map('window', 'n', '', '+', '3C-w>+')
"call submode#map('window', 'n', '', '-', '3<C-w>-')
"call submode#map('window', 'n', '', '<', '5<C-w><')
"call submode#map('window', 'n', '', '>', '5<C-w>>')

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#leave_with('undo/redo', 'n', '', '<Esc>')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+') 

"end of submode---------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""
"mapping new keys to avoid submode while switching windows

nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-auto-comment -specially for block commenting
let g:autocomment_map_keys = 0


let g:inline_comment_dict = {
		\'//': ["js", "ts", "cpp", "c", "dart"],
		\'#': ['py', 'sh'],
		\'"': ['vim'],
		\}

let g:block_comment_dict = {
		\'/*': ["js", "ts", "cpp", "c", "dart"],
		\'"""': ['py'],
		\}

" Inline comment mapping
vnoremap <silent><Leader>// :AutoInlineComment<CR>
nnoremap <silent><Leader>// :AutoInlineComment<CR>

" Block comment mapping
vnoremap <silent><Leader>/b :AutoBlockComment<CR>
nnoremap <silent><Leader>/b :AutoBlockComment<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"diff colorscheme for tty and others(like xterm) 
set bg=dark
let g:solarized_termcolors=256
let term=$TERM
if term == "linux" 
	let g:solarized_termcolors=16
	colorscheme solarized
else
	colorscheme elflord
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""shortcuts for custom scripts"""""""""""""
nmap <F4> :w<CR>:!run %<CR>
