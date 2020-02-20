set nocompatible            " Use Vim defaults (much better!)
set bs=indent,eol,start     " allow backspacing over everything in insert mode
"set ai                     " always set autoindenting on
set ruler                   " show the cursor position all the time
set bg=light
set ignorecase
set smartcase
set incsearch
set hlsearch
set shiftwidth=4
autocmd FileType python setlocal expandtab
set softtabstop=4
set ts=4                   " set tabs to display as width 4
set number
set tw=79
syntax on
set autoindent
"set smartindent
set vb

set foldenable
syn region myFold start="{" end="}" transparent fold
syn sync fromstart
set foldmethod=syntax

" enable vundle https://github.com/gmarik/vundle
"filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"filetype plugin indent on
" end of vundle

execute pathogen#infect()

if has('gui_running')
    set gfn=Inconsolata:h16
    "set guioptions=-t

    " solarized colorscheme in gui only
    set background=dark
    colorscheme solarized
endif

if has('gui_vimr')
    "set gfn=Inconsolata:h16
    "set guioptions=-t

    " solarized colorscheme in gui only
    set background=dark
    "colorscheme candid
    colorscheme darcula
endif

nmap =j :%!python -m json.tool<CR>
