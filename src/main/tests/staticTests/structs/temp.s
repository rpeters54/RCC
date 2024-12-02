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
	subq	$216, %rsp
	.cfi_def_cfa_offset 272
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$1, 208(%rsp)
	movq	$0, 200(%rsp)
	movq	$2, 192(%rsp)
	movq	$1, 184(%rsp)
	movq	$3, 176(%rsp)
	movq	$2, 168(%rsp)
	movq	$0, 160(%rsp)
	movq	$3, 152(%rsp)
	movq	$0, 144(%rsp)
	movq	$4, 136(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 128(%rsp)
	movl	$1, %r15d
	movq	$4, 120(%rsp)
	movb	$0, 6(%rsp)
	xorl	%ebp, %ebp
	movq	$0, 112(%rsp)
	movq	$0, 104(%rsp)
	movq	$10, 96(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 88(%rsp)
	movq	$10, 80(%rsp)
	movb	$0, 4(%rsp)
	movq	$0, 72(%rsp)
	leaq	24(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	40(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	56(%rsp), %rax
	movq	%rax, 48(%rsp)
	leaq	8(%rsp), %r13
	movq	%r13, 64(%rsp)
	testb	%bpl, %bpl
	jne	LBB0_3
## %bb.1:                               ## %l3.preheader
	movl	$4, %r12d
	leaq	L_.r49(%rip), %rbx
	leaq	L_.r55(%rip), %r14
	.p2align	4, 0x90
LBB0_2:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	_printf
	callq	_getchar
	movslq	%ebp, %rbp
	movq	%rbp, %rcx
	shlq	$4, %rcx
	movb	%al, 8(%rsp,%rcx)
	movq	%r14, %rdi
	movl	%eax, %esi
	callq	_printf
	addl	%r15d, %ebp
	movslq	%ebp, %rax
	cmpq	%r12, %rax
	jl	LBB0_2
LBB0_3:                                 ## %l5
	movl	$10, %r14d
	testq	%r14, %r14
	jle	LBB0_6
## %bb.4:                               ## %l6.preheader
	xorl	%ebp, %ebp
	leaq	L_.r91(%rip), %rbx
	.p2align	4, 0x90
LBB0_5:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	movzbl	(%r13), %esi
	movq	%rbx, %rdi
	callq	_printf
	movq	8(%r13), %r13
	addl	%r15d, %ebp
	movslq	%ebp, %rax
	cmpq	%r14, %rax
	jl	LBB0_5
LBB0_6:                                 ## %l8
	xorl	%eax, %eax
	addq	$216, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r49:                                 ## @.r49
	.asciz	"Gimme a char\n"

	.p2align	4, 0x0                          ## @.r55
L_.r55:
	.asciz	"Got Character: %c\n"

L_.r91:                                 ## @.r91
	.asciz	"%c\n"

.subsections_via_symbols
