if /bin/ls --version 2>&1 | grep -q GNU; then
    # GNU userland
    alias ls='ls -v --color=auto'
    alias ll='ls -l --time-style=long-iso'
    alias rm='rm -vr'
    alias cp='cp -av'
    alias ln='ln -v'
    alias mv='mv -v'
    alias mkdir='mkdir -pv'
    alias chown='chown -cv'
    alias chgrp='chgrp -cv'
    alias chmod='chmod -cv'
    alias grep='grep -n --color'
    alias getfacl='getfacl --tabular'
    alias du1='du --max-depth=1'
    alias psx='ps -AHo pid,user,group,%cpu,%mem,nlwp,vsize,rssize,tname,stat,ni,start_time,cputime,args'
    alias watch='watch -c -d -t -n 1'
fi
