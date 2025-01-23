" Source .vimrc
nnoremap <leader>r :source $MYVIMRC<CR>
" Swap : and ; in normal/visual mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Deactivate Ex mode
noremap Q <nop>

" Disable arrow keys
map <LEFT> <nop>
map <RIGHT> <nop>
map <UP> <nop>
map <DOWN> <nop>

" Useful escape mapping
inoremap jk <ESC>

" Clear last search
" nnoremap <silent> <leader>c :let @/=''<CR>
nnoremap <silent> <leader>c :nohl<CR>

" Movement in command mode
cnoremap <C-a> <C-b>
cnoremap <C-b> <C-Left>
cnoremap <C-f> <C-Right>

" Moving between tabs/buffers
" nnoremap <leader>N :tabn<CR>
" nnoremap <leader>P :tabp<CR>
nnoremap L :bn<CR>
nnoremap H :bp<CR>

" CtrlP Bookmarks
" noremap <leader>ba :CtrlPBookmarkDirAdd <C-R>=expand('%:p:h')<CR>
" noremap <leader>bo :CtrlPBookmarkDir<CR>

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

" Completion
inoremap <C-space> <C-x><C-o>

" Trigger Ag search
nnoremap <leader>f :Ag!<SPACE>
vnoremap <leader>f y:Ag!<SPACE><C-R>0<SPACE>

" fzf
nnoremap <C-p> :Files<CR>
" nnoremap <C-p>/ :BLines<CR>
" nnoremap <C-p>b :Buffers<CR>
" nnoremap <C-p>f :Files<CR>
" nnoremap <C-p>h :History<CR>

" Multi-cursor mappings
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-u>'
let g:multi_cursor_quit_key='<C-x>'

" UltiSnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" Make UltiSnips work along with YCM
let g:ycm_key_list_select_completion=['<C-n>', 'Down']
let g:ycm_key_list_previous_completion=['<C-p>', 'Up']

let g:SuperTabDefaultCompletionType='<C-n>'

" Add local mappings if any
if filereadable(glob('~/.vim/load/keymapping.local.vim'))
    source ~/.vim/load/keymapping.local.vim
endif
