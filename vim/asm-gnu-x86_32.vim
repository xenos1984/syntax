" GNU x86 (32 bit) assempler syntax for vim

if exists("b:current_syntax")
	finish
endif

runtime! syntax/asm-gnu.vim

let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword=48-57,a-z,A-Z,%,.,_

syn case match

" Registers:
if (exists('g:gas_register_prefix') && (g:gas_register_prefix == 1)) || (exists('b:gas_register_prefix') && (b:gas_register_prefix == 1))
	syn keyword gasRegX86General %eax %ebx %ecx %edx %ax %bx %cx %dx %ah %al %bh %bl %ch %cl %dh %dl
	syn keyword gasRegX86General %edi %esi %esp %ebp %di %si %sp %bp %eip %ip %eflags
	syn keyword gasRegX86Segment %cs %ds %es %fs %gs %ss
	syn keyword gasRegX86Control %cr0 %cr2 %cr3 %cr4 %cr8
	syn keyword gasRegX86Debug %dr0 %dr1 %dr2 %dr3 %dr6 %dr7
	syn keyword gasRegX86Test %tr3 %tr4 %tr5 %tr6 %tr7
else
	syn keyword gasRegX86General eax ebx ecx edx ax bx cx dx ah al bh bl ch cl dh dl
	syn keyword gasRegX86General edi esi esp ebp di si sp bp eip ip eflags
	syn keyword gasRegX86Segment cs ds es fs gs ss
	syn keyword gasRegX86Control cr0 cr2 cr3 cr4 cr8
	syn keyword gasRegX86Debug dr0 dr1 dr2 dr3 dr6 dr7
	syn keyword gasRegX86Test tr3 tr4 tr5 tr6 tr7
endif

" Instructions:
if (exists('g:gas_instruction_size') && (g:gas_instruction_size == 1)) || (exists('b:gas_instruction_size') && (b:gas_instruction_size == 1))
	syn keyword gasInstrX86General movb movw movl addb addw addl subb subw subl
else
	syn keyword gasInstrX86General mov add sub
endif

" Highlighting:
hi link gasRegX86General Identifier
hi link gasRegX86Segment Identifier
hi link gasRegX86Debug Identifier
hi link gasRegX86Control Identifier
hi link gasRegX86Test Identifier
hi link gasInstrX86General Statement

let &cpo = s:cpo_save
unlet s:cpo_save

let b:current_syntax = "gas-x86_32"

