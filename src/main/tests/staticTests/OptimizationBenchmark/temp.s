	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_constantFolding          ## -- Begin function _mini_constantFolding
	.p2align	4, 0x90
__mini_constantFolding:                 ## @_mini_constantFolding
	.cfi_startproc
## %bb.0:                               ## %l2
	movq	$226, -8(%rsp)
	movl	$226, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_constantPropagation      ## -- Begin function _mini_constantPropagation
	.p2align	4, 0x90
__mini_constantPropagation:             ## @_mini_constantPropagation
	.cfi_startproc
## %bb.0:                               ## %l4
	movq	$-25457889, -8(%rsp)            ## imm = 0xFE7B8B1F
	movq	$-25457889, %rax                ## imm = 0xFE7B8B1F
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_deadCodeElimination      ## -- Begin function _mini_deadCodeElimination
	.p2align	4, 0x90
__mini_deadCodeElimination:             ## @_mini_deadCodeElimination
	.cfi_startproc
## %bb.0:                               ## %l6
	movq	$11, -8(%rsp)
	movq	$5, -16(%rsp)
	movq	$9, -24(%rsp)
	movq	$38, -32(%rsp)
	movq	$9, _.r4(%rip)
	movl	$38, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_sum                      ## -- Begin function _mini_sum
	.p2align	4, 0x90
__mini_sum:                             ## @_mini_sum
	.cfi_startproc
## %bb.0:                               ## %l8
	movq	$0, -8(%rsp)
	xorl	%eax, %eax
	movq	$0, -16(%rsp)
	movb	$0, -33(%rsp)
	movq	$1, -24(%rsp)
	movq	$0, -32(%rsp)
	movb	$0, -34(%rsp)
	testq	%rdi, %rdi
	jle	LBB3_3
## %bb.1:                               ## %l9.preheader
	movl	$1, %ecx
	movl	$1, %edx
	negq	%rdx
	.p2align	4, 0x90
LBB3_2:                                 ## %l9
                                        ## =>This Inner Loop Header: Depth=1
	addq	%rdi, %rax
	leaq	(%rdx,%rdi), %rsi
	subq	%rcx, %rdi
	testq	%rsi, %rsi
	jg	LBB3_2
LBB3_3:                                 ## %l11
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_doesntModifyGlobals      ## -- Begin function _mini_doesntModifyGlobals
	.p2align	4, 0x90
__mini_doesntModifyGlobals:             ## @_mini_doesntModifyGlobals
	.cfi_startproc
## %bb.0:                               ## %l13
	movq	$3, -8(%rsp)
	movl	$3, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_interProceduralOptimization ## -- Begin function _mini_interProceduralOptimization
	.p2align	4, 0x90
__mini_interProceduralOptimization:     ## @_mini_interProceduralOptimization
	.cfi_startproc
