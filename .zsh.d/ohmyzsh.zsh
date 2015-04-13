#################################
# Oh-My-Zsh設定
#################################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kphoen"
plugins=(git atom autojump brew brew-cask ruby osx bundler brew rails emoji-clock composer gem vagrant tig aws vagrant)

export PATH="$PATH:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
