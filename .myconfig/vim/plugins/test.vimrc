Plug 'janko-m/vim-test'
let test#strategy = "tslime"
nnoremap <Leader>sf  :w <bar> :TestFile<CR>
nnoremap <Leader>ss  :w <bar> :TestNearest<CR>
nnoremap <Leader>sl  :w <bar> :TestLast<CR>
nnoremap <Leader>sa  :w <bar> :TestSuite<CR>
nnoremap <Leader>su  :w <bar> :TestSuite -u<CR>

let test#javascript#jest#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'
let test#javasctipt#project_root = "client"
let test#javascript#jest#executable = "NODE_ENV=test TZ=UTC $(yarn bin)/jest path/to/my.spec.js"

Plug 'jgdavey/tslime.vim'
let g:tslime_always_current_session = 1

