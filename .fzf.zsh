# Setup fzf
# ---------
if [[ ! "$PATH" == */home/glaux/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/glaux/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/glaux/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/glaux/.fzf/shell/key-bindings.zsh"
