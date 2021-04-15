Plug 'pbogut/fzf-mru.vim'
let g:fzf_mru_relative = 1

" files history
map <leader>fhh :let g:fzf_mru_relative=1<cr> :FZFMru<cr>
map <leader>fhf :let g:fzf_mru_relative=0<cr> :FZFMru<cr>
