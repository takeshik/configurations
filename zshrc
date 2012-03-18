### OPTIONS ###
setopt \
    always_last_prompt \
    append_history \
    auto_cd \
    auto_list \
    auto_menu \
    auto_param_keys \
    auto_param_slash \
    auto_pushd \
    complete_in_word \
    extended_glob \
    extended_history \
    hash_all \
    hist_expand \
    hist_ignore_dups \
    hist_ignore_space \
    hist_no_store \
    hist_reduce_blanks \
    inc_append_history \
    list_ambiguous \
    list_packed \
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

### VARIABLES ###
export PROMPT='[%B%{%(?.${fg[yellow]}.${fg[magenta]})%}%h%b%{${reset_color}%}|%B%U%{${fg[red]}%}%n@%M%u%b%{${reset_color}%}:%B%{${fg[blue]}%}%d%b%{${reset_color}%}]%(1j.%B%{${fg[green]}%}%#%b%{${reset_color}%}.%#) ';
export RPROMPT='(r:%? s:`echo $(( \`dirs -p | wc -l\` - 1))` j:%j%)'
export PROMPT2='%B%{${fg[black]}%}--->%b%{${reset_color}%} '
export RPROMPT2='%_'

HISTFILE=~/.zsh_history
HISTSIZE=99999999
SAVEHIST=99999999
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
watch=(all all)

### STYLES ###
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

### KEYBINDS ###
bindkey -e
bindkey "^?"    backward-delete-char
bindkey "^_"    describe-key-briefly
bindkey "^F"    history-incremental-pattern-search-backward
bindkey "^H"    backward-kill-word
bindkey "^K"    kill-region
bindkey "^P"    push-input
bindkey "^Y"    yank
bindkey "^[OA"  history-search-backward
bindkey "^[OB"  history-search-forward
bindkey "^[OD"  backward-word
bindkey "^[OC"  forward-word
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[[A" where-is

### ALIASES ###
alias -g ls='ls -av --color=auto'
alias -g ls!='ls -R'
alias -g ll='ls -l'
alias -g ll!='ll -R'
alias -g rm='rm -v'
alias -g rm!='rm -R'
alias -g rm!!='rm! -f'
alias -g cp='cp -av'
alias -g cp!='cp -f'
alias -g ln='ln -v'
alias -g ln!='ln -f'
alias -g mv='mv -v'
alias -g mv!='mv -f'
alias -g mkdir='mkdir -pv'
alias -g md='mkdir'
alias -g chown='chown -cv'
alias -g chown!='chown -R'
alias -g chgrp='chgrp -cv'
alias -g chgrp!='chgrp -R'
alias -g chmod='chmod -cv'
alias -g chmod!='chmod -R'
alias -g chacl!='chacl -r'
alias -g getfacl='getfacl --tabular'
alias -g getfacl!='getfacl -LR'
alias -g setfacl!='setfacl -LR'
alias -g pwd='pwd -P'
alias -g grep='grep -n --color'
alias -g history='history -Ddi'
alias -g ps='ps -AHo pid,user,group,%cpu,%mem,nlwp,vsize,rssize,tname,stat,ni,start_time,cputime,args'
alias -g ja='LANG=ja_JP.UTF8 LC_ALL=ja_JP.UTF-8'
alias -g en='LANG=en_US.UTF8 LC_ALL=en_US.UTF-8'
alias -g h='history 0'
alias -g g='grep'
alias -g s='dirs'
alias -g l='$PAGER'
alias -g k='kill'
alias -g K='kill -KILL'
alias -g ka='killall'
alias -g KA='killall -KILL'
alias -g r='popd'
alias -g j='jobs'
alias -g H='head'
alias -g T='tail'
alias -g TF='tail -F'

### AUTOLOADS ###
autoload -U colors; colors
autoload -U compinit; compinit
autoload    zed
autoload -U zmv

### FUNCTIONS ###

function cd() {
    builtin cd $@ && ls;
}

