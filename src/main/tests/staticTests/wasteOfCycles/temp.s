	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_function                 ## -- Begin function _mini_function
	.p2align	4, 0x90
__mini_function:                        ## @_mini_function
	.cfi_startproc
## %bb.0:                               ## %l2
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 48(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 14(%rsp)
	movq	$1, 24(%rsp)
	movb	$0, 13(%rsp)
	movq	$1, 16(%rsp)
	testq	%rdi, %rdi
	jg	LBB0_2
## %bb.1:
	xorl	%eax, %eax
	jmp	LBB0_6
LBB0_2:                                 ## %l5
	movq	%rdi, %rbx
	movl	$1, %r12d
	movq	%rdi, %r13
	imulq	%rbx, %r13
	testq	%r13, %r13
	jle	LBB0_5
## %bb.3:                               ## %l6.preheader
	leaq	L_.r29(%rip), %r14
	movq	%rbx, %r15
	movl	$1, %ebp
	.p2align	4, 0x90
LBB0_4:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_printf
	addq	%r12, %r15
	cmpq	%r13, %rbp
	leaq	(%rbp,%r12), %rbp
	jl	LBB0_4
LBB0_5:                                 ## %l8
	subq	%r12, %rbx
	movq	%rbx, %rdi
	callq	__mini_function
LBB0_6:                                 ## %l1
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l10
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	leaq	L_.r52(%rip), %rdi
	movq	%rsp, %rsi
	callq	_scanf
	movq	(%rsp), %rdi
	callq	__mini_function
	leaq	L_.r56(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l12
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r29:                                 ## @.r29
	.asciz	"%ld "

L_.r52:                                 ## @.r52
	.asciz	"%ld"

L_.r56:                                 ## @.r56
	.asciz	"%ld\n"

.subsections_via_symbols
