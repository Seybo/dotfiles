Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

let g:fzf_preview_directory_files_command = 'fd --type f --hidden --follow'
let g:fzf_preview_filelist_command = 'fd --type f --hidden --follow'
" atm it is messing up buffers order so using buffergator mostly
nmap <C-l><C-l> :FzfPreviewBuffers<cr>
nmap <Leader>ff :FzfPreviewProjectFiles<cr>
nmap <Leader>fd :FzfPreviewFromResources directory<cr>
nmap <Leader>fl :FzfPreviewMruFiles<cr>
vmap <Leader>fs "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
nmap <Leader>fw viw"sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
map  <Leader>fm :FzfPreviewProjectGrep
nmap <Leader>fc :FzfPreviewChanges<cr>
nmap <Leader>ga :FzfPreviewGitActions<cr>
nmap <Leader>gs :FzfPreviewGitStatus<cr>
