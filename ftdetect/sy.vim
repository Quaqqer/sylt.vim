" Vim syntax file
" Language:   Sylt
" Maintainer: Edvard Thörnros

autocmd BufNewFile,BufRead *.sy set filetype=sy

function! s:DetectTdy()
    if getline(1) =~ '^#!.*\<sy\>'
        set filetype=sy
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectTdy()
