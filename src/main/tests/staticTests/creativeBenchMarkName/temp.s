	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_buildList                ## -- Begin function _mini_buildList
	.p2align	4, 0x90
__mini_buildList:                       ## @_mini_buildList
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$16, 48(%rsp)
	movq	$16, 40(%rsp)
	movq	$16, 32(%rsp)
	movq	$16, 24(%rsp)
	movq	$16, 16(%rsp)
	movq	$16, 8(%rsp)
	movq	$0, (%rsp)
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r15
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r12
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r13
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %rbp
	leaq	L_.r51(%rip), %rdi
	movq	%rbx, %rsi
	callq	_scanf
	leaq	L_.r54(%rip), %rdi
	movq	%r14, %rsi
	callq	_scanf
	leaq	L_.r57(%rip), %rdi
	movq	%r15, %rsi
	callq	_scanf
	leaq	L_.r60(%rip), %rdi
	movq	%r12, %rsi
	callq	_scanf
	leaq	L_.r63(%rip), %rdi
	movq	%r13, %rsi
	callq	_scanf
	leaq	L_.r66(%rip), %rdi
	movq	%rbp, %rsi
	callq	_scanf
	movq	%r14, 8(%rbx)
	movq	%r15, 8(%r14)
	movq	%r12, 8(%r15)
	movq	%r13, 8(%r12)
	movq	%rbp, 8(%r13)
	movq	$0, 8(%rbp)
	movq	%rbx, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_multiple                 ## -- Begin function _mini_multiple
	.p2align	4, 0x90
__mini_multiple:                        ## @_mini_multiple
	.cfi_startproc
## %bb.0:                               ## %l4
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 32(%rsp)
	xorl	%eax, %eax
	movq	$5, 24(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 16(%rsp)
	movq	$5, 8(%rsp)
	movb	$0, 6(%rsp)
	movq	(%rdi), %rbx
	testb	%al, %al
	jne	LBB1_3
## %bb.1:                               ## %l5.preheader
	movl	$1, %r15d
	movl	$5, %r12d
	movq	8(%rdi), %r13
	leaq	L_.r109(%rip), %r14
	movl	$1, %ebp
	.p2align	4, 0x90
LBB1_2:                                 ## %l5
                                        ## =>This Inner Loop Header: Depth=1
	imulq	(%r13), %rbx
	movq	8(%r13), %r13
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_printf
	cmpq	%r12, %rbp
	leaq	(%rbp,%r15), %rbp
	jl	LBB1_2
LBB1_3:                                 ## %l7
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_add                      ## -- Begin function _mini_add
	.p2align	4, 0x90
__mini_add:                             ## @_mini_add
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 32(%rsp)
	xorl	%eax, %eax
	movq	$5, 24(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 16(%rsp)
	movq	$5, 8(%rsp)
	movb	$0, 6(%rsp)
	movq	(%rdi), %rbx
	testb	%al, %al
	jne	LBB2_3
## %bb.1:                               ## %l10.preheader
	movl	$1, %r15d
	movl	$5, %r12d
	movq	8(%rdi), %r13
	leaq	L_.r159(%rip), %r14
	movl	$1, %ebp
	.p2align	4, 0x90
LBB2_2:                                 ## %l10
                                        ## =>This Inner Loop Header: Depth=1
	addq	(%r13), %rbx
	movq	8(%r13), %r13
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_printf
	cmpq	%r12, %rbp
	leaq	(%rbp,%r15), %rbp
	jl	LBB2_2
LBB2_3:                                 ## %l12
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_recurseList              ## -- Begin function _mini_recurseList
	.p2align	4, 0x90
__mini_recurseList:                     ## @_mini_recurseList
	.cfi_startproc
## %bb.0:                               ## %l14
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	$0, 8(%rsp)
	movb	$0, 7(%rsp)
	cmpq	$0, 8(%rdi)
	jne	LBB3_2
## %bb.1:                               ## %l15
	movq	(%rdi), %rax
	jmp	LBB3_3
LBB3_2:                                 ## %l16
	movq	(%rdi), %rbx
	movq	8(%rdi), %rdi
	callq	__mini_recurseList
	imulq	%rbx, %rax
LBB3_3:                                 ## %l13
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l18
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
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 96(%rsp)
	xorl	%ebx, %ebx
	movq	$0, 88(%rsp)
	movq	$2, 80(%rsp)
	movq	$2, 72(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 64(%rsp)
	movl	$1, %r12d
	movq	$2, 56(%rsp)
	movb	$0, 14(%rsp)
	movq	$0, 48(%rsp)
	movb	$0, 13(%rsp)
	movq	$1, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 12(%rsp)
	movq	$0, 24(%rsp)
	callq	__mini_buildList
	movq	%rax, %r15
	movq	%rax, %rdi
	callq	__mini_multiple
	movq	%rax, 16(%rsp)                  ## 8-byte Spill
	movq	%r15, %rdi
	callq	__mini_add
	movq	%rax, %r13
	shrq	$63, %r13
	addq	%rax, %r13
	sarq	%r13
	testb	%bl, %bl
	jne	LBB4_3
## %bb.1:                               ## %l19.preheader
	movl	$2, %ebp
	movl	$1, %r14d
	.p2align	4, 0x90
LBB4_2:                                 ## %l19
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	callq	__mini_recurseList
	addq	%rax, %rbx
	cmpq	%rbp, %r14
	leaq	(%r14,%r12), %r14
	jl	LBB4_2
LBB4_3:                                 ## %l21
	movq	16(%rsp), %r14                  ## 8-byte Reload
	subq	%r13, %r14
	leaq	L_.r259(%rip), %rdi
	movq	%rbx, %rsi
	callq	_printf
	testq	%rbx, %rbx
	je	LBB4_4
## %bb.5:                               ## %l22.preheader
	movq	%rbx, %r15
	.p2align	4, 0x90
LBB4_6:                                 ## %l22
                                        ## =>This Inner Loop Header: Depth=1
	subq	%r12, %r15
	cmpq	%rbx, %r12
	movq	%r15, %rbx
	jne	LBB4_6
	jmp	LBB4_7
LBB4_4:
	movq	%rbx, %r15
LBB4_7:                                 ## %l24
	leaq	L_.r294(%rip), %rdi
	movq	%r14, %rsi
	callq	_printf
	leaq	L_.r296(%rip), %rdi
	movq	%r15, %rsi
	callq	_printf
	xorl	%eax, %eax
	addq	$104, %rsp
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
## %bb.0:                               ## %l26
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	__mini_main
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r51:                                 ## @.r51
	.asciz	"%ld"

L_.r54:                                 ## @.r54
	.asciz	"%ld"

L_.r57:                                 ## @.r57
	.asciz	"%ld"

L_.r60:                                 ## @.r60
	.asciz	"%ld"

L_.r63:                                 ## @.r63
	.asciz	"%ld"

L_.r66:                                 ## @.r66
	.asciz	"%ld"

L_.r109:                                ## @.r109
	.asciz	"%ld\n"

L_.r159:                                ## @.r159
	.asciz	"%ld\n"

L_.r259:                                ## @.r259
	.asciz	"%ld\n"

L_.r294:                                ## @.r294
	.asciz	"%ld\n"

L_.r296:                                ## @.r296
	.asciz	"%ld\n"

.subsections_via_symbols
