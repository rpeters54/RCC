	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_move                     ## -- Begin function _mini_move
	.p2align	4, 0x90
__mini_move:                            ## @_mini_move
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	$1, -8(%rsp)
	movb	$0, -41(%rsp)
	movq	$2, -16(%rsp)
	movl	$2, %ecx
	movb	$0, -42(%rsp)
	movq	$1, -24(%rsp)
	movl	$1, %eax
	movb	$0, -43(%rsp)
	movq	$2, -32(%rsp)
	movb	$0, -44(%rsp)
	movq	$1, -40(%rsp)
	cmpq	$1, %rdi
	jne	LBB0_2
## %bb.1:                               ## %l3
	movq	_.r4(%rip), %rdx
	movq	8(%rdx), %rdi
	movq	%rdi, _.r4(%rip)
	cmpq	%rax, %rsi
	jne	LBB0_7
	jmp	LBB0_6
LBB0_2:                                 ## %l4
	cmpq	%rcx, %rdi
	jne	LBB0_4
## %bb.3:                               ## %l5
	movq	_.r5(%rip), %rdx
	movq	8(%rdx), %rdi
	movq	%rdi, _.r5(%rip)
	cmpq	%rax, %rsi
	je	LBB0_6
LBB0_7:                                 ## %l10
	cmpq	%rcx, %rsi
	jne	LBB0_9
## %bb.8:                               ## %l11
	movq	_.r5(%rip), %rcx
	movq	%rcx, 8(%rdx)
	movq	%rdx, _.r5(%rip)
	addq	%rax, _.r7(%rip)
	retq
LBB0_4:                                 ## %l6
	movq	_.r6(%rip), %rdx
	movq	8(%rdx), %rdi
	movq	%rdi, _.r6(%rip)
	cmpq	%rax, %rsi
	jne	LBB0_7
LBB0_6:                                 ## %l9
	movq	_.r4(%rip), %rcx
	movq	%rcx, 8(%rdx)
	movq	%rdx, _.r4(%rip)
	addq	%rax, _.r7(%rip)
	retq
LBB0_9:                                 ## %l12
	movq	_.r6(%rip), %rcx
	movq	%rcx, 8(%rdx)
	movq	%rdx, _.r6(%rip)
	addq	%rax, _.r7(%rip)
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_hanoi                    ## -- Begin function _mini_hanoi
	.p2align	4, 0x90
__mini_hanoi:                           ## @_mini_hanoi
	.cfi_startproc
## %bb.0:                               ## %l16
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
	movq	$1, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 24(%rsp)
	movq	$1, 16(%rsp)
	cmpq	$1, %rdi
	jne	LBB1_2
## %bb.1:                               ## %l17
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	__mini_move
	jmp	LBB1_3
LBB1_2:                                 ## %l18
	subq	$1, %rdi
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%rdx, %r15
	movq	%rcx, %rdx
	movq	%rcx, %r12
	movq	%r15, %rcx
	callq	__mini_hanoi
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	__mini_move
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	callq	__mini_hanoi
LBB1_3:                                 ## %l15
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_printPeg                 ## -- Begin function _mini_printPeg
	.p2align	4, 0x90
__mini_printPeg:                        ## @_mini_printPeg
	.cfi_startproc
