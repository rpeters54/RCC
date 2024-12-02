	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	_compareDoubles                 ## -- Begin function compareDoubles
	.p2align	4, 0x90
_compareDoubles:                        ## @compareDoubles
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	$0, -8(%rsp)
	movb	$0, -25(%rsp)
	movq	$-1, -16(%rsp)
	movq	$1, -24(%rsp)
	movsd	(%rdi), %xmm0                   ## xmm0 = mem[0],zero
	subsd	(%rsi), %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	LBB0_2
## %bb.1:                               ## %l3
	movq	$-1, %rax
                                        ## kill: def $eax killed $eax killed $rax
	retq
LBB0_2:                                 ## %l4
	movl	$1, %eax
                                        ## kill: def $eax killed $eax killed $rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_heapify                        ## -- Begin function heapify
	.p2align	4, 0x90
_heapify:                               ## @heapify
	.cfi_startproc
## %bb.0:                               ## %l6
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
	movl	%esi, %r12d
	movq	%rdi, %rbx
	movq	$2, 112(%rsp)
	movq	$1, 104(%rsp)
	movq	$2, 96(%rsp)
	movq	$2, 88(%rsp)
	movq	$0, 80(%rsp)
	movb	$0, 23(%rsp)
	movb	$0, 22(%rsp)
	movq	$-1, 72(%rsp)
	movq	$-1, %rdx
	movq	$0, 64(%rsp)
	movb	$0, 21(%rsp)
	movb	$0, 20(%rsp)
	movq	$-1, 56(%rsp)
	movq	$-1, 48(%rsp)
	movb	$0, 19(%rsp)
	movq	$0, 40(%rsp)
	movb	$0, 18(%rsp)
	movq	$-1, 32(%rsp)
	movb	$0, 17(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 16(%rsp)
	movb	$0, 15(%rsp)
	movslq	%esi, %r15
	leaq	1(%r15,%r15), %r13
	leal	2(%r15,%r15), %r14d
	cmpl	16(%rdi), %r13d
	setge	%al
	movslq	%r13d, %rcx
	testq	%rcx, %rcx
	sets	%cl
	orb	%al, %cl
	je	LBB1_2
## %bb.1:                               ## %l7
	movq	$-1, %r13
LBB1_2:                                 ## %l9
	cmpl	16(%rbx), %r14d
	setge	%al
	movslq	%r14d, %rcx
	testq	%rcx, %rcx
	sets	%cl
	orb	%al, %cl
	je	LBB1_4
## %bb.3:                               ## %l10
	movq	$-1, %r14
LBB1_4:                                 ## %l12
	movslq	%r13d, %rax
	cmpq	%rdx, %rax
	movl	%r12d, %ebp
	je	LBB1_7
## %bb.5:                               ## %l13
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdx
	movq	(%rcx,%rax,8), %rdi
	movq	(%rcx,%r15,8), %rsi
	callq	*%rdx
	movq	$-1, %rdx
	cltq
	testq	%rax, %rax
	movl	%r13d, %ebp
	js	LBB1_7
## %bb.6:                               ## %l16
	movl	%r12d, %ebp
LBB1_7:                                 ## %l18
	movslq	%r14d, %rax
	cmpq	%rdx, %rax
	je	LBB1_9
## %bb.8:                               ## %l19
	movq	(%rbx), %rcx
	movq	8(%rbx), %rdx
	movq	(%rcx,%rax,8), %rdi
	movslq	%ebp, %rax
	movq	(%rcx,%rax,8), %rsi
	callq	*%rdx
	cltq
	testq	%rax, %rax
	js	LBB1_10
LBB1_9:                                 ## %l22
	movl	%ebp, %r14d
LBB1_10:                                ## %l24
	cmpl	%r12d, %r14d
	je	LBB1_12
## %bb.11:                              ## %l25
	movq	(%rbx), %rax
	movslq	%r14d, %rcx
	movq	(%rax,%rcx,8), %rdx
	movq	(%rax,%r15,8), %rsi
	movq	%rsi, (%rax,%rcx,8)
	movq	(%rbx), %rax
	movq	%rdx, (%rax,%r15,8)
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	_heapify
LBB1_12:                                ## %l5
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
	.globl	_make                           ## -- Begin function make
	.p2align	4, 0x90
_make:                                  ## @make
	.cfi_startproc
## %bb.0:                               ## %l29
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$120, %rsp
	.cfi_def_cfa_offset 160
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %r15
	movq	%rsi, %r14
	movl	%edi, %ebp
	movq	$24, 112(%rsp)
	movq	$0, 104(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 96(%rsp)
	movq	$0, 88(%rsp)
	movq	$8, 80(%rsp)
	movq	$0, 72(%rsp)
	movb	$0, 6(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 56(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 48(%rsp)
	movb	$0, 4(%rsp)
	movq	$2, 40(%rsp)
	movq	$2, 32(%rsp)
	movq	$0, 24(%rsp)
	movb	$0, 3(%rsp)
	movq	$1, 16(%rsp)
	movq	$0, 8(%rsp)
	movb	$0, 2(%rsp)
	movl	$24, %edi
	callq	_malloc
	testq	%rax, %rax
	jne	LBB2_3
## %bb.1:                               ## %l30
	leaq	L_.r251(%rip), %rdi
	jmp	LBB2_2
LBB2_3:                                 ## %l32
	movq	%rax, %rbx
	movl	$8, %eax
	movl	$0, 16(%rbx)
	movl	%ebp, 20(%rbx)
	movq	%r15, 8(%rbx)
	movslq	%ebp, %rdi
	imulq	%rax, %rdi
	callq	_malloc
	movq	%rax, (%rbx)
	testq	%rax, %rax
	jne	LBB2_5
## %bb.4:                               ## %l33
	leaq	L_.r279(%rip), %rdi
LBB2_2:                                 ## %l28
	callq	_printf
	xorl	%ebx, %ebx
LBB2_10:                                ## %l28
	movq	%rbx, %rax
	addq	$120, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB2_5:                                 ## %l35
	movl	$1, %r15d
	movl	$2, %ecx
	xorl	%eax, %eax
	testl	%ebp, %ebp
	jle	LBB2_7
	.p2align	4, 0x90
LBB2_6:                                 ## %l36
                                        ## =>This Inner Loop Header: Depth=1
	cltq
	movq	(%r14,%rax,8), %rdx
	movq	(%rbx), %rsi
	movq	%rdx, (%rsi,%rax,8)
	addl	%r15d, %eax
	cmpl	%ebp, %eax
	jl	LBB2_6
LBB2_7:                                 ## %l38
	movl	%eax, 16(%rbx)
	cltq
	subq	%rcx, %rax
	cqto
	idivq	%rcx
	movq	%rax, %r14
	.p2align	4, 0x90
LBB2_9:                                 ## %l39
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%r14d, %rax
	testq	%rax, %rax
	js	LBB2_10
## %bb.8:                               ## %l39
                                        ##   in Loop: Header=BB2_9 Depth=1
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	_heapify
	subl	%r15d, %r14d
	jmp	LBB2_9
	.cfi_endproc
                                        ## -- End function
	.globl	_popFirst                       ## -- Begin function popFirst
	.p2align	4, 0x90
_popFirst:                              ## @popFirst
	.cfi_startproc
## %bb.0:                               ## %l43
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -16
	movq	$0, 56(%rsp)
	movb	$0, 7(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	$1, 32(%rsp)
	movq	$0, 24(%rsp)
	movq	$1, 16(%rsp)
	movq	$0, 8(%rsp)
	cmpl	$0, 16(%rdi)
	jne	LBB3_2
## %bb.1:
	xorl	%ebx, %ebx
	jmp	LBB3_3
LBB3_2:                                 ## %l46
	movl	$1, %eax
	movq	(%rdi), %rcx
	movq	(%rcx), %rbx
	movslq	16(%rdi), %rdx
	subq	$1, %rdx
	movq	(%rcx,%rdx,8), %rdx
	movq	%rdx, (%rcx)
	subl	%eax, 16(%rdi)
	xorl	%esi, %esi
	callq	_heapify
LBB3_3:                                 ## %l42
	movq	%rbx, %rax
	addq	$64, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l48
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$296, %rsp                      ## imm = 0x128
	.cfi_def_cfa_offset 320
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movabsq	$4602678819172646912, %rsi      ## imm = 0x3FE0000000000000
	movq	%rsi, 216(%rsp)
	movabsq	$4614388178203810202, %rdx      ## imm = 0x400999999999999A
	movq	%rdx, 208(%rsp)
	movabsq	$4616414798036126925, %rdi      ## imm = 0x4010CCCCCCCCCCCD
	movq	%rdi, 200(%rsp)
	movabsq	$4609434218613702656, %r8       ## imm = 0x3FF8000000000000
	movq	%r8, 192(%rsp)
	movq	%rdx, 184(%rsp)
	movabsq	$4621256167635550208, %r9       ## imm = 0x4022000000000000
	movq	%r9, 176(%rsp)
	movabsq	$4591870180066957722, %r10      ## imm = 0x3FB999999999999A
	movq	%r10, 168(%rsp)
	movabsq	$4613937818241073152, %r11      ## imm = 0x4008000000000000
	movq	%r11, 160(%rsp)
	movabsq	$4620130267728707584, %rbx      ## imm = 0x401E000000000000
	movq	%rbx, 152(%rsp)
	movq	$0, 144(%rsp)
	movq	$9, 136(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 128(%rsp)
	movq	$9, 120(%rsp)
	movl	$9, %eax
	movb	$0, 14(%rsp)
	xorl	%ecx, %ecx
	movq	$9, 112(%rsp)
	movq	$0, 104(%rsp)
	movb	$0, 13(%rsp)
	movq	$0, 96(%rsp)
	movb	$0, 12(%rsp)
	movq	$0, 88(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rdi, 32(%rsp)
	movq	%r8, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%r9, 56(%rsp)
	movq	%r10, 64(%rsp)
	movq	%r11, 72(%rsp)
	movq	%rbx, 80(%rsp)
	testb	%cl, %cl
	jne	LBB4_3
## %bb.1:                               ## %l49.preheader
	movl	$1, %edx
	.p2align	4, 0x90
LBB4_2:                                 ## %l49
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%ecx, %rcx
	leaq	16(%rsp,%rcx,8), %rsi
	movq	%rsi, 224(%rsp,%rcx,8)
	addl	%edx, %ecx
	movslq	%ecx, %rsi
	cmpq	%rax, %rsi
	jl	LBB4_2
LBB4_3:                                 ## %l51
	leaq	_compareDoubles(%rip), %rdx
	leaq	224(%rsp), %rsi
	movl	$9, %edi
	callq	_make
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_popFirst
	testq	%rax, %rax
	je	LBB4_6
## %bb.4:                               ## %l52.preheader
	leaq	L_.r502(%rip), %r14
	.p2align	4, 0x90
LBB4_5:                                 ## %l52
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rax), %rsi
	movq	%r14, %rdi
	callq	_printf
	movq	%rbx, %rdi
	callq	_popFirst
	testq	%rax, %rax
	jne	LBB4_5
LBB4_6:                                 ## %l54
	xorl	%eax, %eax
	addq	$296, %rsp                      ## imm = 0x128
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.r251:                                ## @.r251
	.asciz	"Memory error\n"

L_.r279:                                ## @.r279
	.asciz	"Memory error\n"

L_.r502:                                ## @.r502
	.asciz	"%ld\n"

.subsections_via_symbols
