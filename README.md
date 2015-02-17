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

### DNSMASQS
```.shell
//設定ファイルコピー
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf

//自動起動追加
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

//自動起動から外す
sudo launchctl unloadload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

//設定ファイル
vi /usr/local/etc/dnsmasq.conf

# wildcardでの名前解決を許す?
bind-interfaces
# launch deamonで動かすために常にforgroundで起動
keep-in-foreground  
#  /etc/resolve.confを見ない
no-resolv

#  *.dev ドメインへのアクセスは全てlocalに。
address=/dev/127.0.0.1
#  名前解決する時にローカルを見るためには自動的にloopbackしてくれんので、明示的に設定するとかなんとか?
listen-address=127.0.0.1 
```
