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

" should go after colorscheme
highlight CocErrorHighlight ctermfg=Yellow guifg=#ffff00
highlight CocErrorVirtualText ctermfg=Yellow guifg=#ffff00
highlight CocErrorFloat ctermfg=Yellow guifg=#ffff00

" Change the Sneak colors
highlight Sneak guifg=#262626 guibg=#afff5f ctermfg=red ctermbg=yellow
highlight SneakScope guifg=#262626 guibg=#afff5f ctermfg=red ctermbg=yellow
