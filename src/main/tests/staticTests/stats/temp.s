	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_getRands                 ## -- Begin function _mini_getRands
	.p2align	4, 0x90
__mini_getRands:                        ## @_mini_getRands
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r13
	movq	%rdi, %rbx
	movq	$0, 96(%rsp)
	movq	$16, 88(%rsp)
	movq	$0, 80(%rsp)
	movq	$1, 72(%rsp)
	movq	$0, 64(%rsp)
	movb	$0, 7(%rsp)
	movq	$2, 56(%rsp)
	movq	$1, 48(%rsp)
	movq	$1000000000, 40(%rsp)           ## imm = 0x3B9ACA00
	movq	$1000000000, 32(%rsp)           ## imm = 0x3B9ACA00
	movq	$16, 24(%rsp)
	movq	$1, 16(%rsp)
	movq	$0, 8(%rsp)
	movb	$0, 6(%rsp)
	movq	%rdi, %r12
	imulq	%rdi, %r12
	movl	$16, %edi
	callq	_malloc
	movq	%r12, (%rax)
	movq	$0, 8(%rax)
	leaq	-1(%r13), %rcx
	testq	%rcx, %rcx
	jle	LBB0_1
## %bb.2:                               ## %l3.preheader
	movq	%rax, %r15
	subq	$1, %r13
	subq	$1, %r13
	movq	%r13, %r14
	movl	$1, %ebp
	.p2align	4, 0x90
LBB0_3:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	imulq	%r12, %r12
	movq	%r12, %rax
	cqto
	idivq	%rbx
	movq	%rax, %rcx
	movq	%rbx, %rax
	cqto
	movl	$2, %esi
	idivq	%rsi
	movq	%rax, %r12
	imulq	%rcx, %r12
	addq	%rbp, %r12
	movq	%r12, %rax
	cqto
	movl	$1000000000, %ecx               ## imm = 0x3B9ACA00
	idivq	%rcx
	imulq	%rcx, %rax
	subq	%rax, %r12
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rcx
	movq	%r12, (%rax)
	movq	%r15, 8(%rax)
	subq	%rbp, %r14
	testq	%r13, %r13
	movq	%r14, %r13
	movq	%rax, %r15
	jg	LBB0_3
	jmp	LBB0_4
LBB0_1:
	xorl	%ecx, %ecx
LBB0_4:                                 ## %l5
	movq	%rcx, %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_calcMean                 ## -- Begin function _mini_calcMean
	.p2align	4, 0x90
__mini_calcMean:                        ## @_mini_calcMean
	.cfi_startproc
## %bb.0:                               ## %l7
	movq	$0, -8(%rsp)
	xorl	%eax, %eax
	movq	$0, -16(%rsp)
	movq	$0, -24(%rsp)
	movq	$0, -32(%rsp)
	movb	$0, -57(%rsp)
	movq	$1, -40(%rsp)
	movq	$0, -48(%rsp)
	movb	$0, -58(%rsp)
	movq	$0, -56(%rsp)
	movb	$0, -59(%rsp)
	testq	%rdi, %rdi
	je	LBB1_1
## %bb.2:                               ## %l8.preheader
	movl	$1, %edx
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB1_3:                                 ## %l8
                                        ## =>This Inner Loop Header: Depth=1
	addq	%rdx, %rsi
	addq	(%rdi), %rcx
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	jne	LBB1_3
## %bb.4:                               ## %l10
	testq	%rsi, %rsi
	je	LBB1_6
LBB1_5:                                 ## %l11
	movq	%rcx, %rax
	cqto
	idivq	%rsi
LBB1_6:                                 ## %l13
	retq
LBB1_1:
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	testq	%rsi, %rsi
	jne	LBB1_5
	jmp	LBB1_6
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_approxSqrt               ## -- Begin function _mini_approxSqrt
	.p2align	4, 0x90
__mini_approxSqrt:                      ## @_mini_approxSqrt
	.cfi_startproc
## %bb.0:                               ## %l15
	movq	$1, -8(%rsp)
	movl	$1, %eax
	movq	$0, -16(%rsp)
	movb	$0, -25(%rsp)
	movq	$1, -24(%rsp)
	movb	$0, -26(%rsp)
	testq	%rdi, %rdi
	jle	LBB2_4
