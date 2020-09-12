call plug#begin('~/.vim/plugged')
    Plug 'powerline/powerline'                      " For status bar
    Plug 'vim-airline/vim-airline'                  " Status bar
    Plug 'preservim/nerdtree'                       " File manager
    Plug 'preservim/nerdcommenter'                  " Comment code
     
    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'mhartington/oceanic-next'
    Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'joshdick/onedark.vim'
    
    " Markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    Plug 'iamcco/mathjax-support-for-mkdp' 
    Plug 'iamcco/markdown-preview.vim'
    
    " IDE-like
call plug#end()
" Vim settings
syntax on
set mouse=a

set number
autocmd InsertEnter * :set relativenumber 
autocmd InsertLeave * :set norelativenumber 

" set noshowmode
set encoding=utf-8

set cursorline
hi CursorLineNr cterm=bold

" Tabulations
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

set autowriteall

set incsearch
set noshowmode
set t_Co=256
set bg=dark

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

set backspace=indent,eol,start whichwrap+=<,>,[,]

" Custom shortcuts
imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l

map <F2> :Explore<Enter>

map <C-t> :tabnew<Enter>

map <F8> :NERDTreeToggle %<CR>

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Extension settings
set nofoldenable

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Airline

let g:Powerline_symbols = 'unicode'

let g:airline_powerline_fonts=1
let g:gruvbox_contrast_dark="meduim"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" airline extensions

let g:airline#extensions#xkblayout#enabled = 1
let g:airline#extensions#xkblayout#short_codes = {'Russian-Phonetic': 'RU', 'ABC': 'EN'}

let g:XkbSwitchLib = '/lib/libxkbswitch.so'

" airline tabline
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" Markdown
nmap <silent> <F12> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F12> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F11> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F11> <Plug>StopMarkdownPreview    " for insert mode
filetype plugin indent on
