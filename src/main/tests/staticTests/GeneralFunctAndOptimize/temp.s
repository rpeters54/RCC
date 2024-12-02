	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_multBy4xTimes            ## -- Begin function _mini_multBy4xTimes
	.p2align	4, 0x90
__mini_multBy4xTimes:                   ## @_mini_multBy4xTimes
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	$0, 24(%rsp)
	movb	$0, 7(%rsp)
	movq	$4, 16(%rsp)
	movq	$1, 8(%rsp)
	testq	%rsi, %rsi
	jg	LBB0_2
## %bb.1:                               ## %l3
	movq	(%rdi), %rax
	jmp	LBB0_3
LBB0_2:                                 ## %l5
	movl	$4, %eax
	imulq	(%rdi), %rax
	movq	%rax, (%rdi)
	subq	$1, %rsi
	movq	%rdi, %rbx
	callq	__mini_multBy4xTimes
	movq	(%rbx), %rax
LBB0_3:                                 ## %l1
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_divideBy8                ## -- Begin function _mini_divideBy8
	.p2align	4, 0x90
__mini_divideBy8:                       ## @_mini_divideBy8
	.cfi_startproc
## %bb.0:                               ## %l7
	movq	$2, -8(%rsp)
	movq	$2, -16(%rsp)
	movq	$2, -24(%rsp)
	movq	(%rdi), %rax
	movq	%rax, %rcx
	shrq	$63, %rcx
	addq	%rax, %rcx
	movq	%rcx, %rax
	sarq	%rax
	shrq	$63, %rcx
	addq	%rax, %rcx
	movq	%rcx, %rax
	sarq	%rax
	shrq	$63, %rcx
	addq	%rax, %rcx
	sarq	%rcx
	movq	%rcx, (%rdi)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l9
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$8, 144(%rsp)
	movq	$1000000, 136(%rsp)             ## imm = 0xF4240
	movq	$0, 128(%rsp)
	xorl	%r14d, %r14d
	movq	$0, 120(%rsp)
	movq	$0, 112(%rsp)
	movq	$50, 104(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 96(%rsp)
	movb	$0, 14(%rsp)
	movq	$39916800, 88(%rsp)             ## imm = 0x2611500
	movq	$1, 80(%rsp)
	movq	$2, 72(%rsp)
	movq	$1, 64(%rsp)
	movq	$0, 56(%rsp)
	movb	$0, 13(%rsp)
	movq	$1, 48(%rsp)
	movb	$0, 12(%rsp)
	movq	$1, 40(%rsp)
	movq	$50, 32(%rsp)
	movb	$0, 11(%rsp)
	movq	$0, 24(%rsp)
	movl	$8, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	$1000000, _.r5(%rip)            ## imm = 0xF4240
	leaq	L_.r75(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	leaq	L_.r77(%rip), %rdi
	leaq	_.r4(%rip), %rsi
	callq	_scanf
	movq	16(%rsp), %rsi
	leaq	L_.r79(%rip), %rdi
	callq	_printf
	movq	_.r4(%rip), %rsi
	leaq	L_.r82(%rip), %rdi
	callq	_printf
	testb	%r14b, %r14b
	jne	LBB2_1
## %bb.2:                               ## %l10.preheader
	movl	$1, %r12d
	movl	$50, %r13d
	xorl	%ebp, %ebp
	xorl	%r15d, %r15d
	jmp	LBB2_3
	.p2align	4, 0x90
LBB2_8:                                 ##   in Loop: Header=BB2_3 Depth=1
	movl	$39916800, %r15d                ## imm = 0x2611500
LBB2_9:                                 ## %l15
                                        ##   in Loop: Header=BB2_3 Depth=1
	addq	%r12, %rbp
	cmpq	%r13, %rbp
	jge	LBB2_10
LBB2_3:                                 ## %l10
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_5 Depth 2
	cmpq	$0, _.r5(%rip)
	movl	$0, %r14d
	js	LBB2_9
## %bb.4:                               ## %l13.preheader
                                        ##   in Loop: Header=BB2_3 Depth=1
	xorl	%r14d, %r14d
	jmp	LBB2_5
	.p2align	4, 0x90
LBB2_7:                                 ## %l18
                                        ##   in Loop: Header=BB2_5 Depth=2
	addq	%rax, %r14
	cmpq	_.r5(%rip), %r14
	jg	LBB2_8
LBB2_5:                                 ## %l13
                                        ##   Parent Loop BB2_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	addq	%r12, %r14
	movq	%r14, (%rbx)
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	__mini_multBy4xTimes
	movq	%rbx, %rdi
	callq	__mini_divideBy8
	movq	_.r4(%rip), %rax
	subq	%r12, %rax
	testq	%rax, %rax
	jg	LBB2_7
## %bb.6:                               ## %l16
                                        ##   in Loop: Header=BB2_5 Depth=2
	movl	$1, %eax
	jmp	LBB2_7
LBB2_1:
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
LBB2_10:                                ## %l12
	leaq	L_.r232(%rip), %rdi
	movq	%r14, %rsi
	callq	_printf
	leaq	L_.r234(%rip), %rdi
	movq	%r15, %rsi
	callq	_printf
	xorl	%eax, %eax
	addq	$152, %rsp
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
## %bb.0:                               ## %l20
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
L_.r75:                                 ## @.r75
	.asciz	"%ld"

L_.r77:                                 ## @.r77
	.asciz	"%ld"

L_.r79:                                 ## @.r79
	.asciz	"%ld\n"

L_.r82:                                 ## @.r82
	.asciz	"%ld\n"

L_.r232:                                ## @.r232
	.asciz	"%ld\n"

L_.r234:                                ## @.r234
	.asciz	"%ld\n"

.subsections_via_symbols