## %bb.1:                               ## %l16.preheader
	movl	$1, %ecx
	.p2align	4, 0x90
LBB2_2:                                 ## %l16
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rcx, %rdx
	imulq	%rcx, %rdx
	addq	%rax, %rcx
	cmpq	%rdi, %rdx
	jl	LBB2_2
## %bb.3:                               ## %l18.loopexit
	subq	%rax, %rcx
	movq	%rcx, %rax
LBB2_4:                                 ## %l18
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_approxSqrtAll            ## -- Begin function _mini_approxSqrtAll
	.p2align	4, 0x90
__mini_approxSqrtAll:                   ## @_mini_approxSqrtAll
	.cfi_startproc
## %bb.0:                               ## %l20
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, 16(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 8(%rsp)
	movb	$0, 6(%rsp)
	testq	%rdi, %rdi
	je	LBB3_3
## %bb.1:                               ## %l21.preheader
	movq	%rdi, %rbx
	leaq	L_.r196(%rip), %r14
	.p2align	4, 0x90
LBB3_2:                                 ## %l21
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	callq	__mini_approxSqrt
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	LBB3_2
LBB3_3:                                 ## %l19
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_range                    ## -- Begin function _mini_range
	.p2align	4, 0x90
__mini_range:                           ## @_mini_range
	.cfi_startproc
## %bb.0:                               ## %l25
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -16
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movq	$1, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 6(%rsp)
	movb	$0, 5(%rsp)
	movq	$0, 8(%rsp)
	movb	$0, 4(%rsp)
	testq	%rdi, %rdi
	je	LBB4_1
## %bb.2:                               ## %l26.preheader
	movl	$1, %eax
	xorl	%esi, %esi
	xorl	%ebx, %ebx
	jmp	LBB4_3
	.p2align	4, 0x90
LBB4_4:                                 ## %l29
                                        ##   in Loop: Header=BB4_3 Depth=1
	movq	(%rdi), %rsi
	movq	%rsi, %rbx
	xorl	%eax, %eax
LBB4_9:                                 ## %l37
                                        ##   in Loop: Header=BB4_3 Depth=1
	movq	8(%rdi), %rdi
	testq	%rdi, %rdi
	je	LBB4_10
LBB4_3:                                 ## %l26
                                        ## =>This Inner Loop Header: Depth=1
	testq	%rax, %rax
	jne	LBB4_4
## %bb.5:                               ## %l30
                                        ##   in Loop: Header=BB4_3 Depth=1
	cmpq	%rsi, (%rdi)
	jge	LBB4_7
## %bb.6:                               ## %l31
                                        ##   in Loop: Header=BB4_3 Depth=1
	movq	(%rdi), %rsi
	jmp	LBB4_9
	.p2align	4, 0x90
LBB4_7:                                 ## %l32
                                        ##   in Loop: Header=BB4_3 Depth=1
	cmpq	%rbx, (%rdi)
	jle	LBB4_9
## %bb.8:                               ## %l33
                                        ##   in Loop: Header=BB4_3 Depth=1
	movq	(%rdi), %rbx
	jmp	LBB4_9
LBB4_1:
	xorl	%esi, %esi
	xorl	%ebx, %ebx
LBB4_10:                                ## %l28
	leaq	L_.r291(%rip), %rdi
	callq	_printf
	leaq	L_.r293(%rip), %rdi
	movq	%rbx, %rsi
	callq	_printf
	addq	$64, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l39
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	$0, 24(%rsp)
	leaq	L_.r303(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	leaq	L_.r305(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	movq	16(%rsp), %rdi
	movq	8(%rsp), %rsi
	callq	__mini_getRands
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	__mini_calcMean
	leaq	L_.r311(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	%rbx, %rdi
	callq	__mini_range
	movq	%rbx, %rdi
	callq	__mini_approxSqrtAll
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l41
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r196:                                ## @.r196
	.asciz	"%ld\n"

L_.r291:                                ## @.r291
	.asciz	"%ld\n"

L_.r293:                                ## @.r293
	.asciz	"%ld\n"

L_.r303:                                ## @.r303
	.asciz	"%ld"

L_.r305:                                ## @.r305
	.asciz	"%ld"

L_.r311:                                ## @.r311
	.asciz	"%ld\n"

.subsections_via_symbols
