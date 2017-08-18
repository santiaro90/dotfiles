" Required for Vundle
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Fetched and loaded by Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'

" Allow adding different plugins per machine
if filereadable(glob('~/.vim/load/plugins.local.vim'))
    source ~/.vim/load/plugins.local.vim
endif

call vundle#end()

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':p:t'
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#left_alt_sep='│'
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#right_alt_sep='│'
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#show_close_button=0
let g:airline_left_sep=''
let g:airline_powerline_fonts=1
let g:airline_right_sep=''
let g:airline_theme='bubblegum'

" CtrlP
let g:ctrlp_match_window='top,order:ttb,min:1,max:10'
let g:ctrlp_show_hidden=1
let g:ctrlp_match_func={ 'match': 'pymatcher#PyMatch' }
let g:ctrlp_working_path_mode='ra'

if executable('ag')
    let g:ctrlp_user_command='ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore node_modules
        \ --ignore "**/*.pyc"
        \ -g ""'
    let g:ctrlp_use_caching=0
endif

" Zencoding for JSX react components
autocmd FileType javascript runtime! ftplugin/html/sparkup.vim

" NERDTree
let NERDTreeShowHidden=1

" UltiSnips
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" YCM
let g:ycm_key_list_select_completion=['<C-n>', 'Down']
let g:ycm_key_list_previous_completion=['<C-p>', 'Up']
let g:SuperTabDefaultCompletionType='<C-n>'

" Place cursor properly when hitting enter after braces
let g:delimitMate_expand_cr=1

" To hide preview window after selecting an autocomplete option
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
