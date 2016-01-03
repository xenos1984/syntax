" Game Description Language syntax for vim

if exists("b:current_syntax")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword=48-57,a-z,A-Z

syntax case ignore

syntax cluster gdlKeyword contains=gdlGeneral,gdlInput,gdlOutput,gdlOther

syntax keyword gdlGeneral contained base input role init
syntax keyword gdlInput contained true does
syntax keyword gdlOutput contained legal next goal terminal
syntax keyword gdlOther contained or distinct not

syntax match gdlVar /?\w\+/ contained

syntax match gdlFunc /(\@<=\w\+/ contained contains=@gdlKeyword

"syntax match gdlDelim /(\|)/

syntax match gdlRuleOp +<=+ contained nextgroup=gdlHead skipwhite skipnl skipempty

syntax region gdlComment start=";" end="$"

syntax region gdlRule start="(<="rs=s+1 end=")" contains=gdlRuleOp,gdlFact,gdlVar

"syntax region gdlHead start="(\w\+"rs=s+1 end=")" contained contains=gdlGeneral,gdlOutput,gdlFact nextgroup=gdlBody

"syntax region gdlBody start="(\w\+"rs=s+1 end=")" contained contains=gdlGeneral,gdlInput,gdlOther,gdlFact nextgroup=gdlBody

syntax region gdlFact start="(\w\+"rs=s+1 end=")" contains=gdlFunc,gdlFact,gdlVar

hi def link gdlComment Comment
hi def link gdlVar Identifier
hi def link gdlRuleOp Conditional
hi def link gdlGeneral PreProc
hi def link gdlInput Keyword
hi def link gdlOutput Keyword
hi def link gdlOther Operator
"hi def link gdlHead Delimiter
"hi def link gdlBody Delimiter

"hi gdlHead ctermfg=Red ctermbg=NONE cterm=bold,underline guifg=Red guibg=NONE gui=bold,underline

let b:current_syntax = "gdl"

let &cpo = s:cpo_save
unlet s:cpo_save

