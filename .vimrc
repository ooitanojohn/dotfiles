"
"  dein.vim
"
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  let s:toml = '~/.vim/dein/dein.toml'
  call dein#load_toml(s:toml, {'lazy':0})
 
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" color theme 
color hatsunemiku

" vim-airline-themes プラグイン 
"let g:airline_theme = 'dark' 
let g:airline_theme = 'hatsunemiku' 
"let g:airline_theme = 'hatsunemiku_light' 

" タブ設定
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
let g:airline#extensions#tabline#buffer_idx_mode = 1 " タブに番号を表示
nmap <C-p> <Plug>AirlineSelectPrevTab   
nmap <C-n> <Plug>AirlineSelectNextTab 
let g:airline_powerline_fonts = 1            " Powerline Fontsを利用

" Ctrl-mでNERDTreeを開く
map <C-m> :NERDTreeToggle<CR>
" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" 行番号を表示
set number
"Tabをスペース2つに展開&Tabの設定
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
"日本語化
set helplang=ja
"シンタックスハイライトを有効
syntax enable
"クリップボードを有効
set clipboard=unnamedplus

" キーバインド
noremap <c-j> <esc>
noremap! <c-j> <esc>

" molokai配色
let g:molokai_original = 1

" インデント
let g:indent_guides_enable_on_vim_startup = 1

" phpProc
" 画面を分割して定義元へのジャンプ
function! DefinitionJumpWithPhpactor()
    split
    call phpactor#GotoDefinition()
endfunction
" useの補完
nmap <silent><Leader>u      :<C-u>call phpactor#UseAdd()<CR>
" コンテキストメニューの起動(カーソル下のクラスやメンバに対して実行可能な選択肢を表示してくれます)
nmap <silent><Leader>mm     :<C-u>call phpactor#ContextMenu()<CR>
" ナビゲーションメニューの起動(クラスの参照元を列挙したり、他ファイルへのジャンプなど)
nmap <silent><Leader>nn     :<C-u>call phpactor#Navigate()<CR>
" カーソル下のクラスやメンバの定義元にジャンプ
nmap <silent><Leader>o      :<C-u>call phpactor#GotoDefinition()<CR>
" 編集中のクラスに対し各種の変更を加える(コンストラクタ補完、インタフェース実装など)
nmap <silent><Leader>tt     :<C-u>call phpactor#Transform()<CR>
" 新しいクラスを生成する(編集中のファイルに)
nmap <silent><Leader>cc     :<C-u>call phpactor#ClassNew()<CR>
" 選択した範囲を変数に抽出する
nmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:false)<CR>
" 選択した範囲を変数に抽出する
vmap <silent><Leader>ee     :<C-u>call phpactor#ExtractExpression(v:true)<CR>
" 選択した範囲を新たなメソッドとして抽出する
vmap <silent><Leader>em     :<C-u>call phpactor#ExtractMethod()<CR>
" split → jump
nmap <silent><C-w><Leader>o :<C-u>call DefinitionJumpWithPhpactor()<CR>
" カーソル下のクラスや変数の情報を表示する
" 他のエディタで、マウスカーソルをおいたときに表示されるポップアップなどに相当
vmap <silent><Leader>hh     :<C-u>call phpactor#Hover()<CR>
" 自動補完出す
autocmd FileType php setlocal omnifunc=phpactor#Complete

"ファイル変更があった際に自動読み込み変更
set autoread

" needtree 🗄更新があった際にctrl + rで読み取る
nmap <C-r> :NERDTreeRefreshRoot<CR>
 
" esc inore
inoremap <silent> jj <esc>
