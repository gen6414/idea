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
"    プラグイン設定
" ***********************
if has('vim_starting')
  set rtp+=~/.config/nvim/plugged/vim-plug
  if !isdirectory(expand('~/.config/nvim/plugged/vim-plug'))
    echo 'Install vim-plug...'
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.config/nvim/plugged/vim-plug/autoload')
  endif
endif

call plug#begin('~/.config/nvim/plugged')
" ステータスバー
Plug 'itchyny/lightline.vim'
" 語尾の空白自動削除
Plug 'bronson/vim-trailing-whitespace'
" カラースキーマ
Plug 'jacoborus/tender.vim'
Plug 'beigebrucewayne/Turtles'
" 括弧s自動補完
Plug 'cohama/lexima.vim'
" NERDTree
Plug 'scrooloose/nerdtree'
" NERDTreeのタブ間共有
Plug 'jistr/vim-nerdtree-tabs'
" NERDTreeにgit変更を表示
Plug 'Xuyuanp/nerdtree-git-plugin'
" Git修正箇所を表示
Plug 'airblade/vim-gitgutter'
" インデントライン
Plug 'Yggdroot/indentLine'
" vueシンタックス
Plug 'posva/vim-vue'
" 自動補完
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'wokalski/autocomplete-flow'
endif
call plug#end()

" NERDTree
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" NERDTree Tabs
if argc() == 0
  " ファイルが指定されていなければNERD treeを有効にする
  let g:nerdtree_tabs_open_on_console_startup = 1
end
" lightline
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ }
" vim-trailing-whitespace
autocmd BufWritePre * :FixWhitespace "ファイル保存時に余分なスペースを削除する
" deoplete
let g:deoplete#enable_at_startup = 1
function! DeopleteConfig()
  call deoplete#custom#set('_', 'converters', ['converter_auto_paren', 'converter_remove_overlap'])
  call deoplete#custom#set('_', 'min_pattern_length', 1)
  call deoplete#custom#set('buffer', 'rank', 100)
  call deoplete#custom#set('go', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#set('go', 'sorters', [])
  call deoplete#custom#set('jedi', 'disabled_syntaxes', ['Comment'])
  call deoplete#custom#set('jedi', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#set('neosnippet', 'disabled_syntaxes', ['goComment'])"
  call deoplete#custom#set('ternjs', 'rank', 0)
  call deoplete#custom#set('vim', 'disabled_syntaxes', ['Comment'])
endfunction
" indentLine
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#333333'


" ***********************
"    カラー設定
" ***********************
syntax on
colorscheme turtles


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
" TrueColorを有効
set termguicolors


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
"外部でファイルに変更がされた場合は読みなおす
set autoread



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
nnoremap <silent> sv :vsplit<CR>
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
noremap xl <C-w>>
noremap xh <C-w><
noremap xk <C-w>+
noremap xj <C-w>-
" タブ
noremap <silent> tt :tabnew<CR>
noremap tn gt
noremap tp gT
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

