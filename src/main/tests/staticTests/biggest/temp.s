	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_getIntList               ## -- Begin function _mini_getIntList
	.p2align	4, 0x90
__mini_getIntList:                      ## @_mini_getIntList
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movq	$16, 40(%rsp)
	movq	$-1, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 24(%rsp)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	leaq	L_.r13(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	cmpq	$-1, 16(%rsp)
	jne	LBB0_2
## %bb.1:                               ## %l3
	movq	16(%rsp), %rax
	movq	%rax, (%rbx)
	movq	$0, 8(%rbx)
	jmp	LBB0_3
LBB0_2:                                 ## %l4
	movq	16(%rsp), %rax
	movq	%rax, (%rbx)
	callq	__mini_getIntList
	movq	%rax, 8(%rbx)
LBB0_3:                                 ## %l1
	movq	%rbx, %rax
	addq	$48, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_biggest                  ## -- Begin function _mini_biggest
	.p2align	4, 0x90
__mini_biggest:                         ## @_mini_biggest
	.cfi_startproc
## %bb.0:                               ## %l6
	movq	%rdi, %rax
	movb	$0, -1(%rsp)
	cmpq	%rsi, %rdi
	jg	LBB1_2
## %bb.1:                               ## %l8
	movq	%rsi, %rax
LBB1_2:                                 ## %l5
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_biggestInList            ## -- Begin function _mini_biggestInList
	.p2align	4, 0x90
__mini_biggestInList:                   ## @_mini_biggestInList
	.cfi_startproc
## %bb.0:                               ## %l10
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	$0, 24(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 14(%rsp)
	movq	(%rdi), %rax
	cmpq	$0, 8(%rdi)
	je	LBB2_3
## %bb.1:                               ## %l11.preheader
	movq	%rdi, %rbx
	.p2align	4, 0x90
LBB2_2:                                 ## %l11
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rsi
	movq	%rax, %rdi
	callq	__mini_biggest
	movq	8(%rbx), %rbx
	cmpq	$0, 8(%rbx)
	jne	LBB2_2
LBB2_3:                                 ## %l13
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l15
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	$0, (%rsp)
	callq	__mini_getIntList
	movq	%rax, %rdi
	callq	__mini_biggestInList
	leaq	L_.r85(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l17
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r13:                                 ## @.r13
	.asciz	"%ld"

L_.r85:                                 ## @.r85
	.asciz	"%ld\n"

.subsections_via_symbols
