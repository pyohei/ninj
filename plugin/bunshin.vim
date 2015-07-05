" ----------------------------------------------------------------------
" Bunshin plugin
" Version: 0.0.0
" Author: Phoohei
" Licence: MTI Licence
" ----------------------------------------------------------------------
"  TODO
"       autoloadへ移動
"       command定義を追加
"       すでにwindowが広い場合、どうするか
"           (windowのサイズとバッファのサイズを比較)

let s:save_cpo = &cpoptions
set cpo&vim

if !exists('g:BUNSHIN_COLUMN')
    let g:BUNSHIN_COLUMN = 80
endif

if !exists('g:BUNSHIN_MAX')
    let g:BUNSHIN_MAX = 3
endif

function! TestWindow()
    if !has('gui')
        echo 'This commamd is for gui vim'
        return
    endif 
    let win_size = &co
    let l:buf_size = g:BUNSHIN_COLUMN / 2
    let l:wide_max_size = l:win_size + l:buf_size
    let l:cur_win_num = l:wide_max_size / g:BUNSHIN_COLUMN
    if l:cur_win_num >= g:BUNSHIN_MAX
        echo 'Full of window'
        return
    endif
    let l:win_size = (l:cur_win_num + 1) * g:BUNSHIN_COLUMN
    let &columns = l:win_size
    vsplit<CR>
endfunction

function! TestWindow2()
    if !has('gui')
        echo 'This commamd is for gui vim'
        return
    endif 
    let l:cur_win_size = &co
    let l:buf_size = g:BUNSHIN_COLUMN / 2
    let l:wide_min_size = g:BUNSHIN_COLUMN + l:buf_size
    if l:wide_min_size >= l:cur_win_size
        echo 'Minimum window'
        return
    endif
    w
    close
    let l:win_size = l:cur_win_size - g:BUNSHIN_COLUMN
    let &columns = l:win_size
    " Unable <C-W> command with 'windcmd'
    wincmd =
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
