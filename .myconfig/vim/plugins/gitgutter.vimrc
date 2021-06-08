Plug 'airblade/vim-gitgutter'

let g:gitgutter_map_keys = 0
let g:gitgutter_line_highlights_enable = 'true'
let g:gitgutter_line_nr_highlights_enable = 'false'
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_allow_clobber = 1

nmap <leader>ggf :GitGutterFold<CR>
nmap ( <Plug>(GitGutterNextHunk)
nmap ) <Plug>(GitGutterPrevHunk)

" highlight GitGutterAdd    guifg=#009900
" highlight GitGutterChange guifg=#bbbb00
" highlight GitGutterDelete guifg=#ff2222
