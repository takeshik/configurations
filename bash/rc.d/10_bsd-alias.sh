if ! /bin/ls --version 2>&1 | grep -q GNU; then
    # (should be) BSD userland
    alias ls='ls -FG'
    alias ll='ls -l'
    alias rm='rm -vr'
    alias cp='cp -av'
    alias ln='ln -v'
    alias mv='mv -v'
    alias mkdir='mkdir -pv'
    alias chown='chown -v'
    alias chgrp='chgrp -v'
    alias chmod='chmod -v'
    alias grep='grep -n'
    alias du1='du -d 1'
fi
