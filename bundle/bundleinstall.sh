#/bin/bash -xle
if [ -z "/usr/local/bin/brew" ];then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap homebrew/boneyard && \
cd $HOME/.profile/bundle && \
brew bundle &&
read-dir `pwd`/package/*_package
