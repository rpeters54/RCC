	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_wait                     ## -- Begin function _mini_wait
	.p2align	4, 0x90
__mini_wait:                            ## @_mini_wait
	.cfi_startproc
## %bb.0:                               ## %l5
	movq	$0, -8(%rsp)
	xorl	%eax, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_power                    ## -- Begin function _mini_power
	.p2align	4, 0x90
__mini_power:                           ## @_mini_power
	.cfi_startproc
## %bb.0:                               ## %l7
	movq	$1, -8(%rsp)
	movl	$1, %ecx
	movq	$0, -16(%rsp)
	movb	$0, -33(%rsp)
	movq	$1, -24(%rsp)
	movq	$0, -32(%rsp)
	movb	$0, -34(%rsp)
	testq	%rsi, %rsi
	jle	LBB1_1
## %bb.2:                               ## %l8.preheader
	subq	%rcx, %rsi
	movl	$1, %eax
	movq	%rsi, %rdx
	.p2align	4, 0x90
LBB1_3:                                 ## %l8
                                        ## =>This Inner Loop Header: Depth=1
	imulq	%rdi, %rax
	subq	%rcx, %rdx
	testq	%rsi, %rsi
	movq	%rdx, %rsi
	jg	LBB1_3
## %bb.4:                               ## %l10
	retq
LBB1_1:
	movl	$1, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_recursiveDecimalSum      ## -- Begin function _mini_recursiveDecimalSum
	.p2align	4, 0x90
__mini_recursiveDecimalSum:             ## @_mini_recursiveDecimalSum
	.cfi_startproc
## %bb.0:                               ## %l12
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	$0, 56(%rsp)
	movb	$0, 7(%rsp)
	movq	$2, 48(%rsp)
	movq	$10, 40(%rsp)
	movq	$10, 32(%rsp)
	movq	$1, 24(%rsp)
	movb	$0, 6(%rsp)
	movq	$10, 16(%rsp)
	movq	$1, 8(%rsp)
	testq	%rdi, %rdi
	jle	LBB2_4
## %bb.1:                               ## %l13
	movq	%rdx, %r14
	movq	%rdi, %r15
	movl	$10, %r13d
	movl	$1, %r12d
	movq	%rdi, %rax
	cqto
	idivq	%r13
	imulq	%r13, %rax
	movq	%rdi, %rcx
	subq	%rax, %rcx
	cmpq	$1, %rcx
	jne	LBB2_3
## %bb.2:                               ## %l15
	movl	$2, %edi
	movq	%r14, %rsi
	callq	__mini_power
	addq	%rax, %rbx
LBB2_3:                                 ## %l17
	movq	%r15, %rax
	cqto
	idivq	%r13
	addq	%r12, %r14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	__mini_recursiveDecimalSum
	movq	%rax, %rbx
LBB2_4:                                 ## %l11
	movq	%rbx, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_convertToDecimal         ## -- Begin function _mini_convertToDecimal
	.p2align	4, 0x90
__mini_convertToDecimal:                ## @_mini_convertToDecimal
	.cfi_startproc
## %bb.0:                               ## %l20
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	__mini_recursiveDecimalSum
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l22
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 40(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 32(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 6(%rsp)
	movq	$0, 16(%rsp)
	leaq	L_.r123(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	movq	8(%rsp), %rdi
	callq	__mini_convertToDecimal
	movq	%rax, %rbx
	movq	%rax, 8(%rsp)
	imulq	%rax, %rbx
	testq	%rbx, %rbx
	jle	LBB4_3
## %bb.1:                               ## %l23.preheader
	movl	$1, %r14d
	movl	$1, %r15d
	negq	%r15
	.p2align	4, 0x90
LBB4_2:                                 ## %l23
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	__mini_wait
	leaq	(%r15,%rbx), %rax
	subq	%r14, %rbx
	testq	%rax, %rax
	jg	LBB4_2
LBB4_3:                                 ## %l25
	movq	8(%rsp), %rsi
	leaq	L_.r149(%rip), %rdi
	callq	_printf
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l27
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r123:                                ## @.r123
	.asciz	"%ld"

L_.r149:                                ## @.r149
	.asciz	"%ld\n"

.subsections_via_symbols
