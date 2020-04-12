if [[ $(uname) =~ "MINGW*" ]]; then
    local p_pwd="%B%{$fg[blue]%}%~%b%{$reset_color%}"
    local p_suffix="%(1j.%B%{$fg[yellow]%}%(!.#.$)%b%{$reset_color%}.%(!.#.$))"
    export PROMPT="${p_pwd} ${p_suffix} "

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' use-simple true
    zstyle ":vcs_info:*" check-for-changes false
fi
