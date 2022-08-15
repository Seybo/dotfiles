Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
source /usr/share/doc/fzf/examples/fzf.vim
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

" fzf-preview installed into coc
nmap <Leader>ff :CocCommand fzf-preview.ProjectFiles<cr>
nmap <Leader>fd :FzfPreviewFromResources directory<cr>
nmap <Leader>fr :CocCommand fzf-preview.ProjectMruFiles<cr>
vmap <Leader>fs \"sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
vmap <Leader>fs "sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(@s, '\n', '', 'g')<cr>"<cr>
nmap <Leader>fs viw"sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
map  <Leader>fm :CocCommand fzf-preview.ProjectGrep
nmap <Leader>fc :CocCommand fzf-preview.Changes<cr>
nmap <Leader>ga :CocCommand fzf-preview.GitActions<cr>
nmap <Leader>gs :CocCommand fzf-preview.GitStatus<cr>
" search by filename the word under cursor
nmap <Leader>fq viw<Leader>y :CocCommand fzf-preview.ProjectFiles<cr>

