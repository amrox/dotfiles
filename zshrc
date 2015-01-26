# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gsub="git submodule update --init --recursive"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew compleat docker encode64 gitfast git-extras golang fabric jsontools nyan osx pip python)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all # turn off autocorrect

# Solarized colors
export LSCOLORS=exfxcxdxbxegedabagacad

# Paths
export PATH=$HOME/.bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/X11/bin:$PATH
export PATH=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH

# Virtualenv Wrapper/Burrito
VIRTUALENVWRAPPER_BURRITO=~/.venvburrito/startup.sh
VIRTUALENVWRAPPER_BREW=/usr/local/share/python/virtualenvwrapper.sh
for p ($VIRTUALENVWRAPPER_BURRITO $VIRTUALENVWRAPPER_BREW); do
	if  [[ -a $p ]]; then
		source $p
		break
	fi
done
