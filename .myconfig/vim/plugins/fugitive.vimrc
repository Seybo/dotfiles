Plug 'tpope/vim-rhubarb' " needed for fugitive code on gh open
Plug 'tpope/vim-fugitive'
nnoremap <leader>gt   :tab new<cr>:Git<cr><C-w>j:q<CR>
nnoremap <leader>gm   :GRename
nnoremap <leader>ge   :Gedit
" nnoremap <leader>gr   :Gread<cr>
" nnoremap <leader>gw   :Gwrite<cr>
nnoremap <leader>gbl  :Git blame<cr>
" next get/put ones has nothing to do with the plugin but put here for consistency
" nnoremap <leader>gdp  :diffput<cr>
" nnoremap <leader>gdg  :diffget<cr>
" nmap <leader>ggl    :diffget //2<cr>
" nmap <leader>ggr    :diffget //3<cr>
" nnoremap <leader>gdu  :diffupdate<cr>
" nnoremap <leader>gdv  :Gvdiff<cr>
" nnoremap <leader>gds  :Gdiffsplit<cr>
nnoremap <leader>gbb  :GBrowse<cr>
vnoremap <leader>gbb  :GBrowse<cr>
nnoremap <leader>gbo  :GBrowse origin:%<cr>
vnoremap <leader>gbo  :GBrowse origin:%<cr>

" A git commit browser requires fugitive
Plug 'junegunn/gv.vim'

" HELP
" < and > - fold/unfold diffs for the selected file. If done on HEAD works for all the files
