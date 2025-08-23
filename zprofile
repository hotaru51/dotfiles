# NeoVim
export XDG_CONFIG_HOME=~/.config

# Homebrew
case "${OSTYPE}" in
    darwin* )
        test -f /opt/homebrew/bin/brew && \
            eval "$(/opt/homebrew/bin/brew shellenv)"
        ;;
    linux* )
        test -f /home/linuxbrew/.linuxbrew/bin/brew && \
            eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        ;;
esac

# read .zprofile_local
if [ -f ~/.zprofile_local ]; then
    . ~/.zprofile_local
fi
