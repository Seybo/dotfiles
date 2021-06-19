let mapleader = "\<Space>"
syntax enable                                " enable syntax highlighting
set nocompatible                             " we're running Vim, not Vi!
set hidden                                   " disable not saved changes warning
" set nowrap                                   " disable wrapping long lines
set mouse=a                                  " enable mouse
" set cursorline                               " highlight current line
" filetype on           " enable filetype detection
" filetype indent on    " enable filetype-specific indenting
" filetype plugin on    " enable filetype-specific plugins
" set encoding=utf-8
set number relativenumber

" indentation settings
" set autoindent
set expandtab
" set softtabstop=2
set shiftwidth=2

" stop swap files
set nobackup
set nowritebackup
set noswapfile

" use system clipboard
" set clipboard=unnamedplus

" folding
set foldlevelstart=99
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=0 "remove folding indication col at window left
" adds some lagging to buffers change
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END

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
" set keymap=russian-jcukenwin
" set iminsert=0
" set imsearch=0
" highlight lCursor guifg=NONE guibg=Cyan
" setlocal spell spelllang=ru_yo,en_us
