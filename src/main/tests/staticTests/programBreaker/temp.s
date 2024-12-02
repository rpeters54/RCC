	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_fun2                     ## -- Begin function _mini_fun2
	.p2align	4, 0x90
__mini_fun2:                            ## @_mini_fun2
	.cfi_startproc
## %bb.0:                               ## %l2
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, %rax
	movq	$0, 16(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 8(%rsp)
	testq	%rdi, %rdi
	je	LBB0_2
## %bb.1:                               ## %l4
	subq	$1, %rdi
	movq	%rax, %rsi
	callq	__mini_fun2
LBB0_2:                                 ## %l1
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_fun1                     ## -- Begin function _mini_fun1
	.p2align	4, 0x90
__mini_fun1:                            ## @_mini_fun1
	.cfi_startproc
## %bb.0:                               ## %l6
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdx, %r8
	movq	%rdi, %rcx
	movq	$11, 48(%rsp)
	movq	$2, 40(%rsp)
	movq	$4, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$5, 24(%rsp)
	movq	$6, 16(%rsp)
	movb	$0, 14(%rsp)
	movb	$0, 13(%rsp)
	addq	%rdi, %rdi
	movl	$4, %eax
	xorl	%edx, %edx
	idivq	%rsi
	subq	%rdi, %rax
	leaq	11(%rax,%r8), %rax
	cmpq	%rsi, %rax
	jle	LBB1_2
## %bb.1:                               ## %l7
	movq	%rax, %rdi
	movq	%rcx, %rsi
	jmp	LBB1_4
LBB1_2:                                 ## %l8
	movl	$5, %ecx
	cmpq	$6, %rcx
	setl	%cl
	cmpq	%rsi, %rax
	setle	%dl
	testb	%dl, %cl
	je	LBB1_5
## %bb.3:                               ## %l9
	movq	%rax, %rdi
LBB1_4:                                 ## %l5
	callq	__mini_fun2
LBB1_5:                                 ## %l5
	addq	$56, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l14
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 72(%rsp)
	movq	$10000, 64(%rsp)                ## imm = 0x2710
	movb	$0, 15(%rsp)
	movq	$3, 56(%rsp)
	movq	$5, 48(%rsp)
	movq	$1, 40(%rsp)
	movq	$10000, 32(%rsp)                ## imm = 0x2710
	movb	$0, 14(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	leaq	L_.r64(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	cmpq	$9999, 16(%rsp)                 ## imm = 0x270F
	jg	LBB2_3
## %bb.1:                               ## %l15.preheader
	movl	$1, %r14d
	movl	$10000, %r15d                   ## imm = 0x2710
	leaq	L_.r73(%rip), %rbx
	.p2align	4, 0x90
LBB2_2:                                 ## %l15
                                        ## =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rsi
	movl	$3, %edi
	movl	$5, %edx
	callq	__mini_fun1
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	16(%rsp), %rax
	addq	%r14, %rax
	movq	%rax, 16(%rsp)
	cmpq	%r15, %rax
	jl	LBB2_2
LBB2_3:                                 ## %l17
	xorl	%eax, %eax
	addq	$80, %rsp
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
## %bb.0:                               ## %l19
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_.r4                            ## @.r4
.zerofill __DATA,__common,_.r4,8,3
	.globl	_.r5                            ## @.r5
.zerofill __DATA,__common,_.r5,8,3
	.section	__TEXT,__cstring,cstring_literals
L_.r64:                                 ## @.r64
	.asciz	"%ld"

L_.r73:                                 ## @.r73
	.asciz	"%ld\n"

.subsections_via_symbols
