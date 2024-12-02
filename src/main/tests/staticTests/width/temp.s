	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_test_sign                      ## -- Begin function test_sign
	.p2align	4, 0x90
_test_sign:                             ## @test_sign
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movl	%edi, %ebx
	movq	$0, 40(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 32(%rsp)
	movb	$0, 14(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 13(%rsp)
	movq	$0, 16(%rsp)
	movb	$0, 12(%rsp)
	testq	%rdx, %rdx
	js	LBB0_2
## %bb.1:                               ## %l3
	leaq	L_.r12(%rip), %rdi
	jmp	LBB0_3
LBB0_2:                                 ## %l4
	leaq	L_.r14(%rip), %rdi
LBB0_3:                                 ## %l5
	callq	_printf
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB0_5
## %bb.4:                               ## %l6
	leaq	L_.r26(%rip), %rdi
	jmp	LBB0_6
LBB0_5:                                 ## %l7
	leaq	L_.r28(%rip), %rdi
LBB0_6:                                 ## %l8
	callq	_printf
	movslq	%ebx, %rax
	testq	%rax, %rax
	js	LBB0_8
## %bb.7:                               ## %l9
	leaq	L_.r41(%rip), %rdi
	jmp	LBB0_9
LBB0_8:                                 ## %l10
	leaq	L_.r43(%rip), %rdi
LBB0_9:                                 ## %l11
	callq	_printf
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB0_11
## %bb.10:                              ## %l12
	leaq	L_.r56(%rip), %rdi
	jmp	LBB0_12
LBB0_11:                                ## %l13
	leaq	L_.r58(%rip), %rdi
LBB0_12:                                ## %l1
	callq	_printf
	addq	$48, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l16
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	$4294967295, %eax               ## imm = 0xFFFFFFFF
	movq	%rax, 64(%rsp)
	movq	%rax, 56(%rsp)
	movq	$-1, 48(%rsp)
	movq	$-1, 40(%rsp)
	movq	$3, 32(%rsp)
	movq	$3, 24(%rsp)
	movq	$-4, 16(%rsp)
	movq	$-4, 8(%rsp)
	movq	$0, (%rsp)
	movl	$4294967295, %edi               ## imm = 0xFFFFFFFF
	movl	$4294967295, %esi               ## imm = 0xFFFFFFFF
	movq	$-1, %rdx
	movq	$-1, %rcx
	callq	_test_sign
	movl	$-4, %edi
	movl	$-4, %esi
	movq	$-4, %rdx
	movq	$-4, %rcx
	callq	_test_sign
	xorl	%eax, %eax
	addq	$72, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r12:                                 ## @.r12
	.asciz	"gong >= 0\n"

L_.r14:                                 ## @.r14
	.asciz	"gong < 0\n"

L_.r26:                                 ## @.r26
	.asciz	"dugong >= 0\n"

L_.r28:                                 ## @.r28
	.asciz	"dugong < 0\n"

L_.r41:                                 ## @.r41
	.asciz	"nit >= 0\n"

L_.r43:                                 ## @.r43
	.asciz	"nit < 0\n"

L_.r56:                                 ## @.r56
	.asciz	"unit >= 0\n"

L_.r58:                                 ## @.r58
	.asciz	"unit < 0\n"

.subsections_via_symbols
