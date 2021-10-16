Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'

" let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=50
let NERDTreeMapMenu='f'
let NERDTreeDirArrowExpandable = '~'
let NERDTreeDirArrowCollapsible = '~'
let NERDTreeShowHidden=1

" map <C-n><C-n> :NERDTreeToggle<CR>
map <C-n><C-t> :NERDTreeToggle<CR>
map <C-n><C-f> :NERDTreeFind %<CR>
map <C-n><C-h> :NERDTree /home/glaux<CR>
map <C-n><C-m> :NERDTree /home/glaux/.myconfig<CR>
map <leader>vc :NERDTree /home/glaux/.myconfig/vim<CR>
" let NERDTreeMinimalUI = 1
" let NERDTreeIgnore = []
" let NERDTreeStatusline = ''
