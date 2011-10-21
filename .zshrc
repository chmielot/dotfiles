# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic" 

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
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler git-flow github knife osx rvm vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

if [ -f ~/.rvm/scripts/rvm ]; then
    source ~/.rvm/scripts/rvm
fi
if [ -f ~/.ec2/environment ]; then
    source ~/.ec2/environment
fi

# TODO: Fix strange locales on OSX
export LC_ALL=en_US.UTF-8 

# TODO: Fix strange vim exit code error ...
alias vim='/usr/bin/vim'
export EDITOR='/usr/bin/vim'

# TODO: Move this into own zsh-plugin
function cd {
    builtin cd "$@" 
    echo $PWD > ~/.zsh_pwd
}
if [ -f ~/.zsh_pwd ]; then
    cd $(cat ~/.zsh_pwd)
fi

# TODO: Really!? Currently only for ack ...
export PATH=~/.bin/:${PATH}