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
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 128(%rsp)
	movq	$0, 120(%rsp)
	movq	$1000, 112(%rsp)                ## imm = 0x3E8
	movb	$0, 39(%rsp)
	movq	$1, 104(%rsp)
	movq	$1000, 96(%rsp)                 ## imm = 0x3E8
	movb	$0, 38(%rsp)
	xorl	%ebx, %ebx
	movq	$0, 88(%rsp)
	movq	$1000, 80(%rsp)                 ## imm = 0x3E8
	movb	$0, 37(%rsp)
	movq	$1, 72(%rsp)
	movq	$1000, 64(%rsp)                 ## imm = 0x3E8
	movb	$0, 36(%rsp)
	movq	$0, 56(%rsp)
	xorl	%edi, %edi
	callq	_srand
	leaq	L_.r15(%rip), %rdi
	callq	_printf
	testb	%bl, %bl
	jne	LBB0_3
## %bb.1:                               ## %l3.preheader
	leaq	L_.r38(%rip), %r12
	leaq	L_.r45(%rip), %r13
	leaq	L_.r52(%rip), %rbp
	leaq	L_.r59(%rip), %r14
	leaq	L_.r66(%rip), %r15
	.p2align	4, 0x90
LBB0_2:                                 ## %l3
                                        ## =>This Inner Loop Header: Depth=1
	leaq	L_.r28(%rip), %rdi
	movl	%ebx, %esi
	callq	_printf
	callq	_rand
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, 48(%rsp)
	callq	_rand
	xorps	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, 40(%rsp)
	movq	48(%rsp), %rsi
	leaq	L_.r34(%rip), %rdi
	callq	_printf
	movq	40(%rsp), %rsi
	movq	%r12, %rdi
	callq	_printf
	movsd	48(%rsp), %xmm0                 ## xmm0 = mem[0],zero
	addsd	40(%rsp), %xmm0
	movsd	%xmm0, 24(%rsp)
	movq	24(%rsp), %rsi
	movq	%r13, %rdi
	callq	_printf
	movsd	48(%rsp), %xmm0                 ## xmm0 = mem[0],zero
	subsd	40(%rsp), %xmm0
	movsd	%xmm0, 24(%rsp)
	movq	24(%rsp), %rsi
	movq	%rbp, %rdi
	callq	_printf
	movsd	48(%rsp), %xmm0                 ## xmm0 = mem[0],zero
	mulsd	40(%rsp), %xmm0
	movsd	%xmm0, 24(%rsp)
	movq	24(%rsp), %rsi
	movq	%r14, %rdi
	callq	_printf
	movsd	48(%rsp), %xmm0                 ## xmm0 = mem[0],zero
	divsd	40(%rsp), %xmm0
	movsd	%xmm0, 24(%rsp)
	movq	24(%rsp), %rsi
	movq	%r15, %rdi
	callq	_printf
	movl	$1, %eax
	addl	%eax, %ebx
	movslq	%ebx, %rax
	movl	$1000, %ecx                     ## imm = 0x3E8
	cmpq	%rcx, %rax
	jl	LBB0_2
LBB0_3:                                 ## %l5
	leaq	L_.r84(%rip), %rdi
	callq	_printf
	movl	$1000, %eax                     ## imm = 0x3E8
	testq	%rax, %rax
	jle	LBB0_6
## %bb.4:                               ## %l6.preheader
	xorl	%ebx, %ebx
	leaq	L_.r114(%rip), %r13
	leaq	L_.r121(%rip), %rbp
	leaq	L_.r128(%rip), %r14
	leaq	L_.r135(%rip), %r15
	movl	$1000, %r12d                    ## imm = 0x3E8
	.p2align	4, 0x90
LBB0_5:                                 ## %l6
                                        ## =>This Inner Loop Header: Depth=1
	leaq	L_.r97(%rip), %rdi
	movl	%ebx, %esi
	callq	_printf
	callq	_rand
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, 20(%rsp)
	callq	_rand
	xorps	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, 16(%rsp)
	movl	20(%rsp), %esi
	leaq	L_.r103(%rip), %rdi
	callq	_printf
	movl	16(%rsp), %esi
	leaq	L_.r107(%rip), %rdi
	callq	_printf
	movss	20(%rsp), %xmm0                 ## xmm0 = mem[0],zero,zero,zero
	addss	16(%rsp), %xmm0
	movss	%xmm0, 12(%rsp)
	movl	12(%rsp), %esi
	movq	%r13, %rdi
	callq	_printf
	movss	20(%rsp), %xmm0                 ## xmm0 = mem[0],zero,zero,zero
	subss	16(%rsp), %xmm0
	movss	%xmm0, 12(%rsp)
	movl	12(%rsp), %esi
	movq	%rbp, %rdi
	callq	_printf
	movss	20(%rsp), %xmm0                 ## xmm0 = mem[0],zero,zero,zero
	mulss	16(%rsp), %xmm0
	movss	%xmm0, 12(%rsp)
	movl	12(%rsp), %esi
	movq	%r14, %rdi
	callq	_printf
	movss	20(%rsp), %xmm0                 ## xmm0 = mem[0],zero,zero,zero
	divss	16(%rsp), %xmm0
	movss	%xmm0, 12(%rsp)
	movl	12(%rsp), %esi
	movq	%r15, %rdi
	callq	_printf
	movl	$1, %eax
	addl	%eax, %ebx
	movslq	%ebx, %rax
	cmpq	%r12, %rax
	jl	LBB0_5
LBB0_6:                                 ## %l8
	xorl	%eax, %eax
	addq	$136, %rsp
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
	.p2align	4, 0x0                          ## @.r15
L_.r15:
	.asciz	"Trying Doubles:\n"

L_.r28:                                 ## @.r28
	.asciz	"Iteration %d: \n"

L_.r34:                                 ## @.r34
	.asciz	"da is %ld\n"

L_.r38:                                 ## @.r38
	.asciz	"db is %ld\n"

L_.r45:                                 ## @.r45
	.asciz	"Add: %ld\n"

L_.r52:                                 ## @.r52
	.asciz	"Sub: %ld\n"

L_.r59:                                 ## @.r59
	.asciz	"Multiply: %ld\n"

L_.r66:                                 ## @.r66
	.asciz	"Divide: %ld\n"

L_.r84:                                 ## @.r84
	.asciz	"Trying Floats:\n"

L_.r97:                                 ## @.r97
	.asciz	"Iteration %d: \n"

L_.r103:                                ## @.r103
	.asciz	"fa is %d\n"

L_.r107:                                ## @.r107
	.asciz	"fb is %d\n"

L_.r114:                                ## @.r114
	.asciz	"Add: %d\n"

L_.r121:                                ## @.r121
	.asciz	"Sub: %d\n"

L_.r128:                                ## @.r128
	.asciz	"Multiply: %d\n"

L_.r135:                                ## @.r135
	.asciz	"Divide: %d\n"

.subsections_via_symbols
