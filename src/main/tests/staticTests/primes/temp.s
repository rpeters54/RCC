	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_isqrt                    ## -- Begin function _mini_isqrt
	.p2align	4, 0x90
__mini_isqrt:                           ## @_mini_isqrt
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	$1, -8(%rsp)
	movl	$1, %ecx
	movq	$3, -16(%rsp)
	movl	$3, %eax
	movb	$0, -41(%rsp)
	movq	$2, -24(%rsp)
	movl	$2, %esi
	movb	$0, -42(%rsp)
	movq	$2, -32(%rsp)
	movq	$1, -40(%rsp)
	testq	%rdi, %rdi
	jle	LBB0_3
## %bb.1:                               ## %l3.preheader
	movl	$1, %edx
	.p2align	4, 0x90
LBB0_2:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	addq	%rax, %rdx
	addq	%rsi, %rax
	cmpq	%rdi, %rdx
	jle	LBB0_2
LBB0_3:                                 ## %l5
	cqto
	idivq	%rsi
	subq	%rcx, %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_prime                    ## -- Begin function _mini_prime
	.p2align	4, 0x90
__mini_prime:                           ## @_mini_prime
	.cfi_startproc
## %bb.0:                               ## %l7
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$2, 56(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 48(%rsp)
	xorl	%eax, %eax
	movq	$2, 40(%rsp)
	movb	$0, 6(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 5(%rsp)
	movq	$0, 24(%rsp)
	movq	$1, 16(%rsp)
	movb	$0, 4(%rsp)
	movq	$1, 8(%rsp)
	cmpq	$2, %rdi
	jl	LBB1_7
## %bb.1:                               ## %l9
	movq	%rdi, %rbx
	movl	$2, %r14d
	movl	$1, %r15d
	callq	__mini_isqrt
	cmpq	%rax, %r14
	jg	LBB1_6
## %bb.2:                               ## %l10.preheader
	movq	%rax, %rcx
	.p2align	4, 0x90
LBB1_3:                                 ## %l10
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rax
	cqto
	idivq	%r14
	imulq	%r14, %rax
	cmpq	%rax, %rbx
	je	LBB1_4
## %bb.5:                               ## %l15
                                        ##   in Loop: Header=BB1_3 Depth=1
	addq	%r15, %r14
	cmpq	%rcx, %r14
	jle	LBB1_3
LBB1_6:
	movl	$1, %eax
	jmp	LBB1_7
LBB1_4:
	xorl	%eax, %eax
LBB1_7:                                 ## %l6
	addq	$64, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l17
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
	movq	$0, 32(%rsp)
	movq	$1, 24(%rsp)
	movb	$0, 6(%rsp)
	movq	$0, 16(%rsp)
	leaq	L_.r102(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	cmpq	$0, 8(%rsp)
	js	LBB2_5
## %bb.1:                               ## %l18.preheader
	xorl	%ebx, %ebx
	movl	$1, %r15d
	leaq	L_.r116(%rip), %r14
	jmp	LBB2_2
	.p2align	4, 0x90
LBB2_4:                                 ## %l23
                                        ##   in Loop: Header=BB2_2 Depth=1
	addq	%r15, %rbx
	cmpq	8(%rsp), %rbx
	jg	LBB2_5
LBB2_2:                                 ## %l18
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	__mini_prime
	testq	%rax, %rax
	je	LBB2_4
## %bb.3:                               ## %l21
                                        ##   in Loop: Header=BB2_2 Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_printf
	jmp	LBB2_4
LBB2_5:                                 ## %l20
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
## %bb.0:                               ## %l25
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r102:                                ## @.r102
	.asciz	"%ld"

L_.r116:                                ## @.r116
	.asciz	"%ld\n"

.subsections_via_symbols
