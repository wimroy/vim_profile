" ===== Pathogen Manager =====
execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()


set hidden
set number
set nowrap
set backspace=indent,eol,start
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set hlsearch!   " Turn off highlighting of searched term by default

filetype plugin on
filetype indent on


set title
set laststatus=2
set nosmd      " No showmode
set noruler    " No ruler



set scroll=5    " Set lines to scroll with ^-U and ^-D
"set mouse=a

" ===== Disable arrow keys for navigation in Normal mode =====
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>


" Using Tabs (currently disabled)
" http://vim.wikia.com/wiki/Using_tab_pages
"set switchbuf=usetab,newtab
"nnoremap <S-F8> :sbprevious<CR>
"nnoremap <F7> :sbprevious<CR>
"nnoremap <F8> :sbnext<CR>


" Buffer navigation
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>


" ===== Function Key Bindings =====
nnoremap <silent> <F2> :set nonumber!<CR> " Toggle line numbers
nnoremap <silent> <F3> :set hlsearch!<CR> " Map <F3> to toggle highlighting of searched term
nnoremap <silent> <F4> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
nnoremap <silent> <F9> :set invpaste paste?<CR> " Toggle paste mode for code that's already indented
set pastetoggle=<F9>
"set showmode


" ===== Colors =====
highlight LineNr term=NONE
highlight Comment  term=italic cterm=italic ctermfg=10 gui=italic guifg=#303030
if has('gui_running')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
else
    syntax on
    set t_Co=16
    set background=dark
    let g:solarized_termtrans=1
    colorscheme solarized
endif




" ===== Python-mode =====
map <C-K> :!clear; python %<CR> " Run Python scripts from within the editor

set nofoldenable
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save (Change setting to NO)
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Airline Statusline
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



" http://stackoverflow.com/a/3107159
" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


autocmd FileType python set omnifunc=pythoncomplete#Complete




" Awesome fix from: http://superuser.com/a/402084
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
