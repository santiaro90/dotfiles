" Required for Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('~/.vim/bundle/Vundle.vim'))
    call vundle#begin()

    " Fetched and loaded by Vundle
    Plugin 'gmarik/Vundle.vim'

    " Git
    Plugin 'airblade/vim-gitgutter'
    Plugin 'tpope/vim-fugitive'

    " Dev
    Plugin 'AndrewRadev/splitjoin.vim'
    Plugin 'SirVer/ultisnips'
    " Plugin 'Valloric/YouCompleteMe'
    Plugin 'chrisbra/NrrwRgn'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'ervandew/supertab'
    Plugin 'janko-m/vim-test'
    Plugin 'rking/ag.vim'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'w0rp/ale'

    " Utils
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'mattn/gist-vim'
    Plugin 'mattn/webapi-vim'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'tpope/vim-abolish'
    Plugin 'tpope/vim-dispatch'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-surround'

    " JS/HTML/CSS
    Plugin 'Quramy/tsuquyomi'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'othree/javascript-libraries-syntax.vim'
    Plugin 'pangloss/vim-javascript'
    Plugin 'rstacruz/sparkup'

    " Ruby
    Plugin 'tpope/vim-rails'
    Plugin 'vim-ruby/vim-ruby'

    " Themes
    Plugin 'catppuccin/vim', {'as': 'catppuccin'}
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

    " Allow adding different plugins per machine
    if filereadable(glob('~/.vim/custom/plugins.local.vim'))
        source ~/.vim/custom/plugins.local.vim
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
    let g:airline_theme='catppuccin_frappe'

    " fzf
    let g:fzf_layout={'up': '~30%'}
    let g:fzf_history_dir='~/.local/share/fzf-history'

    " Zencoding for JSX react components
    autocmd FileType javascript runtime! ftplugin/html/sparkup.vim

    " Linter
    let g:ale_fix_on_save=1
    let g:ale_fixers={'ruby': ['rubocop'], 'javascript': ['prettier']}
    let g:ale_linters={'ruby': ['rubocop'], 'javascript': ['eslint']}
    let g:ale_pattern_options={'\.html$': {'ale_enabled': 0}, '\.erb$': {'ale_enabled': 0}}
    let g:ale_sign_error='x'
    let g:ale_sign_warning='⚠'

    " NERDTree
    let NERDTreeShowHidden=1

    " UltiSnips
    let g:UltiSnipsEditSplit='vertical'
    let g:UltiSnipsSnippetDirectories=['~/.vim/custom/UltiSnips', 'UltiSnips']
endif

" To hide preview window after selecting an autocomplete option
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
