	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.globl	__mini_printgroup               ## -- Begin function _mini_printgroup
	.p2align	4, 0x90
__mini_printgroup:                      ## @_mini_printgroup
	.cfi_startproc
## %bb.0:                               ## %l2
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	$1, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	$1, 24(%rsp)
	movq	$0, 16(%rsp)
	movq	$1, 8(%rsp)
	movq	$0, (%rsp)
	leaq	L_.r10(%rip), %rdi
	movl	$1, %esi
	callq	_printf
	leaq	L_.r14(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r18(%rip), %rdi
	movl	$1, %esi
	callq	_printf
	leaq	L_.r22(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r26(%rip), %rdi
	movl	$1, %esi
	callq	_printf
	leaq	L_.r30(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r34(%rip), %rdi
	movq	%rbx, %rsi
	callq	_printf
	addq	$48, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_setcounter               ## -- Begin function _mini_setcounter
	.p2align	4, 0x90
__mini_setcounter:                      ## @_mini_setcounter
	.cfi_startproc
## %bb.0:                               ## %l4
	movq	$1, -8(%rsp)
	movq	%rdi, _.r7(%rip)
	movl	$1, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_takealltypes             ## -- Begin function _mini_takealltypes
	.p2align	4, 0x90
__mini_takealltypes:                    ## @_mini_takealltypes
	.cfi_startproc
## %bb.0:                               ## %l6
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$88, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	$3, 80(%rsp)
	movb	$0, 15(%rsp)
	movq	$1, 72(%rsp)
	movq	$0, 64(%rsp)
	movq	$0, 56(%rsp)
	movq	$1, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	$1, 24(%rsp)
	movq	$0, 16(%rsp)
	cmpq	$3, %rdi
	jne	LBB2_2
## %bb.1:                               ## %l7
	leaq	L_.r51(%rip), %rdi
	movl	$1, %esi
	jmp	LBB2_3
LBB2_2:                                 ## %l8
	leaq	L_.r55(%rip), %rdi
	xorl	%esi, %esi
LBB2_3:                                 ## %l9
	callq	_printf
	testq	%r14, %r14
	je	LBB2_5
## %bb.4:                               ## %l10
	leaq	L_.r65(%rip), %rdi
	movl	$1, %esi
	jmp	LBB2_6
LBB2_5:                                 ## %l11
	leaq	L_.r69(%rip), %rdi
	xorl	%esi, %esi
LBB2_6:                                 ## %l12
	callq	_printf
	cmpq	$0, 8(%rbx)
	je	LBB2_8
## %bb.7:                               ## %l13
	leaq	L_.r81(%rip), %rdi
	movl	$1, %esi
	jmp	LBB2_9
LBB2_8:                                 ## %l14
	leaq	L_.r85(%rip), %rdi
	xorl	%esi, %esi
LBB2_9:                                 ## %l5
	callq	_printf
	addq	$88, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_tonofargs                ## -- Begin function _mini_tonofargs
	.p2align	4, 0x90
__mini_tonofargs:                       ## @_mini_tonofargs
	.cfi_startproc
## %bb.0:                               ## %l17
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%r9, %rbx
	movq	$5, 96(%rsp)
	movb	$0, 7(%rsp)
	movq	$1, 88(%rsp)
	movq	$0, 80(%rsp)
	movq	$6, 72(%rsp)
	movl	$6, %r15d
	movb	$0, 6(%rsp)
	movq	$1, 64(%rsp)
	movq	$0, 56(%rsp)
	movq	$7, 48(%rsp)
	movb	$0, 5(%rsp)
	movq	$1, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	$8, 24(%rsp)
	movb	$0, 4(%rsp)
	movq	$1, 16(%rsp)
	movq	$0, 8(%rsp)
	cmpq	$5, %r8
	jne	LBB3_2
## %bb.1:                               ## %l18
	leaq	L_.r107(%rip), %rdi
	movl	$1, %esi
	jmp	LBB3_3
LBB3_2:                                 ## %l19
	movq	%r8, %r14
	leaq	L_.r111(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r115(%rip), %rdi
	movq	%r14, %rsi
LBB3_3:                                 ## %l20
	callq	_printf
	movq	144(%rsp), %r14
	movl	$7, %r12d
	cmpq	%r15, %rbx
	jne	LBB3_5
## %bb.4:                               ## %l21
	leaq	L_.r131(%rip), %rdi
	movl	$1, %esi
	jmp	LBB3_6
LBB3_5:                                 ## %l22
	leaq	L_.r135(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r139(%rip), %rdi
	movq	%rbx, %rsi
LBB3_6:                                 ## %l23
	callq	_printf
	movq	152(%rsp), %rbx
	movl	$8, %r15d
	cmpq	%r12, %r14
	jne	LBB3_8
## %bb.7:                               ## %l24
	leaq	L_.r155(%rip), %rdi
	movl	$1, %esi
	jmp	LBB3_9
LBB3_8:                                 ## %l25
	leaq	L_.r159(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r163(%rip), %rdi
	movq	%r14, %rsi
LBB3_9:                                 ## %l26
	callq	_printf
	cmpq	%r15, %rbx
	jne	LBB3_11
## %bb.10:                              ## %l27
	leaq	L_.r179(%rip), %rdi
	movl	$1, %esi
	jmp	LBB3_12
LBB3_11:                                ## %l28
	leaq	L_.r183(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r187(%rip), %rdi
	movq	%rbx, %rsi
LBB3_12:                                ## %l16
	callq	_printf
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_returnint                ## -- Begin function _mini_returnint
	.p2align	4, 0x90
__mini_returnint:                       ## @_mini_returnint
	.cfi_startproc
## %bb.0:                               ## %l30
	movq	%rdi, %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_returnbool               ## -- Begin function _mini_returnbool
	.p2align	4, 0x90
__mini_returnbool:                      ## @_mini_returnbool
	.cfi_startproc
## %bb.0:                               ## %l32
	movq	%rdi, %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_returnstruct             ## -- Begin function _mini_returnstruct
	.p2align	4, 0x90
__mini_returnstruct:                    ## @_mini_returnstruct
	.cfi_startproc
## %bb.0:                               ## %l34
	movq	%rdi, %rax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__mini_main                     ## -- Begin function _mini_main
	.p2align	4, 0x90
__mini_main:                            ## @_mini_main
	.cfi_startproc
## %bb.0:                               ## %l37
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
	subq	$1832, %rsp                     ## imm = 0x728
	.cfi_def_cfa_offset 1888
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	$0, 1824(%rsp)
	movq	$1, 1816(%rsp)
	movq	$0, 1808(%rsp)
	movq	$0, 1800(%rsp)
	movb	$0, 71(%rsp)
	movq	$0, 1792(%rsp)
	movq	$1, 1784(%rsp)
	movl	$1, %r15d
	movq	$0, 1776(%rsp)
	movq	$0, 1768(%rsp)
	movb	$0, 70(%rsp)
	movq	$0, 1760(%rsp)
	movq	$1, 1752(%rsp)
	movq	$0, 1744(%rsp)
	movq	$0, 1736(%rsp)
	movb	$0, 69(%rsp)
	movq	$0, 1728(%rsp)
	movq	$1, 1720(%rsp)
	movq	$1, 1712(%rsp)
	movq	$0, 1704(%rsp)
	movb	$0, 68(%rsp)
	movq	$1, 1696(%rsp)
	movq	$0, 1688(%rsp)
	movq	$0, 1680(%rsp)
	movq	$2, 1672(%rsp)
	movq	$1, 1664(%rsp)
	movq	$0, 1656(%rsp)
	movb	$0, 67(%rsp)
	movq	$1, 1648(%rsp)
	movq	$0, 1640(%rsp)
	movq	$1, 1632(%rsp)
	movq	$0, 1624(%rsp)
	movb	$0, 66(%rsp)
	movq	$1, 1616(%rsp)
	movq	$0, 1608(%rsp)
	movq	$1, 1600(%rsp)
	movq	$0, 1592(%rsp)
	movb	$0, 65(%rsp)
	movq	$1, 1584(%rsp)
	movq	$0, 1576(%rsp)
	movq	$0, 1568(%rsp)
	movq	$0, 1560(%rsp)
	movb	$0, 64(%rsp)
	movq	$0, 1552(%rsp)
	movq	$1, 1544(%rsp)
	movq	$3, 1536(%rsp)
	movq	$42, 1528(%rsp)
	movq	$1, 1520(%rsp)
	movb	$0, 63(%rsp)
	movq	$1, 1512(%rsp)
	movq	$0, 1504(%rsp)
	movq	$42, 1496(%rsp)
	movq	$1, 1488(%rsp)
	movb	$0, 62(%rsp)
	movq	$1, 1480(%rsp)
	movq	$0, 1472(%rsp)
	movq	$42, 1464(%rsp)
	movq	$1, 1456(%rsp)
	movb	$0, 61(%rsp)
	movq	$0, 1448(%rsp)
	movq	$1, 1440(%rsp)
	movq	$42, 1432(%rsp)
	movq	$1, 1424(%rsp)
	movb	$0, 60(%rsp)
	movq	$0, 1416(%rsp)
	movq	$1, 1408(%rsp)
	movq	$42, 1400(%rsp)
	movq	$1, 1392(%rsp)
	movb	$0, 59(%rsp)
	movq	$0, 1384(%rsp)
	movq	$1, 1376(%rsp)
	movq	$42, 1368(%rsp)
	movq	$1, 1360(%rsp)
	movb	$0, 58(%rsp)
	movq	$1, 1352(%rsp)
	movq	$0, 1344(%rsp)
	movq	$1, 1336(%rsp)
	movq	$0, 1328(%rsp)
	movq	$1, 1320(%rsp)
	movq	$0, 1312(%rsp)
	movq	$1, 1304(%rsp)
	movq	$0, 1296(%rsp)
	movb	$0, 57(%rsp)
	movq	$0, 1288(%rsp)
	movq	$1, 1280(%rsp)
	movq	$0, 1272(%rsp)
	movq	$0, 1264(%rsp)
	movq	$0, 1256(%rsp)
	movq	$1, 1248(%rsp)
	movq	$0, 1240(%rsp)
	movq	$0, 1232(%rsp)
	movb	$0, 56(%rsp)
	movq	$1, 1224(%rsp)
	movq	$0, 1216(%rsp)
	movq	$0, 1208(%rsp)
	movq	$0, 1200(%rsp)
	movb	$0, 55(%rsp)
	movq	$1, 1192(%rsp)
	movq	$0, 1184(%rsp)
	movq	$4, 1176(%rsp)
	movq	$5, 1168(%rsp)
	movq	$5, 1160(%rsp)
	movb	$0, 54(%rsp)
	movq	$1, 1152(%rsp)
	movq	$0, 1144(%rsp)
	movq	$5, 1136(%rsp)
	movq	$6, 1128(%rsp)
	movq	$6, 1120(%rsp)
	movb	$0, 53(%rsp)
	movq	$1, 1112(%rsp)
	movq	$0, 1104(%rsp)
	movq	$6, 1096(%rsp)
	movq	$1, 1088(%rsp)
	movq	$1, 1080(%rsp)
	movb	$0, 52(%rsp)
	movq	$1, 1072(%rsp)
	movq	$0, 1064(%rsp)
	movq	$1, 1056(%rsp)
	movq	$2, 1048(%rsp)
	movq	$2, 1040(%rsp)
	movb	$0, 51(%rsp)
	movq	$1, 1032(%rsp)
	movq	$0, 1024(%rsp)
	movq	$2, 1016(%rsp)
	movq	$-6, 1008(%rsp)
	movq	$0, 1000(%rsp)
	movb	$0, 50(%rsp)
	movq	$1, 992(%rsp)
	movq	$0, 984(%rsp)
	movq	$5, 976(%rsp)
	movq	$42, 968(%rsp)
	movq	$42, 960(%rsp)
	movb	$0, 49(%rsp)
	movq	$1, 952(%rsp)
	movq	$0, 944(%rsp)
	movq	$5, 936(%rsp)
	movq	$5, 928(%rsp)
	movb	$0, 48(%rsp)
	movq	$1, 920(%rsp)
	movq	$0, 912(%rsp)
	movq	$1, 904(%rsp)
	movq	$0, 896(%rsp)
	movq	$1, 888(%rsp)
	movq	$0, 880(%rsp)
	movq	$0, 872(%rsp)
	movb	$0, 47(%rsp)
	movq	$0, 864(%rsp)
	movq	$1, 856(%rsp)
	movq	$0, 848(%rsp)
	movq	$0, 840(%rsp)
	movq	$0, 832(%rsp)
	movq	$1, 824(%rsp)
	movq	$0, 816(%rsp)
	movb	$0, 46(%rsp)
	movq	$1, 808(%rsp)
	movq	$0, 800(%rsp)
	movq	$0, 792(%rsp)
	movq	$0, 784(%rsp)
	movq	$1, 776(%rsp)
	movq	$6, 768(%rsp)
	movq	$0, 760(%rsp)
	movq	$5, 752(%rsp)
	movb	$0, 45(%rsp)
	movq	$5, 744(%rsp)
	movb	$0, 44(%rsp)
	movq	$0, 736(%rsp)
	movq	$5, 728(%rsp)
	movq	$5, 720(%rsp)
	movb	$0, 43(%rsp)
	movq	$5, 712(%rsp)
	movb	$0, 42(%rsp)
	movq	$1, 704(%rsp)
	movq	$0, 696(%rsp)
	movq	$7, 688(%rsp)
	movq	$24, 680(%rsp)
	movq	$42, 672(%rsp)
	movq	$1, 664(%rsp)
	movq	$42, 656(%rsp)
	movb	$0, 41(%rsp)
	movq	$1, 648(%rsp)
	movq	$0, 640(%rsp)
	movq	$0, 632(%rsp)
	movq	$1, 624(%rsp)
	movq	$0, 616(%rsp)
	movq	$24, 608(%rsp)
	movq	$13, 600(%rsp)
	movq	$0, 592(%rsp)
	movq	$13, 584(%rsp)
	movb	$0, 40(%rsp)
	movq	$1, 576(%rsp)
	movq	$0, 568(%rsp)
	movq	$0, 560(%rsp)
	movb	$0, 39(%rsp)
	movq	$1, 552(%rsp)
	movq	$0, 544(%rsp)
	movb	$0, 38(%rsp)
	movq	$1, 536(%rsp)
	movq	$0, 528(%rsp)
	movb	$0, 37(%rsp)
	movq	$1, 520(%rsp)
	movq	$0, 512(%rsp)
	movq	$8, 504(%rsp)
	movq	$7, 496(%rsp)
	movq	$7, 488(%rsp)
	movb	$0, 36(%rsp)
	movq	$1, 480(%rsp)
	movq	$0, 472(%rsp)
	movq	$1, 464(%rsp)
	movq	$0, 456(%rsp)
	movq	$1, 448(%rsp)
	movq	$0, 440(%rsp)
	movq	$24, 432(%rsp)
	movq	$34, 424(%rsp)
	movq	$0, 416(%rsp)
	movq	$34, 408(%rsp)
	movb	$0, 35(%rsp)
	movq	$1, 400(%rsp)
	movq	$0, 392(%rsp)
	movq	$0, 384(%rsp)
	movb	$0, 34(%rsp)
	movq	$1, 376(%rsp)
	movq	$0, 368(%rsp)
	movq	$24, 360(%rsp)
	movq	$16, 352(%rsp)
	movq	$1, 344(%rsp)
	movq	$16, 336(%rsp)
	movb	$0, 33(%rsp)
	movq	$1, 328(%rsp)
	movq	$0, 320(%rsp)
	movq	$0, 312(%rsp)
	movq	$1, 304(%rsp)
	movq	$0, 296(%rsp)
	movq	$9, 288(%rsp)
	movq	$24, 280(%rsp)
	movq	$1, 272(%rsp)
	movq	$3, 264(%rsp)
	movq	$1, 256(%rsp)
	movq	$2, 248(%rsp)
	movq	$1, 240(%rsp)
	movq	$2, 232(%rsp)
	movq	$3, 224(%rsp)
	movq	$4, 216(%rsp)
	movq	$5, 208(%rsp)
	movq	$6, 200(%rsp)
	movq	$7, 192(%rsp)
	movq	$8, 184(%rsp)
	movq	$3, 176(%rsp)
	movq	$3, 168(%rsp)
	movq	$3, 160(%rsp)
	movb	$0, 32(%rsp)
	movq	$1, 152(%rsp)
	movq	$0, 144(%rsp)
	movq	$1, 136(%rsp)
	movq	$0, 128(%rsp)
	movq	$1, 120(%rsp)
	movq	$0, 112(%rsp)
	movq	$24, 104(%rsp)
	movb	$0, 31(%rsp)
	movq	$1, 96(%rsp)
	movq	$0, 88(%rsp)
	movq	$10, 80(%rsp)
	movq	$0, 72(%rsp)
	movq	$0, _.r7(%rip)
	movl	$1, %edi
	callq	__mini_printgroup
	movb	$1, %al
	testb	%al, %al
	jne	LBB7_2
## %bb.1:                               ## %l38
	leaq	L_.r238(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_3
LBB7_2:                                 ## %l39
	leaq	L_.r242(%rip), %rdi
	movl	$1, %esi
LBB7_3:                                 ## %l40
	callq	_printf
	movb	$1, %al
	testb	%al, %al
	jne	LBB7_5
## %bb.4:                               ## %l41
	leaq	L_.r264(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_6
LBB7_5:                                 ## %l42
	leaq	L_.r268(%rip), %rdi
	movl	$1, %esi
LBB7_6:                                 ## %l43
	callq	_printf
	movb	$1, %al
	testb	%al, %al
	jne	LBB7_8
## %bb.7:                               ## %l44
	leaq	L_.r290(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_9
LBB7_8:                                 ## %l45
	leaq	L_.r294(%rip), %rdi
	movl	$1, %esi
LBB7_9:                                 ## %l46
	callq	_printf
	movl	$2, %ebx
	testq	%r15, %r15
	je	LBB7_11
## %bb.10:                              ## %l47
	leaq	L_.r316(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_12
LBB7_11:                                ## %l48
	leaq	L_.r320(%rip), %rdi
	xorl	%esi, %esi
LBB7_12:                                ## %l49
	callq	_printf
	movq	$0, _.r7(%rip)
	movl	$2, %edi
	callq	__mini_printgroup
	testq	%r15, %r15
	je	LBB7_14
## %bb.13:                              ## %l50
	leaq	L_.r346(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_15
LBB7_14:                                ## %l51
	leaq	L_.r350(%rip), %rdi
	xorl	%esi, %esi
LBB7_15:                                ## %l52
	callq	_printf
	testq	%r15, %r15
	je	LBB7_17
## %bb.16:                              ## %l53
	leaq	L_.r372(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_18
LBB7_17:                                ## %l54
	leaq	L_.r376(%rip), %rdi
	xorl	%esi, %esi
LBB7_18:                                ## %l55
	callq	_printf
	testq	%r15, %r15
	je	LBB7_20
## %bb.19:                              ## %l56
	leaq	L_.r398(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_21
LBB7_20:                                ## %l57
	leaq	L_.r402(%rip), %rdi
	xorl	%esi, %esi
LBB7_21:                                ## %l58
	callq	_printf
	movl	$3, %r12d
	movl	$42, %r13d
	movb	$1, %al
	testb	%al, %al
	jne	LBB7_23
## %bb.22:                              ## %l59
	leaq	L_.r424(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_24
LBB7_23:                                ## %l60
	leaq	L_.r428(%rip), %rdi
	movl	$1, %esi
LBB7_24:                                ## %l61
	callq	_printf
	movl	$3, %edi
	callq	__mini_printgroup
	cmpq	%r15, %r13
	jle	LBB7_26
## %bb.25:                              ## %l62
	leaq	L_.r449(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_27
LBB7_26:                                ## %l63
	leaq	L_.r453(%rip), %rdi
	xorl	%esi, %esi
LBB7_27:                                ## %l64
	callq	_printf
	cmpq	%r15, %r13
	jl	LBB7_29
## %bb.28:                              ## %l65
	leaq	L_.r472(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_30
LBB7_29:                                ## %l66
	leaq	L_.r476(%rip), %rdi
	xorl	%esi, %esi
LBB7_30:                                ## %l67
	callq	_printf
	cmpq	%r15, %r13
	jge	LBB7_32
## %bb.31:                              ## %l68
	leaq	L_.r495(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_33
LBB7_32:                                ## %l69
	leaq	L_.r499(%rip), %rdi
	movl	$1, %esi
LBB7_33:                                ## %l70
	callq	_printf
	cmpq	%r15, %r13
	jg	LBB7_35
## %bb.34:                              ## %l71
	leaq	L_.r518(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_36
LBB7_35:                                ## %l72
	leaq	L_.r522(%rip), %rdi
	movl	$1, %esi
LBB7_36:                                ## %l73
	callq	_printf
	cmpl	%r15d, %r13d
	jne	LBB7_38
## %bb.37:                              ## %l74
	leaq	L_.r541(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_39
LBB7_38:                                ## %l75
	leaq	L_.r545(%rip), %rdi
	movl	$1, %esi
LBB7_39:                                ## %l76
	callq	_printf
	cmpl	%r15d, %r13d
	je	LBB7_41
## %bb.40:                              ## %l77
	leaq	L_.r564(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_42
LBB7_41:                                ## %l78
	leaq	L_.r568(%rip), %rdi
	xorl	%esi, %esi
LBB7_42:                                ## %l79
	callq	_printf
	testq	%r15, %r15
	je	LBB7_44
## %bb.43:                              ## %l80
	leaq	L_.r584(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_45
LBB7_44:                                ## %l81
	leaq	L_.r588(%rip), %rdi
	xorl	%esi, %esi
LBB7_45:                                ## %l82
	callq	_printf
	testq	%r15, %r15
	jne	LBB7_47
## %bb.46:                              ## %l83
	leaq	L_.r607(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_48
LBB7_47:                                ## %l84
	leaq	L_.r611(%rip), %rdi
	movl	$1, %esi
LBB7_48:                                ## %l85
	callq	_printf
	movb	$1, %al
	testb	%al, %al
	jne	LBB7_50
## %bb.49:                              ## %l86
	leaq	L_.r627(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_51
LBB7_50:                                ## %l87
	leaq	L_.r631(%rip), %rdi
	movl	$1, %esi
LBB7_51:                                ## %l88
	callq	_printf
	movl	$5, %ebp
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB7_53
## %bb.52:                              ## %l89
	leaq	L_.r650(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_54
LBB7_53:                                ## %l90
	leaq	L_.r654(%rip), %rdi
	xorl	%esi, %esi
LBB7_54:                                ## %l91
	callq	_printf
	movl	$6, %r14d
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB7_56
## %bb.55:                              ## %l92
	leaq	L_.r673(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_57
LBB7_56:                                ## %l93
	leaq	L_.r677(%rip), %rdi
	xorl	%esi, %esi
LBB7_57:                                ## %l94
	callq	_printf
	movl	$4, %edi
	callq	__mini_printgroup
	cmpl	%ebp, %ebp
	jne	LBB7_59
## %bb.58:                              ## %l95
	leaq	L_.r701(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_60
LBB7_59:                                ## %l96
	leaq	L_.r705(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r709(%rip), %rdi
	movl	$5, %esi
LBB7_60:                                ## %l97
	callq	_printf
	cmpl	%r14d, %r14d
	jne	LBB7_62
## %bb.61:                              ## %l98
	leaq	L_.r734(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_63
LBB7_62:                                ## %l99
	leaq	L_.r738(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r742(%rip), %rdi
	movl	$6, %esi
LBB7_63:                                ## %l100
	callq	_printf
	cmpl	%r15d, %r15d
	jne	LBB7_65
## %bb.64:                              ## %l101
	leaq	L_.r767(%rip), %rdi
	jmp	LBB7_66
LBB7_65:                                ## %l102
	leaq	L_.r771(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r775(%rip), %rdi
LBB7_66:                                ## %l103
	movl	$1, %esi
	callq	_printf
	movq	$-6, %r14
	cmpl	%ebx, %ebx
	jne	LBB7_68
## %bb.67:                              ## %l104
	leaq	L_.r800(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_69
LBB7_68:                                ## %l105
	leaq	L_.r804(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r808(%rip), %rdi
	movl	$2, %esi
LBB7_69:                                ## %l106
	callq	_printf
	testq	%r14, %r14
	jns	LBB7_71
## %bb.70:                              ## %l107
	leaq	L_.r833(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_72
LBB7_71:                                ## %l108
	leaq	L_.r837(%rip), %rdi
	xorl	%esi, %esi
LBB7_72:                                ## %l109
	callq	_printf
	movl	$5, %edi
	callq	__mini_printgroup
	cmpl	%r13d, %r13d
	jne	LBB7_74
## %bb.73:                              ## %l110
	leaq	L_.r858(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_75
LBB7_74:                                ## %l111
	leaq	L_.r862(%rip), %rdi
	xorl	%esi, %esi
LBB7_75:                                ## %l112
	callq	_printf
	cmpl	%ebp, %ebp
	jne	LBB7_77
## %bb.76:                              ## %l113
	leaq	L_.r884(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_78
LBB7_77:                                ## %l114
	leaq	L_.r888(%rip), %rdi
	xorl	%esi, %esi
LBB7_78:                                ## %l115
	callq	_printf
	testq	%r15, %r15
	je	LBB7_80
## %bb.79:                              ## %l116
	leaq	L_.r904(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_81
LBB7_80:                                ## %l117
	leaq	L_.r908(%rip), %rdi
	xorl	%esi, %esi
LBB7_81:                                ## %l118
	callq	_printf
	testq	%r15, %r15
	jne	LBB7_83
## %bb.82:                              ## %l119
	leaq	L_.r925(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_84
LBB7_83:                                ## %l120
	leaq	L_.r929(%rip), %rdi
	movl	$1, %esi
LBB7_84:                                ## %l121
	callq	_printf
	movb	$1, %al
	testb	%al, %al
	jne	LBB7_86
## %bb.85:                              ## %l122
	leaq	L_.r945(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_87
LBB7_86:                                ## %l123
	leaq	L_.r949(%rip), %rdi
	movl	$1, %esi
LBB7_87:                                ## %l124
	callq	_printf
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB7_89
## %bb.88:                              ## %l125
	leaq	L_.r966(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_90
LBB7_89:                                ## %l126
	leaq	L_.r970(%rip), %rdi
	xorl	%esi, %esi
LBB7_90:                                ## %l127
	callq	_printf
	movb	$1, %al
	testb	%al, %al
	jne	LBB7_92
## %bb.91:                              ## %l128
	leaq	L_.r984(%rip), %rdi
	xorl	%esi, %esi
	jmp	LBB7_93
LBB7_92:                                ## %l129
	leaq	L_.r988(%rip), %rdi
	movl	$1, %esi
LBB7_93:                                ## %l130
	callq	_printf
	movl	$6, %edi
	callq	__mini_printgroup
	testq	%rbp, %rbp
	jle	LBB7_98
## %bb.94:                              ## %l131.preheader
	leaq	L_.r1022(%rip), %r14
	jmp	LBB7_95
	.p2align	4, 0x90
LBB7_97:                                ## %l136
                                        ##   in Loop: Header=BB7_95 Depth=1
	addq	%rbp, %rbx
	cmpq	%rbp, %rbx
	jge	LBB7_98
LBB7_95:                                ## %l131
                                        ## =>This Inner Loop Header: Depth=1
	cmpq	%rbp, %rbx
	jl	LBB7_97
## %bb.96:                              ## %l134
                                        ##   in Loop: Header=BB7_95 Depth=1
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	_printf
	jmp	LBB7_97
LBB7_98:                                ## %l133
	movl	$7, %r14d
	cmpq	%rbp, %rbx
	jne	LBB7_100
## %bb.99:                              ## %l137
	leaq	L_.r1062(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_101
LBB7_100:                               ## %l138
	leaq	L_.r1066(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r1070(%rip), %rdi
	movq	%rbx, %rsi
LBB7_101:                               ## %l139
	callq	_printf
	movl	$7, %edi
	callq	__mini_printgroup
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%r13, (%rax)
	movq	%r15, 8(%rax)
	cmpq	%r13, %r13
	jne	LBB7_103
## %bb.102:                             ## %l140
	leaq	L_.r1099(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_104
LBB7_103:                               ## %l141
	leaq	L_.r1103(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	movq	(%rbx), %rsi
	leaq	L_.r1107(%rip), %rdi
LBB7_104:                               ## %l142
	callq	_printf
	movl	$13, %r13d
	cmpq	$0, 8(%rbx)
	je	LBB7_106
## %bb.105:                             ## %l143
	leaq	L_.r1123(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_107
LBB7_106:                               ## %l144
	leaq	L_.r1127(%rip), %rdi
	xorl	%esi, %esi
LBB7_107:                               ## %l145
	callq	_printf
	movl	$24, %edi
	callq	_malloc
	movq	%rax, 16(%rbx)
	movq	%r13, (%rax)
	movq	16(%rbx), %rax
	movq	$0, 8(%rax)
	movq	16(%rbx), %rax
	cmpq	%r13, (%rax)
	jne	LBB7_109
## %bb.108:                             ## %l146
	leaq	L_.r1163(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_110
LBB7_109:                               ## %l147
	leaq	L_.r1167(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	movq	16(%rbx), %rax
	movq	(%rax), %rsi
	leaq	L_.r1171(%rip), %rdi
LBB7_110:                               ## %l148
	callq	_printf
	movq	16(%rbx), %rax
	cmpq	$0, 8(%rax)
	jne	LBB7_112
## %bb.111:                             ## %l149
	leaq	L_.r1194(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_113
LBB7_112:                               ## %l150
	leaq	L_.r1198(%rip), %rdi
	xorl	%esi, %esi
LBB7_113:                               ## %l151
	callq	_printf
	xorl	%eax, %eax
	testb	%al, %al
	jne	LBB7_115
## %bb.114:                             ## %l152
	leaq	L_.r1213(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_116
LBB7_115:                               ## %l153
	leaq	L_.r1217(%rip), %rdi
	xorl	%esi, %esi
LBB7_116:                               ## %l154
	callq	_printf
	movl	$8, %r13d
	cmpq	16(%rbx), %rbx
	je	LBB7_118
## %bb.117:                             ## %l155
	leaq	L_.r1234(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_119
LBB7_118:                               ## %l156
	leaq	L_.r1238(%rip), %rdi
	xorl	%esi, %esi
LBB7_119:                               ## %l157
	callq	_printf
	movq	16(%rbx), %rdi
	callq	_free
	movq	%rbx, %rdi
	callq	_free
	movl	$8, %edi
	callq	__mini_printgroup
	movq	%r14, _.r4(%rip)
	cmpq	%r14, %r14
	jne	LBB7_121
## %bb.120:                             ## %l158
	leaq	L_.r1264(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_122
LBB7_121:                               ## %l159
	leaq	L_.r1268(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	movq	_.r4(%rip), %rsi
	leaq	L_.r1272(%rip), %rdi
LBB7_122:                               ## %l160
	callq	_printf
	movl	$34, %ebx
	movq	%r15, _.r5(%rip)
	testq	%r15, %r15
	je	LBB7_124
## %bb.123:                             ## %l161
	leaq	L_.r1288(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_125
LBB7_124:                               ## %l162
	leaq	L_.r1292(%rip), %rdi
	xorl	%esi, %esi
LBB7_125:                               ## %l163
	callq	_printf
	movl	$24, %edi
	callq	_malloc
	movq	%rax, _.r6(%rip)
	movq	%rbx, (%rax)
	movq	_.r6(%rip), %rax
	movq	$0, 8(%rax)
	movq	_.r6(%rip), %rax
	cmpq	%rbx, (%rax)
	jne	LBB7_127
## %bb.126:                             ## %l164
	leaq	L_.r1324(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_128
LBB7_127:                               ## %l165
	leaq	L_.r1328(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	movq	_.r6(%rip), %rax
	movq	(%rax), %rsi
	leaq	L_.r1332(%rip), %rdi
LBB7_128:                               ## %l166
	callq	_printf
	movl	$16, %ebx
	movq	_.r6(%rip), %rax
	cmpq	$0, 8(%rax)
	jne	LBB7_130
## %bb.129:                             ## %l167
	leaq	L_.r1353(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_131
LBB7_130:                               ## %l168
	leaq	L_.r1357(%rip), %rdi
	xorl	%esi, %esi
LBB7_131:                               ## %l169
	callq	_printf
	movl	$24, %edi
	callq	_malloc
	movq	_.r6(%rip), %rcx
	movq	%rax, 16(%rcx)
	movq	_.r6(%rip), %rax
	movq	16(%rax), %rax
	movq	%rbx, (%rax)
	movq	_.r6(%rip), %rax
	movq	16(%rax), %rax
	movq	%r15, 8(%rax)
	movq	_.r6(%rip), %rax
	movq	16(%rax), %rax
	cmpq	%rbx, (%rax)
	jne	LBB7_133
## %bb.132:                             ## %l170
	leaq	L_.r1397(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_134
LBB7_133:                               ## %l171
	leaq	L_.r1401(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	movq	_.r6(%rip), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rsi
	leaq	L_.r1405(%rip), %rdi
LBB7_134:                               ## %l172
	callq	_printf
	movq	_.r6(%rip), %rax
	movq	16(%rax), %rax
	cmpq	$0, 8(%rax)
	je	LBB7_136
## %bb.135:                             ## %l173
	leaq	L_.r1427(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_137
LBB7_136:                               ## %l174
	leaq	L_.r1431(%rip), %rdi
	xorl	%esi, %esi
LBB7_137:                               ## %l175
	callq	_printf
	movq	_.r6(%rip), %rax
	movq	16(%rax), %rdi
	callq	_free
	movq	_.r6(%rip), %rdi
	callq	_free
	movl	$9, %edi
	callq	__mini_printgroup
	movl	$24, %edi
	callq	_malloc
	movq	%r15, 8(%rax)
	movl	$3, %edi
	movl	$1, %esi
	movq	%rax, %rdx
	callq	__mini_takealltypes
	leaq	L_.r1461(%rip), %rdi
	movl	$2, %esi
	callq	_printf
	movq	%r13, 8(%rsp)
	movq	%r14, (%rsp)
	movl	$1, %edi
	movl	$2, %esi
	movl	$3, %edx
	movl	$4, %ecx
	movl	$5, %r8d
	movl	$6, %r9d
	callq	__mini_tonofargs
	leaq	L_.r1481(%rip), %rdi
	movl	$3, %esi
	callq	_printf
	movl	$3, %edi
	callq	__mini_returnint
	cmpq	%r12, %rax
	jne	LBB7_139
## %bb.138:                             ## %l176
	leaq	L_.r1494(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_140
LBB7_139:                               ## %l177
	movq	%rax, %rbx
	leaq	L_.r1498(%rip), %rdi
	xorl	%esi, %esi
	callq	_printf
	leaq	L_.r1502(%rip), %rdi
	movq	%rbx, %rsi
LBB7_140:                               ## %l178
	callq	_printf
	movl	$1, %edi
	callq	__mini_returnbool
	testq	%rax, %rax
	je	LBB7_142
## %bb.141:                             ## %l179
	leaq	L_.r1517(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_143
LBB7_142:                               ## %l180
	leaq	L_.r1521(%rip), %rdi
	xorl	%esi, %esi
LBB7_143:                               ## %l181
	callq	_printf
	movl	$24, %edi
	callq	_malloc
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	__mini_returnstruct
	cmpq	%rax, %rbx
	jne	LBB7_145
## %bb.144:                             ## %l182
	leaq	L_.r1541(%rip), %rdi
	movl	$1, %esi
	jmp	LBB7_146
LBB7_145:                               ## %l183
	leaq	L_.r1545(%rip), %rdi
	xorl	%esi, %esi
LBB7_146:                               ## %l184
	callq	_printf
	movl	$10, %edi
	callq	__mini_printgroup
	xorl	%eax, %eax
	addq	$1832, %rsp                     ## imm = 0x728
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
## %bb.0:                               ## %l186
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
	.globl	_.r7                            ## @.r7
.zerofill __DATA,__common,_.r7,8,3
	.section	__TEXT,__cstring,cstring_literals
L_.r10:                                 ## @.r10
	.asciz	"%ld "

L_.r14:                                 ## @.r14
	.asciz	"%ld "

L_.r18:                                 ## @.r18
	.asciz	"%ld "

L_.r22:                                 ## @.r22
	.asciz	"%ld "

L_.r26:                                 ## @.r26
	.asciz	"%ld "

L_.r30:                                 ## @.r30
	.asciz	"%ld "

L_.r34:                                 ## @.r34
	.asciz	"%ld\n"

L_.r51:                                 ## @.r51
	.asciz	"%ld\n"

L_.r55:                                 ## @.r55
	.asciz	"%ld\n"

L_.r65:                                 ## @.r65
	.asciz	"%ld\n"

L_.r69:                                 ## @.r69
	.asciz	"%ld\n"

L_.r81:                                 ## @.r81
	.asciz	"%ld\n"

L_.r85:                                 ## @.r85
	.asciz	"%ld\n"

L_.r107:                                ## @.r107
	.asciz	"%ld\n"

L_.r111:                                ## @.r111
	.asciz	"%ld "

L_.r115:                                ## @.r115
	.asciz	"%ld\n"

L_.r131:                                ## @.r131
	.asciz	"%ld\n"

L_.r135:                                ## @.r135
	.asciz	"%ld "

L_.r139:                                ## @.r139
	.asciz	"%ld\n"

L_.r155:                                ## @.r155
	.asciz	"%ld\n"

L_.r159:                                ## @.r159
	.asciz	"%ld "

L_.r163:                                ## @.r163
	.asciz	"%ld\n"

L_.r179:                                ## @.r179
	.asciz	"%ld\n"

L_.r183:                                ## @.r183
	.asciz	"%ld "

L_.r187:                                ## @.r187
	.asciz	"%ld\n"

L_.r238:                                ## @.r238
	.asciz	"%ld\n"

L_.r242:                                ## @.r242
	.asciz	"%ld\n"

L_.r264:                                ## @.r264
	.asciz	"%ld\n"

L_.r268:                                ## @.r268
	.asciz	"%ld\n"

L_.r290:                                ## @.r290
	.asciz	"%ld\n"

L_.r294:                                ## @.r294
	.asciz	"%ld\n"

L_.r316:                                ## @.r316
	.asciz	"%ld\n"

L_.r320:                                ## @.r320
	.asciz	"%ld\n"

L_.r346:                                ## @.r346
	.asciz	"%ld\n"

L_.r350:                                ## @.r350
	.asciz	"%ld\n"

L_.r372:                                ## @.r372
	.asciz	"%ld\n"

L_.r376:                                ## @.r376
	.asciz	"%ld\n"

L_.r398:                                ## @.r398
	.asciz	"%ld\n"

L_.r402:                                ## @.r402
	.asciz	"%ld\n"

L_.r424:                                ## @.r424
	.asciz	"%ld\n"

L_.r428:                                ## @.r428
	.asciz	"%ld\n"

L_.r449:                                ## @.r449
	.asciz	"%ld\n"

L_.r453:                                ## @.r453
	.asciz	"%ld\n"

L_.r472:                                ## @.r472
	.asciz	"%ld\n"

L_.r476:                                ## @.r476
	.asciz	"%ld\n"

L_.r495:                                ## @.r495
	.asciz	"%ld\n"

L_.r499:                                ## @.r499
	.asciz	"%ld\n"

L_.r518:                                ## @.r518
	.asciz	"%ld\n"

L_.r522:                                ## @.r522
	.asciz	"%ld\n"

L_.r541:                                ## @.r541
	.asciz	"%ld\n"

L_.r545:                                ## @.r545
	.asciz	"%ld\n"

L_.r564:                                ## @.r564
	.asciz	"%ld\n"

L_.r568:                                ## @.r568
	.asciz	"%ld\n"

L_.r584:                                ## @.r584
	.asciz	"%ld\n"

L_.r588:                                ## @.r588
	.asciz	"%ld\n"

L_.r607:                                ## @.r607
	.asciz	"%ld\n"

L_.r611:                                ## @.r611
	.asciz	"%ld\n"

L_.r627:                                ## @.r627
	.asciz	"%ld\n"

L_.r631:                                ## @.r631
	.asciz	"%ld\n"

L_.r650:                                ## @.r650
	.asciz	"%ld\n"

L_.r654:                                ## @.r654
	.asciz	"%ld\n"

L_.r673:                                ## @.r673
	.asciz	"%ld\n"

L_.r677:                                ## @.r677
	.asciz	"%ld\n"

L_.r701:                                ## @.r701
	.asciz	"%ld\n"

L_.r705:                                ## @.r705
	.asciz	"%ld "

L_.r709:                                ## @.r709
	.asciz	"%ld\n"

L_.r734:                                ## @.r734
	.asciz	"%ld\n"

L_.r738:                                ## @.r738
	.asciz	"%ld "

L_.r742:                                ## @.r742
	.asciz	"%ld\n"

L_.r767:                                ## @.r767
	.asciz	"%ld\n"

L_.r771:                                ## @.r771
	.asciz	"%ld "

L_.r775:                                ## @.r775
	.asciz	"%ld\n"

L_.r800:                                ## @.r800
	.asciz	"%ld\n"

L_.r804:                                ## @.r804
	.asciz	"%ld "

L_.r808:                                ## @.r808
	.asciz	"%ld\n"

L_.r833:                                ## @.r833
	.asciz	"%ld\n"

L_.r837:                                ## @.r837
	.asciz	"%ld\n"

L_.r858:                                ## @.r858
	.asciz	"%ld\n"

L_.r862:                                ## @.r862
	.asciz	"%ld\n"

L_.r884:                                ## @.r884
	.asciz	"%ld\n"

L_.r888:                                ## @.r888
	.asciz	"%ld\n"

L_.r904:                                ## @.r904
	.asciz	"%ld\n"

L_.r908:                                ## @.r908
	.asciz	"%ld\n"

L_.r925:                                ## @.r925
	.asciz	"%ld\n"

L_.r929:                                ## @.r929
	.asciz	"%ld\n"

L_.r945:                                ## @.r945
	.asciz	"%ld\n"

L_.r949:                                ## @.r949
	.asciz	"%ld\n"

L_.r966:                                ## @.r966
	.asciz	"%ld\n"

L_.r970:                                ## @.r970
	.asciz	"%ld\n"

L_.r984:                                ## @.r984
	.asciz	"%ld\n"

L_.r988:                                ## @.r988
	.asciz	"%ld\n"

L_.r1022:                               ## @.r1022
	.asciz	"%ld\n"

L_.r1062:                               ## @.r1062
	.asciz	"%ld\n"

L_.r1066:                               ## @.r1066
	.asciz	"%ld "

L_.r1070:                               ## @.r1070
	.asciz	"%ld\n"

L_.r1099:                               ## @.r1099
	.asciz	"%ld\n"

L_.r1103:                               ## @.r1103
	.asciz	"%ld "

L_.r1107:                               ## @.r1107
	.asciz	"%ld\n"

L_.r1123:                               ## @.r1123
	.asciz	"%ld\n"

L_.r1127:                               ## @.r1127
	.asciz	"%ld\n"

L_.r1163:                               ## @.r1163
	.asciz	"%ld\n"

L_.r1167:                               ## @.r1167
	.asciz	"%ld "

L_.r1171:                               ## @.r1171
	.asciz	"%ld\n"

L_.r1194:                               ## @.r1194
	.asciz	"%ld\n"

L_.r1198:                               ## @.r1198
	.asciz	"%ld\n"

L_.r1213:                               ## @.r1213
	.asciz	"%ld\n"

L_.r1217:                               ## @.r1217
	.asciz	"%ld\n"

L_.r1234:                               ## @.r1234
	.asciz	"%ld\n"

L_.r1238:                               ## @.r1238
	.asciz	"%ld\n"

L_.r1264:                               ## @.r1264
	.asciz	"%ld\n"

L_.r1268:                               ## @.r1268
	.asciz	"%ld "

L_.r1272:                               ## @.r1272
	.asciz	"%ld\n"

L_.r1288:                               ## @.r1288
	.asciz	"%ld\n"

L_.r1292:                               ## @.r1292
	.asciz	"%ld\n"

L_.r1324:                               ## @.r1324
	.asciz	"%ld\n"

L_.r1328:                               ## @.r1328
	.asciz	"%ld "

L_.r1332:                               ## @.r1332
	.asciz	"%ld\n"

L_.r1353:                               ## @.r1353
	.asciz	"%ld\n"

L_.r1357:                               ## @.r1357
	.asciz	"%ld\n"

L_.r1397:                               ## @.r1397
	.asciz	"%ld\n"

L_.r1401:                               ## @.r1401
	.asciz	"%ld "

L_.r1405:                               ## @.r1405
	.asciz	"%ld\n"

L_.r1427:                               ## @.r1427
	.asciz	"%ld\n"

L_.r1431:                               ## @.r1431
	.asciz	"%ld\n"

L_.r1461:                               ## @.r1461
	.asciz	"%ld\n"

L_.r1481:                               ## @.r1481
	.asciz	"%ld\n"

L_.r1494:                               ## @.r1494
	.asciz	"%ld\n"

L_.r1498:                               ## @.r1498
	.asciz	"%ld "

L_.r1502:                               ## @.r1502
	.asciz	"%ld\n"

L_.r1517:                               ## @.r1517
	.asciz	"%ld\n"

L_.r1521:                               ## @.r1521
	.asciz	"%ld\n"

L_.r1541:                               ## @.r1541
	.asciz	"%ld\n"

L_.r1545:                               ## @.r1545
	.asciz	"%ld\n"

.subsections_via_symbols
