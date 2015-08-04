if [ -s "$HOME/.profile/.zsh.d/zsh-notify/notify.plugin.zsh" ]; then
    source $HOME/.profile/.zsh.d/zsh-notify/notify.plugin.zsh
else
    git clone https://github.com/marzocchi/zsh-notify $HOME/.profile/.zsh.d/zsh-notify
    source $HOME/.profile/.zsh.d/zsh-notify/notify.plugin.zsh
fi
