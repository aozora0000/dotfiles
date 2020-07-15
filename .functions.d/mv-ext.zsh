function mv-ext() {
    if [ $# -ne 2 ]; then
        echo "指定された引数は$#個です。" 1>&2
        echo "実行するには2個の引数が必要です。" 1>&2
        return;
    fi
    for filename in "*.$1"; do mv $filename ${filename%."$1"}."$2"; done
}
