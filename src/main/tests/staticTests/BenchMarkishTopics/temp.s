	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_length                   ## -- Begin function _mini_length
	.p2align	4, 0x90
__mini_length:                          ## @_mini_length
	.cfi_startproc
## %bb.0:                               ## %l2
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	$0, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 24(%rsp)
	movq	$1, 16(%rsp)
	testq	%rdi, %rdi
	jne	LBB0_2
## %bb.1:
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
LBB0_2:                                 ## %l5
	movq	8(%rdi), %rdi
	callq	__mini_length
	addq	$1, %rax
	addq	$40, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_addToFront               ## -- Begin function _mini_addToFront
	.p2align	4, 0x90
__mini_addToFront:                      ## @_mini_addToFront
	.cfi_startproc
## %bb.0:                               ## %l7
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	$0, 32(%rsp)
	movb	$0, 7(%rsp)
	movq	$16, 24(%rsp)
	movq	$0, 16(%rsp)
	movq	$16, 8(%rsp)
	testq	%rdi, %rdi
	jne	LBB1_2
## %bb.1:                               ## %l8
	movl	$16, %edi
	callq	_malloc
	movq	%rbx, (%rax)
	movq	$0, 8(%rax)
	jmp	LBB1_3
LBB1_2:                                 ## %l10
	movq	%rdi, %r14
	movl	$16, %edi
	callq	_malloc
	movq	%rbx, (%rax)
	movq	%r14, 8(%rax)
LBB1_3:                                 ## %l6
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_deleteFirst              ## -- Begin function _mini_deleteFirst
	.p2align	4, 0x90
__mini_deleteFirst:                     ## @_mini_deleteFirst
	.cfi_startproc
## %bb.0:                               ## %l12
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	$0, 24(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 16(%rsp)
	testq	%rdi, %rdi
	jne	LBB2_2
## %bb.1:                               ## %l13
	xorl	%ebx, %ebx
	jmp	LBB2_3
LBB2_2:                                 ## %l15
	movq	8(%rdi), %rbx
	callq	_free
LBB2_3:                                 ## %l11
	movq	%rbx, %rax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l17
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 64(%rsp)
	xorl	%ebx, %ebx
	movq	$0, 56(%rsp)
	movq	$0, 48(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 6(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 5(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 4(%rsp)
	movq	$0, 8(%rsp)
	leaq	L_.r77(%rip), %rdi
	leaq	_.r4(%rip), %rsi
	callq	_scanf
	cmpq	$0, _.r4(%rip)
	movl	$0, %r14d
	jle	LBB3_3
## %bb.1:                               ## %l18.preheader
	movl	$1, %r12d
	xorl	%r14d, %r14d
	leaq	L_.r95(%rip), %r15
	.p2align	4, 0x90
LBB3_2:                                 ## %l18
                                        ## =>This Inner Loop Header: Depth=1
	movq	_.r4(%rip), %rsi
	movq	%r14, %rdi
	callq	__mini_addToFront
	movq	%rax, %r14
	movq	(%rax), %rsi
	movq	%r15, %rdi
	callq	_printf
	movq	_.r4(%rip), %rax
	subq	%r12, %rax
	movq	%rax, _.r4(%rip)
	testq	%rax, %rax
	jg	LBB3_2
LBB3_3:                                 ## %l20
	movq	%r14, %rdi
	callq	__mini_length
	leaq	L_.r114(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	%r14, %rdi
	callq	__mini_length
	testq	%rax, %rax
	jle	LBB3_6
## %bb.4:                               ## %l21.preheader
	leaq	L_.r129(%rip), %r15
	.p2align	4, 0x90
LBB3_5:                                 ## %l21
                                        ## =>This Inner Loop Header: Depth=1
	addq	(%r14), %rbx
	movq	%r14, %rdi
	callq	__mini_length
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	%r14, %rdi
	callq	__mini_deleteFirst
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	__mini_length
	testq	%rax, %rax
	jg	LBB3_5
LBB3_6:                                 ## %l23
	leaq	L_.r144(%rip), %rdi
	movq	%rbx, %rsi
	callq	_printf
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l25
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
	.section	__TEXT,__cstring,cstring_literals
L_.r77:                                 ## @.r77
	.asciz	"%ld"

L_.r95:                                 ## @.r95
	.asciz	"%ld "

L_.r114:                                ## @.r114
	.asciz	"%ld "

L_.r129:                                ## @.r129
	.asciz	"%ld "

L_.r144:                                ## @.r144
	.asciz	"%ld\n"

.subsections_via_symbols
