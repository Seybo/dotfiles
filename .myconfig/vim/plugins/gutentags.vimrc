Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_ctags_executable='/usr/bin/ctags'
let g:gutentags_file_list_command = 'rg --files' " exclude gitignore
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "*.bs.js", "build", "vendor", "log", ".git", "tmp", "public", "node_modules"]
