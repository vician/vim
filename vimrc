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

let g:vimwiki_list = [
			\{'path': '~/Documents/wiki/','path_html':'~/Documents/wiki-html/'},
			\{'path': '~/martin@vician.cz/everywhere/wiki/','path_html':'~/Downloads/martin@vician.cz-wiki-html/'},
			\{'path': '~/martin@vician.cz/everywhere/wiki-public/','path_html':'~/Downloads/martin@vician.cz-wiki-public-html/'}
			\]

" Draw line on 80 collumn
"set colorcolumn=+1        " highlight column after 'textwidth'
"set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
"highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

set nofoldenable

function! VimwikiLinkHandler(link)
	try
		if a:link =~# '^http'
			execute '!/usr/bin/chromium-browser '.a:link
			return 1
		else
			echo "no link"
			return 0
		endif
	catch
		echo "This can happen for a variety of reasons ..."
	endtry
	return 0
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
