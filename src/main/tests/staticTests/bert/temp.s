	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_concatLists              ## -- Begin function _mini_concatLists
	.p2align	4, 0x90
__mini_concatLists:                     ## @_mini_concatLists
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	$0, -8(%rsp)
	movb	$0, -25(%rsp)
	movq	$0, -16(%rsp)
	movb	$0, -26(%rsp)
	movq	$0, -24(%rsp)
	movb	$0, -27(%rsp)
	testq	%rdi, %rdi
	jne	LBB0_2
## %bb.1:
	movq	%rsi, %rax
	retq
LBB0_2:                                 ## %l5
	movq	%rdi, %rax
	cmpq	$0, 8(%rdi)
	movq	%rdi, %rcx
	je	LBB0_5
## %bb.3:                               ## %l6.preheader
	movq	%rax, %rcx
	.p2align	4, 0x90
LBB0_4:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	movq	8(%rcx), %rcx
	cmpq	$0, 8(%rcx)
	jne	LBB0_4
LBB0_5:                                 ## %l8
	movq	%rsi, 8(%rcx)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_add                      ## -- Begin function _mini_add
	.p2align	4, 0x90
__mini_add:                             ## @_mini_add
	.cfi_startproc
## %bb.0:                               ## %l10
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	$16, (%rsp)
	movl	$16, %edi
	callq	_malloc
	movq	%rbx, (%rax)
	movq	%r14, 8(%rax)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_size                     ## -- Begin function _mini_size
	.p2align	4, 0x90
__mini_size:                            ## @_mini_size
	.cfi_startproc
## %bb.0:                               ## %l12
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	$0, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 24(%rsp)
	movq	$1, 16(%rsp)
	testq	%rdi, %rdi
	jne	LBB2_2
## %bb.1:
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
LBB2_2:                                 ## %l15
	movq	8(%rdi), %rdi
	callq	__mini_size
	addq	$1, %rax
	addq	$40, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_get                      ## -- Begin function _mini_get
	.p2align	4, 0x90
__mini_get:                             ## @_mini_get
	.cfi_startproc
