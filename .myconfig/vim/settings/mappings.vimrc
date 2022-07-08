" return to normal mode
inoremap jk <Esc>
inoremap <C-д> <Esc>
inoremap <C-х> <Esc>
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>

nnoremap <silent><leader>fov :e ~/.myconfig/vim/plugins/_plugins.vimrc<cr>
nnoremap <silent><leader>fot :e ./_mydev/temp.md<cr>
nnoremap <silent><leader>fom :e ./_mydev/marks.md<cr>
nnoremap <silent><Leader>vs :source ~/.myconfig/vim/init_new.vim<cr>
nnoremap <silent><Leader>vpi :PlugInstall<cr>
nnoremap <silent><Leader>vpu :PlugUpdate<cr>

" buffers
" implemented by buffers management plugin because it works on MRU buffers
" nnoremap <silent><a-i> :bp<cr>
" nnoremap <silent><a-o> :bn<cr>
" save
nnoremap <silent><Leader>w :w<cr>
function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction
nnoremap <leader>bde :call DeleteEmptyBuffers()<cr>

function! DeleteTerminalBuffers()
    let [i, n; terminal] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && match(bufname(i), 'term') != -1
            call add(terminal, i)
        endif
        let i += 1
    endwhile
    if len(terminal) > 0
        exe 'bdelete' join(terminal)
    endif
endfunction
nnoremap <leader>bdt :call DeleteTerminalBuffers()<cr>

function! DeleteInactiveBuffers()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nDeletes = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bdelete' i
            let nDeletes = nDeletes + 1
        endif
    endfor
    echomsg nDeletes . ' buffer(s) deleted'
endfunction
nnoremap <leader>bdi :call DeleteInactiveBuffers() \| call DeleteEmptyBuffers()<cr>

" close is managed by bufkill in order to not to close tabs with buffers
" nnoremap <silent><Leader>q :bd<cr>
" list
nnoremap <leader>bl :ls<cr>:b *
" jump between two recent
nnoremap <silent><a-u> :b#<cr>

" quit vim
nnoremap Q :qa!<cr>

" Copy & paste to system clipboard
" if not used set clipboard=unnamedplus
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
" coc-yank
" nnoremap <silent> <leader>0  :<C-u>CocList -A --normal yank<cr>
nmap <silent><leader>y :<C-u>CocList yank<cr>
nmap <Leader>p "+p
nmap <Leader>P o<ESC>"+p
" Copy & paste to custom register
vmap Yz "zy
nmap Yz "zP

" moving lines
nnoremap <A-j> :m .+1<cr>==
nnoremap <A-k> :m .-2<cr>==
" inoremap <A-j> <Esc>:m .+1<cr>==gi
" inoremap <A-k> <Esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

" adding empty lines
nnoremap <C-j> :set paste<cr>m`o<Esc>``:set nopaste<cr>
nnoremap <C-k> :set paste<cr>m`O<Esc>``:set nopaste<cr>

" Indentation
noremap <A-l> >>
noremap <A-h> <<
vnoremap <A-l> >gv
vnoremap <A-h> <gv

" Splits
" map <leader>wq :wincmd q<cr> " close window
noremap  so :only <cr> " leave only current window
noremap  sq :close<cr>
noremap  sx :BD!<cr> " completely delete the buffer as well
noremap  sh <C-w>h " switch to left window
noremap  sl <C-w>l " switch to right window
noremap  sj <C-w>j " switch to down window
noremap  sk <C-w>k " switch to up window
noremap  st <c-w><c-w> " switch between last
noremap  sp :sp<cr> " split horizontal
noremap  sv :vsp<cr> " split vertical
" tnoremap <leader>sh <C-\><C-N><C-w>h
" tnoremap <leader>sj <C-\><C-N><C-w>j
" tnoremap <leader>sk <C-\><C-N><C-w>k
" tnoremap <leader>sl <C-\><C-N><C-w>l


" maximize windows
" noremap <leader>wmj <C-w>j<C-w>_<cr>
" noremap <leader>wml <C-w>l<C-w>_<cr>
" noremap <leader>wmj <C-w>j<C-w>_<cr>
" noremap <leader>wmk <C-w>k<C-w>_<cr>
" noremap <leader>wmd <C-w>=<cr>

" resizing
nmap <right> :10wincmd ><cr>
nmap <left>  :10wincmd <<cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>

" move vertically by visual line with j and k
nnoremap j gj
nnoremap k gk

" select all
nnoremap <leader>aa ggVG<cr>

" replace word under cursor
nnoremap <leader>rw :%s/<C-r><C-w>/
vnoremap <leader>rw y:%s/

" copy filename
" full path
map <silent><leader>fpf :let @+ = expand("%:p")<cr>
" relative path
map <silent><leader>fpr :let @+ = expand("%")<cr>
" just filename
map <silent><leader>fpp :let @+ = expand("%:t")<cr>

" remove all the search highlights on press enter
nnoremap <cr> :noh<cr><cr>
nnoremap <A-t> :b#<cr>

" refresh/revert file's unsaved changes
nnoremap <silent> <Leader>fr :e!<cr>

" copy-paste visual selection
vmap <silent><leader>. :t'><cr>

" replace
map <leader>rr :%s/

" save/load view (folds, etc)
map <S-F2> :mkview<cr>
map <S-F3> :loadview<cr>

" copy/paste from retigster
" map <silent><leader>y "kyy
" map <silent><leader>p "kp
" map <silent><leader>d "kd

nnoremap <silent><leader>ll i <Esc>

" set foldmethod for markdown files for example
nmap <leader>fi :setlocal foldmethod=indent<cr>
nmap <leader>fe :setlocal foldmethod=expr<cr>

" search by filename the word under cursor
nmap <Leader>fq viw<Leader>y :CocCommand fzf-preview.ProjectFiles<cr>

" tabs
nnoremap to :tab new<cr>
nnoremap tx :tab close<cr>
nnoremap tp :tabp<cr>
nnoremap tn :tabn<cr>
nnoremap tl :tabl<cr>
nnoremap ta 1gt
nnoremap ts 2gt
nnoremap td 3gt
nnoremap tf 4gt
nnoremap th 5gt

" terminal
nnoremap tt :term<cr>
tnoremap jk <C-\><C-n>

" spell languages
nnoremap <silent><leader>le :set spelllang=en_us<cr>
nnoremap <silent><leader>lr :set spelllang=ru_yo<cr>
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction
nnoremap <silent><leader>lc :call ToggleSpellCheck()<CR>

" line numbers
nnoremap <leader>lna :set nornu<cr>
nnoremap <leader>lnr :set rnu<cr>
