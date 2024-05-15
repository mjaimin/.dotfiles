# Initialize TIMER_START_TIME and EXIT_STATUS
TIMER_START_TIME=$SECONDS
EXIT_STATUS=0

# Save the time and exit status just before any command execution
preexec() {
    TIMER_START_TIME=$SECONDS
    EXIT_STATUS=$?
}

precmd() {
    # Capture the exit status of the last command
    local exit_status=$?

    # Capture the elapsed time
    ELAPSED_TIME=$(($SECONDS - $TIMER_START_TIME))
    FORMATTED_ELAPSED_TIME=$(date -u -d @$ELAPSED_TIME +"%T")
    local columns=${COLUMNS:-$(tput cols)}
    local elapsed_length=${#FORMATTED_ELAPSED_TIME}
    local dashes_before=$(( (columns - elapsed_length - 2) / 2 ))
    local dashes_after=$(( columns - elapsed_length - dashes_before - 2 ))

    printf '\e[1;36m%*s\e[0m' "$dashes_before" '' | tr ' ' '-'
    printf "$FORMATTED_ELAPSED_TIME"  # Underline the elapsed time
    printf '\e[1;36m%*s\e[0m\n' "$dashes_after" '' | tr ' ' '-'
    echo -n $'\n'

    # Check the exit status of the last command
    if [ $exit_status -eq 0 ]; then
        echo "$fg[green]✔"
    else
        echo "$fg[red]✖"
    fi

    # Update the prompt with the latest status and other information
    PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)$(prompt_char) %{$fg[blue]%}[%D{%I:%M:%S %p}]%{$reset_color%} # '
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
# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# Mercurial settings
ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[075]%}(%{$fg[078]%}"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[214]%}*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$fg[075]%})%{$reset_color%}"

# Virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[075]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
