Plug 'MattesGroeger/vim-bookmarks'
let g:bookmark_no_default_key_mappings = 1
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_auto_close = 1
" bookmarks per project
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

nmap <Leader>bb <Plug>BookmarkToggle
nmap <Leader>ba <Plug>BookmarkAnnotate
nmap <Leader>bl <Plug>BookmarkShowAll
nmap <Leader>bc <Plug>BookmarkClearAll
