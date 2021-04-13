Plug 'tpope/vim-rhubarb' " needed for fugitive code on gh open

Plug 'tpope/vim-fugitive'
nmap <leader>gs     :Gstatus<CR>
nmap <leader>gm     :Gmove
nmap <leader>gr     :Gread<CR>
nmap <leader>gw     :Gwrite<CR>
nmap <leader>gdh    :Gdiff<CR>
nmap <leader>gbl    :Git blame<CR>
nmap <leader>gdv    :Gvdiff<CR>
" next two has nothing to do with the plugin but put here for consistency
nmap <leader>ggl    :diffget //2<CR>
nmap <leader>ggr    :diffget //3<CR>
" nmap <leader>gp     :diffput
nmap <leader>gu     :diffupdate<CR>
nmap <leader>gbb    :Gbrowse<CR>
vmap <leader>gbb    :Gbrowse<CR>
nmap <leader>gbo    :Gbrowse origin:%<CR>
vmap <leader>gbo    :Gbrowse origin:%<CR>
