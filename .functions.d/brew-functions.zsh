#################################
# brewcask-upgrade
#################################
function brewcask-upgrade() {
    for app in `brew cask list`;do
        brew cask install ${app}
    done
}

function brew-dump() {
    rm -rf $HOME/.dotfiles/bundle/Brewfile.old  && \
    mv $HOME/.dotfiles/bundle/Brewfile $HOME/.dotfiles/bundle/Brewfile.old && \
    brew brewdle dump --file=$HOME/.dotfiles/bundle/Brewfile
}
