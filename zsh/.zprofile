# Login-shell init. See zsh/README.md in the dotfiles repo for the
# file-type model and cross-platform strategy.

export DO_NOT_TRACK=1
export ANSIBLE_NOCOWS=1

# Editor — nvim is one of the first things installed on any new machine
export EDITOR=nvim
export VISUAL=nvim

# brew (mac or linuxbrew)
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -x /home/linuxbrew/.linuxbrew/bin/brew ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Personal bin dirs (prepended; user dirs win over system)
path=("$HOME/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" $path)

# OrbStack (mac)
[[ -f "$HOME/.orbstack/shell/init.zsh" ]] && source "$HOME/.orbstack/shell/init.zsh"

# Local overrides
[[ -f ~/.zprofile.local ]] && source ~/.zprofile.local
