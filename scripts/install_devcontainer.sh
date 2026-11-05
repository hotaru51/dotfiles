#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    build-essential \
    procps \
    curl \
    file \
    git \
    zsh \
    zip

# change default shell
sudo chsh -s "$(command -v zsh)" "$(id -un)"

# install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install Homebrew packages
export XDG_CONFIG_HOME=~/.config
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew bundle --global install

# install mise packages
eval "$(mise activate bash)"
# 必ずしも必要なケースが少ないので予め除外
mise_disabled=('ruby' 'go' 'terraform')
# devcontainerに含まれるか確認する言語
mise_check_exists=('python' 'node')

for lang in "${mise_check_exists[@]}"; do
    if command -v ${lang} > /dev/null 2>&1; then
        mise_disabled+=("${lang}")
    fi
done

mise_disable_value=$(IFS=,; echo "${mise_disabled[*]}")
MISE_DISABLE_TOOLS=${mise_disable_value} mise install
echo "export MISE_DISABLE_TOOLS=${mise_disable_value}" >> ${HOME}/.zprofile_local

# clone NeoVim config
git clone https://github.com/hotaru51/nvim-config.git ~/.config/nvim
