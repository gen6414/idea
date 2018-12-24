scriptencoding utf-8

" ***********************
"    文字コード設定
" ***********************
" バッファ文字コード
set encoding=utf-8
" ファイル書き込み時の文字コード
set fileencoding=utf-8
" ファイル読み込み時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コード
set fileformats=unix,dos,mac
"全角文字を正常に表示させる
set ambiwidth=double


" ***********************
"    dein設定
" ***********************
if &compatible
  set nocompatible
endif

" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')
" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


" ***********************
"    表示設定
" ***********************
" 行番号の表示
set number
"不可視文字の表示
set list
" 不可視文字の設定
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" ファイル名の表示
set title
" 行の折返し設定
set wrap display=lastline
" 対応する括弧を強調
set showmatch
" 対応する括弧に'<>'を追加
set matchpairs& matchpairs+=<:>
" バックスペースで消せる文字追加
set backspace=indent,eol,start
" カレント行の協調
set cursorline
" シンタックスカラー
syntax on


" ***********************
"    編集設定
" ***********************
" 補完時に大文字小文字を区別しない
set infercase
" ファイルを保存していない場合、終了時に確認する
set confirm
" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden
" ファイル保存時にバックアップファイルを作らない
set nobackup
" ファイル編集中にスワップファイルを作らない
set noswapfile
" 外部でファイルに変更がされた場合は読みなおす
set autoread
" clip board
set clipboard+=unnamedplus


" ***********************
"    検索設定
" ***********************
" 検索ワード入力時に検索（インクリメンタルサーチ）
set incsearch
" 大文字/小文字の区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索マッチテキストをハイライト
set hlsearch
"検索時、/,?をエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


" ***********************
"    タブ・インデント設定
" ***********************
" 行頭のインデント幅
set shiftwidth=2
" 行頭以外のインデント幅
set tabstop=2
" タブ入力を空白入力に置き換える
set expandtab
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent


" ***********************
"    キーバインド設定
" ***********************
"jjをEscとする
inoremap jj <Esc>
"Escを2回でハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" 画面分割
nnoremap <silent> ss :split<CR>
nnoremap <silent> si :vsplit<CR>
" 画面分割移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
" 分割画面そのものを移動
nnoremap wj <C-w>J
nnoremap wk <C-w>K
nnoremap wh <C-w>H
nnoremap wl <C-w>L
" 分割画面の高さと幅の増減
noremap <C-w>l <C-w>>
noremap <C-w>h <C-w><
noremap <C-w>k <C-w>+
noremap <C-w>j <C-w>-
" タブ
noremap <silent> tt :tabnew<CR>
noremap tn gt
noremap tp gu
" vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ
