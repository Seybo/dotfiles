Plug 'jeetsukumaran/vim-buffergator'
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1 " dont use default mappings
let g:buffergator_vsplit_size = 120
let g:buffergator_display_regime = "basename"
nnoremap <silent><C-l><C-l> :BuffergatorToggle<cr>
nnoremap <silent><A-i>      :BuffergatorMruCycleNext<cr>
nnoremap <silent><A-o>      :BuffergatorMruCyclePrev<cr>
"two recent buffers toggle
nnoremap <silent><A-u>      :b#<CR>

"===== HELP =====
" mappings
" cd - cycle through the view modes
