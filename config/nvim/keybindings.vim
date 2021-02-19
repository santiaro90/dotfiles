let mapleader="\<Space>"

" Reload config
nnoremap <Leader>r :source .config/nvim/init.vim<CR>

" Disable arrow keys
map <LEFT> <nop>
map <RIGHT> <nop>
map <UP> <nop>
map <DOWN> <nop>

" Swap : and ;
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Movement in command mode
cnoremap <C-a> <C-b>
cnoremap <C-b> <C-Left>
cnoremap <C-f> <C-Right>

" Moving between tabs/buffers
nnoremap <leader>N :tabn<CR>
nnoremap <leader>P :tabp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" fzf
nnoremap <C-p> :Files<CR>

" Miscellaneous
inoremap jk <ESC>
nnoremap <leader>c :noh<CR>

" Centre line when traversing search results
nnoremap n nzz
nnoremap N Nzz

" Add blank line above/below
nnoremap <leader>o @='mzo<C-V><ESC>`z'<CR>
nnoremap <leader>O @='mzO<C-V><ESC>`z'<CR>

