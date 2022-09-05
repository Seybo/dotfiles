Plug 'github/copilot.vim'

" apply suggestion with <C-y>
imap <silent><script><expr> <C-y> copilot#Accept("\<cr>")
imap <c-j> <Plug>(copilot-next)

let g:copilot_no_tab_map = v:true

" to change suggestion font
" highlight CopilotSuggestion guifg=#00ff00
