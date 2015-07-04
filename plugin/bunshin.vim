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

if !exists('g:BUNSHIN_COLUMN')
    let g:BUNSHIN_COLUMN = 80
endif

if !exists('g:BUNSHIN_MAX')
    let g:BUNSHIN_MAX = 3
endif

" let s:win_size = winrestcmd()
" echo s:win_size
" let s:win_sizes = split(s:win_size, ' ')
" echo s:win_sizes

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

" Control window size.
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