## %bb.0:                               ## %l17
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 16(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 8(%rsp)
	testq	%rsi, %rsi
	jne	LBB3_2
## %bb.1:                               ## %l18
	movq	(%rdi), %rax
	addq	$24, %rsp
	retq
LBB3_2:                                 ## %l20
	movq	8(%rdi), %rdi
	subq	$1, %rsi
	callq	__mini_get
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_pop                      ## -- Begin function _mini_pop
	.p2align	4, 0x90
__mini_pop:                             ## @_mini_pop
	.cfi_startproc
## %bb.0:                               ## %l22
	movq	8(%rdi), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_printList                ## -- Begin function _mini_printList
	.p2align	4, 0x90
__mini_printList:                       ## @_mini_printList
	.cfi_startproc
## %bb.0:                               ## %l24
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	$0, 8(%rsp)
	movb	$0, 7(%rsp)
	testq	%rdi, %rdi
	je	LBB5_2
## %bb.1:                               ## %l25
	movq	(%rdi), %rsi
	leaq	L_.r114(%rip), %rax
	movq	%rdi, %rbx
	movq	%rax, %rdi
	callq	_printf
	movq	8(%rbx), %rdi
	callq	__mini_printList
LBB5_2:                                 ## %l23
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_treeprint                ## -- Begin function _mini_treeprint
	.p2align	4, 0x90
__mini_treeprint:                       ## @_mini_treeprint
	.cfi_startproc
## %bb.0:                               ## %l29
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	$0, 8(%rsp)
	movb	$0, 7(%rsp)
	testq	%rdi, %rdi
	je	LBB6_2
## %bb.1:                               ## %l30
	movq	8(%rdi), %rax
	movq	%rdi, %rbx
	movq	%rax, %rdi
	callq	__mini_treeprint
	movq	(%rbx), %rsi
	leaq	L_.r132(%rip), %rdi
	callq	_printf
	movq	16(%rbx), %rdi
	callq	__mini_treeprint
LBB6_2:                                 ## %l28
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_freeList                 ## -- Begin function _mini_freeList
	.p2align	4, 0x90
__mini_freeList:                        ## @_mini_freeList
	.cfi_startproc
## %bb.0:                               ## %l34
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	$0, 8(%rsp)
	movb	$0, 7(%rsp)
	testq	%rdi, %rdi
	je	LBB7_2
## %bb.1:                               ## %l35
	movq	8(%rdi), %rax
	movq	%rdi, %rbx
	movq	%rax, %rdi
	callq	__mini_freeList
	movq	%rbx, %rdi
	callq	_free
LBB7_2:                                 ## %l33
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_freeTree                 ## -- Begin function _mini_freeTree
	.p2align	4, 0x90
__mini_freeTree:                        ## @_mini_freeTree
	.cfi_startproc
## %bb.0:                               ## %l39
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	$0, 8(%rsp)
	movb	$0, 7(%rsp)
	movb	$0, 6(%rsp)
	testq	%rdi, %rdi
	je	LBB8_2
## %bb.1:                               ## %l40
	movq	8(%rdi), %rax
	movq	%rdi, %rbx
	movq	%rax, %rdi
	callq	__mini_freeTree
	movq	16(%rbx), %rdi
	callq	__mini_freeTree
	movq	%rbx, %rdi
	callq	_free
LBB8_2:                                 ## %l38
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_postOrder                ## -- Begin function _mini_postOrder
	.p2align	4, 0x90
__mini_postOrder:                       ## @_mini_postOrder
	.cfi_startproc
## %bb.0:                               ## %l44
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 40(%rsp)
	movb	$0, 15(%rsp)
	movq	$16, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	testq	%rdi, %rdi
	je	LBB9_2
## %bb.1:                               ## %l45
	movq	%rdi, %rbx
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%rax, (%r14)
	movq	$0, 8(%r14)
	movq	8(%rbx), %rdi
	callq	__mini_postOrder
	movq	%rax, %r15
	movq	16(%rbx), %rdi
	callq	__mini_postOrder
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	__mini_concatLists
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	__mini_concatLists
	jmp	LBB9_3
LBB9_2:                                 ## %l47
	xorl	%eax, %eax
LBB9_3:                                 ## %l43
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_treeadd                  ## -- Begin function _mini_treeadd
	.p2align	4, 0x90
__mini_treeadd:                         ## @_mini_treeadd
	.cfi_startproc
## %bb.0:                               ## %l49
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movq	$0, 40(%rsp)
	movb	$0, 15(%rsp)
	movq	$24, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 14(%rsp)
	testq	%rdi, %rdi
	jne	LBB10_2
## %bb.1:                               ## %l50
	movl	$24, %edi
	movq	%rsi, %rbx
	callq	_malloc
	movq	%rbx, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	jmp	LBB10_5
LBB10_2:                                ## %l52
	cmpq	(%rdi), %rsi
	jge	LBB10_4
## %bb.3:                               ## %l53
	movq	8(%rdi), %rax
	movq	%rdi, %rbx
	movq	%rax, %rdi
	callq	__mini_treeadd
	movq	%rax, %rcx
	movq	%rbx, %rax
	movq	%rcx, 8(%rbx)
	jmp	LBB10_5
LBB10_4:                                ## %l54
	movq	16(%rdi), %rax
	movq	%rdi, %rbx
	movq	%rax, %rdi
	callq	__mini_treeadd
	movq	%rax, %rcx
	movq	%rbx, %rax
	movq	%rcx, 16(%rbx)
LBB10_5:                                ## %l48
	addq	$48, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_quickSort                ## -- Begin function _mini_quickSort
	.p2align	4, 0x90
__mini_quickSort:                       ## @_mini_quickSort
	.cfi_startproc
## %bb.0:                               ## %l57
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
	movq	%rdi, %rbp
	movq	$0, 80(%rsp)
	movq	$0, 72(%rsp)
	movq	$1, 64(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 56(%rsp)
	movq	$1, 48(%rsp)
	movq	$2, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 6(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 16(%rsp)
	movq	$0, 8(%rsp)
	movb	$0, 4(%rsp)
	callq	__mini_size
	cmpq	$2, %rax
	jl	LBB11_8
## %bb.1:                               ## %l60
	movl	$2, %ebx
	xorl	%r14d, %r14d
	movq	%rbp, %rdi
	xorl	%esi, %esi
	callq	__mini_get
	movq	%rax, %r15
	movq	%rbp, %rdi
	callq	__mini_size
	leaq	-1(%rax), %rsi
	movq	%rbp, %rdi
	callq	__mini_get
	addq	%r15, %rax
	cqto
	idivq	%rbx
	testq	%rbp, %rbp
	movl	$0, %r12d
	je	LBB11_7
## %bb.2:                               ## %l61.preheader
	movq	%rax, %r15
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	movq	%rbp, %rbx
	jmp	LBB11_3
	.p2align	4, 0x90
LBB11_5:                                ## %l65
                                        ##   in Loop: Header=BB11_3 Depth=1
	callq	__mini_get
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	__mini_add
	movq	%rax, %r14
LBB11_6:                                ## %l66
                                        ##   in Loop: Header=BB11_3 Depth=1
	movq	8(%rbx), %rbx
	movl	$1, %eax
	addq	%rax, %r13
	testq	%rbx, %rbx
	je	LBB11_7
LBB11_3:                                ## %l61
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbp, %rdi
	movq	%r13, %rsi
	callq	__mini_get
	movq	%rbp, %rdi
	movq	%r13, %rsi
	cmpq	%r15, %rax
	jle	LBB11_5
## %bb.4:                               ## %l64
                                        ##   in Loop: Header=BB11_3 Depth=1
	callq	__mini_get
	movq	%r12, %rdi
	movq	%rax, %rsi
	callq	__mini_add
	movq	%rax, %r12
	jmp	LBB11_6
LBB11_7:                                ## %l63
	movq	%rbp, %rdi
	callq	__mini_freeList
	movq	%r14, %rdi
	callq	__mini_quickSort
	movq	%rax, %rbx
	movq	%r12, %rdi
	callq	__mini_quickSort
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	__mini_concatLists
	movq	%rax, %rbp
LBB11_8:                                ## %l56
	movq	%rbp, %rax
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
	.globl	__mini_quickSortMain            ## -- Begin function _mini_quickSortMain
	.p2align	4, 0x90
__mini_quickSortMain:                   ## @_mini_quickSortMain
	.cfi_startproc
## %bb.0:                               ## %l68
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	$-999, 24(%rsp)                 ## imm = 0xFC19
	movq	$-999, 16(%rsp)                 ## imm = 0xFC19
	movq	$-999, 8(%rsp)                  ## imm = 0xFC19
	movq	$0, (%rsp)
	callq	__mini_printList
	leaq	L_.r349(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%rbx, %rdi
	callq	__mini_printList
	leaq	L_.r356(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%rbx, %rdi
	callq	__mini_printList
	leaq	L_.r363(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_treesearch               ## -- Begin function _mini_treesearch
	.p2align	4, 0x90
__mini_treesearch:                      ## @_mini_treesearch
	.cfi_startproc
## %bb.0:                               ## %l70
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$88, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	movq	$-1, 80(%rsp)
	movq	$0, 72(%rsp)
	movb	$0, 15(%rsp)
	movb	$0, 14(%rsp)
	xorl	%ebx, %ebx
	movq	$1, 64(%rsp)
	movq	$1, 56(%rsp)
	movb	$0, 13(%rsp)
	movq	$1, 48(%rsp)
	movq	$1, 40(%rsp)
	movb	$0, 12(%rsp)
	movq	$1, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	leaq	L_.r377(%rip), %rdi
	movq	$-1, %rsi
	callq	_printf
	testq	%r15, %r15
	je	LBB13_5
## %bb.1:                               ## %l71
	movl	$1, %r12d
	cmpq	%r14, (%r15)
	je	LBB13_4
## %bb.2:                               ## %l75
	movq	8(%r15), %rdi
	movq	%r14, %rsi
	callq	__mini_treesearch
	cmpq	%r12, %rax
	je	LBB13_4
## %bb.3:                               ## %l78
	movq	16(%r15), %rdi
	movq	%r14, %rsi
	callq	__mini_treesearch
	cmpq	%r12, %rax
	jne	LBB13_5
LBB13_4:
	movl	$1, %ebx
LBB13_5:                                ## %l69
	movq	%rbx, %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_inOrder                  ## -- Begin function _mini_inOrder
	.p2align	4, 0x90
__mini_inOrder:                         ## @_mini_inOrder
	.cfi_startproc
## %bb.0:                               ## %l83
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	$0, 40(%rsp)
	movb	$0, 15(%rsp)
	movq	$16, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	testq	%rdi, %rdi
	je	LBB14_2
## %bb.1:                               ## %l84
	movq	%rdi, %rbx
	movl	$16, %edi
	callq	_malloc
	movq	%rax, %r14
	movq	(%rbx), %rax
	movq	%rax, (%r14)
	movq	$0, 8(%r14)
	movq	8(%rbx), %rdi
	callq	__mini_inOrder
	movq	%rax, %r15
	movq	16(%rbx), %rdi
	callq	__mini_inOrder
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	__mini_concatLists
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	__mini_concatLists
	jmp	LBB14_3
LBB14_2:                                ## %l85
	xorl	%eax, %eax
LBB14_3:                                ## %l82
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_bintreesearch            ## -- Begin function _mini_bintreesearch
	.p2align	4, 0x90
__mini_bintreesearch:                   ## @_mini_bintreesearch
	.cfi_startproc
## %bb.0:                               ## %l87
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	$-1, 32(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 7(%rsp)
	movb	$0, 6(%rsp)
	movq	$1, 16(%rsp)
	movb	$0, 5(%rsp)
	movq	$0, 8(%rsp)
	leaq	L_.r464(%rip), %rdi
	movq	$-1, %rsi
	callq	_printf
	testq	%r14, %r14
	je	LBB15_1
## %bb.2:                               ## %l88
	movl	$1, %eax
	cmpq	%rbx, (%r14)
	je	LBB15_7
## %bb.3:                               ## %l92
	cmpq	(%r14), %rbx
	jge	LBB15_5
## %bb.4:                               ## %l93
	movq	8(%r14), %rdi
	jmp	LBB15_6
LBB15_1:
	xorl	%eax, %eax
	jmp	LBB15_7
LBB15_5:                                ## %l94
	movq	16(%r14), %rdi
LBB15_6:                                ## %l86
	movq	%rbx, %rsi
	callq	__mini_bintreesearch
LBB15_7:                                ## %l86
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_buildTree                ## -- Begin function _mini_buildTree
	.p2align	4, 0x90
__mini_buildTree:                       ## @_mini_buildTree
	.cfi_startproc
## %bb.0:                               ## %l97
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %rbx
	movq	$0, 32(%rsp)
	xorl	%r14d, %r14d
	movq	$0, 24(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 16(%rsp)
	movb	$0, 14(%rsp)
	callq	__mini_size
	testq	%rax, %rax
	jle	LBB16_3
## %bb.1:                               ## %l98.preheader
	xorl	%r15d, %r15d
	movl	$1, %r12d
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB16_2:                                ## %l98
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	__mini_get
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	__mini_treeadd
	movq	%rax, %r14
	addq	%r12, %r15
	movq	%rbx, %rdi
	callq	__mini_size
	cmpq	%rax, %r15
	jl	LBB16_2
LBB16_3:                                ## %l100
	movq	%r14, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_treeMain                 ## -- Begin function _mini_treeMain
	.p2align	4, 0x90
__mini_treeMain:                        ## @_mini_treeMain
	.cfi_startproc
## %bb.0:                               ## %l102
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$248, %rsp
	.cfi_def_cfa_offset 272
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$-999, 240(%rsp)                ## imm = 0xFC19
	movq	$-999, 232(%rsp)                ## imm = 0xFC19
	movq	$-999, 224(%rsp)                ## imm = 0xFC19
	movq	$0, 216(%rsp)
	movq	$-999, 208(%rsp)                ## imm = 0xFC19
	movq	$10, 200(%rsp)
	movq	$-999, 192(%rsp)                ## imm = 0xFC19
	movq	$-2, 184(%rsp)
	movq	$-999, 176(%rsp)                ## imm = 0xFC19
	movq	$2, 168(%rsp)
	movq	$-999, 160(%rsp)                ## imm = 0xFC19
	movq	$3, 152(%rsp)
	movq	$-999, 144(%rsp)                ## imm = 0xFC19
	movq	$9, 136(%rsp)
	movq	$-999, 128(%rsp)                ## imm = 0xFC19
	movq	$1, 120(%rsp)
	movq	$-999, 112(%rsp)                ## imm = 0xFC19
	movq	$0, 104(%rsp)
	movq	$-999, 96(%rsp)                 ## imm = 0xFC19
	movq	$10, 88(%rsp)
	movq	$-999, 80(%rsp)                 ## imm = 0xFC19
	movq	$-2, 72(%rsp)
	movq	$-999, 64(%rsp)                 ## imm = 0xFC19
	movq	$2, 56(%rsp)
	movq	$-999, 48(%rsp)                 ## imm = 0xFC19
	movq	$3, 40(%rsp)
	movq	$-999, 32(%rsp)                 ## imm = 0xFC19
	movq	$9, 24(%rsp)
	movq	$-999, 16(%rsp)                 ## imm = 0xFC19
	movq	$1, 8(%rsp)
	movq	$-999, (%rsp)                   ## imm = 0xFC19
	callq	__mini_buildTree
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	__mini_treeprint
	leaq	L_.r550(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%rbx, %rdi
	callq	__mini_inOrder
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	__mini_printList
	leaq	L_.r558(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%r14, %rdi
	callq	__mini_freeList
	movq	%rbx, %rdi
	callq	__mini_postOrder
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	__mini_printList
	leaq	L_.r566(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%r14, %rdi
	callq	__mini_freeList
	movq	%rbx, %rdi
	xorl	%esi, %esi
	callq	__mini_treesearch
	leaq	L_.r573(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r578(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	__mini_treesearch
	leaq	L_.r585(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r590(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%rbx, %rdi
	movq	$-2, %rsi
	callq	__mini_treesearch
	leaq	L_.r597(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r605(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	__mini_treesearch
	leaq	L_.r612(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r617(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	__mini_treesearch
	leaq	L_.r624(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r629(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$9, %esi
	movq	%rbx, %rdi
	callq	__mini_treesearch
	leaq	L_.r636(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r641(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	__mini_treesearch
	leaq	L_.r648(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r653(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%rbx, %rdi
	xorl	%esi, %esi
	callq	__mini_bintreesearch
	leaq	L_.r660(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r665(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	__mini_bintreesearch
	leaq	L_.r672(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r677(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%rbx, %rdi
	movq	$-2, %rsi
	callq	__mini_bintreesearch
	leaq	L_.r684(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r692(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	__mini_bintreesearch
	leaq	L_.r699(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r704(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	__mini_bintreesearch
	leaq	L_.r711(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r716(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$9, %esi
	movq	%rbx, %rdi
	callq	__mini_bintreesearch
	leaq	L_.r723(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r728(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	__mini_bintreesearch
	leaq	L_.r735(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	leaq	L_.r740(%rip), %rdi
	movq	$-999, %rsi                     ## imm = 0xFC19
	callq	_printf
	movq	%rbx, %rdi
	callq	__mini_freeTree
	addq	$248, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_myCopy                   ## -- Begin function _mini_myCopy
	.p2align	4, 0x90
__mini_myCopy:                          ## @_mini_myCopy
	.cfi_startproc
## %bb.0:                               ## %l104
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 24(%rsp)
	movq	$0, 16(%rsp)
	testq	%rdi, %rdi
	jne	LBB18_2
## %bb.1:                               ## %l105
	xorl	%eax, %eax
	jmp	LBB18_3
LBB18_2:                                ## %l107
	movq	(%rdi), %rsi
	movq	%rdi, %r14
	xorl	%edi, %edi
	callq	__mini_add
	movq	%rax, %rbx
	movq	8(%r14), %rdi
	callq	__mini_myCopy
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	__mini_concatLists
LBB18_3:                                ## %l103
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l109
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
	xorl	%r14d, %r14d
	movq	$0, 72(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 56(%rsp)
	movq	$10, 48(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 40(%rsp)
	movq	$10, 32(%rsp)
	movb	$0, 14(%rsp)
	movq	$0, 24(%rsp)
	xorl	%ebx, %ebx
	testb	%r14b, %r14b
	jne	LBB19_1
## %bb.2:                               ## %l110.preheader
	leaq	L_.r808(%rip), %r15
	leaq	16(%rsp), %r12
	movl	$1, %ebp
	.p2align	4, 0x90
LBB19_3:                                ## %l110
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	_scanf
	movq	16(%rsp), %rsi
	movq	%rbx, %rdi
	callq	__mini_add
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	__mini_myCopy
	movq	%rax, %r13
	movq	%rbx, %rdi
	callq	__mini_myCopy
	movq	%rax, %r14
	movq	%r13, %rdi
	callq	__mini_quickSortMain
	movq	%rax, %rdi
	callq	__mini_freeList
	movq	%r14, %rdi
	callq	__mini_treeMain
	movl	$10, %eax
	cmpq	%rax, %rbp
	movl	$1, %eax
	leaq	(%rbp,%rax), %rbp
	jl	LBB19_3
	jmp	LBB19_4
LBB19_1:
	xorl	%r13d, %r13d
LBB19_4:                                ## %l112
	movq	%rbx, %rdi
	callq	__mini_freeList
	movq	%r13, %rdi
	callq	__mini_freeList
	movq	%r14, %rdi
	callq	__mini_freeList
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
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l114
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
	.globl	_.r6                            ## @.r6
.zerofill __DATA,__common,_.r6,8,3
	.section	__TEXT,__cstring,cstring_literals
L_.r114:                                ## @.r114
	.asciz	"%ld\n"

L_.r132:                                ## @.r132
	.asciz	"%ld\n"

L_.r349:                                ## @.r349
	.asciz	"%ld\n"

L_.r356:                                ## @.r356
	.asciz	"%ld\n"

L_.r363:                                ## @.r363
	.asciz	"%ld\n"

L_.r377:                                ## @.r377
	.asciz	"%ld\n"

L_.r464:                                ## @.r464
	.asciz	"%ld\n"

L_.r550:                                ## @.r550
	.asciz	"%ld\n"

L_.r558:                                ## @.r558
	.asciz	"%ld\n"

L_.r566:                                ## @.r566
	.asciz	"%ld\n"

L_.r573:                                ## @.r573
	.asciz	"%ld\n"

L_.r578:                                ## @.r578
	.asciz	"%ld\n"

L_.r585:                                ## @.r585
	.asciz	"%ld\n"

L_.r590:                                ## @.r590
	.asciz	"%ld\n"

L_.r597:                                ## @.r597
	.asciz	"%ld\n"

L_.r605:                                ## @.r605
	.asciz	"%ld\n"

L_.r612:                                ## @.r612
	.asciz	"%ld\n"

L_.r617:                                ## @.r617
	.asciz	"%ld\n"

L_.r624:                                ## @.r624
	.asciz	"%ld\n"

L_.r629:                                ## @.r629
	.asciz	"%ld\n"

L_.r636:                                ## @.r636
	.asciz	"%ld\n"

L_.r641:                                ## @.r641
	.asciz	"%ld\n"

L_.r648:                                ## @.r648
	.asciz	"%ld\n"

L_.r653:                                ## @.r653
	.asciz	"%ld\n"

L_.r660:                                ## @.r660
	.asciz	"%ld\n"

L_.r665:                                ## @.r665
	.asciz	"%ld\n"

L_.r672:                                ## @.r672
	.asciz	"%ld\n"

L_.r677:                                ## @.r677
	.asciz	"%ld\n"

L_.r684:                                ## @.r684
	.asciz	"%ld\n"

L_.r692:                                ## @.r692
	.asciz	"%ld\n"

L_.r699:                                ## @.r699
	.asciz	"%ld\n"

L_.r704:                                ## @.r704
	.asciz	"%ld\n"

L_.r711:                                ## @.r711
	.asciz	"%ld\n"

L_.r716:                                ## @.r716
	.asciz	"%ld\n"

L_.r723:                                ## @.r723
	.asciz	"%ld\n"

L_.r728:                                ## @.r728
	.asciz	"%ld\n"

L_.r735:                                ## @.r735
	.asciz	"%ld\n"

L_.r740:                                ## @.r740
	.asciz	"%ld\n"

L_.r808:                                ## @.r808
	.asciz	"%ld"

.subsections_via_symbols
