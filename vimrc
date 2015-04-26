" iMprove it
set nocompatible

" Always show status line
set laststatus=2

" Required for Vundle
filetype off

" ==============================================================================
" === Plugins ===

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Actual plugins
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

call vundle#end()

" Airline settings
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

" CtrlP settings
let g:ctrlp_match_window='top,order:ttb,min:1,max:5'
let g:ctrlp_show_hidden=1

" ==============================================================================
" === Colour scheme ===

" Use Tomorrow Night theme
set background=dark
set t_Co=256
colorscheme Tomorrow-Night-Eighties
syntax on

" ==============================================================================
" === Editing settings ===

set autowrite
set hidden

set splitbelow
set splitright

set incsearch

" No backup files
set nobackup

" Line numbering on
set number

" Highlight current line
set cursorline
set ruler

" Show invisible characters
set lcs=tab:▸\ ,trail:·
set list

" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" Enable file type detection
filetype plugin indent on

" Disable autocommenting
autocmd VimEnter,BufNewFile,BufRead * setlocal formatoptions-=cro

" ==============================================================================
" === Key mappings ===
let mapleader=" "

" Disable arrow keys
noremap <LEFT> <nop>
noremap <RIGHT> <nop>
noremap <UP> <nop>
noremap <DOWN> <nop>

" Useful escape mapping
inoremap kj <ESC> 

" Easier movement for windows and tabs
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

noremap <leader>j <C-w>J
noremap <leader>k <C-w>K
noremap <leader>h <C-w>H
noremap <leader>l <C-w>L

" Toggle invisible characters
noremap <leader>li :set list!<CR>

" Save buffers
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wa<CR>

" Close and save windows
nnoremap <leader>w :wq<CR>
nnoremap <leader>W :wqa<CR>

" Open NERDTree
noremap <C-n> :NERDTreeToggle<CR>
