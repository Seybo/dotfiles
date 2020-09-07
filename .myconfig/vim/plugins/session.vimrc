Plug 'xolox/vim-session'

Plug 'xolox/vim-misc'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_default_name = fnamemodify(getcwd(), ':t')
map <F2> :SaveSession
map <F3> :OpenSession<CR>
map <S-F3> :OpenSession!
map <F4> :DeleteSession
