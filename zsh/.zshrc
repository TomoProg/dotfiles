# lsコマンドを色付きで表示
alias ls='ls --color'

# vimコマンドでnvimを呼ぶように変更
alias vim='nvim'
alias vi='nvim'

# Ctrl + Sの画面停止機能を無効化
stty stop undef 

# ^R の履歴検索を peco 対応にする
# https://qiita.com/shepabashi/items/f2bc2be37a31df49bca5
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# zsh-autosuggestionsの読み込み
# インストール方法
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
# のManualのところを参考
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# rbenvのセットアップ
eval "$(rbenv init -)"

# byYourSideのminioにつなぐ
alias minio3='aws --profile minio --endpoint-url http://192.168.56.112:9000 s3'

# コマンドラインで#をコメントアウトとして使えるようにする
setopt interactivecomments

