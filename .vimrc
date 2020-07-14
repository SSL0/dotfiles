call plug#begin('~/.vim/plugged')
    Plug 'powerline/powerline'                      " For status bar
    Plug 'vim-airline/vim-airline'                  " Status bar
    Plug 'vim-airline/vim-airline-themes'           " Status bar theme
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
    Plug 'preservim/nerdtree'                       " File manager
    Plug 'ryanoasis/vim-devicons'                   " Nerd icons
    Plug 'preservim/nerdcommenter'                  " Comment code
    Plug 'jiangmiao/auto-pairs'                     " Auto pair
    Plug 'vhdirk/vim-cmake'                         " CMake
    Plug 'tpope/vim-fugitive'
    Plug 'chrisbra/Colorizer'
     
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
    " Plug 'dense-analysis/ale' " Lints
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

let g:dracula_italic = 0

colorscheme onedark
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

map <F11> :ALEFindReferences<Enter>
map <F12> :ALEGoToDefinition<Enter>
map e] :ALENext<Enter>
map [e :ALEPrevious<Enter>
" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Extension settings
set nofoldenable

let g:airline_theme='deus'

" Coc

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Ale
let g:ale_c_build_dir_names = [ 'build', 'release', 'debug' ]
let g:ale_cpp_clangtidy_builddir = 'build'

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:colorizer_auto_color = 1

filetype plugin indent on
