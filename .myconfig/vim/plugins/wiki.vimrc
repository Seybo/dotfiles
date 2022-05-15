Plug 'vimwiki/vimwiki'

nmap <Leader>vww <Plug>VimwikiUISelect
nmap <Leader>vwi <Plug>VimwikiIndex

let dev = {}
let dev.path = '~/Dropbox/Documents/wiki/dev/'
let dev.syntax = 'markdown'
let dev.ext = '.md'
let ubuntu = {}
let ubuntu.path = '~/Dropbox/Documents/wiki/ubuntu/'
let ubuntu.syntax = 'markdown'
let ubuntu.ext = '.md'
let nvim = {}
let nvim.path = '~/Dropbox/Documents/wiki/nvim/'
let nvim.syntax = 'markdown'
let nvim.ext = '.md'
let design = {}
let design.path = '~/Dropbox/Documents/wiki/design/'
let design.syntax = 'markdown'
let design.ext = '.md'
let other = {}
let other.path = '~/Dropbox/Documents/wiki/other/'
let other.syntax = 'markdown'
let other.ext = '.md'
let c19 = {}
let c19.path = '~/Dropbox/Documents/wiki/c19/'
let c19.syntax = 'markdown'
let c19.ext = '.md'

let g:vimwiki_list = [dev, ubuntu, nvim, design, other, c19]
