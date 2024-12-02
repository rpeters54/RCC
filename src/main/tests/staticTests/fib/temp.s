	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_fib                            ## -- Begin function fib
	.p2align	4, 0x90
_fib:                                   ## @fib
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	$1, 56(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 48(%rsp)
	movq	$2, 40(%rsp)
	movb	$0, 14(%rsp)
	movq	$1, 32(%rsp)
	movq	$1, 24(%rsp)
	movq	$2, 16(%rsp)
	movslq	%edi, %rcx
	cmpq	$1, %rcx
	jg	LBB0_2
## %bb.1:                               ## %l3
	xorl	%eax, %eax
	jmp	LBB0_4
LBB0_2:                                 ## %l4
	movl	$2, %r14d
	movl	$1, %eax
	cmpq	$2, %rcx
	je	LBB0_4
## %bb.3:                               ## %l6
	movl	%edi, %ecx
	subl	%eax, %ecx
	movl	%edi, %ebx
	movl	%ecx, %edi
	callq	_fib
	movl	%eax, %ebp
	subl	%r14d, %ebx
	movl	%ebx, %edi
	callq	_fib
                                        ## kill: def $eax killed $eax def $rax
	addl	%ebp, %eax
LBB0_4:                                 ## %l1
                                        ## kill: def $eax killed $eax killed $rax
	addq	$64, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l8
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movb	$48, 7(%rsp)
	movq	$0, 8(%rsp)
	leaq	L_.r43(%rip), %rdi
	callq	_printf
	callq	_getchar
                                        ## kill: def $eax killed $eax def $rax
	leal	-48(%rax), %ebx
	movl	%ebx, %edi
	callq	_fib
	leaq	L_.r51(%rip), %rdi
	movl	%ebx, %esi
	movl	%eax, %edx
	callq	_printf
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4, 0x0                          ## @.r43
L_.r43:
	.asciz	"Please Provide a Number:\n"

L_.r51:                                 ## @.r51
	.asciz	"Fib(%d) = %d\n"

.subsections_via_symbols
