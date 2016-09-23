set nocompatible
set encoding=utf-8
set fileformat=unix
set clipboard=unnamedplus
let mapleader=" "
let maplocalleader=" "

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'vim-airline/vim-airline'

" Python Plugins
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ivanov/vim-ipython'
"Plugin 'klen/python-mode'

" Tmux Plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-dispatch'

Plugin 'ctrlpvim/ctrlp.vim'

" Tags
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'

" Colorscheme
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=dark
colorscheme solarized

" Create tags in directory of file
let g:easytags_dynamic_files = 2
set tags=./tags

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

let python_highlight_all=1
syntax on

" Slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

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

set cursorline
set wildmenu
set wildmode=list:longest,full

" Faster mappings
imap fd <ESC>:w<CR>
nnoremap <leader>q :q<CR>
nnoremap <BS> <C-^>
nnoremap <leader>rc :e ~/.vimrc<CR>

" Better mappings
map 0 ^

" Dispatch mappings
autocmd FileType python nnoremap <localleader>t :Dispatch pytest<CR>

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

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
