" https://github.com/airblade/vim-gitgutter#getting-started
Plug 'airblade/vim-gitgutter'
let g:gitgutter_highlight_lines = 0 " To turn on line highlighting by default
let g:gitgutter_map_keys = 0
nmap <leader>ggh :GitGutterLineHighlightsToggle<CR>
nmap <leader>ggf :GitGutterFold<CR>

" GitGutterLineNrHighlightsToggle
" By default buffers are diffed against the index. However you can diff against any commit by setting:
" let g:gitgutter_diff_base = '<commit SHA>'
