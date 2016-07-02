" Source .vimrc
nnoremap <leader>s :source $MYVIMRC<CR>
" Swap : and ; in normal/visual mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Deactivate Ex mode
noremap Q <nop>

" Search with Dash
nnoremap K :Dash <C-R><C-W><SPACE>
vnoremap K y:Dash <C-R>0<SPACE>

" Disable arrow keys
map <LEFT> <nop>
map <RIGHT> <nop>
map <UP> <nop>
map <DOWN> <nop>

" Useful escape mapping
inoremap kj <ESC>

" Toggle search highlight
nnoremap <silent> <leader>c :let @/=''<CR>

" Moving between tabs/buffers
nnoremap <leader>N :tabn<CR>
nnoremap <leader>P :tabp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" Toggle NERDTree
noremap <leader>. :NERDTreeToggle<CR>

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
nnoremap <leader>o @='mzo<C-V><ESC>`z'<CR>
nnoremap <leader>O @='mzO<C-V><ESC>`z'<CR>

" Multi-cursor mappings
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-u>'
let g:multi_cursor_quit_key='<C-x>'

" Make UltiSnips work along with YCM
let g:UltiSnipsExpandTrigger='<C-space>'

" Add local mappings if any
if filereadable(glob('~/.vim/load/keymapping.local.vim'))
    source ~/.vim/load/keymapping.local.vim
endif
