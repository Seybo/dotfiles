Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
let g:neosnippet#snippets_directory = "~/.myconfig/vim/snippets/"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <C-l>     <Plug>(neosnippet_expand_or_jump)<esc>
map <F6> :NeoSnippetEdit<CR>
