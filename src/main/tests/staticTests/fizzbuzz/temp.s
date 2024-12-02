	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_fizzbuzz                       ## -- Begin function fizzbuzz
	.p2align	4, 0x90
_fizzbuzz:                              ## @fizzbuzz
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
	movb	$0, 7(%rsp)
	movq	$0, 72(%rsp)
	movq	$3, 64(%rsp)
	movq	$0, 56(%rsp)
	movb	$0, 6(%rsp)
	movq	$1, 48(%rsp)
	movq	$5, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 24(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 4(%rsp)
	movq	$1, 8(%rsp)
	movb	$0, 3(%rsp)
	testl	%edi, %edi
	jle	LBB0_10
## %bb.1:                               ## %l3.preheader
	movl	%edi, %ebx
	xorl	%ebp, %ebp
	movl	$1, %r12d
	movl	$5, %r15d
	leaq	L_.r66(%rip), %r13
	jmp	LBB0_2
	.p2align	4, 0x90
LBB0_9:                                 ## %l14
                                        ##   in Loop: Header=BB0_2 Depth=1
	movq	%r13, %rdi
	callq	_printf
	addl	%r12d, %ebp
	cmpl	%ebx, %ebp
	jge	LBB0_10
LBB0_2:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%ebp, %r14
	movq	%r14, %rax
	cqto
	movl	$3, %ecx
	idivq	%rcx
	testq	%rdx, %rdx
	jne	LBB0_3
## %bb.4:                               ## %l6
                                        ##   in Loop: Header=BB0_2 Depth=1
	leaq	L_.r28(%rip), %rdi
	callq	_printf
	movl	$1, %ecx
	jmp	LBB0_5
	.p2align	4, 0x90
LBB0_3:                                 ##   in Loop: Header=BB0_2 Depth=1
	xorl	%ecx, %ecx
LBB0_5:                                 ## %l8
                                        ##   in Loop: Header=BB0_2 Depth=1
	movq	%r14, %rax
	cqto
	idivq	%r15
	testq	%rdx, %rdx
	jne	LBB0_7
## %bb.6:                               ## %l9
                                        ##   in Loop: Header=BB0_2 Depth=1
	leaq	L_.r46(%rip), %rdi
	callq	_printf
	movl	$1, %ecx
LBB0_7:                                 ## %l11
                                        ##   in Loop: Header=BB0_2 Depth=1
	testw	%cx, %cx
	jne	LBB0_9
## %bb.8:                               ## %l12
                                        ##   in Loop: Header=BB0_2 Depth=1
	leaq	L_.r61(%rip), %rdi
	movl	%ebp, %esi
	callq	_printf
	jmp	LBB0_9
LBB0_10:                                ## %l1
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
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l16
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$100, 16(%rsp)
	movq	$0, 8(%rsp)
	movl	$100, %edi
	callq	_fizzbuzz
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r28:                                 ## @.r28
	.asciz	"Fizz"

L_.r46:                                 ## @.r46
	.asciz	"Buzz"

L_.r61:                                 ## @.r61
	.asciz	"%d"

L_.r66:                                 ## @.r66
	.asciz	"\n"

.subsections_via_symbols
