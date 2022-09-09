
" settings/colors_base part
syntax enable

" should go after colorscheme
" hi CocErrorHighlight guifg=#BBE67E
" hi CocErrorVirtualText guifg=#BBE67E
" guibg doesnt work here for some reason
hi CocErrorFloat guifg=#E3890D
hi CocWarningFloat guifg=#934BDC
hi CocInfoFloat guifg=#343F4C
hi CocMenuSel guibg=#343F4C guifg=#BBE67E

" Sneak colors
hi Sneak guifg=#343F4C guibg=#BBE67E
hi SneakScope guifg=#343F4C guibg=#BBE67E

" Vim-bookmarks colors
hi BookmarkSign guibg=#343F4C guifg=#BBE67E
hi BookmarkLine guibg=#343F4C guifg=#BBE67E

" Coc colors
" to disable line text color change for the line with error (the sign in the gutter is enough)
hi CocErrorHighlight guifg=none
" use :help coc-highlights
