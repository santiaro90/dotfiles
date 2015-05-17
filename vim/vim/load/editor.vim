set autowrite
set autoread
set diffopt+=vertical
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set nowrap
set ruler
set showmatch
set smartcase
set smarttab
set splitbelow
set splitright

" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬
set list

" Indentation
set autoindent
set backspace=indent,eol,start
set expandtab
set shiftround
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

" No automatic folding
set nofoldenable
set foldmethod=manual

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

