Plug 'vim-test/vim-test'

nnoremap <silent><Leader>tss :TestNearest<cr><c-w>=
"close already opened test split first, r-reopen
nnoremap <silent><Leader>tsr <C-w>jii:TestNearest<cr><c-w>=
nnoremap <silent><Leader>tff :TestFile<cr><c-w>=
nnoremap <silent><Leader>tfr <C-w>jii:TestFile<cr><c-w>=
nnoremap <silent><Leader>tll :TestLast<cr><c-w>=
nnoremap <silent><Leader>tlr <C-w>jii:TestLast<cr><c-w>=
nnoremap <silent><Leader>tv :TestVisit<cr>
" close opened test window
nnoremap <silent><Leader>tx <C-w>jii<cr>

let test#javascript#jest#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'
let test#javasctipt#project_root = "client"
let test#javascript#jest#executable = "NODE_ENV=test TZ=UTC $(yarn bin)/jest path/to/my.spec.js"
