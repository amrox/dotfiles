# Profiling — uncomment top + bottom together to measure startup
#zmodload zsh/zprof

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Empty — starship handles the prompt (see below). If starship isn't on
# PATH on a given machine, you'll get a bare `%` prompt; install starship
# or set a fallback theme here.
ZSH_THEME=""

plugins=(
  gitfast
  docker
  python                  # pyenv/venv helpers + completion
  brew
  fzf
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting # must stay last — wraps the prompt redraw
  # sd                    # was on Mac — confirm origin before re-enabling
)

source "$ZSH/oh-my-zsh.sh"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY HIST_REDUCE_BLANKS

# Aliases — git
alias gsub="git submodule update --init --recursive"
alias gdmerged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d ; git remote prune origin'
alias gcountall="git rev-list --all --count"

# Aliases — misc
alias whatismyip="dig +short myip.opendns.com @resolver1.opendns.com"
alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/\$/¶/g'"

# eza if installed
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -lhg --git'
fi

# Tool integrations — only run if the binary is present, so the same rc works
# on machines where these aren't installed yet.
command -v mise     &>/dev/null && eval "$(mise activate zsh)"
command -v atuin    &>/dev/null && eval "$(atuin init zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"

# tmux: terminfo for tmux-256color isn't always present; downgrade to a name
# every system has.
if [[ "$TERM" == "tmux-256color" ]]; then
  export TERM=screen-256color
fi

# Claude CLI: opt out of its DO_NOT_TRACK respect (we don't set DO_NOT_TRACK
# globally for that purpose, but if something upstream sets it, drop it for
# claude only).
claude() {
  env -u DO_NOT_TRACK command claude "$@"
}

# OS-specific
if [[ "$OSTYPE" == darwin* ]]; then
  [ -e "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"
  alias love="/Applications/love.app/Contents/MacOS/love"
  export MANPATH="/opt/homebrew/share/man:$MANPATH"
fi

## End profiling
#zprof
#zmodload -u zsh/zprof
