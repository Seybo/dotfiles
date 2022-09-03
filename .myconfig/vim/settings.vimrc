" keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/undodir > /dev/null 2>&1
  set undodir=~/.config/nvim/undodir
  set undofile
endif

" disable Ex mode
map Q <Nop>

augroup neovim_terminal
  autocmd!
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
augroup END

""""""""""""""""""""""""""""""""""""
"""""""" Statusline Start """"""""""
""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=
set statusline+=%m
set statusline+=\ 
set statusline+=%{b:gitbranch}
" set statusline+=%{FugitiveStatusline()} 
set statusline+=%=
set statusline+=%y
set statusline+=·
set statusline+=%L

function! StatuslineGitBranch()
  let b:gitbranch=""
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="[".substitute(l:gitrevparse, '\n', '', 'g')."]"
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

""""""""""""""""""""""""""""""""""""
""""""""" Statusline End """""""""""
""""""""""""""""""""""""""""""""""""

" use relativenumber in visual mode
" au ModeChanged [vV\x16]*:* let &l:rnu = mode() =~# '^[vV\x16]'
" au ModeChanged *:[vV\x16]* let &l:rnu = mode() =~# '^[vV\x16]'
" au WinEnter,WinLeave * let &l:rnu = mode() =~# '^[vV\x16]'

" so gitgutter doesnt override line numbers
set signcolumn=yes

""""""""""""""""""""""""""""""""""""
""""""""""" Tabline Start """"""""""
""""""""""""""""""""""""""""""""""""

" show only filenames in tablen
set tabline=%!MyTabLine()

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T' 

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1 
    let s .= '%=%#TabLine#%999Xclose'
  endif

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label =  bufname(buflist[winnr - 1]) 
  return fnamemodify(label, ":t") 
endfunction

" same color as my white scheme
augroup TabColors
  autocmd!
  autocmd ColorScheme * hi TabLineFill guifg=gray99
  autocmd ColorScheme * hi TabLine guifg=gray99 guibg=gray10
  autocmd ColorScheme * hi TabLineSel guibg=MediumTurquoise guifg=gray99
augroup END

""""""""""""""""""""""""""""""""""""
""""""""""" Tabline End """"""""""""
""""""""""""""""""""""""""""""""""""

let g:ruby_host_prog = '~/.rbenv/versions/2.7.5/bin/neovim-ruby-host'
let g:python3_host_prog = '/usr/bin/python3'
" python 3 should be enough
" let g:python_host_prog = '/usr/bin/python2'
augroup RestoreCursorShapeOnExit
  autocmd!
  autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
augroup END
