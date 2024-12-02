	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	$8, 24(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movl	$8, %edi
	callq	_malloc
	movq	%rax, %rbx
	xorl	%edi, %edi
	callq	_srand
	callq	_rand
	movl	%eax, (%rbx)
	callq	_rand
	movl	%eax, 4(%rbx)
	movl	(%rbx), %esi
	leaq	L_.r21(%rip), %rdi
	callq	_printf
	movq	(%rbx), %rsi
	leaq	L_.r25(%rip), %rdi
	callq	_printf
	movss	(%rbx), %xmm0                   ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.r29(%rip), %rdi
	callq	_printf
	movsd	(%rbx), %xmm0                   ## xmm0 = mem[0],zero
	leaq	L_.r34(%rip), %rdi
	callq	_printf
	movl	(%rbx), %esi
	leaq	L_.r38(%rip), %rdi
	callq	_printf
	movl	4(%rbx), %esi
	leaq	L_.r43(%rip), %rdi
	callq	_printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r21:                                 ## @.r21
	.asciz	"%d\n"

L_.r25:                                 ## @.r25
	.asciz	"%ld\n"

L_.r29:                                 ## @.r29
	.asciz	"%f\n"

L_.r34:                                 ## @.r34
	.asciz	"%f\n"

L_.r38:                                 ## @.r38
	.asciz	"%d\n"

L_.r43:                                 ## @.r43
	.asciz	"%d\n"

.subsections_via_symbols
