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
git clone git@github.com:aozora0000/dotfiles.git ./.dotfiles
```

## 3. homebrewからパッケージをインストール

```.shell
cd $HOME/.dotfiles
sh bundleinstall.sh

~~~~~~~~~省略~~~~~~~~~~

// 終了したらzshrcを上書き
echo "source ~/.dotfiles/.bootstrap" > ~/.zshrc
source ~/.zshrc
```

## 4. 公開鍵・その他設定をリンク

Dropboxを起動・設定する

```.shell
ln -s ~/Dropbox/.ssh ~/.ssh
ls -s ~/Dropbox/macbookpro/.gitconfig ~/.gitconfig
ls -s ~/Dropbox/macbookpro/.git_template ~/.git_template
ls -s ~/Dropbox/macbookpro/.aws ~/.aws
ls -s ~/Dropbox/macbookpro/.ansible.cfg ~/.ansible.cfg
ls -s ~/Dropbox/macbookpro/.HOMEBREW_GITHUB_API_TOKEN ~/.HOMEBREW_GITHUB_API_TOKEN
ssh-config
```
## 5. Vimの設定

```.shell
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
echo "source ~/.dotfiles/.vimrc" > ~/.vimrc

~/.vim/bundle/neobundle.vim/bin/neoinstall
```

## 6. 開発環境構築

### PHP

```.shell
// phpbrew インストール
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod a+x phpbrew
mv phpbrew /usr/local/bin/phpbrew

// PHPビルドインストール
phpbrew init
phpbrew known
phpbrew install 5.6.5 +default +pdo +mysql
phpbrew switch 5.6.5
phpbrew ext install xdebug
phpbrew ext install memcached
phpbrew ext install yaml

// php.ini設定
sed -i "s/phar.readonly.*/phar.readonly = Off/g" ~/.phpbrew/php/php-*/etc/php.ini
cat ~/.phpbrew/php/php-*/etc/php.ini | grep  phar.readonly
sed -i "s/^;date.timezone.*/date.timezone = \"Asia\/Tokyo\"/" ~/.phpbrew/php/php-*/etc/php.ini
cat ~/.phpbrew/php/php-*/etc/php.ini | grep date.timezone
sed -i "s/^expose_php = On$/expose_php = Off/" ~/.phpbrew/php/php-*/etc/php.ini
cat ~/.phpbrew/php/php-*/etc/php.ini | grep expose_php
// composerインストトール
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

// phpunitインストトール
wget https://phar.phpunit.de/phpunit.phar
chmod a+x phpunit.phar
mv phpunit.phar /usr/local/bin/phpunit

// boxインストール
curl -LSs http://box-project.org/installer.php | php
chmod a+x box.phar
mv box.phar /usr/local/bin/box

// codeceptインストール
wget http://codeception.com/codecept.phar
chmod a+x codecept.phar
mv codecept.phar /usr/local/bin/codecept
```

### ATOMエディタ
```.shell
apm stars --install
```
