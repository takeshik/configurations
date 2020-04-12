if [[ ! $(uname) == MINGW* ]]; then
    exit 0
fi

if [ -z $SESSIONNAME ]; then
    export PS1='\[\033[34;1m\]\w\[\033[;33m\]`__git_ps1`\[\033[0m\] # '
else
    export PS1='\[\033[34;1m\]\w\[\033[;33m\]`__git_ps1`\[\033[0m\] $ '
fi
 

# http://stackoverflow.com/questions/18641864
mklink() {
    if [[ -z "$2" ]]; then
        if [[ -n "$WINDIR" ]]; then
            fsutil reparsepoint query "$1" > /dev/null
        else
            [[ -h "$1" ]]
        fi
    else
        if [[ -n "$WINDIR" ]]; then
            if [[ -d "$2" ]]; then
                cmd <<< "mklink /D \"$1\" \"${2//\//\\}\"" > /dev/null
            else
                cmd <<< "mklink \"$1\" \"${2//\//\\}\"" > /dev/null
            fi
        else
            ln -s "$2" "$1"
        fi
    fi
}

rmlink() {
    if [[ -n "$WINDIR" ]]; then
        if [[ -d "$1" ]]; then
            rmdir "$1";
        else
            rm "$1"
        fi
    else
        rm "$1"
    fi
}
