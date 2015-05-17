" Required for Vundle
filetype off

" Setup Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Fetched and loaded by Vundle
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

call vundle#end()

" Airline settings
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1

" CtrlP settings
let g:ctrlp_match_window='top,order:ttb,min:1,max:10'
let g:ctrlp_show_hidden=1

"
let g:delimitMate_expand_cr=1

" Open NERDTree
noremap <C-n> :NERDTreeToggle<CR>

