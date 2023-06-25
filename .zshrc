# set command alias
alias ls="ls --color"
alias ll="ls -l"
alias la="ls -a"
if [ -f "$(which nvim)" ]; then
    alias vi=nvim
    alias vim=nvim
fi
test -f "$(which lazygit)" && alias lg=lazygit

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=100000

setopt inc_append_history
setopt share_history

# zsh completion
autoload -Uz compinit
compinit

# anyenv
if [ -f "$(which anyenv)" ]; then
    eval "$(anyenv init -)"
fi

# ssh config hosts
function ssh-hosts() {
    if [ "$#" -ge 1 ]; then
        grep -r -E '^[Hh]ost\s' ~/.ssh | grep -Ev '[Hh]ost (ssm_\*|\*)$' | awk '{print $NF}' | grep "${1}"
    else
        grep -r -E '^[Hh]ost\s' ~/.ssh | grep -Ev '[Hh]ost (ssm_\*|\*)$' | awk '{print $NF}'
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

# gcloud
case "${OSTYPE}" in
    darwin* )
        if [ -f "${HOME}/.google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/.google-cloud-sdk/path.zsh.inc"; fi
        if [ -f "${HOME}/.google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/.google-cloud-sdk/completion.zsh.inc"; fi
        ;;
esac

# read .zshrc_local
if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi
