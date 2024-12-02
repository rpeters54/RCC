	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$1096, %rsp                     ## imm = 0x448
	.cfi_def_cfa_offset 1136
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 88(%rsp)
	movq	$250, 80(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 72(%rsp)
	movl	$1, %r14d
	movq	$250, 64(%rsp)
	movl	$250, %r15d
	movb	$0, 14(%rsp)
	xorl	%ebx, %ebx
	movq	$250, 56(%rsp)
	movq	$0, 48(%rsp)
	movq	$250, 40(%rsp)
	movb	$0, 13(%rsp)
	movq	$1, 32(%rsp)
	movq	$250, 24(%rsp)
	movb	$0, 12(%rsp)
	movq	$0, 16(%rsp)
	testb	%bl, %bl
	jne	LBB0_2
	.p2align	4, 0x90
LBB0_1:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	callq	_rand
	movslq	%ebx, %rbx
	movl	%eax, 96(%rsp,%rbx,4)
	addl	%r14d, %ebx
	movslq	%ebx, %rax
	cmpq	%r15, %rax
	jl	LBB0_1
LBB0_2:                                 ## %l5
	leaq	96(%rsp), %rdi
	movl	$250, %esi
	callq	_selection_sort
	testq	%r15, %r15
	jle	LBB0_5
## %bb.3:                               ## %l6.preheader
	xorl	%r12d, %r12d
	leaq	L_.r49(%rip), %rbx
	.p2align	4, 0x90
LBB0_4:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%r12d, %r12
	movl	96(%rsp,%r12,4), %esi
	movq	%rbx, %rdi
	callq	_printf
	addl	%r14d, %r12d
	movslq	%r12d, %rax
	cmpq	%r15, %rax
	jl	LBB0_4
LBB0_5:                                 ## %l8
	xorl	%eax, %eax
	addq	$1096, %rsp                     ## imm = 0x448
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_selection_sort                 ## -- Begin function selection_sort
	.p2align	4, 0x90
_selection_sort:                        ## @selection_sort
	.cfi_startproc
## %bb.0:                               ## %l10
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	$1, 64(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movb	$0, 6(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 40(%rsp)
	movb	$0, 4(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$1, 16(%rsp)
	movq	$1, 8(%rsp)
	movslq	%esi, %rax
	cmpq	$2, %rax
	jl	LBB1_8
## %bb.1:                               ## %l13
	movl	$1, %ecx
	movl	$1, %eax
	xorl	%edx, %edx
	testl	%esi, %esi
	jle	LBB1_2
## %bb.3:                               ## %l14.preheader
	xorl	%r9d, %r9d
	jmp	LBB1_4
	.p2align	4, 0x90
LBB1_6:                                 ## %l19
                                        ##   in Loop: Header=BB1_4 Depth=1
	addl	%ecx, %edx
	cmpl	%esi, %edx
	movl	%r8d, %r9d
	jge	LBB1_7
LBB1_4:                                 ## %l14
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%edx, %r8
	movl	(%rdi,%r8,4), %r8d
	movslq	%r9d, %r10
	cmpl	(%rdi,%r10,4), %r8d
	movl	%edx, %r8d
	jl	LBB1_6
## %bb.5:                               ## %l18
                                        ##   in Loop: Header=BB1_4 Depth=1
	movl	%r9d, %r8d
	jmp	LBB1_6
LBB1_2:
	xorl	%r8d, %r8d
LBB1_7:                                 ## %l16
	movl	(%rdi), %edx
	movslq	%r8d, %r8
	movl	(%rdi,%r8,4), %r9d
	movl	%r9d, (%rdi)
	movl	%edx, (%rdi,%r8,4)
	leaq	(%rdi,%rcx,4), %rdi
	subl	%eax, %esi
	callq	_selection_sort
LBB1_8:                                 ## %l9
	addq	$72, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r49:                                 ## @.r49
	.asciz	"%d\n"

.subsections_via_symbols
