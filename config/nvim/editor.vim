set encoding=utf-8
set autowrite
set autoread
set gdefault
set hidden
set nowrap
set smartcase
set splitbelow
set splitright

set laststatus=2
set showtabline=2

set modeline
set nobackup
set noshowmode
set noswapfile
set nowritebackup


" Tab behaviour
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=4
set tabstop=4

" Reasonable way to handle join and insert on commented lines
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
set formatoptions+=j

set cursorline
set number
set relativenumber
set scrolloff=5

" Disable background to get transparency
augroup colorset
  autocmd!
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
  autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
augroup END

colorscheme onedark
