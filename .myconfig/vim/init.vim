source $HOME/.myconfig/vim/global_before.vimrc
call plug#begin('~/.vim/plugged')
source $HOME/.myconfig/vim/plugins_basic.vimrc
" a separate file for those plugins that can be disabled (for debugging purposes for example) 
source $HOME/.myconfig/vim/plugins_extra.vimrc
call plug#end()
source $HOME/.myconfig/vim/settings.vimrc
source $HOME/.myconfig/vim/mappings.vimrc
source $HOME/.myconfig/vim/colors.vimrc
source $HOME/.myconfig/vim/global_after.vimrc

" Links:
" $HOME/.config/nvim/ftplugin
" $HOME/.config/nvim/indent
