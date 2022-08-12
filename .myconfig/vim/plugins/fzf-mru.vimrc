Plug 'pbogut/fzf-mru.vim'
" only list files within current directory.
let g:fzf_mru_relative = 1
" keep list sorted by recency
let g:fzf_mru_no_sort = 1

" files history
map <leader>fhh :let g:fzf_mru_relative=1<cr> :FZFMru<cr>
map <leader>fhf :let g:fzf_mru_relative=0<cr> :FZFMru<cr>
