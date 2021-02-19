call plug#begin(stdpath('data') . '/plugged')
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'ap/vim-css-color'
  Plug 'itchyny/lightline.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'neoclide/coc.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
call plug#end()

let g:indentLine_char = '|'
let g:lightline = {}
let g:lightline.tabline = {}
let g:lightline.component_expand = {}
let g:lightline.component_type = {}
let g:lightline.tabline.left = [ ['buffers'] ]
let g:lightline.tabline.right = []
let g:lightline.component_expand.buffers = 'lightline#bufferline#buffers'
let g:lightline.component_type.buffers = 'tabsel'
