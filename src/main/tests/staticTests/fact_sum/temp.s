	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_sum                      ## -- Begin function _mini_sum
	.p2align	4, 0x90
__mini_sum:                             ## @_mini_sum
	.cfi_startproc
## %bb.0:                               ## %l2
	leaq	(%rdi,%rsi), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_fact                     ## -- Begin function _mini_fact
	.p2align	4, 0x90
__mini_fact:                            ## @_mini_fact
	.cfi_startproc
## %bb.0:                               ## %l4
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -16
	movq	$1, 56(%rsp)
	movq	$0, 48(%rsp)
	movb	$0, 15(%rsp)
	movb	$0, 14(%rsp)
	movq	$1, 40(%rsp)
	movl	$1, %eax
	movq	$1, 32(%rsp)
	movb	$0, 13(%rsp)
	movq	$-1, 24(%rsp)
	movq	$1, 16(%rsp)
	testq	$-2, %rdi
	je	LBB1_4
## %bb.1:                               ## %l7
	movq	%rdi, %rcx
	subq	%rax, %rcx
	jg	LBB1_3
## %bb.2:                               ## %l8
	movq	$-1, %rax
	imulq	%rdi, %rax
	movq	%rax, %rdi
	callq	__mini_fact
	jmp	LBB1_4
LBB1_3:                                 ## %l10
	movq	%rdi, %rbx
	movq	%rcx, %rdi
	callq	__mini_fact
	imulq	%rax, %rbx
	movq	%rbx, %rax
LBB1_4:                                 ## %l3
	addq	$64, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l12
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 64(%rsp)
	movq	$-1, 56(%rsp)
	movb	$0, 15(%rsp)
	movq	$-1, 48(%rsp)
	movb	$0, 14(%rsp)
	xorl	%eax, %eax
	movq	$0, 40(%rsp)
	movq	$0, 24(%rsp)
	testb	%al, %al
	jne	LBB2_3
## %bb.1:                               ## %l13.preheader
	leaq	16(%rsp), %r14
	leaq	L_.r65(%rip), %r15
	leaq	32(%rsp), %r12
	leaq	L_.r71(%rip), %r13
	leaq	L_.r76(%rip), %rbp
	leaq	24(%rsp), %rbx
	.p2align	4, 0x90
LBB2_2:                                 ## %l13
                                        ## =>This Inner Loop Header: Depth=1
	leaq	L_.r63(%rip), %rdi
	movq	%r14, %rsi
	callq	_scanf
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	_scanf
	movq	16(%rsp), %rdi
	callq	__mini_fact
	movq	%rax, 16(%rsp)
	movq	32(%rsp), %rdi
	callq	__mini_fact
	movq	%rax, 32(%rsp)
	movq	16(%rsp), %rdi
	movq	%rax, %rsi
	callq	__mini_sum
	movq	%r13, %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	callq	_scanf
	movq	$-1, %rax
	cmpq	%rax, 24(%rsp)
	jne	LBB2_2
LBB2_3:                                 ## %l15
	xorl	%eax, %eax
	addq	$72, %rsp
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
L_.r63:                                 ## @.r63
	.asciz	"%ld"

L_.r65:                                 ## @.r65
	.asciz	"%ld"

L_.r71:                                 ## @.r71
	.asciz	"%ld\n"

L_.r76:                                 ## @.r76
	.asciz	"%ld"

.subsections_via_symbols
