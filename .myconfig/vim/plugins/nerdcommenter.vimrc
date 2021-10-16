Plug 'preservim/nerdcommenter'

let g:NERDCreateDefaultMappings = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
nmap <leader>cc :call nerdcommenter#Comment(0,"toggle")<cr>
vmap <leader>cc :call nerdcommenter#Comment(0,"toggle")<cr>
nmap <leader>ca <plug>NERDCommenterAltDelims
vmap <leader>ca <plug>NERDCommenterAltDelims
