set nocompatible

syntax on
set number
set visualbell
set background=dark

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

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

map <C-n> :NERDTreeToggle<CR>
