" ================ Global Settings ========================
let mapleader = "\<Space>"
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set encoding=utf-8
set number relativenumber
set hidden            " to disable not saved changes warning
set mouse=a

" indentation settings
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

" stop swap files
set nobackup
set nowritebackup
set noswapfile

" =============== Plugin Initialization ===============
" This loads all the plugins specified in ~/.vim/plugins/_plugins.vim
source ~/.myconfig/vim/plugins/_plugins.vim

" ================ Custom Settings ========================
" This loads all the settings specified in ~/.vim/settings.vim
source ~/.myconfig/vim/settings.vim

