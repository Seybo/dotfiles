Plug 'github/copilot.vim'

" apply suggestion with <C-i>
imap <silent><script><expr> <C-i> copilot#Accept("\<cr>")
inoremap <c-j> <Plug>(copilot-next)

let g:copilot_no_tab_map = v:true

" to change suggestion font
" highlight CopilotSuggestion guifg=#00ff00
