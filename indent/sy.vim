" Language: Sylt

if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetSyltIndent(v:lnum)

if exists("*GetSyltIndent")
    finish
endif

let s:INDENT_AFTER_BRACE = '[^{]*{[^}]*'
let s:OUTDENT_AFTER_BRACE = '[^}]*}[^{]*'

func! s:GetPrevNonCodeLineNum(line_num)
    let SKIP_LINES = '^\s*//'
    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) !~? SKIP_LINES
            break
        endif
    endwhile
endfunc

func! GetSyltIndent(curlinenum)
    if a:line_num == 0
        return 0
    endif

    let this_line = getline(a:line_num)

    let prev_codeline_num = s:GetPrevCodeLineNum(a:line_num)
    let prev_codeline = getline(prev_codeline_num)
    let prev_indent = indent(prev_codeline_num)

    if prevline =~ s:INDENT_AFTER_BRACE
        return prev_indent + &shiftwidth
    endif

    if prevline =~ s:OUTDENT_AFTER_BRACE
        return prev_indent - &shiftwidth
    endif

    return -1
endfunc
