" Sylt filetype plugin file
" Language: Sylt 0.2.0+
" Last change: 2021 Nov 22

" Don't load multiple filetypes
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

if exists("loaded_matchit")

    " Works somewhat okay, very hard to create a regex that matches implicit
    " do in functions when a parameter of a function is another function.
    " Matches do and enum with end.
    let b:match_ignorecase = 0
    let b:match_words =
      \ '\<do\>' .
      \ '\|' .
      \ '\<enum\>' .
      \ ':' .
      \ '\<end\>'
    let b:match_skip = 's:syltComment\|syltString'
endif " exists("loaded_matchit")

let &cpo = s:cpo_save
unlet s:cpo_save
