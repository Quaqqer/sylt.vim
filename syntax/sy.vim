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


hi link syltTodo        Todo
hi link syltComment     Comment
hi link syltKeyword     Keyword

hi link syltBool        Boolean
hi link syltString      String
hi link syltNumber      Number
hi link syltFloat       Float

syn match syltOp "\v\*"
syn match syltOp "\v/"
syn match syltOp "\v\+"
syn match syltOp "\v-"
syn match syltOp "\v!"
syn match syltOp "\v\&\&"
syn match syltOp "\v\|\|"
syn match syltOp "\v\*\="
syn match syltOp "\v/\="
syn match syltOp "\v\+\="
syn match syltOp "\v-\="
syn match syltOp "\v\="
syn match syltOp "\v:"

hi link syltOp       Operator

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
