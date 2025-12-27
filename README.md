# dotfiles

dotfile達  
[macOS用](https://github.com/hotaru51/macos-dotfiles)、[Ubuntu用](https://github.com/hotaru51/ubuntu-dotfiles)で別々に管理していたものを共通化(される予定)

## Tool

よく使うツール類メモ(WIP)

* [Homebrew](https://brew.sh/)
    * GCC(Homebrewでインストール推奨)
    * NeoVim
        * 設定周りは[nvim-config](https://github.com/hotaru51/nvim-config)参照
    * [startship](https://starship.rs/)
    * Git
    * lazygit
    * yarn
        * `--ignore-dependencies` でインストール
    * fzf
    * jq
    * grep (GNU grep, macOSのみ)
    * ripgrep
    * git-secrets
    * [jid](https://github.com/simeji/jid)
    * [terraform-ls](https://github.com/hashicorp/terraform-ls)
        * `brew install hashicorp/tap/terraform-ls`
    * [mise](https://github.com/jdx/mise)
        * ruby
        * python
        * node.js
        * go
        * terraform
        * gemini-cli(予定)
    * [rain](https://github.com/aws-cloudformation/rain)
    * direnv
    * WezTerm(cask)
    * gemini-cli
* [AWS CLI](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)
    * [Session manager用プラグイン](https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
* [AWS SAM CLI](https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/install-sam-cli.html)
* [gcloud CLI](https://cloud.google.com/sdk/docs/install)
* [HackGen font](https://github.com/yuru7/HackGen)

## Usage

```sh
# 暫定手順(macOSのみ動作確認済み)
git clone git@github.com:hotaru51/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x deploy.sh
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
