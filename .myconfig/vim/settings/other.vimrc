" live replacement with %s/
set inccommand=nosplit
" Incrementally search while typing
set incsearch
" Use smart case for searching
set ignorecase
set smartcase
" Highlight searches
set hlsearch
" so gitgutter doesnt override line numbers
set signcolumn=yes
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

augroup neovim_terminal
  autocmd!
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
augroup END

let g:ruby_host_prog = '~/.rbenv/versions/2.7.5/bin/neovim-ruby-host'
let g:python3_host_prog = '/usr/bin/python3'
" python 3 should be enough
" let g:python_host_prog = '/usr/bin/python2'
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
augroup END