## %bb.0:                               ## %l21
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, 16(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 8(%rsp)
	movb	$0, 6(%rsp)
	testq	%rdi, %rdi
	je	LBB2_3
## %bb.1:                               ## %l22.preheader
	movq	%rdi, %rbx
	leaq	L_.r107(%rip), %r14
	.p2align	4, 0x90
LBB2_2:                                 ## %l22
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rsi
	movq	%r14, %rdi
	callq	_printf
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	LBB2_2
LBB2_3:                                 ## %l20
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l26
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$184, %rsp
	.cfi_def_cfa_offset 208
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	$0, 176(%rsp)
	movq	$0, 168(%rsp)
	movq	$0, 160(%rsp)
	movq	$0, 152(%rsp)
	movq	$1, 144(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 136(%rsp)
	movb	$0, 6(%rsp)
	movq	$16, 128(%rsp)
	movq	$1, 120(%rsp)
	movq	$0, 112(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 104(%rsp)
	movq	$2, 96(%rsp)
	movq	$3, 88(%rsp)
	movq	$1, 80(%rsp)
	movq	$3, 72(%rsp)
	movq	$2, 64(%rsp)
	movq	$1, 56(%rsp)
	movq	$2, 48(%rsp)
	movq	$3, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 4(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 3(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, _.r4(%rip)
	movq	$0, _.r5(%rip)
	movq	$0, _.r6(%rip)
	movq	$0, _.r7(%rip)
	leaq	L_.r142(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	cmpq	$0, 8(%rsp)
	jle	LBB3_6
## %bb.1:                               ## %l27
	movl	$1, %ebx
	movq	8(%rsp), %r14
	testq	%r14, %r14
	je	LBB3_3
	.p2align	4, 0x90
LBB3_2:                                 ## %l29
                                        ## =>This Inner Loop Header: Depth=1
	movl	$16, %edi
	callq	_malloc
	movq	%r14, (%rax)
	movq	_.r4(%rip), %rcx
	movq	%rcx, 8(%rax)
	movq	%rax, _.r4(%rip)
	subq	%rbx, %r14
	jne	LBB3_2
LBB3_3:                                 ## %l31
	leaq	L_.r180(%rip), %rdi
	movl	$1, %esi
	callq	_printf
	movq	_.r4(%rip), %rdi
	callq	__mini_printPeg
	leaq	L_.r185(%rip), %rdi
	movl	$2, %esi
	callq	_printf
	movq	_.r5(%rip), %rdi
	callq	__mini_printPeg
	leaq	L_.r190(%rip), %rdi
	movl	$3, %esi
	callq	_printf
	movq	_.r6(%rip), %rdi
	callq	__mini_printPeg
	movq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$3, %edx
	movl	$2, %ecx
	callq	__mini_hanoi
	leaq	L_.r202(%rip), %rdi
	movl	$1, %esi
	callq	_printf
	movq	_.r4(%rip), %rdi
	callq	__mini_printPeg
	leaq	L_.r207(%rip), %rdi
	movl	$2, %esi
	callq	_printf
	movq	_.r5(%rip), %rdi
	callq	__mini_printPeg
	leaq	L_.r212(%rip), %rdi
	movl	$3, %esi
	callq	_printf
	movq	_.r6(%rip), %rdi
	callq	__mini_printPeg
	movq	_.r7(%rip), %rsi
	leaq	L_.r217(%rip), %rdi
	callq	_printf
	cmpq	$0, _.r6(%rip)
	je	LBB3_6
	.p2align	4, 0x90
LBB3_4:                                 ## %l32
                                        ## =>This Inner Loop Header: Depth=1
	movq	_.r6(%rip), %rdi
	movq	8(%rdi), %rax
	movq	%rax, _.r6(%rip)
	callq	_free
	cmpq	$0, _.r6(%rip)
	jne	LBB3_4
LBB3_6:                                 ## %l35
	xorl	%eax, %eax
	addq	$184, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l37
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
	.globl	_.r7                            ## @.r7
.zerofill __DATA,__common,_.r7,8,3
	.section	__TEXT,__cstring,cstring_literals
L_.r107:                                ## @.r107
	.asciz	"%ld\n"

L_.r142:                                ## @.r142
	.asciz	"%ld"

L_.r180:                                ## @.r180
	.asciz	"%ld\n"

L_.r185:                                ## @.r185
	.asciz	"%ld\n"

L_.r190:                                ## @.r190
	.asciz	"%ld\n"

L_.r202:                                ## @.r202
	.asciz	"%ld\n"

L_.r207:                                ## @.r207
	.asciz	"%ld\n"

L_.r212:                                ## @.r212
	.asciz	"%ld\n"

L_.r217:                                ## @.r217
	.asciz	"%ld\n"

.subsections_via_symbols
