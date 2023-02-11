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
    * tig
    * lazygit(試用中)
    * yarn
    * fzf
    * jq
    * [jid](https://github.com/simeji/jid)
    * [terraform-ls](https://github.com/hashicorp/terraform-ls)
    * [anyenv](https://github.com/anyenv/anyenv)
        * rbenv
        * pyenv
        * nodenv
        * goenv
        * tfenv
    * [rain](https://github.com/aws-cloudformation/rain)
* [AWS CLI](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)
    * [Session manager用プラグイン](https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
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

## Memo

そのうち自動化したい

* gitのalias

```sh
git config --global alias.graph 'log --graph --oneline'
```
