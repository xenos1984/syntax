" GNU assempler syntax for vim

if exists("b:current_syntax")
	finish
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword=48-57,a-z,A-Z,%,.,_

syn case match

" Numbers:
syn match gasDecimalNumber "\<\$\?-\?\d\+\>"
syn match gasBinaryNumber "\<\$\?-\?0b[01]\+\>"
syn match gasOctalNumber "\<\$\?-\?0\d\+\>"
syn match gasHexNumber "\<\$\?-\?0x\x\+\>"

" Strings:
syn region gasString start=/"/ end=/"/ skip=/\\"/

" Labels:
syn match gasLabel "^\s*[a-zA-Z.][a-zA-Z0-9]*:"
syn match gasLocal "^\s*\d\+:"
syn match gasLocal "\<\d\+[bf]\>"

" Assembler directives

" Data types:
syn keyword gasKeyType .ascii .asciz .byte .double .float .hword .int .long .octa .quad .short .single .space .string .string8 .string16 .word

" Macros:
syn keyword gasKeyMacro .altmacro .macro .noaltmacro .endm .func .endfunc

" Conditionals:
syn keyword gasKeyCond .if .else .elseif .endif

" Includes:
syn keyword gasKeyInclude .include .incbin

" Sections:
syn match gasSection "^\s*\.section\s\+[.a-zA-Z]\+\s*\(,.*\)\?$"

" Symbols:
syn match gasSymbol "^\s*\.\(extern\|global\)\s\+[.a-zA-Z]\+\s*$"

" Code generation options:
syn keyword gasKeyCode .code16 .code32 .code64

" Comments:
syn keyword gasTodo contained TODO
syn region gasComment start="/\*" end="\*/" contains=gasTodo
syn region gasComment start="//" end="$" keepend contains=gasTodo

" Highlighting:
hi def link gasKeyType Type
hi def link gasKeyMacro Macro
hi def link gasKeyCond Conditional
hi def link gasKeyCode Special
hi def link gasString String
hi def link gasDecimalNumber Number
hi def link gasBinaryNumber Number
hi def link gasOctalNumber Number
hi def link gasHexNumber Number
hi def link gasLabel Label
hi def link gasLocal Tag
hi def link gasComment Comment
hi def link gasTodo Todo
hi def link gasSection StorageClass
hi def link gasSymbol Function

if !exists('g:gasDisablePreproc') && !exists('b:gasDisablePreproc')
	syn include @cPP syntax/c.vim
	syn match cPPLineCont "\\$" contained
	syn region cPPPreProc start=/^\s*#\s*\(if\|else\|endif\|define\|include\)/ end=/$/ contains=@cPP,cPPLineCont
endif

let b:current_syntax = "gas"

let &cpo = s:cpo_save
unlet s:cpo_save

