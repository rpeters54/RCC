	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_computeFib               ## -- Begin function _mini_computeFib
	.p2align	4, 0x90
__mini_computeFib:                      ## @_mini_computeFib
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, 48(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 40(%rsp)
	movq	$2, 32(%rsp)
	movb	$0, 6(%rsp)
	movq	$1, 24(%rsp)
	movq	$1, 16(%rsp)
	movq	$2, 8(%rsp)
	testq	%rdi, %rdi
	jne	LBB0_2
## %bb.1:
	xorl	%eax, %eax
	jmp	LBB0_4
LBB0_2:                                 ## %l4
	movl	$1, %eax
	movq	%rdi, %rbx
	subq	$2, %rbx
	jle	LBB0_4
## %bb.3:                               ## %l6
	subq	%rax, %rdi
	callq	__mini_computeFib
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	__mini_computeFib
	addq	%r14, %rax
LBB0_4:                                 ## %l1
	addq	$56, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l8
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 16(%rsp)
	leaq	L_.r34(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	movq	8(%rsp), %rdi
	callq	__mini_computeFib
	leaq	L_.r36(%rip), %rdi
	movq	%rax, %rsi
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
## %bb.0:                               ## %l10
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r34:                                 ## @.r34
	.asciz	"%ld"

L_.r36:                                 ## @.r36
	.asciz	"%ld\n"

.subsections_via_symbols
