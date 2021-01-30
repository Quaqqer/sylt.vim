" Vim syntax file
" Language:   Thidy
" Maintainer: Edvard Thörnros

autocmd BufNewFile,BufRead *.tdy set filetype=tdy

function! s:DetectTdy()
    if getline(1) =~ '^#!.*\<tdy\>'
        set filetype=tdy
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectTdy()
