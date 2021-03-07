" Vim syntax file
" Language:   Sylt
" Maintainer: Edvard Thörnros

"
" Shamelessly stealen from moon.vim
"

if exists("b:current_syntax") && b:current_syntax == "sy"
    finish
endif
let b:current_syntax = "sy"

syn keyword syltKeyword if else for in fn blob print yield ret use

syn keyword syltBool true false

syn match syltNumber /\i\@<![-+]\?\d\+\%([eE][+-]\?\d\+\)\?/ display
syn match syltFloat /\i\@<![-+]\?\d*\.\@<!\.\d\+\%([eE][+-]\?\d\+\)\?/ display

syn region syltBlock start="{" end="}" fold transparent
syn region syltString start='"' end='"'

syn keyword syltTodo contained TODO FIXME XXX NOTE
syn match syltComment "//.*$" contains=syltTodo


hi def link syltTodo        Todo
hi def link syltComment     Comment
hi def link syltKeyword     Type

hi def link syltBool        Constant
hi def link syltString      Constant
hi def link syltNumber      Constant
hi def link syltFloat       Constant

" An error for trailing whitespace, as long as the line isn't just whitespace
if !exists("sylt_no_trailing_space_error")
  syn match syltSpaceError /\S\@<=\s\+$/ display
  hi def link syltSpaceError Error
endif

" An error for trailing semicolons, for help transitioning from JavaScript
if !exists("sylt_no_trailing_semicolon_error")
  syn match syltSemicolonError /;$/ display
  hi def link syltSemicolonError Error
endif
