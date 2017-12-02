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

    " Dispatch mappings
    "Python
    autocmd FileType python nnoremap <localleader>t :Dispatch pytest<CR>
    autocmd FileType python nnoremap <localleader>i :Start ipython<CR>
    autocmd FileType python BracelessEnable +indent
    "C++
    autocmd FileType cpp nnoremap <localleader>m :Make<CR>
    autocmd FileType cpp nnoremap <localleader>mc :Make clean<CR>
    autocmd FileType cpp nnoremap <localleader>t :Dispatch ./tests<CR>
endif

" Create tags in directory of file
let g:easytags_dynamic_files = 2
set tags=./tags;/,tags;/

if has('win32')
    let g:easytags_cmd = 'C:\utils\ctags58\ctags.exe'
endif

" Always show tab line
set showtabline=2

" Show just the filename
set laststatus=2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1

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

" Buffers
nnoremap ]b :bnext<CR>
nnoremap ]B :blast<CR>
nnoremap [b :bprevious<CR>
nnoremap [B :bfirst<CR>

" Tabs
nnoremap <leader>tn :tabnew<CR>

nnoremap <Leader><Leader> :sh<CR>
cabbr <expr> %% expand('%:p:h')

" Better tag jumping
nnoremap <CR> <C-]>
nnoremap <leader><CR> <C-t>
nnoremap <C-w><CR> <C-w><C-]>

nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>p :CtrlPMixed<CR>
nnoremap <Leader>a :Ack 

" Better mappings
map 0 ^

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

if !exists("g:syntax_on")
    syntax enable
endif
set background=dark
colorscheme solarized

" Make colorscheme look better in terminal
if !has('gui_running')
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    colorscheme solarized
endif

if &diff == 'nodiff'
    set shell=/bin/bash\ -i
endif

nnoremap <leader><leader> :!sendscreen 

func GitGrep(...)
    let save = &grepprg
    set grepprg=git\ grep\ -n\ $*
    let s = 'grep'
    for i in a:000
        let s = s . ' ' . i
    endfor
    exe s
    let &grepprg = save
endfun
command -nargs=? GitGrep call GitGrep(<f-args>)

func GitGrepWord()
    normal! "zyiw
    call GitGrep('-w -e ', getreg('z'))
endfun
nnoremap <leader>g :GitGrep 
nnoremap <leader>s :call GitGrepWord()<CR>
