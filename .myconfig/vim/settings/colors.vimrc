set termguicolors
syntax enable
" set background=dark

" themes are located in .vim/plugged/
" colorscheme spacegray
" colorscheme gotham
" colorscheme badwolf
" colorscheme apprentice
" colorscheme onedark
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
" colorscheme neodark
" colorscheme nord

" BEST
" colorscheme one
" colorscheme dracula

" goes nice with indent line plugin. See the theme repo
let ayucolor="mirage"
" i've updated bg color here .vim/plugged/ayu-vim/colors/ayu.vim to match alacrity theme with #262626
colorscheme ayu
let g:airline_theme="minimalist"
let g:airline_section_a = airline#section#create(['crypt', 'paste', 'spell', 'iminsert'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" default sections content
" let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
" let g:airline_section_b       (hunks, branch)
" let g:airline_section_c       (bufferline or filename, readonly)
" let g:airline_section_gutter  (csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y       (fileencoding, fileformat)
" let g:airline_section_z       (percentage, line number, column number)
" let g:airline_section_error   (ycm_error_count, syntastic-err, eclim, languageclient_error_count)
" let g:airline_section_warning (ycm_warning_count, syntastic-warn, languageclient_warning_count, whitespace)

" should go after colorscheme
highlight CocErrorHighlight ctermfg=Yellow guifg=#ffff00
highlight CocErrorVirtualText ctermfg=Yellow guifg=#ffff00
highlight CocErrorFloat ctermfg=Yellow guifg=#ffff00

" Change the Sneak colors
highlight Sneak guifg=#262626 guibg=#afff5f ctermfg=red ctermbg=yellow
highlight SneakScope guifg=#262626 guibg=#afff5f ctermfg=red ctermbg=yellow
