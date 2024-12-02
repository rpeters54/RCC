	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
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
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 112(%rsp)
	movq	$100, 104(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 96(%rsp)
	movl	$1, %r15d
	movq	$100, 88(%rsp)
	movl	$100, %r12d
	movb	$0, 6(%rsp)
	xorl	%ebx, %ebx
	movq	$0, 80(%rsp)
	movq	$100, 72(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 64(%rsp)
	movq	$100, 56(%rsp)
	movb	$0, 4(%rsp)
	movq	$100, 48(%rsp)
	movb	$0, 3(%rsp)
	movq	$0, 40(%rsp)
	movq	$33, 32(%rsp)
	movb	$0, 2(%rsp)
	movq	$1, 24(%rsp)
	movq	$100, 16(%rsp)
	movb	$0, 1(%rsp)
	movq	$0, 8(%rsp)
	leaq	L_.r5(%rip), %rdi
	callq	_printf
	testb	%bl, %bl
	jne	LBB0_3
## %bb.1:                               ## %l3.preheader
	leaq	L_.r15(%rip), %r14
	.p2align	4, 0x90
LBB0_2:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_printf
	addl	%r15d, %ebx
	movslq	%ebx, %rax
	cmpq	%r12, %rax
	jl	LBB0_2
LBB0_3:                                 ## %l5
	leaq	L_.r31(%rip), %rdi
	callq	_printf
	xorl	%ebx, %ebx
	testq	%r12, %r12
	jle	LBB0_4
## %bb.5:                               ## %l6.preheader
	leaq	L_.r44(%rip), %r14
	.p2align	4, 0x90
LBB0_6:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_printf
	movslq	%ebx, %rbx
	leaq	(%rbx,%r15), %rbp
	movslq	%ebp, %rax
	addl	%r15d, %ebx
	cmpq	%r12, %rax
	jl	LBB0_6
	jmp	LBB0_7
LBB0_4:
	xorl	%ebp, %ebp
LBB0_7:                                 ## %l8
	movl	$33, %r13d
	leaq	L_.r60(%rip), %rdi
	callq	_printf
	leaq	L_.r63(%rip), %rbx
	movslq	%ebp, %r14
	.p2align	4, 0x90
LBB0_8:                                 ## %l9
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	_printf
	cmpq	%r12, %r14
	jl	LBB0_8
## %bb.9:                               ## %l11
	leaq	L_.r74(%rip), %rdi
	callq	_printf
	xorl	%ebx, %ebx
	leaq	L_.r80(%rip), %r14
	.p2align	4, 0x90
LBB0_10:                                ## %l12
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_printf
	movslq	%ebx, %rax
	cmpq	%r13, %rax
	je	LBB0_11
## %bb.12:                              ## %l17
                                        ##   in Loop: Header=BB0_10 Depth=1
	addl	%r15d, %ebx
	movslq	%ebx, %rax
	cmpq	%r12, %rax
	jl	LBB0_10
	jmp	LBB0_13
LBB0_11:                                ## %l15
	leaq	L_.r89(%rip), %rdi
	callq	_printf
LBB0_13:                                ## %l14
	xorl	%eax, %eax
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
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4, 0x0                          ## @.r5
L_.r5:
	.asciz	"Testing While Loop\n"

L_.r15:                                 ## @.r15
	.asciz	"%d\n"

	.p2align	4, 0x0                          ## @.r31
L_.r31:
	.asciz	"Testing For Loop\n"

L_.r44:                                 ## @.r44
	.asciz	"%d\n"

	.p2align	4, 0x0                          ## @.r60
L_.r60:
	.asciz	"Testing Do-Loop Auto Entry\n"

	.p2align	4, 0x0                          ## @.r63
L_.r63:
	.asciz	"Got Here Anyway\n"

	.p2align	4, 0x0                          ## @.r74
L_.r74:
	.asciz	"Testing Proper Do-Loop Entry\n"

L_.r80:                                 ## @.r80
	.asciz	"%d\n"

L_.r89:                                 ## @.r89
	.asciz	"Broke\n"

.subsections_via_symbols
