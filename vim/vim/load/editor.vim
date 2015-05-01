set autowrite
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set ruler
set smartcase
set smarttab
set splitbelow
set splitright

" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬
set list

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start

" Highlight current line
set cursorline
" Line numbering on
set number
" Minimum number of lines shown when scrolling
set scrolloff=5

" Enable file type detection
filetype plugin indent on

" Disable autocommenting
autocmd VimEnter,BufNewFile,BufRead * setlocal formatoptions-=cro