## %bb.0:                               ## %l15
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$96, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -16
	movq	$1, 88(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 72(%rsp)
	movq	$100, 64(%rsp)
	movq	$1, 56(%rsp)
	movb	$0, 15(%rsp)
	movq	$10000, 48(%rsp)                ## imm = 0x2710
	movq	$2, 40(%rsp)
	movb	$0, 14(%rsp)
	movq	$20000, 32(%rsp)                ## imm = 0x4E20
	movq	$3, 24(%rsp)
	movb	$0, 13(%rsp)
	movq	$30000, 16(%rsp)                ## imm = 0x7530
	movq	$1, _.r4(%rip)
	movq	$0, _.r5(%rip)
	movq	$0, _.r6(%rip)
	movl	$100, %edi
	callq	__mini_sum
	cmpq	$1, _.r4(%rip)
	jne	LBB5_2
## %bb.1:                               ## %l16
	movl	$10000, %edi                    ## imm = 0x2710
	jmp	LBB5_6
LBB5_2:                                 ## %l17
	movl	$3, %ebx
	cmpq	$2, _.r5(%rip)
	jne	LBB5_4
## %bb.3:                               ## %l18
	movl	$20000, %edi                    ## imm = 0x4E20
	callq	__mini_sum
LBB5_4:                                 ## %l20
	cmpq	%rbx, _.r6(%rip)
	jne	LBB5_7
## %bb.5:                               ## %l21
	movl	$30000, %edi                    ## imm = 0x7530
LBB5_6:                                 ## %l24
	callq	__mini_sum
LBB5_7:                                 ## %l24
	addq	$96, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_commonSubexpressionElimination ## -- Begin function _mini_commonSubexpressionElimination
	.p2align	4, 0x90
__mini_commonSubexpressionElimination:  ## @_mini_commonSubexpressionElimination
	.cfi_startproc
## %bb.0:                               ## %l26
	movq	$-48796, -8(%rsp)               ## imm = 0xFFFF4164
	movq	$-48796, %rax                   ## imm = 0xFFFF4164
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_hoisting                 ## -- Begin function _mini_hoisting
	.p2align	4, 0x90
__mini_hoisting:                        ## @_mini_hoisting
	.cfi_startproc
## %bb.0:                               ## %l28
	movq	$2, -8(%rsp)
	movq	$0, -16(%rsp)
	xorl	%eax, %eax
	movq	$1000000, -24(%rsp)             ## imm = 0xF4240
	movb	$0, -41(%rsp)
	movq	$1, -32(%rsp)
	movq	$1000000, -40(%rsp)             ## imm = 0xF4240
	movb	$0, -42(%rsp)
	testb	%al, %al
	jne	LBB7_3
## %bb.1:                               ## %l29.preheader
	movl	$1, %eax
	movl	$1000000, %ecx                  ## imm = 0xF4240
	movl	$1, %edx
	.p2align	4, 0x90
LBB7_2:                                 ## %l29
                                        ## =>This Inner Loop Header: Depth=1
	cmpq	%rcx, %rdx
	leaq	(%rdx,%rax), %rdx
	jl	LBB7_2
LBB7_3:                                 ## %l31
	movl	$2, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_doubleIf                 ## -- Begin function _mini_doubleIf
	.p2align	4, 0x90
__mini_doubleIf:                        ## @_mini_doubleIf
	.cfi_startproc
## %bb.0:                               ## %l33
	movq	$1, -8(%rsp)
	movq	$0, -16(%rsp)
	xorl	%eax, %eax
	movq	$1, -24(%rsp)
	movb	$0, -33(%rsp)
	movq	$50, -32(%rsp)
	testb	%al, %al
	jne	LBB8_2
## %bb.1:                               ## %l38
	movl	$50, %eax
LBB8_2:                                 ## %l39
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_integerDivide            ## -- Begin function _mini_integerDivide
	.p2align	4, 0x90
__mini_integerDivide:                   ## @_mini_integerDivide
	.cfi_startproc
## %bb.0:                               ## %l41
	movq	$736, -8(%rsp)                  ## imm = 0x2E0
	movl	$736, %eax                      ## imm = 0x2E0
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_association              ## -- Begin function _mini_association
	.p2align	4, 0x90
__mini_association:                     ## @_mini_association
	.cfi_startproc
## %bb.0:                               ## %l43
	movq	$10, -8(%rsp)
	movl	$10, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_tailRecursionHelper      ## -- Begin function _mini_tailRecursionHelper
	.p2align	4, 0x90
__mini_tailRecursionHelper:             ## @_mini_tailRecursionHelper
	.cfi_startproc
## %bb.0:                               ## %l45
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, %rax
	movq	$0, 16(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 8(%rsp)
	testq	%rdi, %rdi
	je	LBB11_2
## %bb.1:                               ## %l47
	addq	%rdi, %rax
	subq	$1, %rdi
	movq	%rax, %rsi
	callq	__mini_tailRecursionHelper
LBB11_2:                                ## %l44
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_tailRecursion            ## -- Begin function _mini_tailRecursion
	.p2align	4, 0x90
__mini_tailRecursion:                   ## @_mini_tailRecursion
	.cfi_startproc
## %bb.0:                               ## %l49
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	$0, (%rsp)
	xorl	%esi, %esi
	callq	__mini_tailRecursionHelper
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_unswitching              ## -- Begin function _mini_unswitching
	.p2align	4, 0x90
__mini_unswitching:                     ## @_mini_unswitching
	.cfi_startproc
## %bb.0:                               ## %l51
	movq	$1, -8(%rsp)
	movl	$1, %ecx
	movq	$2, -16(%rsp)
	movq	$1000000, -24(%rsp)             ## imm = 0xF4240
	movb	$0, -57(%rsp)
	movq	$2, -32(%rsp)
	movb	$0, -58(%rsp)
	xorl	%eax, %eax
	movq	$1, -40(%rsp)
	movq	$2, -48(%rsp)
	movq	$1000000, -56(%rsp)             ## imm = 0xF4240
	movb	$0, -59(%rsp)
	testb	%al, %al
	jne	LBB13_1
## %bb.2:                               ## %l52.preheader
	movl	$2, %edx
	movl	$1000000, %esi                  ## imm = 0xF4240
	movl	$1, %eax
	jmp	LBB13_3
	.p2align	4, 0x90
LBB13_5:                                ## %l56
                                        ##   in Loop: Header=BB13_3 Depth=1
	addq	%rdx, %rax
	cmpq	%rsi, %rax
	jge	LBB13_7
LBB13_3:                                ## %l52
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	%edx, %edx
	jne	LBB13_5
## %bb.4:                               ## %l55
                                        ##   in Loop: Header=BB13_3 Depth=1
	addq	%rcx, %rax
	cmpq	%rsi, %rax
	jl	LBB13_3
LBB13_7:                                ## %l54
	retq
LBB13_1:
	movl	$1, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_randomCalculation        ## -- Begin function _mini_randomCalculation
	.p2align	4, 0x90
__mini_randomCalculation:               ## @_mini_randomCalculation
	.cfi_startproc
## %bb.0:                               ## %l59
	movq	$0, -8(%rsp)
	xorl	%eax, %eax
	movq	$0, -16(%rsp)
	movb	$0, -81(%rsp)
	movq	$19, -24(%rsp)
	movq	$2, -32(%rsp)
	movq	$2, -40(%rsp)
	movq	$3, -48(%rsp)
	movq	$3, -56(%rsp)
	movq	$4, -64(%rsp)
	movq	$4, -72(%rsp)
	movq	$1, -80(%rsp)
	movb	$0, -82(%rsp)
	testq	%rdi, %rdi
	jle	LBB14_1
## %bb.2:                               ## %l60.preheader
	movl	$19, %esi
	movl	$2, %r8d
	movl	$3, %r9d
	movl	$4, %r10d
	movl	$1, %r11d
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB14_3:                                ## %l60
                                        ## =>This Inner Loop Header: Depth=1
	addq	%rsi, %rcx
	imulq	%r8, %rax
	cqto
	idivq	%r8
	imulq	%r9, %rax
	cqto
	idivq	%r9
	imulq	%r10, %rax
	cqto
	idivq	%r10
	addq	%r11, %rax
	cmpq	%rdi, %rax
	jl	LBB14_3
## %bb.4:                               ## %l62
	movq	%rcx, %rax
	retq
LBB14_1:
	xorl	%ecx, %ecx
	movq	%rcx, %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_iterativeFibonacci       ## -- Begin function _mini_iterativeFibonacci
	.p2align	4, 0x90
__mini_iterativeFibonacci:              ## @_mini_iterativeFibonacci
	.cfi_startproc
## %bb.0:                               ## %l64
	movq	$-1, -8(%rsp)
	movq	$1, -16(%rsp)
	movl	$1, %ecx
	movq	$0, -24(%rsp)
	movb	$0, -33(%rsp)
	movq	$1, -32(%rsp)
	movb	$0, -34(%rsp)
	testq	%rdi, %rdi
	jle	LBB15_1
## %bb.2:                               ## %l65.preheader
	movq	$-1, %rsi
	movl	$1, %edx
	movl	$1, %r8d
	.p2align	4, 0x90
LBB15_3:                                ## %l65
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rsi, %rax
	addq	%r8, %rax
	cmpq	%rdi, %rdx
	leaq	(%rdx,%rcx), %rdx
	movq	%r8, %rsi
	movq	%rax, %r8
	jl	LBB15_3
## %bb.4:                               ## %l67
	retq
LBB15_1:
	movl	$1, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_recursiveFibonacci       ## -- Begin function _mini_recursiveFibonacci
	.p2align	4, 0x90
__mini_recursiveFibonacci:              ## @_mini_recursiveFibonacci
	.cfi_startproc
## %bb.0:                               ## %l69
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdi, %rax
	movq	$0, 32(%rsp)
	movq	$1, 24(%rsp)
	movb	$0, 7(%rsp)
	movb	$0, 6(%rsp)
	movq	$1, 16(%rsp)
	movq	$2, 8(%rsp)
	cmpq	$2, %rdi
	jl	LBB16_2
## %bb.1:                               ## %l71
	leaq	-1(%rax), %rdi
	movq	%rax, %rbx
	callq	__mini_recursiveFibonacci
	movq	%rax, %r14
	subq	$2, %rbx
	movq	%rbx, %rdi
	callq	__mini_recursiveFibonacci
	addq	%r14, %rax
LBB16_2:                                ## %l68
	addq	$40, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l73
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$1, 64(%rsp)
	movb	$0, 7(%rsp)
	movq	$1000, 56(%rsp)                 ## imm = 0x3E8
	movq	$5, 48(%rsp)
	movq	$1000, 40(%rsp)                 ## imm = 0x3E8
	movq	$1, 32(%rsp)
	movb	$0, 6(%rsp)
	movq	$9999, 24(%rsp)                 ## imm = 0x270F
	movq	$0, 16(%rsp)
	leaq	L_.r933(%rip), %rdi
	leaq	8(%rsp), %rsi
	callq	_scanf
	cmpq	$2, 8(%rsp)
	jl	LBB17_3
## %bb.1:                               ## %l74.preheader
	movl	$1, %eax
	movl	$1000, %r15d                    ## imm = 0x3E8
	leaq	1(%rax), %r12
	leaq	L_.r979(%rip), %r13
	leaq	L_.r983(%rip), %rbp
	leaq	L_.r990(%rip), %rbx
	leaq	L_.r997(%rip), %r14
	.p2align	4, 0x90
LBB17_2:                                ## %l74
                                        ## =>This Inner Loop Header: Depth=1
	callq	__mini_constantFolding
	leaq	L_.r945(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_constantPropagation
	leaq	L_.r948(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_deadCodeElimination
	leaq	L_.r951(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_interProceduralOptimization
	leaq	L_.r954(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_commonSubexpressionElimination
	leaq	L_.r957(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_hoisting
	leaq	L_.r960(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_doubleIf
	leaq	L_.r963(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_integerDivide
	leaq	L_.r966(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_association
	leaq	L_.r969(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	8(%rsp), %rax
	cqto
	idivq	%r15
	movq	%rax, %rdi
	callq	__mini_tailRecursion
	leaq	L_.r976(%rip), %rdi
	movq	%rax, %rsi
	callq	_printf
	callq	__mini_unswitching
	movq	%r13, %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	8(%rsp), %rdi
	callq	__mini_randomCalculation
	movq	%rbp, %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	8(%rsp), %rax
	cqto
	movl	$5, %ecx
	idivq	%rcx
	movq	%rax, %rdi
	callq	__mini_iterativeFibonacci
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_printf
	movq	8(%rsp), %rax
	cqto
	idivq	%r15
	movq	%rax, %rdi
	callq	__mini_recursiveFibonacci
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	_printf
	cmpq	8(%rsp), %r12
	movl	$1, %eax
	leaq	(%r12,%rax), %r12
	jl	LBB17_2
LBB17_3:                                ## %l76
	leaq	L_.r1011(%rip), %rdi
	movl	$9999, %esi                     ## imm = 0x270F
	callq	_printf
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l78
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
	.section	__TEXT,__cstring,cstring_literals
L_.r933:                                ## @.r933
	.asciz	"%ld"

L_.r945:                                ## @.r945
	.asciz	"%ld\n"

L_.r948:                                ## @.r948
	.asciz	"%ld\n"

L_.r951:                                ## @.r951
	.asciz	"%ld\n"

L_.r954:                                ## @.r954
	.asciz	"%ld\n"

L_.r957:                                ## @.r957
	.asciz	"%ld\n"

L_.r960:                                ## @.r960
	.asciz	"%ld\n"

L_.r963:                                ## @.r963
	.asciz	"%ld\n"

L_.r966:                                ## @.r966
	.asciz	"%ld\n"

L_.r969:                                ## @.r969
	.asciz	"%ld\n"

L_.r976:                                ## @.r976
	.asciz	"%ld\n"

L_.r979:                                ## @.r979
	.asciz	"%ld\n"

L_.r983:                                ## @.r983
	.asciz	"%ld\n"

L_.r990:                                ## @.r990
	.asciz	"%ld\n"

L_.r997:                                ## @.r997
	.asciz	"%ld\n"

L_.r1011:                               ## @.r1011
	.asciz	"%ld\n"

.subsections_via_symbols
