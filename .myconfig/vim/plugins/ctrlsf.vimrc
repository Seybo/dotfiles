Plug 'dyng/ctrlsf.vim'

let g:ctrlsf_position = 'right'
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 5000
    \ }
let g:ctrlsf_auto_preview = 1

nnoremap <silent><leader>st :CtrlSFToggle<cr>
nmap     <silent><leader>sm :CtrlSF -W -S
nmap     <silent><leader>sr :CtrlSF -R
nmap     <silent><leader>sw <Plug>CtrlSFCwordPath
vmap     <silent><leader>ss <Plug>CtrlSFVwordPath
" vmap <C-F><C-F> <Plug>CtrlSFVwordExec
" vmap <C-F><C-M> <Plug>CtrlSFVwordPath
nmap <silent><leader>s1 <Plug>CtrlSFPrompt "START: mikhail"<CR>
nmap <silent><leader>s2 <Plug>CtrlSFPrompt "TODO: mikhail"<CR>
nmap <silent><leader>s3 <Plug>CtrlSFPrompt "QUESTION: mikhail"<CR>
nmap <silent><leader>s4 <Plug>CtrlSFPrompt "TMP_COMMENT: mikhail"<CR>
nmap <silent><leader>s5 <Plug>CtrlSFPrompt ": mikhail"<CR>
nmap <silent><leader>s6 <Plug>CtrlSFPrompt ".    "<CR>
nmap <silent><leader>s8 <Plug>CtrlSFPrompt "binding.pry"<CR>
nmap <silent><leader>s9 <Plug>CtrlSFPrompt "debugger"<CR>
nmap <silent><leader>s0 <Plug>CtrlSFPrompt "console.log("<CR>
