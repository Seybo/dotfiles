inoremap jk <Esc>
nnoremap <silent><Leader>w :w<cr>

nnoremap <silent><leader>fov :e ~/.myconfig/vim/plugins/_plugins.vimrc<cr>
nnoremap <silent><leader>fot :e ./_mydev/temp.md<cr>
nnoremap <silent><leader>fom :e ./_mydev/marks.md<cr>
nnoremap <silent><Leader>vs :source ~/.myconfig/vim/init.vim<cr>
nnoremap <silent><Leader>vpi :PlugInstall<cr>
nnoremap <silent><Leader>vpu :PlugUpdate<cr>

" quit vim
nnoremap Q :qa!<cr>

" Copy & paste to system clipboard
" if not used set clipboard=unnamedplus
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p

" moving lines
nnoremap <silent><A-j> :m .+1<cr>==
nnoremap <silent><A-k> :m .-2<cr>==
vnoremap <silent><A-j> :m '>+1<cr>gv=gv
vnoremap <silent><A-k> :m '<-2<cr>gv=gv

" Indentation
noremap <A-l> >>
noremap <A-h> <<
vnoremap <A-l> >gv
vnoremap <A-h> <gv

" move vertically by visual line with j and k
nnoremap j gj
nnoremap k gk

" select all
nnoremap <leader>aa ggVG<cr>

" remove all the search highlights on press enter
nnoremap <cr> :noh<cr><cr>
nnoremap <A-t> :b#<cr>

" refresh/revert file's unsaved changes
nnoremap <silent><Leader>fr :e!<cr>

" copy-paste visual selection
vmap <silent><leader>. :t'><cr>

" add space
nnoremap <silent><leader>ll i <Esc>

" replace text
map <silent><leader>rr :%s/

" terminal
nnoremap <silent>tt :term<cr>
tnoremap <silent>jk <C-\><C-n>

" line numbers
nnoremap <silent><leader>lna :set nornu<cr>
nnoremap <silent><leader>lnr :set rnu<cr>

" syntax on (because its off for big files by default)
map <silent><leader>sh :syntax on<cr>

" tabs
nnoremap <silent>to :tab new<cr>
nnoremap <silent>tx :tab close<cr>
nnoremap <silent>tp :tabp<cr>
nnoremap <silent>tn :tabn<cr>
nnoremap <silent>tl :tabl<cr>
nnoremap <silent>ta 1gt
nnoremap <silent>ts 2gt
nnoremap <silent>td 3gt
nnoremap <silent>tf 4gt
nnoremap <silent>th 5gt

" close buffer (but don't close window)
" atm bufkill plugin does it
" nnoremap <silent>qq :bp<bar>sp<bar>bn<bar>bd<cr>
" list buffers
nnoremap <silent><leader>bl :ls<cr>:b *
" jump between two recent buffers
nnoremap <silent><a-u> :b#<cr>
" close window
nnoremap <silent>qw :q<CR>

" TODO: move
" coc-yank
" nmap <silent><leader>y :<C-u>CocList yank<cr>
nmap <Leader>p "+p
nmap <Leader>P o<ESC>"+p

" Copy & paste to custom register
vmap Yz "zy
nmap Yz "zP

" adding empty lines
nnoremap <C-j> :set paste<cr>m`o<Esc>``:set nopaste<cr>
nnoremap <C-k> :set paste<cr>m`O<Esc>``:set nopaste<cr>

" Splits
" map <leader>wq :wincmd q<cr> " close window
" leave only current window
noremap <silent>so :only <cr> 
noremap <silent>sq :close<cr>
" completely delete the buffer as well
noremap <silent>sx :BD!<cr>
" switch to left window
noremap <silent>sh <c-w>h
" switch to right window
noremap <silent>sl <c-w>l
" switch to down window
noremap <silent>sj <c-w>j
" switch to up window
noremap <silent>sk <c-w>k
" switch between last
noremap <silent>st <c-w><c-w>
" maximize current window
noremap <silent>smm <c-w>_  
" maximize bottom window
noremap <silent>smj <c-w>j<c-w>_  
" maximize up window
noremap <silent>smk <c-w>k<c-w>_  
" revert maximize (d - default)
noremap <silent>sd <c-w>=  
" rotate splits
noremap <silent>sr <c-w>r
" split horizontal
noremap <silent>sp :sp<cr> 
" split vertical
noremap <silent>sv :vsp<cr> 
" change horizontal splits to vertical
noremap <silent>sH <c-w>H 
" change vertical splits to horizontal
noremap <silent>sK <c-w>K

" resizing
nmap <silent><right> :10wincmd ><cr>
nmap <silent><left>  :10wincmd <<cr>
nmap <silent><up>    :3wincmd +<cr>
nmap <silent><down>  :3wincmd -<cr>

" move vertically by visual line with j and k
nnoremap j gj
nnoremap k gk

" select all
nnoremap <leader>aa ggVG<cr>
" select last pasted text
nnoremap gp `[v`]

" replace word under cursor
nnoremap <leader>rw :%s/<C-r><C-w>/
" replace selection
vnoremap <leader>rw "sy:%s/<C-r>=substitute(@s, '\n', '', 'g')<cr>/

" searching
" it is very often to jump between _
nmap su f_l
nmap Su F_
nmap cu ct_
nmap c2u c2t_
nmap c3u c3t_
nmap vu vt_
nmap v2u v2t_
nmap v3u v3t_
" and between brackets. Let's try using the opening squere one as the (
nmap s[ f(
nmap S[ F(
nmap vi[ vi(
nmap ci[ ci(
nmap di[ di(
" and between spaces
nmap s<space> ft 
nmap s2<space> f2t 
nmap s3<space> f3t 
nmap c<space> ct 
nmap c2<space> c2t 
nmap c3<space> c3t 
nmap v<space> vt 
nmap v2<space> v2t 
nmap v3<space> v3t 
nmap d<space> dt 
nmap d2<space> d2t 
nmap d3<space> d3t 

" copy filename
" full path
map <silent><leader>fpf :let @+ = expand("%:p")<cr>
" relative path
map <silent><leader>fpr :let @+ = expand("%")<cr>
" just filename
map <silent><leader>fpp :let @+ = expand("%:t")<cr>

" remove all the search highlights on press enter
nnoremap <cr> :noh<cr><cr>

" refresh/revert file's unsaved changes
nnoremap <silent> <Leader>fr :e!<cr>

" copy-paste visual selection
vmap <silent><leader>. :t'><cr>

" save/load view (folds, etc)
" map <S-F2> :mkview<cr>
" map <S-F3> :loadview<cr>

" set foldmethod for markdown files for example
nmap <leader>fi :setlocal foldmethod=indent<cr>
nmap <leader>fe :setlocal foldmethod=expr<cr>

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

" Map key to toggle opt
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)
" MapToggle <F7> something

" sometimes empty buffers are left and it's annoying
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

" sometimes terminal buffers are left and it's annoying
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

" sometimes you want to only leave the buffers currently opened in tabs
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
