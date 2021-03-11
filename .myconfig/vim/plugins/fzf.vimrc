Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

" fzf-preview installed into coc
let g:fzf_preview_directory_files_command = 'fd --type f --hidden --follow'
let g:fzf_preview_filelist_command = 'fd --type f --hidden --follow'
" atm it is messing up buffers order so using buffergator mostly
" nmap <C-l><C-l> :FzfPreviewBuffers<cr>
nmap <C-l><C-l> :CocCommand fzf-preview.Buffers<cr>
" nmap <Leader>ff :FzfPreviewProjectFiles<cr>
nmap <Leader>ff :CocCommand fzf-preview.ProjectFiles<cr>
" nmap <Leader>fd :FzfPreviewFromResources directory<cr>
nmap <Leader>fd :FzfPreviewFromResources directory<cr>
" nmap <Leader>fl :FzfPreviewMruFiles<cr>
nmap <Leader>fl :CocCommand fzf-preview.ProjectMruFiles<cr>
" vmap <Leader>fs \"sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
vmap <Leader>fs "sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
" nmap <Leader>fw viw"sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
nmap <Leader>fs viw"sy:CocCommand fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
" map  <Leader>fm :FzfPreviewProjectGrep
map  <Leader>fm :CocCommand fzf-preview.ProjectGrep
" nmap <Leader>fc :FzfPreviewChanges<cr>
nmap <Leader>fc :CocCommand fzf-preview.Changes<cr>
" nmap <Leader>ga :FzfPreviewGitActions<cr>
nmap <Leader>ga :CocCommand fzf-preview.GitActions<cr>
" nmap <Leader>gs :FzfPreviewGitStatus<cr>
nmap <Leader>gs :CocCommand fzf-preview.GitStatus<cr>
