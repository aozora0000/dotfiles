{
    echo "x-codeインストール"
    xcode-select --install
}
{
    echo "Homebrewインストール"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
}
{
    echo "zsh/gitインストール"
    brew install zsh git
}
{
    echo "zplugインストール"
    curl -sL zplug.sh/installer | zsh
}
{
    echo "preztoインストール"

}

