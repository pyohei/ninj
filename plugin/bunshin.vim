" ----------------------------------------------------------------------
" Bunshin plugin
" Version: 0.0.0
" Author: Phoohei
" Licence: MTI Licence
" ----------------------------------------------------------------------

let s:save_cpo = &cpoptions
set cpo&vim

" winrestcmd()
" リサイズした部分にしか影響がでないので、現実的ではない
" 単純に、今のバッファサイズを複製するような仕組みにしたら良いかも
" でもって、閉じるときは、左右のバッファを確認して、あれば、閉じる
" なければ、そのままのような感じにすれば効率よくシンプルにできるかも
" 手始めとして

if !exists('g:BUNSHIN_ROW')
    let g:BUNSHIN_ROW = 80
endif

if !exists('g:BUNSHIN_MAX')
    let g:BUNSHIN_ROW = 240
endif

let s:win_size = winrestcmd()
echo s:win_size
let s:win_sizes = split(s:win_size, ' ')
echo s:win_sizes

" windowを殖やす場合columnsizeを増やして、
" 大きさを均等にする
" 閉じるときは現在のウィンドを閉じてサイズを小さくして
" 均等にする

function! TestWindow()
    " get number of window
    let l:win_num = winnr('$')
    for l:n in range(l:win_num)
        echo l:n
    endfor
endfunction

" Control window size.
let g:window_num = 1
function! Wide_window()
    let g:window_num += 1
    let l:column_base = 80
    let l:column_size = l:column_base * g:window_num
    vs
    let &l:columns = l:column_size
endfunction
nmap <C-T><C-V> :call Wide_window()<CR><C-w>=
function! Tiny_window()
    let g:window_num -= 1
    let l:column_base = 80
    let l:column_size = l:column_base * g:window_num
    w
    bd
    let &l:columns = l:column_size
endfunction
nmap <C-T><C-N> :call Tiny_window()<CR><C-w>=



let &cpo = s:save_cpo
unlet s:save_cpo
