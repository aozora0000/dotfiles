#################################
# sshコンフィグファイル結合
#################################
ssh-config() {
    mv ~/.ssh/config{,.bak}
    cat ~/.ssh/conf.d/*.conf > ~/.ssh/config
    echo > ~/.ssh/known_hosts
}

#################################
# sshコンフィグファイル郡編集
#################################
ssh-open() {
    atom ~/.ssh/conf.d
}
