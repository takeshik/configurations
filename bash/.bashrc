shopt -s \
	autocd \
	checkjobs \
	checkwinsize \
	completion_strip_exe \
	extglob \
	globstar \
	globasciiranges \
	histappend \
	histreedit \
	histverify \
	nocaseglob \
	nocasematch \
	;

export PS1='\[\033[34;1m\]\w\[\033[;33m\]`__git_ps1`\[\033[0m\] $ '
HISTSIZE=-1
HISTFILESIZE=-1

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
alias gr='\grep'
alias s='dirs -v'
alias l='$PAGER'
alias v='git'
alias k='kill'
alias K='kill -KILL'
alias ka='killall'
alias KA='killall -KILL'
alias ssu='sudo -i'
alias r='popd'
alias j='jobs -lp'
alias H='head'
alias T='tail'
alias TF='tail -F'

__git_complete v __git_main

for f in $HOME/.bash/rc.d/*; do
    source $f
done
