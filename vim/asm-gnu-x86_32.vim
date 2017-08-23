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
	syn keyword gasInstrX86General movb movw movl addb addw addl subb subw subl negb negw negl
	syn keyword gasInstrX86General mulb mulw mull imulb imulw imull divb divw divl idivb idivw idivl
	syn keyword gasInstrX86General orb orw orl andb andw andl xorb xorw xorl notb notw notl
	syn keyword gasInstrX86General salb salw sall sarb sarw sarl shlb shlw shll shrb shrw shrl
	syn keyword gasInstrX86General lodsb lodsw lodsl stosb stosw stosl inb inw inl outb outw outl
	syn keyword gasInstrX86General pushw pushl popw popl
else
	syn keyword gasInstrX86General mov add sub neg or and xor not mul imul div idiv
	syn keyword gasInstrX86General sal sar shl shr push pop in out
endif

syn keyword gasInstrX86General cld std call jmp
syn keyword gasInstrX86Jump ja jae jb jbe jc je jz jg jge jl jle jo jp js jna jnae jnb jnbe jnc jne jnz jng jnge jnl jnle jno jnp jns
syn keyword gasInstrX86System cli sti hlt str ltr lgdt lidt lldt

" Highlighting:
hi link gasRegX86General Identifier
hi link gasRegX86Segment Identifier
hi link gasRegX86Debug Identifier
hi link gasRegX86Control Identifier
hi link gasRegX86Test Identifier
hi link gasInstrX86General Statement
hi link gasInstrX86Jump Statement
hi link gasInstrX86System Statement

let &cpo = s:cpo_save
unlet s:cpo_save

let b:current_syntax = "gas-x86_32"

