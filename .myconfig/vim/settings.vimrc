" keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/undodir > /dev/null 2>&1
  set undodir=~/.config/nvim/undodir
  set undofile
endif

" disable Ex mode
map Q <Nop>

" Disables number lines on terminal buffers
" augroup neovim_terminal
"   autocmd!
"   autocmd TermOpen * :set nonumber norelativenumber
" augroup END

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

function! MyTabLine()
    let s = ""

    for i in range(1, tabpagenr('$'))
        let filename = MyTabLabel(i)
        let filename_without_ext = MyTabLabelWithoutExt(i)

        " Check if filename_without_ext is longer than 30 characters
        if strlen(filename_without_ext) > 30
            " Shorten the filename to the last 30 characters and prefix with ".."
            let filename_without_ext = '..' . strpart(filename_without_ext, strlen(filename_without_ext) - 30)
        endif

        if i == tabpagenr()
            let s .= "%#TabLineSel#"
        else
            let s .= "%#TabLine#"
        endif

        let s .= "%" . i . "T"
        let s .= " " . filename_without_ext . " "
    endfor

    let s .= "%#TabLineFill#%T"

    if tabpagenr('$') > 1
        let s .= "%=%#TabLine#%999Xclose"
    endif

    return s
endfunction

" function to extract only the filename without the path and extension
function! MyTabLabel(tabnum)
    let full_path = bufname(tabpagebuflist(a:tabnum)[0])
    let filename = fnamemodify(full_path, ":t")
    return fnamemodify(filename, ":r")
endfunction

" Define the MyTabLabelWithoutExt function to extract filename without extension
function! MyTabLabelWithoutExt(tabnum)
    let full_path = bufname(tabpagebuflist(a:tabnum)[0])
    let filename = fnamemodify(full_path, ":t:r")
    return filename
endfunction

" Show shortened filenames in the tabline
set tabline=%!MyTabLine()

" set in the themes files
" same color as my white scheme
" augroup TabColors
"   autocmd!
"   autocmd ColorScheme * hi TabLineFill guifg=gray99
"   autocmd ColorScheme * hi TabLine guifg=gray99 guibg=gray10
"   autocmd ColorScheme * hi TabLineSel guibg=MediumTurquoise guifg=gray99
" augroup END

""""""""""""""""""""""""""""""""""""
""""""""""" Tabline End """"""""""""
""""""""""""""""""""""""""""""""""""

" neovim stuff
" to remove checkhealth warning: "Neovim::Ext" cpan module is not installed
let g:loaded_perl_provider = 0
let g:ruby_host_prog = '~/.rbenv/versions/2.7.6/bin/neovim-ruby-host'
let g:python3_host_prog = '/usr/bin/python3'
" python 3 should be enough
" let g:python_host_prog = '/usr/bin/python2'

augroup RestoreCursorShapeOnExit
  autocmd!
  autocmd VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
augroup END
