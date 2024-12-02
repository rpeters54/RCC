	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_mod                      ## -- Begin function _mini_mod
	.p2align	4, 0x90
__mini_mod:                             ## @_mini_mod
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	%rdi, %rax
	cqto
	idivq	%rsi
	imulq	%rsi, %rax
	subq	%rax, %rdi
	movq	%rdi, %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_hailstone                ## -- Begin function _mini_hailstone
	.p2align	4, 0x90
__mini_hailstone:                       ## @_mini_hailstone
	.cfi_startproc
## %bb.0:                               ## %l4
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$96, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$1, 88(%rsp)
	movq	$0, 80(%rsp)
	movq	$2, 72(%rsp)
	movq	$1, 64(%rsp)
	movb	$0, 15(%rsp)
	xorl	%eax, %eax
	movq	$3, 56(%rsp)
	movq	$1, 48(%rsp)
	movq	$2, 40(%rsp)
	movq	$1, 32(%rsp)
	movb	$0, 14(%rsp)
	movq	$1, 24(%rsp)
	movq	$0, 16(%rsp)
	testb	%al, %al
	jne	LBB1_8
## %bb.1:                               ## %l5.preheader
	movq	%rdi, %rbx
	movl	$2, %r15d
	movl	$1, %r12d
	movl	$3, %r13d
	leaq	L_.r19(%rip), %r14
	.p2align	4, 0x90
LBB1_2:                                 ## %l5
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_printf
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	__mini_mod
	cmpq	%r12, %rax
	jne	LBB1_4
## %bb.3:                               ## %l8
                                        ##   in Loop: Header=BB1_2 Depth=1
	imulq	%r13, %rbx
	addq	%r12, %rbx
	cmpq	%r12, %rbx
	jg	LBB1_7
	jmp	LBB1_6
	.p2align	4, 0x90
LBB1_4:                                 ## %l9
                                        ##   in Loop: Header=BB1_2 Depth=1
	movq	%rbx, %rax
	cqto
	idivq	%r15
	movq	%rax, %rbx
	cmpq	%r12, %rbx
	jle	LBB1_6
LBB1_7:                                 ## %l6
                                        ##   in Loop: Header=BB1_2 Depth=1
	testq	%r12, %r12
	jne	LBB1_2
	jmp	LBB1_8
LBB1_6:                                 ## %l11
	leaq	L_.r46(%rip), %rdi
	movq	%rbx, %rsi
	callq	_printf
LBB1_8:                                 ## %l3
	addq	$96, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l15
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 16(%rsp)
	leaq	L_.r57(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	movq	8(%rsp), %rdi
	callq	__mini_hailstone
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l17
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r19:                                 ## @.r19
	.asciz	"%ld "

L_.r46:                                 ## @.r46
	.asciz	"%ld\n"

L_.r57:                                 ## @.r57
	.asciz	"%ld"

.subsections_via_symbols
