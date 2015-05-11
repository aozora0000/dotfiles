#################################
# brewcask-upgrade
#################################
function brewcask-upgrade() {
    for app in `brew cask list`;do
        brew cask install ${app}
    done
}
