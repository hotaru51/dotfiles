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

function deploy_dotfile() {
    if [ "$#" -lt 1 ]; then
        echo 'Argument is missing.' 2>&1
        exit 1
    fi

    local file_path=${1}

    # 配置先にシンボリックリンクがすでに存在する場合はスキップ
    if [ -L "${file_path}" ]; then
        echo "Skip symlink creation. [${file_path}]"
        return
    fi

    # 配置先にファイルが存在する場合はバックアップ
    if [ -f "${file_path}" ]; then
        echo "Backup dotfile. [${file_path}]"
        mv ${file_path} ${backup_dir}
    fi

    # 配置先ディレクトが存在しない場合は作成
    local dst_dir=$(dirname file_path)
    if [ ! -d "${dst_dir}" ]; then
        echo "create directory. [${dst_dir}]"
        mkdir -p ${dst_dir}
    fi

    # シンボリックリンク作成
    echo "Create symlink. [${file_path}]"
    ln -s ${work_dir}/$(basename ${file_path}) ${file_path}
}

for file in "${dotfiles[@]}"
do
    deploy_dotfile $file
done
