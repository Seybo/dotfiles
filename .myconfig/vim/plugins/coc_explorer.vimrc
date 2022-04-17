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
\   'vim': {
\     'root-uri': '~/.myconfig/vim/',
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'ftplugin': {
\     'root-uri': '~/.config/nvim/ftplugin/',
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }

nmap <silent><C-n><C-n> :CocCommand explorer --preset floatingTop<CR>
nmap <silent><C-n><C-m> :CocCommand explorer --preset myconfig<CR>
nmap <silent><C-n><C-v> :CocCommand explorer --preset vim<CR>
nmap <silent><C-n><C-f> :CocCommand explorer --preset ftplugin<CR>

autocmd FileType coc-explorer set winblend=5
autocmd FileType coc-explorer-border set winblend=5
