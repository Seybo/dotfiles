" nmap <C-n><C-n> :CocCommand explorer --toggle --sources=buffer+,file+<CR>

let g:coc_explorer_global_presets = {
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'myconfig': {
\     'root-uri': '~/.myconfig',
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }

nmap <silent><C-n><C-n> :CocCommand explorer --preset floatingTop<CR>
nmap <silent><C-n><C-m> :CocCommand explorer --preset myconfig<CR>
" nmap <C-n><C-f> :CocCommand explorer --toggle getcwd()<CR>
" nmap <space>el :CocList explPresets
" floating window bg color
" hi CocExplorerNormalFloat guibg=#ff0000 
autocmd FileType coc-explorer set winblend=5
autocmd FileType coc-explorer-border set winblend=5
