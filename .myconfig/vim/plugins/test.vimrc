Plug 'vim-test/vim-test'

nnoremap <silent><Leader>tss :TestNearest<CR>
"close already opened test split first, r-reopen
nnoremap <silent><Leader>tsr <C-w>jii:TestNearest<CR>
nnoremap <silent><Leader>tf :TestFile<CR>
nnoremap <silent><Leader>tll :TestLast<CR>
nnoremap <silent><Leader>tlr <C-w>jii:TestLast<CR>
nnoremap <silent><Leader>tv :TestVisit<CR>

let test#javascript#jest#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'
let test#javasctipt#project_root = "client"
let test#javascript#jest#executable = "NODE_ENV=test TZ=UTC $(yarn bin)/jest path/to/my.spec.js"
