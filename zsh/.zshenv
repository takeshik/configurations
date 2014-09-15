# -*- mode: sh; encoding: utf-8; tab-width: 4; indent-tabs-mode: nil; -*-

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

export EDITOR=`if where vim > /dev/null; then
    echo =vim
else
    echo =vi
fi`

export PAGER=`if where vimpager > /dev/null; then
    echo =vimpager
else
    echo =less
fi`

export LESS='-MRx4#4'

for f in $ZDOTDIR/env.d/*; do
    source $f
done

# vim:set ft=sh fenc=utf-8 ts=4 sw=4 sts=4 et:
