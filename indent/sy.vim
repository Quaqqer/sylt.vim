" Language: Sylt

if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetSyltIndent(v:lnum)

if exists("*GetSyltIndent")
    finish
endif

let s:COMMENT = '^\s*//'
let s:INDENT_AFTER_BRACE = '{'
let s:OUTDENT_AFTER_BRACE = '^[^{]*}'
let s:SKIP_OPEN_CLOSE_BRACE = '{.*}'

func! s:GetPrevCodeLineNum(line_num)
    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) !~? s:COMMENT
            break
        endif
    endwhile
    return nline
endfunc

func! GetSyltIndent(line_num)
    if a:line_num == 0
        return 0
    endif

    let this_line = getline(a:line_num)

    let prev_codeline_num = s:GetPrevCodeLineNum(a:line_num)
    let prev_codeline = getline(prev_codeline_num)
    let prev_indent = indent(prev_codeline_num)

    if this_line =~ s:COMMENT
        return prev_indent
    endif

    if this_line =~ s:OUTDENT_AFTER_BRACE
        return prev_indent - &shiftwidth
    endif

    if prev_codeline =~ s:SKIP_OPEN_CLOSE_BRACE
        return prev_indent
    endif

    if prev_codeline =~ s:INDENT_AFTER_BRACE
        return prev_indent + &shiftwidth
    endif

    return prev_indent
endfunc
