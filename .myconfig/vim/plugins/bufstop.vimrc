Plug 'mihaifm/bufstop'
" using it for buffer deletion is not a good idea because it wipes buffers (i.e. with marks etc)
" nnoremap <silent><leader>bf :Bufstop<cr>
nnoremap <silent><a-i>      :BufstopBack<cr>
nnoremap <silent><a-o>      :BufstopForward<cr>

let g:BufstopAutoSpeedToggle = 1
" let g:BufstopKeys="asdfghjklqwertyuiopzxcvbnmASDFGHJKL"
