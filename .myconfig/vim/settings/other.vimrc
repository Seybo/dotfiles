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

" associations for gf
" some work only if pass is visually selected (not just a cursor under it)
augroup suffixes
  let associations = [
              \["javascript", ".js,.javascript,.json,.jsx,.gql"],
              \["ruby", ".rb,.yml"]
              \]

  for ft in associations
    execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
  endfor
augroup END
