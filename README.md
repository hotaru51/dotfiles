# dotfiles

dotfileやツール等のセットアップスクリプトなど

## Tool

* Homebrew
    * `homebrew/Brewfile` を参照
* mise
    * `com_mise/conf.d` 配下のファイルを参照
* パッケージマネージャ管理外
    * [Session manager用プラグイン](https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
    * [gcloud CLI](https://cloud.google.com/sdk/docs/install)
    * [HackGen font](https://github.com/yuru7/HackGen)

## Usage

```sh
git clone git@github.com:hotaru51/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./deploy.sh
```

### loc_list.txt について

管理対象のファイルを追加した場合は `loc_list.txt` 内に下記フォーマットで追記する  
対象がファイル、ディレクトリに関わらず、指定した対象へのシンボリックリンクが配置先に作成される

```
<対象ファイル or ディレクトリ>:<~/を起点とした配置先>

# 例)
zshrc:.zshrc     # ~/.zshrc でシンボリックリンクが作成される
git:.config/git  # ~/.config/git でシンボリックリンクが作成される
```

## Memo

そのうち自動化したい

* gitのalias

```sh
git config --global alias.graph 'log --graph --oneline'
```

* git-secrets

```sh
git secrets --register-aws --global
```
