" return to normal mode
inoremap jk <Esc>
inoremap <C-l> <Esc>
vnoremap <C-l> <Esc>
inoremap <C-л> <Esc>
inoremap ол <Esc>

nnoremap <silent><leader>vv :e ~/.myconfig/vim/init_new.vim<CR>
nnoremap <silent><Leader>vs :source ~/.myconfig/vim/init_new.vim<CR>
nnoremap <silent><Leader>vpi :PlugInstall<CR>
nnoremap <silent><Leader>vpu :PlugUpdate<CR>

" save current buffer
nnoremap <silent><Leader>w :w<CR>
" close current buffer
nnoremap <silent><Leader>q :bd<CR>
" quit vim
nnoremap Q :quit<CR>

" Copy & paste to system clipboard
" if not used set clipboard=unnamedplus
" vmap <Leader>y "+y
" vmap <Leader>dd "+d
" vmap <Leader>p "+p
" nmap <Leader>p "+p
" nmap <Leader>p <C-j>j"+p
" nmap <Leader>P "+P

" moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
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
noremap <leader>wh <C-w>h " move to left window
noremap <leader>wl <C-w>l " move to right window
noremap <leader>wj <C-w>j " move to down window
noremap <leader>wk <C-w>k " move to up window
noremap <leader>ww <c-w><c-w> " swith between last

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

" buffers
nnoremap <silent><A-i> :bn<cr>
nnoremap <silent><A-o> :bp<cr>
nnoremap <silent><A-u> :b#<CR>

" copy-paste visual selection
map <silent><leader>d :t'><cr>
