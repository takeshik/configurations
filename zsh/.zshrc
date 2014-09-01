# -*- mode: sh; encoding: utf-8; tab-width: 4; indent-tabs-mode: nil; -*-

setopt \
    always_last_prompt \
    append_history \
    auto_cd \
    auto_list \
    auto_menu \
    auto_param_keys \
    auto_param_slash \
    auto_pushd \
    brace_ccl \
    complete_in_word \
    csh_null_glob \
    extended_glob \
    extended_history \
    hash_cmds \
    hist_expand \
    hist_fcntl_lock \
    hist_find_no_dups \
    hist_ignore_dups \
    hist_ignore_space \
    hist_no_store \
    hist_reduce_blanks \
    hist_subst_pattern \
    inc_append_history \
    interactive_comments \
    list_ambiguous \
    list_packed \
    long_list_jobs \
    magic_equal_subst \
    mark_dirs \
    multi_os \
    no_list_beep \
    notify \
    numeric_glob_sort \
    prompt_subst \
    pushd_minus \
    pushd_ignore_dups \
    share_history \
;

[ -n "`alias run-help`" ] && unalias run-help

autoload -Uz colors; colors
autoload -Uz compinit; compinit -u
autoload -Uz predict-on
autoload -Uz run-help
autoload -Uz url-quote-magic
autoload -Uz vcs_info
autoload -Uz zcalc
autoload -Uz zed
autoload -Uz ztodo
autoload -Uz zmv

local p_user="%B%U%{%(!.$fg[red].$fg[green])%}%n@%m%u%b%{$reset_color%}"
local p_pwd="%B%{$fg[blue]%}%~%b%{$reset_color%}"
local p_suffix="%(1j.%B%{$fg[yellow]%}%(!.#.$)%b%{$reset_color%}.%(!.#.$))"
export PROMPT="[${p_user}:${p_pwd}]${p_suffix} "

local rp_vcs="(%1(V|%1v%f |)"
local rp_ret="%(?.0.%B%{$fg[magenta]%}%?%b%{$reset_color%})"
local rp_dirs="%2(V.%{$fg[cyan]%}%2v%{$reset_color%}.0)"
local rp_jobs="%1(j.%{$fg[yellow]%}%j%{$reset_color%}.0)"
export RPROMPT="${rp_vcs}r:${rp_ret} s:${rp_dirs} j:${rp_jobs})"

export PROMPT2='%B%{$fg[black]%}-->%b%{$reset_color%} '
export RPROMPT2='%_'

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=99999999
SAVEHIST=99999999
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
REPORTTIME=1
TIMEFMT='%J (real: %*E user: %*U sys: %*S cpu: %P pf: %F)'
watch=(all all)
WATCHFMT='%n has %a %l from %m at %D %T'

if =ls --version 2>&1 | grep -q GNU; then
    # GNU userland
    alias ls='ls -av --color=auto'
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
else
    # (should be) BSD userland
    alias ls='ls -aFG'
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

# Common commands
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias md='mkdir'
alias history='history -Ddi'
alias pwd='pwd -P'
alias cc='copyclip'
alias c='LANG=C LC_ALL=C'
alias ja='LANG=ja_JP.UTF-8 LC_ALL=ja_JP.UTF-8'
alias en='LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8'
alias h='history 0'
alias g='grep'
alias s='dirs -v'
alias l='$PAGER'
alias v='view -'
alias k='kill'
alias K='kill -KILL'
alias ka='killall'
alias KA='killall -KILL'
alias ssu='sudo su -'
alias r='popd'
alias j='jobs -lp'
alias H='head'
alias T='tail'
alias TF='tail -F'
alias -g _N_='> /dev/null 2>&1'
alias -s txt=$PAGER
alias -s htm=w3m
alias -s html=w3m
alias -s php=php
alias -s pl=perl
alias -s py=python
alias -s rb=ruby
alias -s exe=mono
alias -s jar='java -jar'
alias -s {sln,csproj,vbproj,fsproj}=xbuild

