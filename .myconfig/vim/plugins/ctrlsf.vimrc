Plug 'dyng/ctrlsf.vim'

let g:ctrlsf_position = 'right'
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 5000
    \ }
let g:ctrlsf_auto_preview = 1

nnoremap <silent><leader>st :CtrlSFToggle<cr>
nmap     <silent><leader>sm <Plug>CtrlSFPrompt
nmap     <silent><leader>sw <Plug>CtrlSFCwordPath<cr>
vmap     <silent><leader>ss <Plug>CtrlSFVwordPath<cr>
" vmap <C-F><C-F> <Plug>CtrlSFVwordExec
" vmap <C-F><C-M> <Plug>CtrlSFVwordPath
" nmap <C-F>1 <Plug>CtrlSFPrompt "START: mikhail"<CR>
" nmap <C-F>2 <Plug>CtrlSFPrompt "TODO: mikhail"<CR>
" nmap <C-F>3 <Plug>CtrlSFPrompt "QUESTION: mikhail"<CR>
" nmap <C-F>4 <Plug>CtrlSFPrompt "TMP_COMMENT: mikhail"<CR>
" nmap <C-F>5 <Plug>CtrlSFPrompt ": mikhail"<CR>
" nmap <C-F>6 <Plug>CtrlSFPrompt ".    "<CR>
" nmap <C-F>8 <Plug>CtrlSFPrompt "binding.pry"<CR>
" nmap <C-F>9 <Plug>CtrlSFPrompt "debugger"<CR>
" nmap <C-F>0 <Plug>CtrlSFPrompt "console.log("<CR>
