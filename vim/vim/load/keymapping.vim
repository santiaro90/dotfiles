let mapleader="\<Space>"

" Deactivate Ex mode
noremap Q <nop>

" No man mapping
noremap K <nop>

" Disable arrow keys
map <LEFT> <nop>
map <RIGHT> <nop>
map <UP> <nop>
map <DOWN> <nop>

" Useful escape mapping
inoremap kj <ESC>

" Toggle search highlight
nnoremap <leader>c :set nohls!<CR>

" Easier movement for windows
" The last <C-W>_ allows maximising space for current window
map <C-j> <C-W>j<C-W>_
map <C-k> <C-W>k<C-W>_
map <C-h> <C-W>h<C-W>_
map <C-l> <C-W>l<C-W>_

" Changing windows layout
noremap <leader>J <C-w>J
noremap <leader>K <C-w>K
noremap <leader>H <C-w>H
noremap <leader>L <C-w>L

" Toggle invisible characters
noremap <leader>l :set list!<CR>

" Write buffers
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wa<CR>
" Write and close buffers
nnoremap <leader>q :wq<CR>
nnoremap <leader>Q :wqa<CR>

" Join and restore cursor position
nnoremap J mjJ`j

" Add blank lines above and below current one
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

