
" settings/colors_base part
syntax enable

" should go after colorscheme
hi CocErrorHighlight guifg=#BBE67E
hi CocErrorVirtualText guifg=#BBE67E
hi CocErrorFloat guifg=#ffff00

" Sneak colors
hi Sneak guifg=#262626 guibg=#BBE67E
hi SneakScope guifg=#262626 guibg=#BBE67E

" Vim-bookmarks colors
hi BookmarkSign guibg=#343F4C guifg=#BBE67E
hi BookmarkLine guibg=#343F4C guifg=#BBE67E

" Coc colors
" to disable line text color change for the line with error (the sign in the
" gutter is enough)
hi CocErrorHighlight guifg=none
