set nocompatible
set encoding=utf-8
set fileformat=unix

if has('unix')
    set clipboard=unnamedplus
elseif has('win32')
    set clipboard=unnamed
endif


let mapleader=" "
let maplocalleader=" "

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'vim-airline/vim-airline'
Plugin 'ervandew/supertab'

" Python Plugins
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tweekmonster/braceless.vim'
Plugin 'tweekmonster/local-indent.vim'

" Tmux Plugins
Plugin 'tpope/vim-dispatch'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'pangloss/vim-javascript'
Plugin 'jiangmiao/auto-pairs'

" Snippets
"   engine
Plugin 'SirVer/ultisnips'
"   actual snippets
Plugin 'honza/vim-snippets'

" Code Navigation
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'

" Colorscheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'


" All of your Plugins must be added before the following line
call vundle#end()            " required

if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif
syntax on

" Create tags in directory of file
let g:easytags_dynamic_files = 2
set tags=./tags;/,tags;/

" Always show tab line
set showtabline=2

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Snippets configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<CR>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"

" C++11+ syntax highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

let g:ctrlp_by_filename = 1

let g:javascript_plugin_jsdoc = 1

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

let python_highlight_all=1

" Line numbering
set number
set relativenumber

" Searching and replacing
set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
nnoremap <CR> :noh<CR>

set autowrite
set autoread

set cursorline
set wildmenu
set wildmode=list:longest,full
set wildignore+=*.pyc,*.swp,*.o,*.obj

" Faster mappings
nnoremap <leader>q :q<CR>
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <leader>e :e<space>
nnoremap <leader>v :e ~/.vimrc<CR>
inoremap jk <ESC>:w<CR>
nnoremap \ <C-^>

" Cycle make errors and ack search results with tab
nnoremap <silent> <Tab> :cnext<CR>
nnoremap <silent> <BS> :cprevious<CR>

nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>l :CtrlPMixed<CR>
nnoremap <Leader>a :Ack 

" Better mappings
map 0 ^

" Dispatch mappings
"Python
autocmd FileType python nnoremap <localleader>t :Dispatch pytest<CR>
autocmd FileType python nnoremap <localleader>i :Start ipython<CR>
autocmd FileType python BracelessEnable +indent
"C++
autocmd FileType cpp nnoremap <localleader>m :Make<CR>
autocmd FileType cpp nnoremap <localleader>mc :Make clean<CR>
autocmd FileType cpp nnoremap <localleader>t :Dispatch ./tests<CR>

" Column indent guide
autocmd FileType * LocalIndentGuide +hl +cc

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

syntax enable
set background=dark
colorscheme solarized

" Make colorscheme look better in terminal
if !has('gui_running')
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    colorscheme solarized
endif

so ~/my_functions.vim

set history=500
