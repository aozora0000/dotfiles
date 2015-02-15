# Mac環境構築用スクリプト

## 0. 準備

ディスクユーティリティーにてファイル権限の修復を実行

## 1. Homebrew/Oh-My-Zshインストール

```.shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
wget http://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```

## 2. Gitインストール/dotfileをクローン

```.shell
cd $HOME
brew install git
git clone git@github.com:aozora0000/dotfiles.git ./.profile
```

## 3. homebrewからパッケージをインストール

```.shell
cd $HOME/.profile
sh bundleinstall.sh

~~~~~~~~~省略~~~~~~~~~~

// 終了したらzshrcを上書き
echo "source ~/.profile/.bootstrap" > ~/.zshrc
source ~/.zshrc
```

## 4. 公開鍵をハードリンク

Dropboxを起動・設定する

```.shell
ln -s ~/Dropbox/.ssh ~/.ssh
ssh-config
```
## 5. Vimの設定

```.shell
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
echo "source ~/.profile/.vimrc" > ~/.vimrc

~/.vim/bundle/neobundle.vim/bin/neoinstall
```

## 6. 開発環境構築

### PHP

```.shell
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod a+x phpbrew
mv phpbrew /usr/local/bin/phpbrew
phpbrew init
phpbrew known
phpbrew install 5.6.5 +default +pdo +mysql
phpbrew switch 5.6.5
phpbrew ext install xdebug
phpbrew ext install memcached
phpbrew ext install yaml
```
