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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
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
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

" Allow adding different plugins per machine
if filereadable(glob('~/.vim/load/plugins.local.vim'))
    source ~/.vim/load/plugins.local.vim
endif

call vundle#end()

" Airline
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'

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
let g:UltiSnipsSnippetDirectories=["load/snippets"]

" Place cursor properly when hitting enter after braces
let g:delimitMate_expand_cr=1

" Ruby linter
let g:syntastic_ruby_checkers=['rubocop']

" To hide preview window after selecting an autocomplete option
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Execute JS code withing Vim and show results in quickfix
command! -nargs=? Node Dispatch node <args>
