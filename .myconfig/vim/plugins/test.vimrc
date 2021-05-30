Plug 'vim-test/vim-test'

nnoremap <Leader>ts :only<CR>:w<bar>:TestNearest<CR>
nnoremap <Leader>tf :only<CR>:w<bar>:TestFile<CR>
nnoremap <Leader>tl :only<CR>:w<bar>:TestLast<CR>
nnoremap <Leader>tv :only<CR>:w<bar>:TestVisit<CR>

let test#javascript#jest#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'
let test#javasctipt#project_root = "client"
let test#javascript#jest#executable = "NODE_ENV=test TZ=UTC $(yarn bin)/jest path/to/my.spec.js"
