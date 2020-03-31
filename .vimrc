filetype on
syntax on

set history=1000
set nocompatible

" 自動縮排：?用自動縮排以後，在貼上剪貼簿的資料時排版可能會亂掉，這時可以手動切換至貼上模式
" :set paste 再進行貼上。
set ai
filetype plugin indent on
"set autoindent 
"set smartindent
set showmatch
"set expandtab
"set shiftwidth=4
"set softtabstop=4
"set tabstop=4
set cindent

set ruler
set number
" set relativenumber

" good in search mode
set incsearch

set cursorline
" set cursorcolumn
" set cursorline

set nowrap
set background=dark
set hls
set noeb
" set mouse=nv
" 自動切換當前目?。
" set autochdir
" set encoding=utf-8
" set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

" For clipboard settings
" Teraterm tutorial : http://tateren.hateblo.jp/entry/2017/07/21/213020
source ~/bin/osc52.vim
vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>
