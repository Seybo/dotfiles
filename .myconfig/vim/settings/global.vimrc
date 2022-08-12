let mapleader = "\<Space>"
syntax off                                " enable syntax highlighting
set nocompatible                             " we're running Vim, not Vi!
set hidden                                   " disable not saved changes warning
set mouse=a                                  " enable mouse
set number relativenumber

" indentation settings
set expandtab
set softtabstop=2
set shiftwidth=2

" stop swap files
set nobackup
set nowritebackup
set noswapfile

" folding
set foldlevelstart=99
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=0 "remove folding indication col at window left

" keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/undodir > /dev/null 2>&1
  set undodir=~/.config/nvim/undodir
  set undofile
endif

" now we can pass <C-h> to mappings as a tab
set wildcharm=<C-h>

" testing
set autowrite
set updatetime=100

" disable Ex mode
map Q <Nop>

" russian mapping
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" TESTING
set switchbuf=useopen,usetab
" this will focus the tab with the already opened file under cursor
nnoremap go :sb <C-r>=expand('<cfile>')<CR><CR>

" SPELLCHECK
set spellcapcheck=
au BufReadPost,BufNewFile * set spelllang=en_us
au BufReadPost,BufNewFile *_ru.md set spelllang=ru_yo

" fix for occasionally occurring error: 'pattern uses more memory than maxmempattern'
set mmp=2000000

" disable WARNING: "Neovim::Ext" cpan module is not installed
let g:loaded_perl_provider = 0
