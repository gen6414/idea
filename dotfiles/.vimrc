"#####プラグイン#####
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

"#####表示設定#####
set number          "行番号を表示する
set list            "不可視文字の可視化
set title           "編集中のファイル名を表示
set nowrap          "折り返ししない
set showmatch       "括弧入力時の対応する括弧を表示
set matchpairs& matchpairs+=<:>     " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start      " バックスペースでなんでも消せるようにする
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲  "不可視文字の設定

"#####編集設定####
set infercase       "補完時に大文字小文字を区別しなし
set confirm         "保存されていないファイルがあるときは終了前に保存確認
set hidden          "保存されていないファイルがあるときでも別のファイルを開くことが出来る
set nobackup        "ファイル保存時にバックアップファイルを作らない
set noswapfile      "ファイル編集中にスワップファイルを作らない
set autoread        "外部でファイルに変更がされた場合は読みなおす

"#####検索設定#####
set incsearch       "検索ワード入力時に検索（インクリメンタルサーチ）
set ignorecase      "大文字/小文字の区別なく検索する
set smartcase       "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan        "検索時に最後まで行ったら最初に戻る
set hlsearch        "検索マッチテキストをハイライト
"検索時、/,?をエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"#####タブ・インデント#####
set tabstop=2       "タブの幅設定
set expandtab       "タブ入力を複数の空白入力に置き換える
set softtabstop=2   "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set shiftwidth=2    "自動インデント時の1レベルあたりのインデント量
set autoindent      "改行時に前の行のインデントを継続する
set smartindent     "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"#####動作設定#####
set clipboard=unnamed,autoselect    "クリップボードにコピー出来るようにする

"#####キーバインド#####
"jjをEscとする
inoremap jj <Esc>
"Escを2回でハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"#####カラースキーム設定#####
syntax on
