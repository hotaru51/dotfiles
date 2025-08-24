#!/usr/bin/env zsh

set -ue

work_dir="$(cd $(dirname $0) && pwd)"
backup_dir="${work_dir}/old"

test ! -d ${backup_dir} && mkdir ${backup_dir}

function deploy_dotfile() {
    if [ "$#" -lt 1 ]; then
        echo 'Argument is missing.' 2>&1
        exit 1
    fi

    local src_file="$(echo "${1}" | cut -d ':' -f 1)"
    local dst_file="$(echo "${1}" | cut -d ':' -f 2)"

    local src_path="${work_dir}/${src_file}"
    local dst_path="${HOME}/${dst_file}"

    # src_pathが存在しない場合はスキップ
    if [ ! -f "${src_path}" ] && [ ! -d "${src_path}" ]; then
        echo "source file not found. [${src_path}]"
        return
    fi

    # 配置先にシンボリックリンクがすでに存在する場合
    if [ -L "${dst_path}" ]; then
        # シンボリックリンクのリンク先が元ファイルと同じならスキップ
        if [ "$(readlink -f "${dst_path}")" = "${src_path}" ]; then
            echo "Skip symlink creation. [${dst_path}]"
            return
        fi
    fi

    # 配置先にファイル or ディレクトリが存在する場合はバックアップ
    if [ -f "${dst_path}" ] || [ -d "${dst_path}" ]; then
        echo "Backup dotfile. [${dst_path}]"
        mv ${dst_path} ${backup_dir}
    fi

    # 配置先ディレクトが存在しない場合は作成
    local dst_dir=$(dirname ${dst_path})
    if [ ! -d "${dst_dir}" ]; then
        echo "create directory. [${dst_dir}]"
        mkdir -p ${dst_dir}
    fi

    # シンボリックリンク作成
    echo "Create symlink. [${src_path} -> ${dst_path}]"
    ln -sf ${src_path} ${dst_path}
}

while read line
do
    deploy_dotfile "${line}"
done < ${work_dir}/loc_list.txt
