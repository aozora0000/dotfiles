#################################
# sshコンフィグファイル結合
#################################
ssh-config() {
    rm -f ~/.ssh/known_hosts ~/.ssh/config.bak
    mv ~/.ssh/config ~/.ssh/config.bak
    cat ~/.ssh/conf.d/*.conf > ~/.ssh/config
    echo > ~/.ssh/known_hosts
}

#################################
# sshコンフィグファイル郡編集
#################################
ssh-open() {
    atom ~/.ssh/conf.d
}
