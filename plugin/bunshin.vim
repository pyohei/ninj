" ----------------------------------------------------------------------
" Bunshin plugin
" Version: 0.0.0
" Author: Phoohei
" Licence: MTI Licence
" ----------------------------------------------------------------------
"  TODO
"       すでにwindowが広い場合、どうするか
"           (windowのサイズとバッファのサイズを比較)
"           方法
"               let w = winnr()         window番号の取得
"               let a = winwidth(w)     windowの幅を取得
"               " aが飛び抜けていたらNG
"               

let s:save_cpo = &cpoptions
set cpo&vim

if !exists('g:BUNSHIN_COLUMN')
    let g:BUNSHIN_COLUMN = 80
endif

if !exists('g:BUNSHIN_MAX')
    let g:BUNSHIN_MAX = 3
endif

command! -nargs=0 WindowWide call window#wide()
command! -nargs=0 WindowCut call window#cut()

let &cpo = s:save_cpo
unlet s:save_cpo
