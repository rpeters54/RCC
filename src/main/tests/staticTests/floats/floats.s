	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -36(%rbp)
	xorl	%edi, %edi
	callq	_srand
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -4(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$1000, -4(%rbp)                 ## imm = 0x3E8
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movb	$0, %al
	callq	_rand
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, -32(%rbp)
	movb	$0, %al
	callq	_rand
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-32(%rbp), %xmm0                ## xmm0 = mem[0],zero
	leaq	L_.str.1(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movsd	-24(%rbp), %xmm0                ## xmm0 = mem[0],zero
	leaq	L_.str.2(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movsd	-32(%rbp), %xmm0                ## xmm0 = mem[0],zero
	addsd	-24(%rbp), %xmm0
	leaq	L_.str.3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movsd	-32(%rbp), %xmm0                ## xmm0 = mem[0],zero
	subsd	-24(%rbp), %xmm0
	leaq	L_.str.4(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movsd	-32(%rbp), %xmm0                ## xmm0 = mem[0],zero
	mulsd	-24(%rbp), %xmm0
	leaq	L_.str.5(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movsd	-32(%rbp), %xmm0                ## xmm0 = mem[0],zero
	divsd	-24(%rbp), %xmm0
	leaq	L_.str.6(%rip), %rdi
	movb	$1, %al
	callq	_printf
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_1
LBB0_4:
	leaq	L_.str.7(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -4(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$1000, -4(%rbp)                 ## imm = 0x3E8
	jge	LBB0_8
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	movb	$0, %al
	callq	_rand
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -12(%rbp)
	movb	$0, %al
	callq	_rand
	cvtsi2ss	%eax, %xmm0
	movss	%xmm0, -8(%rbp)
	movss	-12(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.8(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movss	-8(%rbp), %xmm0                 ## xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.9(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movss	-12(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	addss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.3(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movss	-12(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	subss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.4(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movss	-12(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	mulss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.5(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movss	-12(%rbp), %xmm0                ## xmm0 = mem[0],zero,zero,zero
	divss	-8(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	L_.str.6(%rip), %rdi
	movb	$1, %al
	callq	_printf
## %bb.7:                               ##   in Loop: Header=BB0_5 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	LBB0_5
LBB0_8:
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Trying Doubles:\n"

L_.str.1:                               ## @.str.1
	.asciz	"da is %f\n"

L_.str.2:                               ## @.str.2
	.asciz	"db is %f\n"

L_.str.3:                               ## @.str.3
	.asciz	"Add: %f\n"

L_.str.4:                               ## @.str.4
	.asciz	"Sub: %f\n"

L_.str.5:                               ## @.str.5
	.asciz	"Multiply: %f\n"

L_.str.6:                               ## @.str.6
	.asciz	"Divide: %f\n"

L_.str.7:                               ## @.str.7
	.asciz	"Trying Floats:\n"

L_.str.8:                               ## @.str.8
	.asciz	"fa is %f\n"

L_.str.9:                               ## @.str.9
	.asciz	"fb is %f\n"

.subsections_via_symbols
