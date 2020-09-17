Plug 'janko-m/vim-test'
let test#strategy = "tslime"
nnoremap <Leader>tf  :w <bar> :TestFile<CR>
nnoremap <Leader>ts  :w <bar> :TestNearest<CR>

let test#javascript#jest#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'
let test#javasctipt#project_root = "client"
let test#javascript#jest#executable = "NODE_ENV=test TZ=UTC $(yarn bin)/jest path/to/my.spec.js"

Plug 'jgdavey/tslime.vim'
let g:tslime_always_current_session = 1

