Plug 'mhinz/vim-startify'

let g:ascii = [
  \'                                                                  ',
  \'                                                                  ',
  \'                                                                  ',
  \'                                                                  ',
  \'                                                                  ',
  \'  _|      _|  _|_|_|_|    _|_|    _|      _|  _|_|_|  _|      _|  ',
  \'  _|_|    _|  _|        _|    _|  _|      _|    _|    _|_|  _|_|  ',
  \'  _|  _|  _|  _|_|_|    _|    _|  _|      _|    _|    _|  _|  _|  ',
  \'  _|    _|_|  _|        _|    _|    _|  _|      _|    _|      _|  ',
  \'  _|      _|  _|_|_|_|    _|_|        _|      _|_|_|  _|      _|  ',
  \'                                                                  ',
  \'                                                                  ',
  \'                                                                  ',
  \'                                                                  ',
  \'                                                                  ',
\]


let g:startify_custom_header =
          \ 'startify#center(g:ascii)'

let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ '^/tmp',
  \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
  \ 'bundle/.*/doc',
\ ]

function s:pluginInfo()
  return [
    \ { 'line': 'Install Plugins', 'cmd': ':PlugInstall'},
    \ { 'line': 'Upgrade Plugins', 'cmd': ':PlugUpdate' },
    \ { 'line': 'Clean Plugins'  , 'cmd': ':PlugClean' },
    \ { 'line': 'Status Plugins' , 'cmd': ':PlugStatus' },
  \ ]
endfunction

let g:startify_lists = [
  \ { 'type': 'sessions',                    'header': ["      \ue62e Sessions"]           },
  \ { 'type': 'dir',                         'header': ["      \ufa1e MRU in ". getcwd()]  },
  \ { 'type': 'files',                       'header': ["      \ufa1e Files"]              },
  \ { 'type': 'bookmarks',                   'header': ["      \uf5c2 Bookmarks"]          },
  \ { 'type': 'commands',                    'header': ["      \ufb32 Commands"]           },
  \ { 'type': function('s:pluginInfo'),      'header': ["      漣Plugin loaded " .len(get(g:, 'plugs', 0)).' '], 'indices': ['I','U','C','S'] },
\ ]

let g:startify_commands = [
  \ {'h': ['Check Vim health'       , ':checkhealth']},
  \ {'u': ['Update CoC Plugin'  , ':CocUpdate']},
  \ {'m': ['CoC Marketplace'        , ':CocList marketplace']},
\ ]

let g:startify_bookmarks = [
 \ {'v': '~/.myconfig/vim/init_new.vim'},
 \ {'t': '~/.myconfig/.tmux.conf.local'},
\ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_padding_left = 5
" let g:webdevicons_enable_startify = 1
let g:startify_enable_special = 1
let g:startify_files_number = 5
let g:startify_update_oldfiles = 1
let g:startify_change_to_dir = 1

hi! link StartifyHeader Function
hi! link StartifyFile Directory
hi! link StartifyPath LineNr
hi! link StartifySlash StartifyPath
hi! link StartifyBracket StartifyPath
hi! link StartifyNumber StartifyPath

" function! StartifyEntryFormat()
"   return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
" endfunction

let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1

" sessions management
let g:startify_session_dir = '~/.myconfig/vim/sessions/'
map <F2> :SSave! 
map <F3> :SLoad 
map <F4> :SDelete 

