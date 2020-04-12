export ZDOTDIR=$HOME/.zsh

typeset -U path
path=(
    $HOME/local/sbin(N-/)
    $HOME/local/bin(N-/)
    $path
)

typeset -xT SUDO_PATH sudo_path
sudo_path=(
    /usr/local/sbin(N-/)
    /usr/sbin(N-/)
    /sbin(N-/)
    /opt/sbin(N-/)
)

export EDITOR=$(
    if where vim > /dev/null; then
        echo =vim
    else
        echo =vi
    fi
)

export PAGER=$(
    if where vimpager > /dev/null; then
        echo =vimpager
    else
        echo =less
    fi
)

export LESS='-MRx4#4'

for f in $ZDOTDIR/env.d/*; do
    source $f
done
