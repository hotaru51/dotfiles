# set command alias
alias ls="ls --color"
alias ll="ls -l"
alias la="ls -a"
if [ -f "$(which nvim)" ]; then
    alias vi=nvim
    alias vim=nvim
fi

# zsh completion
autoload -Uz compinit
compinit

# anyenv
if [ -f "$(which anyenv)" ]; then
    eval "$(anyenv init -)"
fi

# ssh config hosts
ssh-hosts() {
    if [ "$#" -ge 1 ]; then
        grep -r -E '^[Hh]ost\s' ~/.ssh | awk '{print $NF}' | sed -e '/^\*$/d' | grep "${1}"
    else
        grep -r -E '^[Hh]ost\s' ~/.ssh | awk '{print $NF}' | sed -e '/^\*$/d'
    fi
}

# fssh
function fssh() {
    if [ ! -f "$(which fzf)" ]; then
        echo 'fzf not found.'
        return 1
    fi

    if [ "$#" -ge 1 ]; then
        local ssh_hostname="$(ssh-hosts "${1}" | fzf)"
    else
        local ssh_hostname="$(ssh-hosts | fzf)"
    fi

    if [ -n "${ssh_hostname}" ]; then
        echo "ssh ${ssh_hostname}"
        ssh "${ssh_hostname}"
    fi
}

# AWS CLI
# see [https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-configure-completion.html]
if [ -f "$(which aws_completer)" ]; then
    autoload bashcompinit
    bashcompinit
    complete -C "$(which aws_completer)" aws
fi

# Starship
if [ -f "$(which starship)" ]; then
    eval "$(starship init zsh)"
fi

# read .zshrc_local
if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi
