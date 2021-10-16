# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/glaux/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export VISUAL=nvim
export EDITOR="$VISUAL"
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# make same ctrl-z key to move back from shell to vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
source ~/.myconfig/aliases.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_PREVIEW_PREVIEW_BAT_THEME='Nord'

# tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
 exec tmux
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# tmuxinator
source ~/.myconfig/tmuxinator.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fuck :)
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# dotfiles
alias dfiles="/usr/bin/git --git-dir=$HOME/.dfiles/ --work-tree=$HOME"

# rspec-retry in dev should not retry
export RSPEC_RETRY_RETRY_COUNT=1

# yarn version manager
export YVM_DIR=/home/glaux/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# autojump
[[ -s /home/glaux/.autojump/etc/profile.d/autojump.sh ]] && source /home/glaux/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# ruby
export GEM_HOME="$HOME/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0"

# python version manager
eval "$(pyenv init -)"

eval "$(direnv hook zsh)"
# silence direnv output
export DIRENV_LOG_FORMAT=

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# git stash broken temp fix (should be fixed in the next zsh release)
_git-stash () {
  local curcontext=$curcontext state line ret=1
  declare -A opt_args
  local -a save_arguments

  save_arguments=(
    '(-p --patch -a --all -u --include-untracked)'{-p,--patch}'[interactively select hunks from diff between HEAD and working tree to stash]'
    '(-k --keep-index --no-keep-index)'{-k,--keep-index}'[all changes already added to the index are left intact]'
    '(-k --keep-index)--no-keep-index[all changes already added to the index are undone]'
    '(-q --quiet)'{-q,--quiet}'[suppress all output]'
    '(-p --patch -a --all -u --include-untracked)'{-u,--include-untracked}'[include untracked files]'
    '(-p --patch -a --all -u --include-untracked)'{-a,--all}'[include ignored files]'
  )

  _arguments -C \
    '*::: :->args' \
    '(-m --message)'{-m,--message}'[specify stash description]' \
    ${save_arguments//#\(/(* } && ret=0

  if [[ -n $state ]]; then
    if (( CURRENT == 1 )); then
      local -a commands

      commands=(
        {push,save}:'save your local modifications to a new stash'
        list:'list the stashes that you currently have'
        show:'show the changes recorded in the stash as a diff'
        pop:'remove and apply a single stashed state from the stash list'
        apply:'apply the changes recorded in the stash'
        branch:'branch off at the commit at which the stash was originally created'
        clear:'remove all the stashed states'
        drop:'remove a single stashed state from the stash list'
        create:'create a stash without storing it in the ref namespace'
      )

      _describe -t commands command commands && ret=0
    else
      curcontext=${curcontext%:*}-$line[1]:
      compset -n 1

      case $line[1] in
        (save)
          _arguments -S $endopt \
            $save_arguments \
            ':: :_guard "([^-]?#|)" message' && ret=0
          ;;
        (push)
          _arguments -S $endopt \
            $save_arguments \
	    '(-m --message)'{-m,--message}'[specify stash description]' \
            ':: :__git_modified_files' && ret=0
          ;;
        (--)
            __git_modified_files
          ;;
        (list)
          local -a log_options revision_options
          __git_setup_log_options
          __git_setup_revision_options

          _arguments -s \
            $log_options \
            $revision_options && ret=0
          ;;
        (show)
          local diff_options
          __git_setup_diff_options

          _arguments -S -s $endopt \
            $diff_options \
            ':: :__git_stashes' && ret=0
          ;;
        (pop|apply)
          _arguments -S $endopt \
            '--index[try to reinstate the changes added to the index as well]' \
            '(-q --quiet)'{-q,--quiet}'[suppress all output]' \
            ':: :__git_stashes' && ret=0
          ;;
        (branch)
          _arguments \
            ': :__git_guard_branch-name' \
            ':: :__git_stashes' && ret=0
          ;;
        (clear)
          _nothing
          ;;
        (drop)
          _arguments -S $endopt \
            '(-q --quiet)'{-q,--quiet}'[suppress all output]' \
            ':: :__git_stashes' && ret=0
          ;;
        (create)
          _nothing
          ;;
        (*)
          _nothing
          ;;
      esac
    fi
  fi

  return ret
}
