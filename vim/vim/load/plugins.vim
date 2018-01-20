" Required for Vundle
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Fetched and loaded by Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'leafgarland/typescript-vim'
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
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
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

" fzf
let g:fzf_layout={'up': '~30%'}

" Zencoding for JSX react components
autocmd FileType javascript runtime! ftplugin/html/sparkup.vim

" Linter
let g:ale_pattern_options={'\.html$': {'ale_enabled': 0}}

" NERDTree
let NERDTreeShowHidden=1

" UltiSnips
let g:UltiSnipsEditSplit='vertical'

" To hide preview window after selecting an autocomplete option
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
