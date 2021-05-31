Plug 'jeetsukumaran/vim-buffergator'
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1 " dont use default mappings
let g:buffergator_vsplit_size = 120
let g:buffergator_display_regime = "basename"
" nnoremap <silent><C-l><C-b> :BuffergatorToggle<cr>
nnoremap <silent><A-i>      :BuffergatorMruCyclePrev<cr>
nnoremap <silent><A-o>      :BuffergatorMruCycleNext<cr>

"===== HELP =====
" mappings
" cd - cycle through the view modes
