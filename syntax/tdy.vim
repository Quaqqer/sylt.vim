" Vim syntax file
" Language:   Thidy
" Maintainer: Edvard Thörnros

if exists("b:current_syntax") && b:current_syntax == "tdy"
    finish
endif
let b:current_syntax = "tdy"

syn keyword tdyKeyword if for fn blob print yield ret 

syn keyword tdyBool true false

syn match tdyNumber '\s\d\d*'
syn match tdyFloatA '\s\d\+\.\d*'
syn match tdyFloatB '\s\.\d\d*'

syn region tdyBlock start="{" end="}" fold transparent
syn region tdyString start='"' end='"'

syn keyword tdyTodo contained TODO FIXME XXX NOTE
syn match tdyComment "//.*$" contains=tdyTodo


hi def link tdyTodo        Todo
hi def link tdyComment     Comment
hi def link tdyKeyword     Type

hi def link tdyBool        Constant
hi def link tdyString      Constant
hi def link tdyNumber      Constant
hi def link tdyFloatA      Constant
hi def link tdyFloatB      Constant
