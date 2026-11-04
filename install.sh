#!/bin/bash

work_dir="$(cd $(dirname $0) && pwd)"

# dotfileの配置
echo 'deploy dotfiles.'
${work_dir}/scripts/deploy.sh

case "${OSTYPE}" in
    darwin* )
        echo 'bootstrap macOS.'
        ;;
    linux* )
        if [ -n "${REMOTE_CONTAINERS:-}" ] || [ -n "${CODESPACES:-}" ]; then
            echo 'bootstrap devcontainer.'
            ${work_dir}/scripts/install_devcontainer.sh
        else
            echo 'bootstrap Linux.'
        fi
        ;;
esac
