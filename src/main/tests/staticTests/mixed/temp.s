	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_tailrecursive            ## -- Begin function _mini_tailrecursive
	.p2align	4, 0x90
__mini_tailrecursive:                   ## @_mini_tailrecursive
	.cfi_startproc
## %bb.0:                               ## %l2
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	$0, 16(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 8(%rsp)
	testq	%rdi, %rdi
	jle	LBB0_2
## %bb.1:                               ## %l5
	subq	$1, %rdi
	callq	__mini_tailrecursive
LBB0_2:                                 ## %l1
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_add                      ## -- Begin function _mini_add
	.p2align	4, 0x90
__mini_add:                             ## @_mini_add
	.cfi_startproc
## %bb.0:                               ## %l7
	leaq	(%rdi,%rsi), %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_domath                   ## -- Begin function _mini_domath
	.p2align	4, 0x90
__mini_domath:                          ## @_mini_domath
	.cfi_startproc
## %bb.0:                               ## %l9
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
	subq	$80, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movq	$24, 72(%rsp)
	movq	$8, 64(%rsp)
	movq	$24, 56(%rsp)
	movq	$8, 48(%rsp)
	movq	$3, 40(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 24(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 14(%rsp)
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %rbx
	movl	$8, %edi
	callq	_malloc
	movq	%rax, 16(%rbx)
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %r15
	movl	$8, %edi
	callq	_malloc
	movq	%rax, 16(%r15)
	movq	%r14, (%rbx)
	movq	$3, (%r15)
	movq	(%rbx), %rax
	movq	16(%rbx), %rcx
	movq	%rax, (%rcx)
	movq	(%r15), %rax
	movq	16(%r15), %rcx
	movq	%rax, (%rcx)
	testq	%r14, %r14
	jle	LBB2_3
## %bb.1:                               ## %l10.preheader
	movl	$1, %r12d
	subq	$1, %r14
	movq	%r14, %r13
	.p2align	4, 0x90
LBB2_2:                                 ## %l10
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rsi
	movq	16(%r15), %rax
	movq	(%rax), %rdi
	callq	__mini_add
	subq	%r12, %r13
	testq	%r14, %r14
	movq	%r13, %r14
	jg	LBB2_2
LBB2_3:                                 ## %l12
	movq	%rbx, %rdi
	callq	_free
	movq	%r15, %rdi
	callq	_free
	addq	$80, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_objinstantiation         ## -- Begin function _mini_objinstantiation
	.p2align	4, 0x90
__mini_objinstantiation:                ## @_mini_objinstantiation
	.cfi_startproc
## %bb.0:                               ## %l14
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
	movq	$24, 32(%rsp)
	movq	$1, 24(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 14(%rsp)
	testq	%rdi, %rdi
	jle	LBB3_3
## %bb.1:                               ## %l15.preheader
	movq	%rdi, %rbx
	movl	$1, %r14d
	subq	$1, %rbx
	movq	%rbx, %r15
	.p2align	4, 0x90
LBB3_2:                                 ## %l15
                                        ## =>This Inner Loop Header: Depth=1
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %rdi
	callq	_free
	subq	%r14, %r15
	testq	%rbx, %rbx
	movq	%r15, %rbx
	jg	LBB3_2
LBB3_3:                                 ## %l13
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_ackermann                ## -- Begin function _mini_ackermann
	.p2align	4, 0x90
__mini_ackermann:                       ## @_mini_ackermann
	.cfi_startproc
## %bb.0:                               ## %l19
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -16
	movq	%rsi, %rax
	movq	$0, 56(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 48(%rsp)
	movl	$1, %ecx
	movq	$0, 40(%rsp)
	movb	$0, 6(%rsp)
	movq	$1, 32(%rsp)
	movq	$1, 24(%rsp)
	movq	$1, 16(%rsp)
	movq	$1, 8(%rsp)
	testq	%rdi, %rdi
	jne	LBB4_2
## %bb.1:                               ## %l20
	addq	%rcx, %rax
	jmp	LBB4_6
LBB4_2:                                 ## %l22
	testq	%rax, %rax
	jne	LBB4_4
## %bb.3:                               ## %l23
	subq	%rcx, %rdi
	movl	$1, %esi
	jmp	LBB4_5
LBB4_4:                                 ## %l24
	movq	%rdi, %rbx
	subq	%rcx, %rbx
	subq	%rcx, %rax
	movq	%rax, %rsi
	callq	__mini_ackermann
	movq	%rbx, %rdi
	movq	%rax, %rsi
LBB4_5:                                 ## %l18
	callq	__mini_ackermann
LBB4_6:                                 ## %l18
	addq	$64, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l26
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	$0, 48(%rsp)
	leaq	L_.r187(%rip), %rdi
	leaq	24(%rsp), %rsi
	callq	_scanf
	leaq	L_.r189(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	leaq	L_.r191(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	leaq	L_.r193(%rip), %rdi
	leaq	40(%rsp), %rsi
	callq	_scanf
	leaq	L_.r195(%rip), %rdi
	leaq	32(%rsp), %rsi
	callq	_scanf
	movq	24(%rsp), %rdi
	callq	__mini_tailrecursive
	movq	24(%rsp), %rsi
	leaq	L_.r198(%rip), %rdi
	callq	_printf
	movq	16(%rsp), %rdi
	callq	__mini_domath
	movq	16(%rsp), %rsi
	leaq	L_.r202(%rip), %rdi
	callq	_printf
	movq	8(%rsp), %rdi
	callq	__mini_objinstantiation
	movq	8(%rsp), %rsi
	leaq	L_.r206(%rip), %rdi
	callq	_printf
	movq	40(%rsp), %rdi
	movq	32(%rsp), %rsi
	callq	__mini_ackermann
	leaq	L_.r209(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	xorl	%eax, %eax
	addq	$56, %rsp
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
L_.r187:                                ## @.r187
	.asciz	"%ld"

L_.r189:                                ## @.r189
	.asciz	"%ld"

L_.r191:                                ## @.r191
	.asciz	"%ld"

L_.r193:                                ## @.r193
	.asciz	"%ld"

L_.r195:                                ## @.r195
	.asciz	"%ld"

L_.r198:                                ## @.r198
	.asciz	"%ld\n"

L_.r202:                                ## @.r202
	.asciz	"%ld\n"

L_.r206:                                ## @.r206
	.asciz	"%ld\n"

L_.r209:                                ## @.r209
	.asciz	"%ld\n"

.subsections_via_symbols
