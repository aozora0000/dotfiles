if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz promptinit
promptinit
prompt powerline
