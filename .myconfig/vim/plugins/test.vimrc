Plug 'vim-test/vim-test'

nnoremap <silent><leader>tss :w<cr>:TestNearest<cr><c-w>=
"close already opened test split first, r-reopen
nnoremap <silent><leader>tsr :w<cr><c-w>jii:TestNearest<cr><c-w>=
nnoremap <silent><leader>tff :w<cr>:TestFile<cr><c-w>=
nnoremap <silent><leader>tfr :w<cr><c-w>jii:TestFile<cr><c-w>=
nnoremap <silent><leader>tll :w<cr>:TestLast<cr><c-w>=
nnoremap <silent><leader>tlr :w<cr><c-w>jii:TestLast<cr><c-w>=
nnoremap <silent><leader>tv :w<cr>:TestVisit<cr>
" close opened test window
nnoremap <silent><leader>tx <C-w>jii<cr>

let test#javascript#jest#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'
let test#javasctipt#project_root = "client"
let test#javascript#jest#executable = "NODE_ENV=test TZ=UTC $(yarn bin)/jest path/to/my.spec.js"
