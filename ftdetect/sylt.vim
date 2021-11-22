" Vim syntax file
" Language:   Sylt
" Maintainer: Edvard Thörnros

autocmd BufNewFile,BufRead *.sy set filetype=sylt

function! s:DetectSy()
    if getline(1) =~ '^#!.*\<sy\>'
        set filetype=sylt
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectSy()