if where dircolors > /dev/null 2>&1; then
    eval `dircolors \`if [ -f $HOME/.DIR_COLORS ]; then
        echo $HOME/.dir_colors
    elif [ -f /etc/DIR_COLORS ]; then
        echo /etc/DIR_COLORS
    fi\``
fi

zstyle ':completion:*' completer _complete _expand _list _match _prefix
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-z}={A-Z} r:|[-_.]=**'
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:sudo:*' command-path $sudo_path $path
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' use-simple false
zstyle ":vcs_info:*" check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "?"
zstyle ':vcs_info:*' formats '%s:%b%c%u'
zstyle ':vcs_info:*' actionformats '%s:%b%c%u:%a'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

function precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    local dirn=$((`dirs -p | wc -l` - 1))
    [ $dirn -gt 0 ] && psvar[2]=$dirn
}

function cd() {
    builtin cd $@ && ls;
}

function cdpop() {
    if popd > /dev/null 2>&1; then
        echo
        ls
        # HACK: to update $RPROMPT
        precmd
        zle reset-prompt
    fi
}

function cdup() {
    echo
    cd ..
    # HACK: to update $RPROMPT
    precmd
    zle reset-prompt
}

function copyclip() {
    if which xsel > /dev/null 2>&1 ; then
        xsel --input --clipboard # X11
    elif which pbcopy > /dev/null 2>&1 ; then
        pbcopy # Mac OS X
    elif which putclip > /dev/null 2>&1 ; then
        putclip # Cygwin
    elif which clip > /dev/null 2>&1 ; then
        putclip # Windows
    else
        $PAGER
    fi
}

function predict-toggle() {
    if [ ! $ZSH_PREDICT ]; then
        predict-on
        ZSH_PREDICT=1
    else
        predict-off
        unset ZSH_PREDICT
    fi
}

function history-hybrid-search-backward() {
    if [ -z $BUFFER ]; then
        zle history-incremental-pattern-search-backward
    else
        zle history-search-backward
    fi
}

function history-hybrid-search-forward() {
    if [ -z $BUFFER ]; then
        zle history-incremental-pattern-search-forward
    else
        zle history-search-forward
    fi
}

function clear-screen-rehash() {
    zle clear-screen
    rehash
    zle reset-prompt
}

zle -N cdpop
zle -N cdup
zle -N self-insert url-quote-magic
zle -N predict-toggle
zle -N history-hybrid-search-backward
zle -N history-hybrid-search-forward
zle -N clear-screen-rehash

bindkey -e
bindkey "^?"     backward-delete-char
bindkey "^_"     describe-key-briefly
bindkey "^F"     history-hybrid-search-backward
bindkey "^J"     history-hybrid-search-forward
bindkey "^H"     backward-delete-char
bindkey "^K"     kill-region
bindkey "^L"     clear-screen-rehash
bindkey "^P"     push-input
bindkey "^Y"     yank
bindkey "^Z"     undo
bindkey "^[z"    redo
bindkey "^[[Z"   reverse-menu-complete
bindkey "^[OA"   expand-word
bindkey "^[OB"   list-expand
bindkey "^[OD"   backward-word
bindkey "^[OC"   forward-word
bindkey "^[^P"   predict-toggle
bindkey "^[[11"  run-help
bindkey "^[[2"   overwrite-mode
bindkey "^[[3~"  delete-char
bindkey "^[[1~"  beginning-of-line
bindkey "^[[4~"  end-of-line
bindkey "^[[[A"  where-is
bindkey "^[^[[A" cdup
bindkey "^[^[[B" cdpop

bindkey -M isearch "^F" history-incremental-pattern-search-backward
bindkey -M isearch "^J" history-incremental-pattern-search-forward

for f in $ZDOTDIR/rc.d/*(N); do
    source $f
done

# vim:set ft=sh fenc=utf-8 ts=4 sw=4 sts=4 et:
