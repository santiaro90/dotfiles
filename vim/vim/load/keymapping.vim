" Source .vimrc
nnoremap <leader>r :source $MYVIMRC<CR>
" Swap : and ; in normal mode
nnoremap ; :
nnoremap : ;

" Deactivate Ex mode
noremap Q <nop>

" Disable mapping to redirect to man pages
noremap K <nop>

" Disable arrow keys
map <LEFT> <nop>
map <RIGHT> <nop>
map <UP> <nop>
map <DOWN> <nop>

" Useful escape mapping
inoremap kj <ESC>

" Toggle search highlight
nnoremap <silent> <leader>c :set nohls!<CR>

" Changing windows layout
noremap <leader>J <C-w>J
noremap <leader>K <C-w>K
noremap <leader>H <C-w>H
noremap <leader>L <C-w>L

" Toggle invisible characters
noremap <silent> <leader>l :set list!<CR>

" Save all/Save all and quit
command! W wa
command! Q wqa

" Join and restore cursor position
nnoremap J mjJ`j

" Add blank lines above and below current one
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

