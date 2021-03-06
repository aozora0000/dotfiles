#################################
# pep
#################################
function pep() {
    local filepath="$(find . | grep -v '/\.' | peco --prompt 'PATH>')"
    [ -z "$filepath" ] && return
    if [ -n "$LBUFFER" ]; then
        BUFFER="$LBUFFER$filepath"
    else
        if [ -d "$filepath" ]; then
            BUFFER="cd $filepath"
        elif [ -f "$filepath" ]; then
            BUFFER="$EDITOR $filepath"
        fi
    fi
    CURSOR=$#BUFFER
}

zle -N pep
bindkey '^f' pep
