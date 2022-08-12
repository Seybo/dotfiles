Plug 'neoclide/coc.nvim', {'branch': 'release'}
" if hidden is not set, TextEdit might fail.
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" plugins that we add to g:cocglobalextensions will be automatically installed and updated
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-solargraph'
  \ ]

" use <alt-h> for trigger completion
inoremap <silent><expr> <a-h> coc#refresh()
" navigate the list
inoremap <expr> <a-j> pumvisible() ? "\<C-n>" : "\<a-j>"
inoremap <expr> <a-k> pumvisible() ? "\<C-p>" : "\<a-k>"
" select the current item
inoremap <expr> <a-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<a-l>"

" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif
" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif

" Remap keys for gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent><Leader>com <Plug>(coc-rename)
nmap <silent><Leader>coa <Plug>(coc-codeaction)
nmap <silent><Leader>coc :CocConfig<CR>
nmap <silent><Leader>col :CocLocalConfig<CR>
nmap <silent><Leader>cog :CocOpenLog<CR>
nmap <silent><Leader>coi :CocInfo<CR>
nmap <silent><Leader>cor :CocRestart<CR>
nmap <silent><Leader>coe :CocList extensions<CR>
nmap <silent><Leader>cod :CocDisable<CR>
nmap <silent><Leader>coh :call CocAction('doHover')<CR>

nnoremap <leader>cof :call CocAction('format')<CR>

" coc-yank
nmap <silent><leader>y :<C-u>CocList yank<cr>

autocmd! BufWritePre *.jsx :call CocAction('format')
