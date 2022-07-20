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

