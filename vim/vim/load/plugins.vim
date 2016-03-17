" Required for Vundle
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Fetched and loaded by Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
" Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'rizzatti/dash.vim'
Plugin 'rking/ag.vim'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'wavded/vim-stylus'

call vundle#end()

" Airline settings
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'

" CtrlP settings
if executable('ag')
    let g:ctrlp_user_command='ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'
    let g:ctrlp_use_caching=0
endif

let g:ctrlp_match_window='top,order:ttb,min:1,max:10'
let g:ctrlp_show_hidden=1
let g:ctrlp_match_func={ 'match': 'pymatcher#PyMatch' }
let g:ctrlp_working_path_mode=0


" Multi-cursor mappings
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-u>'
let g:multi_cursor_quit_key='<C-x>'

" NERDTree settings
let NERDTreeShowHidden=1

" Place cursor properly when hitting enter after braces
let g:delimitMate_expand_cr=1

" Ruby linter
let g:syntastic_ruby_checkers=['rubocop']

" To hide preview window after selecting an autocomplete option
let g:ycm_autoclose_preview_window_after_completion=1

" Open NERDTree
noremap <leader>n :NERDTreeToggle<CR>

command! -nargs=? Node Dispatch node <args>
