	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_cleanBoard               ## -- Begin function _mini_cleanBoard
	.p2align	4, 0x90
__mini_cleanBoard:                      ## @_mini_cleanBoard
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	$0, -8(%rsp)
	movq	$0, -16(%rsp)
	movq	$0, -24(%rsp)
	movq	$0, -32(%rsp)
	movq	$0, -40(%rsp)
	movq	$0, -48(%rsp)
	movq	$0, -56(%rsp)
	movq	$0, -64(%rsp)
	movq	$0, -72(%rsp)
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movq	$0, 32(%rdi)
	movq	$0, 40(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movq	$0, 64(%rdi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_printBoard               ## -- Begin function _mini_printBoard
	.p2align	4, 0x90
__mini_printBoard:                      ## @_mini_printBoard
	.cfi_startproc
## %bb.0:                               ## %l4
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rsi
	leaq	L_.r35(%rip), %rdi
	callq	_printf
	movq	8(%rbx), %rsi
	leaq	L_.r39(%rip), %rdi
	callq	_printf
	movq	16(%rbx), %rsi
	leaq	L_.r43(%rip), %rdi
	callq	_printf
	movq	24(%rbx), %rsi
	leaq	L_.r47(%rip), %rdi
	callq	_printf
	movq	32(%rbx), %rsi
	leaq	L_.r51(%rip), %rdi
	callq	_printf
	movq	40(%rbx), %rsi
	leaq	L_.r55(%rip), %rdi
	callq	_printf
	movq	48(%rbx), %rsi
	leaq	L_.r59(%rip), %rdi
	callq	_printf
	movq	56(%rbx), %rsi
	leaq	L_.r63(%rip), %rdi
	callq	_printf
	movq	64(%rbx), %rsi
	leaq	L_.r67(%rip), %rdi
	callq	_printf
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_printMoveBoard           ## -- Begin function _mini_printMoveBoard
	.p2align	4, 0x90
__mini_printMoveBoard:                  ## @_mini_printMoveBoard
	.cfi_startproc
## %bb.0:                               ## %l6
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$123, 16(%rsp)
	movq	$456, 8(%rsp)                   ## imm = 0x1C8
	movq	$789, (%rsp)                    ## imm = 0x315
	leaq	L_.r72(%rip), %rdi
	movl	$123, %esi
	callq	_printf
	leaq	L_.r76(%rip), %rdi
	movl	$456, %esi                      ## imm = 0x1C8
	callq	_printf
	leaq	L_.r80(%rip), %rdi
	movl	$789, %esi                      ## imm = 0x315
	callq	_printf
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_placePiece               ## -- Begin function _mini_placePiece
	.p2align	4, 0x90
__mini_placePiece:                      ## @_mini_placePiece
	.cfi_startproc
## %bb.0:                               ## %l8
	movq	$1, -8(%rsp)
	movb	$0, -73(%rsp)
	movq	$2, -16(%rsp)
	movb	$0, -74(%rsp)
	movq	$3, -24(%rsp)
	movb	$0, -75(%rsp)
	movq	$4, -32(%rsp)
	movb	$0, -76(%rsp)
	movq	$5, -40(%rsp)
	movb	$0, -77(%rsp)
	movq	$6, -48(%rsp)
	movb	$0, -78(%rsp)
	movq	$7, -56(%rsp)
	movb	$0, -79(%rsp)
	movq	$8, -64(%rsp)
	movb	$0, -80(%rsp)
	movq	$9, -72(%rsp)
	movb	$0, -81(%rsp)
	cmpq	$1, %rdx
	jne	LBB3_2
## %bb.1:                               ## %l9
	movq	%rsi, (%rdi)
	retq
LBB3_2:                                 ## %l10
	cmpq	$2, %rdx
	jne	LBB3_4
## %bb.3:                               ## %l11
	movq	%rsi, 8(%rdi)
	retq
LBB3_4:                                 ## %l12
	cmpq	$3, %rdx
	jne	LBB3_6
## %bb.5:                               ## %l13
	movq	%rsi, 16(%rdi)
	retq
LBB3_6:                                 ## %l14
	cmpq	$4, %rdx
	jne	LBB3_8
## %bb.7:                               ## %l15
	movq	%rsi, 24(%rdi)
	retq
LBB3_8:                                 ## %l16
	cmpq	$5, %rdx
	jne	LBB3_10
## %bb.9:                               ## %l17
	movq	%rsi, 32(%rdi)
	retq
LBB3_10:                                ## %l18
	cmpq	$6, %rdx
	jne	LBB3_12
## %bb.11:                              ## %l19
	movq	%rsi, 40(%rdi)
	retq
LBB3_12:                                ## %l20
	cmpq	$7, %rdx
	jne	LBB3_14
## %bb.13:                              ## %l21
	movq	%rsi, 48(%rdi)
	retq
LBB3_14:                                ## %l22
	cmpq	$8, %rdx
	jne	LBB3_16
## %bb.15:                              ## %l23
	movq	%rsi, 56(%rdi)
	retq
LBB3_16:                                ## %l24
	cmpq	$9, %rdx
	jne	LBB3_18
## %bb.17:                              ## %l25
	movq	%rsi, 64(%rdi)
LBB3_18:                                ## %l7
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_checkWinner              ## -- Begin function _mini_checkWinner
	.p2align	4, 0x90
__mini_checkWinner:                     ## @_mini_checkWinner
	.cfi_startproc
## %bb.0:                               ## %l37
	subq	$304, %rsp                      ## imm = 0x130
	.cfi_def_cfa_offset 312
	movq	$1, 296(%rsp)
	movb	$0, -89(%rsp)
	movq	$1, 288(%rsp)
	movl	$1, %ecx
	movb	$0, -90(%rsp)
	xorl	%eax, %eax
	movq	$1, 280(%rsp)
	movb	$0, -91(%rsp)
	movq	$0, 272(%rsp)
	movq	$2, 264(%rsp)
	movb	$0, -92(%rsp)
	movq	$2, 256(%rsp)
	movb	$0, -93(%rsp)
	movq	$2, 248(%rsp)
	movb	$0, -94(%rsp)
	movq	$1, 240(%rsp)
	movq	$1, 232(%rsp)
	movb	$0, -95(%rsp)
	movq	$1, 224(%rsp)
	movb	$0, -96(%rsp)
	movq	$1, 216(%rsp)
	movb	$0, -97(%rsp)
	movq	$0, 208(%rsp)
	movq	$2, 200(%rsp)
	movb	$0, -98(%rsp)
	movq	$2, 192(%rsp)
	movb	$0, -99(%rsp)
	movq	$2, 184(%rsp)
	movb	$0, -100(%rsp)
	movq	$1, 176(%rsp)
	movq	$1, 168(%rsp)
	movb	$0, -101(%rsp)
	movq	$1, 160(%rsp)
	movb	$0, -102(%rsp)
	movq	$1, 152(%rsp)
	movb	$0, -103(%rsp)
	movq	$0, 144(%rsp)
	movq	$2, 136(%rsp)
	movb	$0, -104(%rsp)
	movq	$2, 128(%rsp)
	movb	$0, -105(%rsp)
	movq	$2, 120(%rsp)
	movb	$0, -106(%rsp)
	movq	$1, 112(%rsp)
	movq	$1, 104(%rsp)
	movb	$0, -107(%rsp)
	movq	$1, 96(%rsp)
	movb	$0, -108(%rsp)
	movq	$1, 88(%rsp)
	movb	$0, -109(%rsp)
	movq	$0, 80(%rsp)
	movq	$2, 72(%rsp)
	movb	$0, -110(%rsp)
	movq	$2, 64(%rsp)
	movb	$0, -111(%rsp)
	movq	$2, 56(%rsp)
	movb	$0, -112(%rsp)
	movq	$1, 48(%rsp)
	movq	$1, 40(%rsp)
	movb	$0, -113(%rsp)
	movq	$1, 32(%rsp)
	movb	$0, -114(%rsp)
	movq	$1, 24(%rsp)
	movb	$0, -115(%rsp)
	movq	$0, 16(%rsp)
	movq	$2, 8(%rsp)
	movb	$0, -116(%rsp)
	movq	$2, (%rsp)
	movb	$0, -117(%rsp)
	movq	$2, -8(%rsp)
	movb	$0, -118(%rsp)
	movq	$1, -16(%rsp)
	movq	$1, -24(%rsp)
	movb	$0, -119(%rsp)
	movq	$1, -32(%rsp)
	movb	$0, -120(%rsp)
	movq	$1, -40(%rsp)
	movb	$0, -121(%rsp)
	movq	$0, -48(%rsp)
	movq	$2, -56(%rsp)
	movb	$0, -122(%rsp)
	movq	$2, -64(%rsp)
	movb	$0, -123(%rsp)
	movq	$2, -72(%rsp)
	movb	$0, -124(%rsp)
	movq	$1, -80(%rsp)
	movq	$-1, -88(%rsp)
	cmpq	$1, (%rdi)
	jne	LBB4_3
## %bb.1:                               ## %l38
	cmpq	%rcx, 8(%rdi)
	jne	LBB4_3
## %bb.2:                               ## %l40
	cmpq	%rcx, 16(%rdi)
	je	LBB4_43
LBB4_3:                                 ## %l46
	movl	$2, %edx
	cmpq	$2, (%rdi)
	jne	LBB4_7
## %bb.4:                               ## %l47
	cmpq	%rdx, 8(%rdi)
	jne	LBB4_7
## %bb.5:                               ## %l49
	cmpq	%rdx, 16(%rdi)
	je	LBB4_6
LBB4_7:                                 ## %l55
	cmpq	%rcx, 24(%rdi)
	jne	LBB4_10
## %bb.8:                               ## %l56
	cmpq	%rcx, 32(%rdi)
	jne	LBB4_10
## %bb.9:                               ## %l58
	cmpq	%rcx, 40(%rdi)
	je	LBB4_43
LBB4_10:                                ## %l64
	cmpq	%rdx, 24(%rdi)
	jne	LBB4_14
## %bb.11:                              ## %l65
	cmpq	%rdx, 32(%rdi)
	jne	LBB4_14
## %bb.12:                              ## %l67
	cmpq	%rdx, 40(%rdi)
	je	LBB4_6
LBB4_14:                                ## %l73
	cmpq	%rcx, 48(%rdi)
	jne	LBB4_17
## %bb.15:                              ## %l74
	cmpq	%rcx, 56(%rdi)
	jne	LBB4_17
## %bb.16:                              ## %l76
	cmpq	%rcx, 64(%rdi)
	je	LBB4_43
LBB4_17:                                ## %l82
	cmpq	%rdx, 48(%rdi)
	jne	LBB4_21
## %bb.18:                              ## %l83
	cmpq	%rdx, 56(%rdi)
	jne	LBB4_21
## %bb.19:                              ## %l85
	cmpq	%rdx, 64(%rdi)
	je	LBB4_6
LBB4_21:                                ## %l91
	cmpq	%rcx, (%rdi)
	jne	LBB4_24
## %bb.22:                              ## %l92
	cmpq	%rcx, 24(%rdi)
	jne	LBB4_24
## %bb.23:                              ## %l94
	cmpq	%rcx, 48(%rdi)
	je	LBB4_43
LBB4_24:                                ## %l100
	cmpq	%rdx, (%rdi)
	jne	LBB4_28
## %bb.25:                              ## %l101
	cmpq	%rdx, 24(%rdi)
	jne	LBB4_28
## %bb.26:                              ## %l103
	cmpq	%rdx, 48(%rdi)
	je	LBB4_6
LBB4_28:                                ## %l109
	cmpq	%rcx, 8(%rdi)
	jne	LBB4_31
## %bb.29:                              ## %l110
	cmpq	%rcx, 32(%rdi)
	jne	LBB4_31
## %bb.30:                              ## %l112
	cmpq	%rcx, 56(%rdi)
	je	LBB4_43
LBB4_31:                                ## %l118
	cmpq	%rdx, 8(%rdi)
	jne	LBB4_35
## %bb.32:                              ## %l119
	cmpq	%rdx, 32(%rdi)
	jne	LBB4_35
## %bb.33:                              ## %l121
	cmpq	%rdx, 56(%rdi)
	je	LBB4_6
LBB4_35:                                ## %l127
	cmpq	%rcx, 16(%rdi)
	jne	LBB4_38
## %bb.36:                              ## %l128
	cmpq	%rcx, 40(%rdi)
	jne	LBB4_38
## %bb.37:                              ## %l130
	cmpq	%rcx, 64(%rdi)
	je	LBB4_43
LBB4_38:                                ## %l136
	cmpq	%rdx, 16(%rdi)
	jne	LBB4_42
## %bb.39:                              ## %l137
	cmpq	%rdx, 40(%rdi)
	jne	LBB4_42
## %bb.40:                              ## %l139
	cmpq	%rdx, 64(%rdi)
	jne	LBB4_42
LBB4_6:
	movl	$1, %eax
	addq	$304, %rsp                      ## imm = 0x130
	retq
LBB4_42:                                ## %l145
	movq	$-1, %rax
LBB4_43:                                ## %l36
	addq	$304, %rsp                      ## imm = 0x130
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l147
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 160(%rsp)
	xorl	%ebp, %ebp
	movq	$0, 152(%rsp)
	movq	$0, 144(%rsp)
	movq	$0, 136(%rsp)
	movq	$-1, 128(%rsp)
	movq	$72, 120(%rsp)
	movq	$0, 112(%rsp)
	movq	$8, 104(%rsp)
	movb	$0, 7(%rsp)
	movb	$0, 6(%rsp)
	movq	$0, 96(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 88(%rsp)
	movl	$1, %r14d
	movq	$1, 80(%rsp)
	movq	$1, 72(%rsp)
	movq	$2, 64(%rsp)
	movq	$1, 56(%rsp)
	movq	$0, 48(%rsp)
	movq	$8, 40(%rsp)
	movb	$0, 4(%rsp)
	movb	$0, 3(%rsp)
	movq	$1, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movl	$72, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	__mini_cleanBoard
	movq	$-1, %rax
	testb	%bpl, %bpl
	jne	LBB5_6
## %bb.1:                               ## %l148.preheader
	movl	$8, %r15d
	subq	%r14, %r15
	leaq	L_.r585(%rip), %r12
	leaq	8(%rsp), %r13
	jmp	LBB5_2
	.p2align	4, 0x90
LBB5_4:                                 ## %l152
                                        ##   in Loop: Header=BB5_2 Depth=1
	subq	%r14, %rbp
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	_scanf
	movq	8(%rsp), %rdx
	movl	$2, %esi
LBB5_5:                                 ## %l153
                                        ##   in Loop: Header=BB5_2 Depth=1
	movq	%rbx, %rdi
	callq	__mini_placePiece
	movq	%rbx, %rdi
	callq	__mini_checkWinner
	testq	%rax, %rax
	sets	%cl
	testq	%r15, %r15
	setne	%dl
	subq	%r14, %r15
	testb	%dl, %cl
	je	LBB5_6
LBB5_2:                                 ## %l148
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	__mini_printBoard
	testq	%rbp, %rbp
	jne	LBB5_4
## %bb.3:                               ## %l151
                                        ##   in Loop: Header=BB5_2 Depth=1
	addq	%r14, %rbp
	leaq	L_.r577(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	movq	16(%rsp), %rdx
	movl	$1, %esi
	jmp	LBB5_5
LBB5_6:                                 ## %l150
	addq	%r14, %rax
	leaq	L_.r619(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	xorl	%eax, %eax
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l155
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r35:                                 ## @.r35
	.asciz	"%ld "

L_.r39:                                 ## @.r39
	.asciz	"%ld "

L_.r43:                                 ## @.r43
	.asciz	"%ld\n"

L_.r47:                                 ## @.r47
	.asciz	"%ld "

L_.r51:                                 ## @.r51
	.asciz	"%ld "

L_.r55:                                 ## @.r55
	.asciz	"%ld\n"

L_.r59:                                 ## @.r59
	.asciz	"%ld "

L_.r63:                                 ## @.r63
	.asciz	"%ld "

L_.r67:                                 ## @.r67
	.asciz	"%ld\n"

L_.r72:                                 ## @.r72
	.asciz	"%ld\n"

L_.r76:                                 ## @.r76
	.asciz	"%ld\n"

L_.r80:                                 ## @.r80
	.asciz	"%ld\n"

L_.r577:                                ## @.r577
	.asciz	"%ld"

L_.r585:                                ## @.r585
	.asciz	"%ld"

L_.r619:                                ## @.r619
	.asciz	"%ld\n"

.subsections_via_symbols
