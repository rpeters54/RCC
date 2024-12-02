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
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$496, %rsp                      ## imm = 0x1F0
	.cfi_def_cfa_offset 544
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 88(%rsp)
	movq	$0, 80(%rsp)
	movq	$100, 72(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 64(%rsp)
	movl	$1, %r15d
	movq	$100, 56(%rsp)
	movl	$100, %r12d
	movb	$0, 14(%rsp)
	xorl	%ebx, %ebx
	movq	$0, 48(%rsp)
	movq	$100, 40(%rsp)
	movb	$0, 13(%rsp)
	movq	$1, 32(%rsp)
	movq	$100, 24(%rsp)
	movb	$0, 12(%rsp)
	movq	$0, 16(%rsp)
	xorl	%edi, %edi
	callq	_srand
	testb	%bl, %bl
	jne	LBB0_3
## %bb.1:                               ## %l3.preheader
	leaq	L_.r25(%rip), %r14
	.p2align	4, 0x90
LBB0_2:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	callq	_rand
	movl	%eax, %ebp
	movq	%r14, %rdi
	movl	%ebx, %esi
	movl	%eax, %edx
	callq	_printf
	movslq	%ebx, %rbx
	movl	%ebp, 96(%rsp,%rbx,4)
	addl	%r15d, %ebx
	movslq	%ebx, %rax
	cmpq	%r12, %rax
	jl	LBB0_2
LBB0_3:                                 ## %l5
	testq	%r12, %r12
	jle	LBB0_6
## %bb.4:                               ## %l6.preheader
	xorl	%ebx, %ebx
	leaq	L_.r56(%rip), %r14
	.p2align	4, 0x90
LBB0_5:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%ebx, %rbx
	movl	96(%rsp,%rbx,4), %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_printf
	addl	%r15d, %ebx
	movslq	%ebx, %rax
	cmpq	%r12, %rax
	jl	LBB0_5
LBB0_6:                                 ## %l8
	xorl	%eax, %eax
	addq	$496, %rsp                      ## imm = 0x1F0
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4, 0x0                          ## @.r25
L_.r25:
	.asciz	"Iteration %d: Generated Value %d\n"

	.p2align	4, 0x0                          ## @.r56
L_.r56:
	.asciz	"Iteration %d: Read Value %d\n"

.subsections_via_symbols
