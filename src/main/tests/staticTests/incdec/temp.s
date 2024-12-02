	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ## -- Begin function main
LCPI0_0:
	.quad	0x4010000000000000              ## double 4
LCPI0_1:
	.quad	0x4014000000000000              ## double 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l2
	subq	$136, %rsp
	.cfi_def_cfa_offset 144
	movb	$102, 15(%rsp)
	movabsq	$4616189618054758400, %rax      ## imm = 0x4010000000000000
	movq	%rax, 128(%rsp)
	movq	$1, 120(%rsp)
	movq	$1, 112(%rsp)
	movq	$1, 104(%rsp)
	movq	$1, 96(%rsp)
	movl	$1, 52(%rsp)
	movl	$1, 48(%rsp)
	movl	$1, 44(%rsp)
	movl	$1, 40(%rsp)
	movw	$1, 22(%rsp)
	movw	$1, 20(%rsp)
	movw	$1, 18(%rsp)
	movw	$1, 16(%rsp)
	movb	$103, 14(%rsp)
	movb	$102, 13(%rsp)
	movb	$103, 12(%rsp)
	movb	$102, 11(%rsp)
	movl	$1065353216, 36(%rsp)           ## imm = 0x3F800000
	movl	$1065353216, 32(%rsp)           ## imm = 0x3F800000
	movl	$1065353216, 28(%rsp)           ## imm = 0x3F800000
	movl	$1065353216, 24(%rsp)           ## imm = 0x3F800000
	movabsq	$4617315517961601024, %rcx      ## imm = 0x4014000000000000
	movq	%rcx, 88(%rsp)
	movq	%rax, 80(%rsp)
	movq	%rcx, 72(%rsp)
	movq	%rax, 64(%rsp)
	movq	$0, 56(%rsp)
	leaq	L_.r22(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r27(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r29(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r34(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r36(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r41(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r43(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r48(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r50(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r55(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r57(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r62(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r64(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r69(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r71(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r76(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r78(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r83(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r85(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r90(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r92(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r97(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r99(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r104(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r106(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r111(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r113(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r118(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r120(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r125(%rip), %rdi
	movl	$103, %esi
	callq	_printf
	leaq	L_.r127(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r132(%rip), %rdi
	movl	$102, %esi
	callq	_printf
	leaq	L_.r134(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r140(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r143(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r149(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r152(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r158(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r161(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r167(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r170(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r175(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r177(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r182(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r184(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r189(%rip), %rdi
	movsd	LCPI0_1(%rip), %xmm0            ## xmm0 = [5.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r191(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	leaq	L_.r196(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0            ## xmm0 = [4.0E+0,0.0E+0]
	callq	_printf
	xorl	%eax, %eax
	addq	$136, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4, 0x0                          ## @.r22
L_.r22:
	.asciz	"before post-inc: %ld\n"

	.p2align	4, 0x0                          ## @.r27
L_.r27:
	.asciz	"after post-inc: %ld\n"

	.p2align	4, 0x0                          ## @.r29
L_.r29:
	.asciz	"before post-dec: %ld\n"

	.p2align	4, 0x0                          ## @.r34
L_.r34:
	.asciz	"after post-dec: %ld\n"

	.p2align	4, 0x0                          ## @.r36
L_.r36:
	.asciz	"before pre-inc: %ld\n"

	.p2align	4, 0x0                          ## @.r41
L_.r41:
	.asciz	"after pre-inc: %ld\n"

	.p2align	4, 0x0                          ## @.r43
L_.r43:
	.asciz	"before pre-dec: %ld\n"

	.p2align	4, 0x0                          ## @.r48
L_.r48:
	.asciz	"after pre-dec: %ld\n"

	.p2align	4, 0x0                          ## @.r50
L_.r50:
	.asciz	"before post-inc: %d\n"

	.p2align	4, 0x0                          ## @.r55
L_.r55:
	.asciz	"after post-inc: %d\n"

	.p2align	4, 0x0                          ## @.r57
L_.r57:
	.asciz	"before post-dec: %d\n"

	.p2align	4, 0x0                          ## @.r62
L_.r62:
	.asciz	"after post-dec: %d\n"

	.p2align	4, 0x0                          ## @.r64
L_.r64:
	.asciz	"before pre-inc: %d\n"

	.p2align	4, 0x0                          ## @.r69
L_.r69:
	.asciz	"after pre-inc: %d\n"

	.p2align	4, 0x0                          ## @.r71
L_.r71:
	.asciz	"before pre-dec: %d\n"

	.p2align	4, 0x0                          ## @.r76
L_.r76:
	.asciz	"after pre-dec: %d\n"

	.p2align	4, 0x0                          ## @.r78
L_.r78:
	.asciz	"before post-inc: %d\n"

	.p2align	4, 0x0                          ## @.r83
L_.r83:
	.asciz	"after post-inc: %d\n"

	.p2align	4, 0x0                          ## @.r85
L_.r85:
	.asciz	"before post-dec: %d\n"

	.p2align	4, 0x0                          ## @.r90
L_.r90:
	.asciz	"after post-dec: %d\n"

	.p2align	4, 0x0                          ## @.r92
L_.r92:
	.asciz	"before pre-inc: %d\n"

	.p2align	4, 0x0                          ## @.r97
L_.r97:
	.asciz	"after pre-inc: %d\n"

	.p2align	4, 0x0                          ## @.r99
L_.r99:
	.asciz	"before pre-dec: %d\n"

	.p2align	4, 0x0                          ## @.r104
L_.r104:
	.asciz	"after pre-dec: %d\n"

	.p2align	4, 0x0                          ## @.r106
L_.r106:
	.asciz	"before post-inc: %c\n"

	.p2align	4, 0x0                          ## @.r111
L_.r111:
	.asciz	"after post-inc: %c\n"

	.p2align	4, 0x0                          ## @.r113
L_.r113:
	.asciz	"before post-dec: %c\n"

	.p2align	4, 0x0                          ## @.r118
L_.r118:
	.asciz	"after post-dec: %c\n"

	.p2align	4, 0x0                          ## @.r120
L_.r120:
	.asciz	"before pre-inc: %c\n"

	.p2align	4, 0x0                          ## @.r125
L_.r125:
	.asciz	"after pre-inc: %c\n"

	.p2align	4, 0x0                          ## @.r127
L_.r127:
	.asciz	"before pre-dec: %c\n"

	.p2align	4, 0x0                          ## @.r132
L_.r132:
	.asciz	"after pre-dec: %c\n"

	.p2align	4, 0x0                          ## @.r134
L_.r134:
	.asciz	"before post-inc: %f\n"

	.p2align	4, 0x0                          ## @.r140
L_.r140:
	.asciz	"after post-inc: %f\n"

	.p2align	4, 0x0                          ## @.r143
L_.r143:
	.asciz	"before post-dec: %f\n"

	.p2align	4, 0x0                          ## @.r149
L_.r149:
	.asciz	"after post-dec: %f\n"

	.p2align	4, 0x0                          ## @.r152
L_.r152:
	.asciz	"before pre-inc: %f\n"

	.p2align	4, 0x0                          ## @.r158
L_.r158:
	.asciz	"after pre-inc: %f\n"

	.p2align	4, 0x0                          ## @.r161
L_.r161:
	.asciz	"before pre-dec: %f\n"

	.p2align	4, 0x0                          ## @.r167
L_.r167:
	.asciz	"after pre-dec: %f\n"

	.p2align	4, 0x0                          ## @.r170
L_.r170:
	.asciz	"before post-inc: %f\n"

	.p2align	4, 0x0                          ## @.r175
L_.r175:
	.asciz	"after post-inc: %f\n"

	.p2align	4, 0x0                          ## @.r177
L_.r177:
	.asciz	"before post-dec: %f\n"

	.p2align	4, 0x0                          ## @.r182
L_.r182:
	.asciz	"after post-dec: %f\n"

	.p2align	4, 0x0                          ## @.r184
L_.r184:
	.asciz	"before pre-inc: %f\n"

	.p2align	4, 0x0                          ## @.r189
L_.r189:
	.asciz	"after pre-inc: %f\n"

	.p2align	4, 0x0                          ## @.r191
L_.r191:
	.asciz	"before pre-dec: %f\n"

	.p2align	4, 0x0                          ## @.r196
L_.r196:
	.asciz	"after pre-dec: %f\n"

.subsections_via_symbols
