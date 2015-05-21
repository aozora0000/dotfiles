#################################
# .DS_Storeファイル削除
#################################
function rm-dss() {
    find ./ -name ".DS_Store" -delete
}

function count-dir() {
    dirlist_path=${1:?"ディレクトリ・リストの指定がありません。中止します。"}

    if [ -f "$dirlist_path" ]; then
        echo "${dirlist_path}はファイルです。ディレクトリを指定してください。"
        exit 1;
    fi

    if [ ! -d "$dirlist_path" ]; then
        echo "${dirlist_path}がありません。中止します。"
        exit 1;
    fi

    for item in `ls -b "$dirlist_path"`
    do
        itempath=$dirlist_path/$item

        if [ -d "$itempath" ]; then
            filenum=`find "$itempath" -type f -name "[^.]*" | wc -l`
            echo $item, $filenum
        fi
    done
}
