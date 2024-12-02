	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_print                          ## -- Begin function print
	.p2align	4, 0x90
_print:                                 ## @print
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rsi
	leaq	L_.r6(%rip), %rdi
	callq	_printf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_println                        ## -- Begin function println
	.p2align	4, 0x90
_println:                               ## @println
	.cfi_startproc
## %bb.0:                               ## %l4
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rsi
	leaq	L_.r10(%rip), %rdi
	callq	_printf
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_read                     ## -- Begin function _mini_read
	.p2align	4, 0x90
__mini_read:                            ## @_mini_read
	.cfi_startproc
## %bb.0:                               ## %l6
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	leaq	L_.r16(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	movq	8(%rsp), %rax
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l8
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 24(%rsp)
	movb	$0, 14(%rsp)
	movq	$0, 16(%rsp)
	callq	__mini_read
	movq	%rax, %r14
	callq	__mini_read
	movq	%rax, %rbx
	callq	__mini_read
	testq	%rax, %rax
	jle	LBB3_1
## %bb.2:                               ## %l9.preheader
	movl	$1, %ecx
	movl	$1, %edx
	.p2align	4, 0x90
LBB3_3:                                 ## %l9
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movq	%r14, %rbx
	cmpq	%rax, %rdx
	leaq	(%rdx,%rcx), %rdx
	movq	%rdi, %r14
	jl	LBB3_3
	jmp	LBB3_4
LBB3_1:
	movq	%r14, %rdi
LBB3_4:                                 ## %l11
	callq	_print
	movq	%rbx, %rdi
	callq	_println
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r6:                                  ## @.r6
	.asciz	"%ld "

L_.r10:                                 ## @.r10
	.asciz	"%ld\n"

L_.r16:                                 ## @.r16
	.asciz	"%ld"

.subsections_via_symbols
