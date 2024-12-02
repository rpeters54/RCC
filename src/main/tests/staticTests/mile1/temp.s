	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_calcPower                ## -- Begin function _mini_calcPower
	.p2align	4, 0x90
__mini_calcPower:                       ## @_mini_calcPower
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	$1, -8(%rsp)
	movl	$1, %ecx
	movq	$0, -16(%rsp)
	movb	$0, -33(%rsp)
	movq	$1, -24(%rsp)
	movq	$0, -32(%rsp)
	movb	$0, -34(%rsp)
	testq	%rsi, %rsi
	jle	LBB0_1
## %bb.2:                               ## %l3.preheader
	subq	%rcx, %rsi
	movl	$1, %eax
	movq	%rsi, %rdx
	.p2align	4, 0x90
LBB0_3:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	imulq	%rdi, %rax
	subq	%rcx, %rdx
	testq	%rsi, %rsi
	movq	%rdx, %rsi
	jg	LBB0_3
## %bb.4:                               ## %l5
	retq
LBB0_1:
	movl	$1, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l7
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
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 88(%rsp)
	movq	$16, 80(%rsp)
	movq	$0, 72(%rsp)
	movb	$0, 15(%rsp)
	movq	$-1, 64(%rsp)
	movq	$-1, %rbx
	movq	$0, 56(%rsp)
	movq	$1000000, 48(%rsp)              ## imm = 0xF4240
	movb	$0, 14(%rsp)
	movq	$1, 40(%rsp)
	movq	$1000000, 32(%rsp)              ## imm = 0xF4240
	movb	$0, 13(%rsp)
	movq	$0, 24(%rsp)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	leaq	L_.r54(%rip), %rdi
	leaq	16(%rsp), %r15
	movq	%r15, %rsi
	callq	_scanf
	movq	16(%rsp), %rax
	movq	%rax, (%r14)
	leaq	L_.r58(%rip), %rdi
	movq	%r15, %rsi
	callq	_scanf
	cmpq	$0, 16(%rsp)
	js	LBB1_5
## %bb.1:                               ## %l10
	xorl	%ebx, %ebx
	movl	$1000000, %r15d                 ## imm = 0xF4240
	movq	16(%rsp), %rax
	movq	%rax, 8(%r14)
	testq	$1000000, %r15                  ## imm = 0xF4240
	movl	$0, %eax
	jle	LBB1_4
## %bb.2:                               ## %l11.preheader
	movl	$1, %r12d
	movl	$1, %r13d
	.p2align	4, 0x90
LBB1_3:                                 ## %l11
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%r14), %rdi
	movq	8(%r14), %rsi
	callq	__mini_calcPower
	cmpq	%r15, %r13
	leaq	(%r13,%r12), %r13
	jl	LBB1_3
LBB1_4:                                 ## %l13
	leaq	L_.r108(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
LBB1_5:                                 ## %l6
	movq	%rbx, %rax
	addq	$96, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l15
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r54:                                 ## @.r54
	.asciz	"%ld"

L_.r58:                                 ## @.r58
	.asciz	"%ld"

L_.r108:                                ## @.r108
	.asciz	"%ld\n"

.subsections_via_symbols
