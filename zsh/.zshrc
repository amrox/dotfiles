# Interactive shell init. See zsh/README.md in the dotfiles repo
# for the file-type model and cross-platform strategy.

# Profiling — uncomment top + bottom together to measure startup
#zmodload zsh/zprof

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY HIST_REDUCE_BLANKS

# Plugins via antidote
source ~/.zsh/antidote/antidote.zsh
antidote load ~/.zsh_plugins.txt

# Aliases — git
alias gsub="git submodule update --init --recursive"
alias gdmerged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d ; git remote prune origin'
alias gcountall="git rev-list --all --count"

# Aliases — misc
alias whatismyip="dig +short myip.opendns.com @resolver1.opendns.com"
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/\$/¶/g'"

# Tool integrations — only run if the binary is present, so the same rc works
# on machines where these aren't installed yet.
command -v mise     &>/dev/null && eval "$(mise activate zsh)"
command -v atuin    &>/dev/null && eval "$(atuin init zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"

# Colorize ls — detect flavor (GNU vs BSD) so this works on Linux, macOS,
# and macOS-with-coreutils. `ls --version` succeeds on GNU, errors on BSD.
if ls --version >/dev/null 2>&1; then
  alias ls='ls --color=auto'
else
  export CLICOLOR=1
  export LSCOLORS=exfxcxdxbxegedabagacad  # Solarized
fi

# tmux: terminfo for tmux-256color isn't always present; downgrade to a name
# every system has.
if [[ "$TERM" == "tmux-256color" ]]; then
  export TERM=screen-256color
fi

# Claude CLI: opt out of its DO_NOT_TRACK respect (we don't set DO_NOT_TRACK
# globally for that purpose, but if something upstream sets it, drop it for
# claude only).
claude() {
  env -u DO_NOT_TRACK claude "$@"
}

# OS-specific
if [[ "$OSTYPE" == darwin* ]]; then
  [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
  alias love="/Applications/love.app/Contents/MacOS/love"
fi

# Clear $TMUX inside iTerm2 -CC tabs (et socket) so commands targeting the
# default tmux socket (e.g. amux) don't get blocked by the nesting guard.
# Safe — different servers.
if [[ "$TMUX" == *"/et,"* ]]; then
  unset TMUX
fi

# Fix tmux pane stuck at wrong size (e.g. after amux mobile resize).
# No args: fix current window. "tfix all": fix all amux sessions.
tfix() {
  if [ "$1" = "all" ]; then
    tmux list-sessions -F '#{session_name}' 2>/dev/null | grep '^amux-' | while read s; do
      tmux resize-window -A -t "$s" 2>/dev/null
      tmux set-option -w -u -t "$s" window-size 2>/dev/null
    done
    echo "Fixed all amux sessions"
  else
    tmux resize-window -A && tmux set-option -w -u window-size
  fi
}

# Local overrides
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

## End profiling
#zprof
#zmodload -u zsh/zprof
