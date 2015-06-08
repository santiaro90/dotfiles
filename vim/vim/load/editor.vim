set autowrite
set autoread
set diffopt+=vertical
set diffopt+=filler
set diffopt+=iwhite
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

" Omni-completion
set ofu=syntaxcomplete#Complete

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

" Center search results on screen
nnoremap n nzz
nnoremap N Nzz

" Enable file type detection
filetype plugin indent on

" Disable autocommenting
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" When joining commented lines, delete comment character
set formatoptions+=j

