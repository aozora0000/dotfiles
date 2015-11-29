#################################
# brewcask-upgrade
#################################
function brewcask-upgrade() {
    for app in `brew cask list`;do
        brew cask install ${app}
    done
}

function brew-dump() {
    rm -rf $HOME/.profile/bundle/Brewfile.old  && \
    mv $HOME/.profile/bundle/Brewfile $HOME/.profile/bundle/Brewfile.old && \
    brew brewdle dump --file=$HOME/.profile/bundle/Brewfile
}
