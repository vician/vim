syntax enable

colorscheme desert
" colorscheme billw

set background=dark

set encoding=utf8

" Use spaces instead of tabs
" set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Always show the status line
set laststatus=2

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

set spelllang=cs,en,csa

set nu

execute pathogen#infect()
filetype plugin indent on

let g:vimwiki_list = [{'path': '~/Documents/wiki/'}]
