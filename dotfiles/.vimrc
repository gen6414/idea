set encoding=utf-8
scriptencoding utf-8

"##### 文字コード #####
set fileencoding=utf-8                        "保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 "読み込み時の文字コード自動判別。左側優先
set fileformats=unix,dos,mac                  "改行コード自動判別。左側優先
set ambiwidth=double                          "□や○が崩れる問題を解消

"##### プラグイン #####
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'Install vim-plug...'
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  endif
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
call plug#end()

"NERDTree
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ }

"##### 表示設定 #####
set number          "行番号を表示する
set list            "不可視文字の可視化
set title           "編集中のファイル名を表示
set nowrap          "折り返ししない
set showmatch       "括弧入力時の対応する括弧を表示
set matchpairs& matchpairs+=<:>     " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start      " バックスペースでなんでも消せるようにする
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲  "不可視文字の設定

"##### 編集設定 ####
set infercase       "補完時に大文字小文字を区別しなし
set confirm         "保存されていないファイルがあるときは終了前に保存確認
set hidden          "保存されていないファイルがあるときでも別のファイルを開くことが出来る
set nobackup        "ファイル保存時にバックアップファイルを作らない
set noswapfile      "ファイル編集中にスワップファイルを作らない
set autoread        "外部でファイルに変更がされた場合は読みなおす

"##### 検索設定 #####
set incsearch       "検索ワード入力時に検索（インクリメンタルサーチ）
set ignorecase      "大文字/小文字の区別なく検索する
set smartcase       "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan        "検索時に最後まで行ったら最初に戻る
set hlsearch        "検索マッチテキストをハイライト
"検索時、/,?をエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"##### タブ・インデント #####
set tabstop=2       "タブの幅設定
set expandtab       "タブ入力を複数の空白入力に置き換える
set softtabstop=2   "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set shiftwidth=2    "自動インデント時の1レベルあたりのインデント量
set autoindent      "改行時に前の行のインデントを継続する
set smartindent     "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"##### ペースト設定 #####
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"##### キーバインド #####
"jjをEscとする
inoremap jj <Esc>
"Escを2回でハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"##### カラースキーム設定 #####
syntax on
