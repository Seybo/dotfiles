####### tmux ########
alias tmux="tmux -u"
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
# alias tsave='tmux2html'
tsave() {
  # $1 - window/pane (0.1 or 2 or 2.3)
  # $2 - history limit
  LINES=${2:-100}
  tmux2html "$1" --history "$LINES" -o ~/tmux.html
}
alias tshow='xopen ~/tmux.html &> /dev/null &'
alias mux=tmuxinator

undupe_history() {
  nl "$1" | sort -k 2  -k 1,1nr| uniq -f 1 | sort -n | cut -f 2 > unduped_history
  rm "$1"
  mv unduped_history "$1"
}

####### zsh ########
alias szsh="source ~/.zshrc"
alias k9="kill -9"
alias t="tree"
alias rboot="systemctl reboot -i"
alias pwoff="sudo poweroff"
alias rp="realpath"
alias espr="espanso restart"

# wifi
alias wfl="nmcli d wifi list"
wfup() {
  # $1 - name of the network
  nmcli c up "$1"
}
alias wfrestart="sudo service network-manager restart"

####### git ########
alias gpf='git push --force-with-lease'
alias gca='git commit -n --amend --no-edit'
alias gcae='git commit -n --amend'
alias gitc='git commit -n -v -m "'
alias grc='GIT_EDITOR=true git rebase --continue'
alias gitct='gitc temp"'
alias gbD='git branch -D'
alias gc-='git checkout -'
alias gaf='gaa && gca && gpf'
alias gurbm='grbm && gcm && gup && gc- && grbm' # first rebase is for unstashed changes notification
alias grsh='git reset --soft HEAD~1'
alias gsta='git stash save' # overwriting oh-my-zsh that uses git stash push
alias gstt='git stash save temp'
alias gstd='git stash drop'

####### dotfiles ########
alias dpf='dfiles push --force-with-lease'
alias dca='dfiles commit --amend --no-edit'
alias dcae='dfiles commit --amend'
alias ditc='dfiles commit -v -m "'
alias dst='dfiles status'
alias dan='dfiles add'
alias daa='dfiles add -u'
# alias daf='daa && dca && dpf'
alias ddif='dfiles diff'
alias dlog='dfiles log'


####### rails ########
alias rsw='rails s webrick'
alias rswc='rails s webrick -e test -p 5002'
alias rsp='PORT=3000 bundle exec puma -C config/puma.rb'
alias beg='bundle exec guard'
alias ber='bundle exec rspec'
# alias forber='for i in `seq 50` ; do ber '
alias bec='bundle exec'
alias rdbm='rails db:migrate && RAILS_ENV=test rails db:reset'
alias brdbm='bundle && rdbm'
alias wai='whereami'
alias rlc='rails log:clear'
# vim shows some spring error if in one tab rails console is launched with spring and in another one a spec is running
alias rc='DISABLE_SPRING=true rails c'

####### elixir ########
alias iex='rlwrap -a iex'


####### front ########
alias yasbj="yarn start storybook.js"
alias yasbr="yarn start storybook.re"
alias yas="yarn start build.dev.server.watch"
alias yac="yarn start build.dev.client.watch"
alias yasc="npx concurrently --kill-others --prefix \"[{name}]\" --names \"CLIENT_BUNDLES,SERVER_BUNDLE\" \"nps build.dev.client.watch\" \"nps build.dev.server.watch\""
alias yar="yarn start build.bs.dev.watch"
alias jst="TZ=UTC BABEL_ENV=jest yarn jest"


####### apps ########
alias v='lvim'
alias lvim='vim -u ~/.config/nvim/init_lua.lua'

alias rr='ranger'
alias gsm='gnome-system-monitor'
alias colorscheme='~/.myconfig/colorscheme'
alias postman='~/etc/postman/Postman'
alias peek='GDK_BACKEND=x11 peek'
# alias nvim_mood='cd ~/.config && mv nvim nvim_main && mv nvim_mood nvim'
alias nvim_ide_to_my='cd ~/.config && mv nvim nvim_ide && mv nvim_my nvim'
alias nvim_my_to_ide='cd ~/.config && mv nvim nvim_my && mv nvim_ide nvim'
alias nvim_alex_to_my='cd ~/.config && mv nvim nvim_alex && mv nvim_my nvim'
alias nvim_my_to_alex='cd ~/.config && mv nvim nvim_my && mv nvim_alex nvim'

# alacritty doesn't go fullscreen with F11
alias alf='wmctrl -r '0:1:zsh' -b toggle,fullscreen'


####### system ########
alias search='sudo find / -type f -iname'
alias xopen='xdg-open'
alias syslog='vim /var/log/syslog'
alias syslogclear="sudo sh -c 'cat /dev/null > /var/log/syslog'\n: 1557288145:0;sudo sh -c 'cat /dev/null > /var/log/syslog'"
alias ls='ls -al'

alias exa='exa --long --header --no-user --icons --all'
alias exae='exa --long --header --no-user --icons --all --sort=ext'
alias exam='exa --long --header --no-user --icons --all --sort=mod'

alias aptu='sudo apt update'
alias apti='sudo apt install'
alias aptb='sudo apt upgrade' # b - bump
alias aptp='sudo apt purge --auto-remove'

source ~/.myconfig/secure/aliases.sh
