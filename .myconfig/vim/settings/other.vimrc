" live replacement with %s/
set inccommand=nosplit
" Incrementally search while typing
set incsearch
" Use smart case for searching
set ignorecase
set smartcase
" Highlight searches
set hlsearch
" Automatically removing all trailing whitespace
autocmd! BufWritePre * %s/\s\+$//e
" Check spell for markdown files
autocmd FileType markdown,vimwiki setlocal spell
