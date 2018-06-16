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

" プラグインON
filetype plugin indent on
