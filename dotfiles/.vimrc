set nocompatible

syntax on
filetype on
set number
set visualbell
set background=dark
set encoding=utf-8

set linebreak
set wrap
set textwidth=80

set autoindent
set shiftwidth=4
set smartindent	
set smarttab	
set softtabstop=4

"set spell

set hlsearch
set incsearch
set ignorecase
set smartcase

set cursorline

set showmode
set showcmd
set laststatus=2
set display=lastline
set scrolloff=10
set backspace=indent,eol,start

set autoread

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

map <C-p> :Files<CR>

let g:airline_powerline_fonts=1

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/simple_ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu
let g:ycm_use_clangd = 1

let g:dracula_italic = 0
colorscheme dracula
let g:airline_theme='dracula'
set termguicolors
