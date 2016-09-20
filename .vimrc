set nocompatible
set encoding=utf-8
set fileformat=unix
set clipboard=unnamedplus

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'elzr/vim-json'
Plugin 'vim-airline/vim-airline'

" Python Plugins
Plugin 'alfredodeza/pytest.vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ivanov/vim-ipython'
"Plugin 'klen/python-mode'

" Tmux Plugins
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" neocomplete
let g:neocomplete#enable_at_startup = 1

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

let python_highlight_all=1
syntax on

" Slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" Pytest
nmap <silent><Leader>a <Esc>:Pytest file verbose<CR>
nmap <silent><Leader>f <Esc>:Pytest function verbose<CR>

" Line numbering
set number
set relativenumber

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <CR> :noh<CR>

set autowrite
set autoread

syntax enable
set cursorline
set wildmenu
set wildmode=list:longest,full

imap fd <ESC>:w<ENTER>

" Tabs and shifts, 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set scrolloff=3
set list

" Window creation and cycling
set splitbelow
set splitright
nnoremap <silent> <Tab> <C-W>w
nnoremap <silent> <S-Tab> <C-W>W
nnoremap <silent> <C-J> <C-W><C-J>
nnoremap <silent> <C-K> <C-W><C-K>
nnoremap <silent> <C-L> <C-W><C-L>
nnoremap <silent> <C-H> <C-W><C-H>
nnoremap <silent> <S-Up>  :resize +5<CR>
nnoremap <silent> <S-Down> :resize -5<CR>
nnoremap <silent> <S-Right>  :vertical resize +10<CR>
nnoremap <silent> <S-Left> :vertical resize -10<CR>
