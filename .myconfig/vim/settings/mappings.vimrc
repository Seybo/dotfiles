" return to normal mode
inoremap jk <Esc>
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
" inoremap ол <Esc>

nnoremap <silent><leader>vv :e ~/.myconfig/vim/init_new.vim<CR>
nnoremap <silent><leader>fot :e ./_mydev/temp.md<CR>
nnoremap <silent><leader>fom :e ./_mydev/marks.md<CR>
nnoremap <silent><Leader>vs :source ~/.myconfig/vim/init_new.vim<CR>
nnoremap <silent><Leader>vpi :PlugInstall<CR>
nnoremap <silent><Leader>vpu :PlugUpdate<CR>

" buffers
" implemented by buffers management plugin because it works on MRU buffers
" nnoremap <silent><a-i> :bp<CR>
" nnoremap <silent><a-o> :bn<CR>
" save
nnoremap <silent><Leader>w :w<CR>
" close
nnoremap <silent><Leader>q :bd<CR>
" list
nnoremap <leader>bl :ls<CR>:b *
" jump between two recent
nnoremap <silent><a-u> :b#<CR>

" quit vim
nnoremap Q :qa<CR>

" Copy & paste to system clipboard
" if not used set clipboard=unnamedplus
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
nmap <Leader>p "+p
nmap <Leader>P o<Esc>"+p

" moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" adding empty lines
nnoremap <C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Indentation
noremap <A-l> >>
noremap <A-h> <<
vnoremap <A-l> >gv
vnoremap <A-h> <gv

" Windows
" map <leader>wq :wincmd q<cr> " close window
map <leader>wo :only <cr> " leave only current window
noremap <leader>wh <C-w>h " switch to left window
noremap <leader>wl <C-w>l " switch to right window
noremap <leader>wj <C-w>j " switch to down window
noremap <leader>wk <C-w>k " switch to up window
noremap <leader>ww <c-w><c-w> " switch between last
tnoremap <leader>wh <C-\><C-N><C-w>h
tnoremap <leader>wj <C-\><C-N><C-w>j
tnoremap <leader>wk <C-\><C-N><C-w>k
tnoremap <leader>wl <C-\><C-N><C-w>l

" maximize windows
noremap <leader>wmj <C-w>j<C-w>_<CR>
noremap <leader>wml <C-w>l<C-w>_<CR>
noremap <leader>wmj <C-w>j<C-w>_<CR>
noremap <leader>wmk <C-w>k<C-w>_<CR>
noremap <leader>wmd <C-w>=<CR>

" resizing
map <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd -<cr>
nmap <down>  :3wincmd +<cr>

" move vertically by visual line with j and k
nnoremap j gj
nnoremap k gk

" duplicate selected block
vmap <C-p> y'>p

" select all
nnoremap <leader>aa ggVG<CR>

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
" nnoremap <silent> <CR> :nohlsearch<CR><CR>|
nnoremap <CR> :noh<CR><CR>
nnoremap <A-y> :b#<CR>

" refresh file
nnoremap <silent> <Leader>rf :e!<CR>

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

nnoremap <silent><leader>l i <Esc>

" set foldmethod for markdown files for example
nmap <leader>fi :setlocal foldmethod=indent<cr>
nmap <leader>fe :setlocal foldmethod=expr<cr>

" search by filename the word under cursor
nmap <Leader>fq viw<Leader>y :CocCommand fzf-preview.ProjectFiles<cr>

" mapping for coc-yank
" nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>

" tabs
nnoremap <leader>tn :tab new<CR>
nnoremap <C-p> <C-o>
nnoremap <silent><C-i> :tabp<CR>
nnoremap <silent><C-o> :tabn<CR>

" terminal
" create a new terminal tab
" tnoremap <Leader>tt <C-\><C-n>:tab new<CR>:term<CR>
" noremap  <Leader>tt :tab new<CR>:term<CR>
" tnoremap jk <C-\><C-n>
