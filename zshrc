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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/Users/amrox/.bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/android-sdk-mac_x86/tools:/usr/local/mysql/bin:/opt/aws/ec2/bin:/opt/aws/cloudfront:/opt/aws/rds/bin:/bin:/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin:/usr/local/Cellar/ruby/1.9.3-p194/bin

# Solarized colors
export LSCOLORS=exfxcxdxbxegedabagacad


# Virtualenv Wrapper/Burrito

VIRTUALENVWRAPPER_BURRITO=~/.venvburrito/startup.sh
VIRTUALENVWRAPPER_BREW=/usr/local/share/python/virtualenvwrapper.sh

for p ($VIRTUALENVWRAPPER_BURRITO, $VIRTUALENVWRAPPER_BREW); do
	if  [[ -a $p ]]; then
		source $p
		break
	fi
done
