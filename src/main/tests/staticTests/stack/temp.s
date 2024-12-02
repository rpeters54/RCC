	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
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
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 80(%rsp)
	movq	$100, 72(%rsp)
	movb	$0, 7(%rsp)
	movq	$4, 64(%rsp)
	movq	$1, 56(%rsp)
	movl	$1, %r12d
	movq	$100, 48(%rsp)
	movl	$100, %r13d
	movb	$0, 6(%rsp)
	xorl	%ebp, %ebp
	movq	$0, 40(%rsp)
	movq	$100, 32(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 24(%rsp)
	movq	$100, 16(%rsp)
	movb	$0, 4(%rsp)
	movq	$0, 8(%rsp)
	callq	_make
	movq	%rax, %rbx
	testb	%bpl, %bpl
	jne	LBB0_3
## %bb.1:                               ## %l3.preheader
	leaq	L_.r32(%rip), %r14
	.p2align	4, 0x90
LBB0_2:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	movl	$4, %edi
	callq	_malloc
	movq	%rax, %r15
	movl	%ebp, (%rax)
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_printf
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_push
	addl	%r12d, %ebp
	movslq	%ebp, %rax
	cmpq	%r13, %rax
	jl	LBB0_2
LBB0_3:                                 ## %l5
	testq	%r13, %r13
	jle	LBB0_6
## %bb.4:                               ## %l6.preheader
	xorl	%ebp, %ebp
	leaq	L_.r69(%rip), %r14
	.p2align	4, 0x90
LBB0_5:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	_pop
	movl	(%rax), %esi
	movq	%r14, %rdi
	callq	_printf
	addl	%r12d, %ebp
	movslq	%ebp, %rax
	cmpq	%r13, %rax
	jl	LBB0_5
LBB0_6:                                 ## %l8
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_pop                            ## -- Begin function pop
	.p2align	4, 0x90
_pop:                                   ## @pop
	.cfi_startproc
## %bb.0:                               ## %l10
	movq	$0, -8(%rsp)
	movb	$0, -25(%rsp)
	movq	$0, -16(%rsp)
	movq	$1, -24(%rsp)
	cmpl	$0, (%rdi)
	jne	LBB1_2
## %bb.1:
	xorl	%eax, %eax
	retq
LBB1_2:                                 ## %l13
	movl	$1, %ecx
	movq	8(%rdi), %rdx
	movq	(%rdx), %rax
	movq	8(%rdx), %rdx
	movq	%rdx, 8(%rdi)
	subl	%ecx, (%rdi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_push                           ## -- Begin function push
	.p2align	4, 0x90
_push:                                  ## @push
	.cfi_startproc
## %bb.0:                               ## %l15
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %r14
	movq	%rdi, %rbx
	movq	$16, 32(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 16(%rsp)
	movl	$16, %edi
	callq	_malloc
	testq	%rax, %rax
	je	LBB2_2
## %bb.1:                               ## %l18
	movl	$1, %ecx
	movq	%r14, (%rax)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%rax)
	movq	%rax, 8(%rbx)
	addl	%ecx, (%rbx)
LBB2_2:                                 ## %l14
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_make                           ## -- Begin function make
	.p2align	4, 0x90
_make:                                  ## @make
	.cfi_startproc
## %bb.0:                               ## %l20
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	$12, 48(%rsp)
	movq	$0, 40(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	movl	$12, %edi
	callq	_malloc
	testq	%rax, %rax
	jne	LBB3_2
## %bb.1:                               ## %l21
	xorl	%eax, %eax
	addq	$56, %rsp
	retq
LBB3_2:                                 ## %l23
	movl	$0, (%rax)
	movq	$0, 8(%rax)
	addq	$56, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4, 0x0                          ## @.r32
L_.r32:
	.asciz	"Value in the stack: %d\n"

	.p2align	4, 0x0                          ## @.r69
L_.r69:
	.asciz	"Value in the stack: %d\n"

.subsections_via_symbols
