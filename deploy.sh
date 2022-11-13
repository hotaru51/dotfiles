#!/usr/bin/env zsh

set -ue

work_dir=$(cd $(dirname $0); pwd)
backup_dir=${work_dir}/old
config_dir=${HOME}/.config

dotfiles=(
    ${HOME}/.zprofile
    ${HOME}/.zshrc
    ${config_dir}/starship.toml
)

test ! -d ${backup_dir} && mkdir ${backup_dir}
test ! -d ${config_dir} && mkdir ${config_dir}

for file in "${dotfiles[@]}"
do
    # dotfileが存在する場合はバックアップ
    if [ -f "${file}" ]; then
        mv ${file} ${backup_dir}
    fi

  # シンボリックリンク作成
  ln -s ${work_dir}/$(basename ${file}) ${file}
done
