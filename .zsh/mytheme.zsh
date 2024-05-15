# Initialize TIMER_START_TIME
TIMER_START_TIME=$SECONDS

# Save the time just before any command execution
preexec() {
    TIMER_START_TIME=$SECONDS
}

precmd() {
    ELAPSED_TIME=$(($SECONDS - $TIMER_START_TIME))
    FORMATTED_ELAPSED_TIME=$(date -u -d @$ELAPSED_TIME +"%T")
    local columns=${COLUMNS:-$(tput cols)}
    local elapsed_length=${#FORMATTED_ELAPSED_TIME}
    local dashes_before=$(( (columns - elapsed_length - 2) / 2 ))
    local dashes_after=$(( columns - elapsed_length - dashes_before - 2 ))

    printf '%*s' "$dashes_before" '' | tr ' ' '-'
    printf ' %s ' "$FORMATTED_ELAPSED_TIME"
    printf '%*s\n' "$dashes_after" '' | tr ' ' '-'
    echo -n $'\n'

    PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)$(prompt_char) %{$fg[blue]%}[%D{%I:%M:%S %p}]%{$reset_color%} >> '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '🕒 ±' && return
    hg root >/dev/null 2>/dev/null && echo 'Hg' && return
    echo '🕒'
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# Mercurial settings
ZSH_THEME_HG_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# Virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[075]}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
