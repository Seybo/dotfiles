Plug 'vim-test/vim-test'
" Plug 'jgdavey/tslime.vim'
" let g:tslime_always_current_session = 1
" Plug 'preservim/vimux'
" let g:VimuxUseNearest = 0
" let g:VimuxOrientation = "h"
" let g:VimuxHeight = "40"

function! CustomStrategy(cmd)
  execute 'bel 15 new'
  call termopen(a:cmd)
  wincmd p " switch back to last window
endfunction
let test#custom_strategies = {'custom': function('CustomStrategy')}
let test#strategy = "custom"
" let test#strategy = {
"   \ 'nearest': 'neoterm',
"   \ 'file':    'vimux',
" \}
nnoremap <Leader>ts  :w <bar> :TestNearest<CR>
nnoremap <Leader>tf  :w <bar> :TestFile<CR>
nnoremap <Leader>tl  :w <bar> :TestLast<CR>
nnoremap <Leader>tv  :w <bar> :TestVisit<CR>

let test#javascript#jest#file_pattern = '\v^.*spec\.(js|jsx|coffee)$'
let test#javasctipt#project_root = "client"
let test#javascript#jest#executable = "NODE_ENV=test TZ=UTC $(yarn bin)/jest path/to/my.spec.js"

