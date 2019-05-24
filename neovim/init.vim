" 色分け機能追加
syntax on

" 行番号表示
set number

" タブ幅
set tabstop=4

" スマートインデント
set smartindent

" 括弧を入力した際に対応する括弧に飛ぶ
" 対応する括弧に飛ぶ時間
set showmatch
set matchtime=1

" 検索が末尾まで進んだら先頭から再開する
set wrapscan

" '<', '>'で進む幅
set shiftwidth=4

" スワップファイルを作成しない
set noswapfile

" 行を折り返さない
set nowrap

" 空白文字などの特殊な文字を表示する
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

" undoファイルを作成する
set undofile
set undodir=/tmp

" ----- ここからdein.vimの設定 -----
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " 追加プラグイン
  call dein#add('scrooloose/nerdtree')

  call dein#end()
  if dein#check_install()
    call dein#install()
  endif
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

