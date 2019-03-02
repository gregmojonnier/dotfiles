set nocompatible
set encoding=utf-8
set fileformat=unix
set history=500
set cmdheight=2

if has('win32')
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif


let mapleader=" "
let maplocalleader=" "

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'elzr/vim-json'
Plugin 'vim-airline/vim-airline'
Plugin 'ervandew/supertab'

" Python Plugins
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

" Tmux Plugins
Plugin 'christoomey/vim-tmux-navigator'

" Code Navigation
Plugin 'tjennings/git-grep-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'

" Colorscheme
Plugin 'wimstefan/lightning'
Plugin 'octol/vim-cpp-enhanced-highlight'


" All of your Plugins must be added before the following line
call vundle#end()            " required

if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

let python_highlight_all=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Always show tab line
set showtabline=2

" Show just the filename
set laststatus=2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1

" C++11+ syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

let g:ctrlp_by_filename = 1

let g:javascript_plugin_jsdoc = 1

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2


" Line numbering
set number

" Searching and replacing
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault

set autowrite
set autoread

set cursorline
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.pyc,*.swp,*.o,*.obj,*.bak,tags,*/.git/**/*
set wildignorecase
" Opt out of scanning includes for completion
set complete-=i

" Faster mappings
nnoremap <leader>q :q<CR>
nnoremap <leader>b :ls<CR>:b<space>

nnoremap <leader>e :e<space>
nnoremap <leader>v :e ~/.vimrc<CR>
inoremap jk <ESC>:w<CR>
nnoremap <BS> <C-^>
nnoremap \ <C-o>

" Quickfix
nnoremap ]q :cnext<CR>
nnoremap ]Q :clast<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap oe :cf<CR>
autocmd FileType qf nnoremap <cr> :exe 'wincmd p \| '.line('.').'cc'<cr>

" Buffers
nnoremap ]b :bnext<CR>
nnoremap ]B :blast<CR>
nnoremap [b :bprevious<CR>
nnoremap [B :bfirst<CR>

" location list
nnoremap ]l :lnext<CR>
nnoremap ]L :llast<CR>
nnoremap [l :lprevious<CR>
nnoremap [L :lfirst<CR>
nnoremap ol :ll<CR>

let g:syntastic_always_populate_loc_list = 1

" Tabs
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

cabbr <expr> %% expand('%:p:h')

" tags
" show all occurrences
nnoremap <C-]> g<C-]>
set tags=./tags;/,tags;/
nmap <F8> :TagbarToggle<CR>

nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>p :CtrlPMixed<CR>
nnoremap <Leader>s :GitGrep <C-R><C-W><CR>
nnoremap <Leader>g :GitGrep 

" Better mappings
map 0 ^

" Tabs and shifts, 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set scrolloff=3

" Window creation and cycling
set splitbelow
set splitright
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <S-Up>  :resize +5<CR>
nnoremap <silent> <S-Down> :resize -5<CR>
nnoremap <silent> <S-Right>  :vertical resize +10<CR>
nnoremap <silent> <S-Left> :vertical resize -10<CR>


if !exists("g:syntax_on")
    syntax enable
endif

if &diff == 'nodiff'
    set shell=/bin/bash\ -i
endif

nnoremap <leader><leader> :!sendscreen 

colorscheme lightning
