if [ -s "$HOME/.dotfiles/.zsh.d/zsh-notify/notify.plugin.zsh" ]; then
    source $HOME/.dotfiles/.zsh.d/zsh-notify/notify.plugin.zsh
else
    git clone https://github.com/marzocchi/zsh-notify $HOME/.dotfiles/.zsh.d/zsh-notify
    source $HOME/.dotfiles/.zsh.d/zsh-notify/notify.plugin.zsh
fi
