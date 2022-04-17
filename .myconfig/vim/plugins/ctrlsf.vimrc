Plug 'dyng/ctrlsf.vim'

let g:ctrlsf_position = 'right'
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 5000
    \ }
" let g:ctrlsf_auto_preview = 1

nnoremap <silent><leader>st :CtrlSFToggle<cr>
nmap     <silent><leader>sm :CtrlSF -W
nmap     <silent><leader>sr :CtrlSF -R
nmap     <silent><leader>sw <Plug>CtrlSFCwordPath<cr>
vmap     <silent><leader>ss <Plug>CtrlSFVwordPath<cr>
" vmap <C-F><C-F> <Plug>CtrlSFVwordExec
" vmap <C-F><C-M> <Plug>CtrlSFVwordPath
nmap <silent><leader>s1 <Plug>CtrlSFPrompt "START: mikhail"<cr>
nmap <silent><leader>s2 <Plug>CtrlSFPrompt "TODO: mikhail"<cr>
nmap <silent><leader>s3 <Plug>CtrlSFPrompt "QUESTION: mikhail"<cr>
nmap <silent><leader>s4 <Plug>CtrlSFPrompt "TMP_COMMENT: mikhail"<cr>
nmap <silent><leader>s5 <Plug>CtrlSFPrompt ": mikhail"<cr>
nmap <silent><leader>s6 <Plug>CtrlSFPrompt ".    "<cr>
nmap <silent><leader>s8 <Plug>CtrlSFPrompt "binding.pry"<cr>
nmap <silent><leader>s9 <Plug>CtrlSFPrompt "debugger; // eslint-disable-line TODO: mikhail"<cr>
nmap <silent><leader>s0 <Plug>CtrlSFPrompt "console.log("<cr>

" Default bindings
" Enter, o, double-click - Open corresponding file of current line in the window which CtrlSF is launched from.
" <C-O> - Like Enter but open file in a horizontal split window.
" t - Like Enter but open file in a new tab.
" p - Like Enter but open file in a preview window.
" P - Like Enter but open file in a preview window and switch focus to it.
" O - Like Enter but always leave CtrlSF window opening.
" T - Like t but focus CtrlSF window instead of new opened tab.
" M - Switch result window between normal view and compact view.
" q - Quit CtrlSF window.
" <C-J> - Move cursor to next match.
" <C-K> - Move cursor to previous match.
" <C-C> - Stop a background searching process.
