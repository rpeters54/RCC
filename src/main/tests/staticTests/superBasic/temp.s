	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l2
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movb	$97, 15(%rsp)
	movb	$0, 14(%rsp)
	movq	$0, 16(%rsp)
	leaq	L_.r19(%rip), %rdi
	callq	_printf
	callq	_getchar
	cmpl	$98, %eax
	jl	LBB0_2
## %bb.1:                               ## %l3
	leaq	L_.r29(%rip), %rdi
	jmp	LBB0_3
LBB0_2:                                 ## %l4
	leaq	L_.r31(%rip), %rdi
LBB0_3:                                 ## %l5
	callq	_printf
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r19:                                 ## @.r19
	.asciz	"Hello World!\n"

L_.r29:                                 ## @.r29
	.asciz	"Greater Than\n"

	.p2align	4, 0x0                          ## @.r31
L_.r31:
	.asciz	"Less Than Or Equal To\n"

.subsections_via_symbols
