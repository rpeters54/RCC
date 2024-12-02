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
	subq	$712, %rsp                      ## imm = 0x2C8
	.cfi_def_cfa_offset 768
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$1, 576(%rsp)
	movq	$2, 568(%rsp)
	movq	$3, 560(%rsp)
	movq	$4, 552(%rsp)
	movq	$5, 544(%rsp)
	movq	$6, 536(%rsp)
	movq	$7, 528(%rsp)
	movq	$8, 520(%rsp)
	movq	$9, 512(%rsp)
	movq	$10, 504(%rsp)
	movq	$11, 496(%rsp)
	movq	$12, 488(%rsp)
	movq	$1, 480(%rsp)
	movq	$4, 472(%rsp)
	movq	$7, 464(%rsp)
	movq	$10, 456(%rsp)
	movq	$2, 448(%rsp)
	movq	$5, 440(%rsp)
	movq	$8, 432(%rsp)
	movq	$11, 424(%rsp)
	movq	$3, 416(%rsp)
	movq	$6, 408(%rsp)
	movq	$9, 400(%rsp)
	movq	$12, 392(%rsp)
	movq	$0, 384(%rsp)
	movq	$128, 376(%rsp)
	movq	$0, 368(%rsp)
	movq	$4, 360(%rsp)
	movb	$0, 15(%rsp)
	movq	$0, 352(%rsp)
	xorl	%ebx, %ebx
	movq	$4, 344(%rsp)
	movb	$0, 14(%rsp)
	movq	$0, 336(%rsp)
	movq	$3, 328(%rsp)
	movb	$0, 13(%rsp)
	movq	$1, 320(%rsp)
	movl	$1, %r12d
	movq	$3, 312(%rsp)
	movb	$0, 12(%rsp)
	movq	$1, 304(%rsp)
	movq	$4, 296(%rsp)
	movb	$0, 11(%rsp)
	movq	$1, 288(%rsp)
	movq	$4, 280(%rsp)
	movb	$0, 10(%rsp)
	movq	$0, 272(%rsp)
	movq	$4, 264(%rsp)
	movb	$0, 9(%rsp)
	movq	$0, 256(%rsp)
	movq	$4, 248(%rsp)
	movb	$0, 8(%rsp)
	movq	$1, 240(%rsp)
	movq	$4, 232(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 224(%rsp)
	movq	$4, 216(%rsp)
	movb	$0, 6(%rsp)
	movq	$0, 208(%rsp)
	movq	$1, 112(%rsp)
	movq	$2, 120(%rsp)
	movq	$3, 128(%rsp)
	movq	$4, 136(%rsp)
	movq	$5, 144(%rsp)
	movq	$6, 152(%rsp)
	movq	$7, 160(%rsp)
	movq	$8, 168(%rsp)
	movq	$9, 176(%rsp)
	movq	$10, 184(%rsp)
	movq	$11, 192(%rsp)
	movq	$12, 200(%rsp)
	movq	$1, 16(%rsp)
	movq	$4, 24(%rsp)
	movq	$7, 32(%rsp)
	movq	$10, 40(%rsp)
	movq	$2, 48(%rsp)
	movq	$5, 56(%rsp)
	movq	$8, 64(%rsp)
	movq	$11, 72(%rsp)
	movq	$3, 80(%rsp)
	movq	$6, 88(%rsp)
	movq	$9, 96(%rsp)
	movq	$12, 104(%rsp)
	leaq	584(%rsp), %rdi
	movl	$128, %edx
	xorl	%esi, %esi
	callq	_memset
	movl	$4, %r10d
	testb	%bl, %bl
	jne	LBB0_9
## %bb.1:                               ## %l3.preheader
	movl	$3, %eax
	jmp	LBB0_2
	.p2align	4, 0x90
LBB0_8:                                 ## %l8
                                        ##   in Loop: Header=BB0_2 Depth=1
	addq	%r12, %rbx
	movslq	%ebx, %rcx
	cmpq	%r10, %rcx
	jge	LBB0_9
LBB0_2:                                 ## %l3
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
                                        ##       Child Loop BB0_6 Depth 3
	testq	%r10, %r10
	movslq	%ebx, %rbx
	jle	LBB0_8
## %bb.3:                               ## %l6.preheader
                                        ##   in Loop: Header=BB0_2 Depth=1
	xorl	%ecx, %ecx
	movq	%rbx, %rdx
	shlq	$5, %rdx
	leaq	584(%rsp,%rdx), %rdx
	leaq	(%rbx,%rbx,2), %rsi
	leaq	112(%rsp,%rsi,8), %rsi
	jmp	LBB0_4
	.p2align	4, 0x90
LBB0_7:                                 ## %l11
                                        ##   in Loop: Header=BB0_4 Depth=2
	addq	%r12, %rcx
	movslq	%ecx, %rdi
	cmpq	%r10, %rdi
	jge	LBB0_8
LBB0_4:                                 ## %l6
                                        ##   Parent Loop BB0_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_6 Depth 3
	testq	%rax, %rax
	movslq	%ecx, %rcx
	jle	LBB0_7
## %bb.5:                               ## %l9.preheader
                                        ##   in Loop: Header=BB0_4 Depth=2
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB0_6:                                 ## %l9
                                        ##   Parent Loop BB0_2 Depth=1
                                        ##     Parent Loop BB0_4 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	movslq	%edi, %rdi
	movq	(%rsi,%rdi,8), %r8
	movq	%rdi, %r9
	shlq	$5, %r9
	leaq	16(%rsp,%r9), %r9
	imulq	(%r9,%rcx,8), %r8
	addq	%r8, (%rdx,%rcx,8)
	leal	(%rdi,%r12), %r8d
	movslq	%r8d, %r8
	addl	%r12d, %edi
	cmpq	%rax, %r8
	jl	LBB0_6
	jmp	LBB0_7
LBB0_9:                                 ## %l5
	testq	%r10, %r10
	jle	LBB0_15
## %bb.10:                              ## %l12.preheader
	xorl	%ebp, %ebp
	leaq	L_.r242(%rip), %rbx
	jmp	LBB0_11
	.p2align	4, 0x90
LBB0_14:                                ## %l17
                                        ##   in Loop: Header=BB0_11 Depth=1
	addq	%r12, %r13
	movslq	%r13d, %rax
	cmpq	%r10, %rax
	movl	%r13d, %ebp
	jge	LBB0_15
LBB0_11:                                ## %l12
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_13 Depth 2
	testq	%r10, %r10
	movslq	%ebp, %r13
	jle	LBB0_14
## %bb.12:                              ## %l15.preheader
                                        ##   in Loop: Header=BB0_11 Depth=1
	movq	%r13, %rax
	shlq	$5, %rax
	leaq	584(%rsp,%rax), %r15
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB0_13:                                ## %l15
                                        ##   Parent Loop BB0_11 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	%r14d, %r14
	movq	(%r15,%r14,8), %rcx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	movl	%r14d, %edx
	callq	_printf
	movl	$4, %r10d
	leal	(%r12,%r14), %eax
	cltq
	addl	%r12d, %r14d
	cmpq	%r10, %rax
	jl	LBB0_13
	jmp	LBB0_14
LBB0_15:                                ## %l14
	xorl	%eax, %eax
	addq	$712, %rsp                      ## imm = 0x2C8
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
	.p2align	4, 0x0                          ## @.r242
L_.r242:
	.asciz	"Value at (row: %d, col: %d) = %d\n"

.subsections_via_symbols
