set nocursorcolumn
set nocursorline
" Each time a new or existing file is edited, 
" Vim will try to recognize the type of the file and set the 'filetype' option. 
" This will trigger the FileType event, which can be used to set the syntax highlighting, set options, etc
filetype on
" This actually loads the file "ftplugin.vim" in 'runtimepath'.
" The result is that when a file is edited its plugin file is loaded 
" (if there is one for the detected filetype)
filetype plugin on
" This actually loads the file "indent.vim" in 'runtimepath'.
" The result is that when a file is edited its indent file is loaded 
" (if there is one for the detected filetype)
filetype indent on

syntax on
" not sure if it makes difference. Should speed up syntax highlighting
syn sync maxlines=200
syn sync minlines=50

" set absolute line numbes
set nu

" indentation settings
set expandtab
set softtabstop=2
set shiftwidth=2

" folding
set foldmethod=indent 
set foldlevelstart=99

" If your search pattern is purely lowercase, it will search case insensitively
" If your search pattern contains uppercase characters, it will search case sensitively
set ignorecase
set smartcase

" syntax highlighting is the major performance hit. Just don't do it on huge files like gql schema
autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
