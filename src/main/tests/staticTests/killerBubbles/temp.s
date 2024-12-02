	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_compare                  ## -- Begin function _mini_compare
	.p2align	4, 0x90
__mini_compare:                         ## @_mini_compare
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	(%rdi), %rax
	subq	(%rsi), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_deathSort                ## -- Begin function _mini_deathSort
	.p2align	4, 0x90
__mini_deathSort:                       ## @_mini_deathSort
	.cfi_startproc
## %bb.0:                               ## %l4
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$1, 48(%rsp)
	movq	$1, 40(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 32(%rsp)
	xorl	%eax, %eax
	movb	$0, 6(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 16(%rsp)
	movb	$0, 4(%rsp)
	movq	$1, 8(%rsp)
	movb	$0, 3(%rsp)
	testb	%al, %al
	jne	LBB1_8
## %bb.1:                               ## %l5.preheader
	movq	%rdi, %rbx
	movl	$1, %r15d
	jmp	LBB1_2
	.p2align	4, 0x90
LBB1_7:                                 ## %l10
                                        ##   in Loop: Header=BB1_2 Depth=1
	cmpq	%r15, %r12
	jne	LBB1_8
LBB1_2:                                 ## %l5
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_4 Depth 2
	cmpq	%rbx, 16(%rbx)
	movl	$0, %r12d
	je	LBB1_7
## %bb.3:                               ## %l8.preheader
                                        ##   in Loop: Header=BB1_2 Depth=1
	movq	%rbx, %r14
	xorl	%r12d, %r12d
	jmp	LBB1_4
	.p2align	4, 0x90
LBB1_6:                                 ## %l13
                                        ##   in Loop: Header=BB1_4 Depth=2
	movq	16(%r14), %r14
	cmpq	%rbx, 16(%r14)
	je	LBB1_7
LBB1_4:                                 ## %l8
                                        ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	16(%r14), %rsi
	movq	%r14, %rdi
	callq	__mini_compare
	testq	%rax, %rax
	jle	LBB1_6
## %bb.5:                               ## %l11
                                        ##   in Loop: Header=BB1_4 Depth=2
	movq	(%r14), %rax
	movq	16(%r14), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, (%r14)
	movq	%rax, (%rcx)
	movl	$1, %r12d
	jmp	LBB1_6
LBB1_8:                                 ## %l3
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_printEVILList            ## -- Begin function _mini_printEVILList
	.p2align	4, 0x90
__mini_printEVILList:                   ## @_mini_printEVILList
	.cfi_startproc
## %bb.0:                               ## %l15
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movb	$0, 7(%rsp)
	movb	$0, 6(%rsp)
	movq	(%rdi), %rsi
	movq	16(%rdi), %r14
	leaq	L_.r112(%rip), %rdi
	callq	_printf
	movq	%rbx, %rdi
	callq	_free
	cmpq	%rbx, %r14
	je	LBB2_3
## %bb.1:                               ## %l16.preheader
	leaq	L_.r124(%rip), %r15
	.p2align	4, 0x90
LBB2_2:                                 ## %l16
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%r14), %rsi
	movq	%r15, %rdi
	callq	_printf
	movq	16(%r14), %r12
	movq	%r14, %rdi
	callq	_free
	cmpq	%rbx, %r12
	movq	%r12, %r14
	jne	LBB2_2
LBB2_3:                                 ## %l14
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l20
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$666, 112(%rsp)                 ## imm = 0x29A
	movq	$0, 104(%rsp)
	movb	$0, 15(%rsp)
	movq	$-1, 96(%rsp)
	movq	$-1, 88(%rsp)
	movq	$1000, 80(%rsp)                 ## imm = 0x3E8
	movq	$24, 72(%rsp)
	movq	$1, 64(%rsp)
	movq	$0, 56(%rsp)
	movb	$0, 14(%rsp)
	movq	$24, 48(%rsp)
	movq	$1, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 13(%rsp)
	movq	$0, 24(%rsp)
	movq	$666, _.r4(%rip)                ## imm = 0x29A
	leaq	L_.r156(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	cmpq	$0, 16(%rsp)
	jg	LBB3_2
## %bb.1:                               ## %l21
	movq	$-1, %rbx
	leaq	L_.r165(%rip), %rdi
	movq	$-1, %rsi
	callq	_printf
	jmp	LBB3_6
LBB3_2:                                 ## %l23
	movl	$1000, %r15d                    ## imm = 0x3E8
	movl	$1, %r12d
	xorl	%ebx, %ebx
	imulq	16(%rsp), %r15
	movq	%r15, 16(%rsp)
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %r14
	movq	%r15, (%rax)
	movq	%rax, 8(%rax)
	movq	%rax, 16(%rax)
	subq	$1, %r15
	testq	%r15, %r15
	jle	LBB3_5
## %bb.3:                               ## %l24.preheader
	movl	$1, %r13d
	negq	%r13
	movq	%r14, %rbp
	.p2align	4, 0x90
LBB3_4:                                 ## %l24
                                        ## =>This Inner Loop Header: Depth=1
	movl	$24, %edi
	callq	_malloc
	movq	%r15, (%rax)
	movq	%rbp, 8(%rax)
	movq	%r14, 16(%rax)
	movq	%rax, 16(%rbp)
	leaq	(%r13,%r15), %rcx
	subq	%r12, %r15
	testq	%rcx, %rcx
	movq	%rax, %rbp
	jg	LBB3_4
LBB3_5:                                 ## %l26
	movq	%r14, %rdi
	callq	__mini_deathSort
	movq	%r14, %rdi
	callq	__mini_printEVILList
LBB3_6:                                 ## %l19
	movq	%rbx, %rax
	addq	$120, %rsp
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
## %bb.0:                               ## %l28
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
L_.r112:                                ## @.r112
	.asciz	"%ld\n"

L_.r124:                                ## @.r124
	.asciz	"%ld\n"

L_.r156:                                ## @.r156
	.asciz	"%ld"

L_.r165:                                ## @.r165
	.asciz	"%ld\n"

.subsections_via_symbols
