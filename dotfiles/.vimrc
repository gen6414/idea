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
Plug 'itchyny/lightline.vim'           "ステータスバー
Plug 'bronson/vim-trailing-whitespace' "語尾空白削除
Plug 'posva/vim-vue'                   "Vue.jsシンタックス
Plug 'jacoborus/tender.vim'            "カラースキーマ
Plug 'cohama/lexima.vim'               "括弧補完
Plug 'scrooloose/nerdtree'             "NERDTree
Plug 'jistr/vim-nerdtree-tabs'         "NERDTreeのタブ間共有
Plug 'Xuyuanp/nerdtree-git-plugin'     "NERDTreeにgit変更を表示
Plug 'airblade/vim-gitgutter'          "git差分を表示
call plug#end()

"NERDTree
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"NERDTree Tabs
if argc() == 0
  " ファイルが指定されていなければNERD treeを有効にする
  let g:nerdtree_tabs_open_on_console_startup = 1
end
"lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ }
"vim-trailing-whitespace
autocmd BufWritePre * :FixWhitespace "ファイル保存時に余分なスペースを削除する

"##### 表示設定 #####
set number          "行番号を表示する
set list            "不可視文字の可視化
set title           "編集中のファイル名を表示
set nowrap          "折り返ししない
set showmatch       "括弧入力時の対応する括弧を表示
set matchpairs& matchpairs+=<:>     " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start      " バックスペースでなんでも消せるようにする
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲  "不可視文字の設定
set cursorcolumn
set cursorline

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
"セパレート関連
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

"##### カラースキーム設定 #####
syntax on
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme tender
