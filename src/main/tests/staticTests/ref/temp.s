	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_swap                           ## -- Begin function swap
	.p2align	4, 0x90
_swap:                                  ## @swap
	.cfi_startproc
## %bb.0:                               ## %l2
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l4
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	$9, 32(%rsp)
	movq	$3, 24(%rsp)
	movq	$0, 16(%rsp)
	movl	$9, 8(%rsp)
	movl	$3, 12(%rsp)
	leaq	8(%rsp), %rdi
	leaq	12(%rsp), %rsi
	callq	_swap
	movl	8(%rsp), %esi
	leaq	L_.r15(%rip), %rdi
	callq	_printf
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r15:                                 ## @.r15
	.asciz	"%d\n"

.subsections_via_symbols
