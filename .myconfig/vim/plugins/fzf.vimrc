Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
" " remove filenames matching from Ag search results
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
" nmap <C-F><C-F> :Ag<cr>


" " :GFiles (shows preview window that i don't need)
" " map <leader>SOMETHING :call fzf#vim#gitfiles('', {'options': '--no-preview'})<cr>

" " :Files (shows preview window that i don't need)
" map <leader>ff :call fzf#vim#gitfiles('', {'options': '--no-preview'})<cr>

" " :Hist (shows preview window that i don't need)
" map <leader>fhh :call fzf#vim#history()<cr>
" map <leader>fhs :call fzf#vim#search_history()<cr>
" map <leader>fhc :call fzf#vim#command_history()<cr>

" map <leader>fcm :Commands<cr>
" map <leader>fm  :Marks<cr>
" map <leader>fca :Commits<cr>
" map <leader>fcb :BCommits<cr>

Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
let g:fzf_preview_directory_files_command = 'fd --type f --hidden --follow'
let g:fzf_preview_filelist_command = 'fd --type f --hidden --follow'
" atm it is messing up buffers order so using buffergator mostly
nmap <C-l><C-b> :FzfPreviewBuffers<cr> 
nmap <Leader>ff :FzfPreviewProjectFiles<cr>
nmap <Leader>fd :FzfPreviewFromResources directory<cr>
nmap <Leader>fl :FzfPreviewMruFiles<cr>
vmap <Leader>fs "sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
nmap <Leader>fw viw"sy:FzfPreviewProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<cr>"<cr>
map  <Leader>fm :FzfPreviewProjectGrep
nmap <Leader>fc :FzfPreviewChanges<cr>
nmap <Leader>ga :FzfPreviewGitActions<cr>
nmap <Leader>gs :FzfPreviewGitStatus<cr>
