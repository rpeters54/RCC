	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ## -- Begin function convertToCelsius
LCPI0_0:
	.quad	0xc040000000000000              ## double -32
LCPI0_1:
	.quad	0x3fe1c71c71c71c72              ## double 0.55555555555555558
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_convertToCelsius
	.p2align	4, 0x90
_convertToCelsius:                      ## @convertToCelsius
	.cfi_startproc
## %bb.0:                               ## %l2
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm0, (%rsp)                   ## 8-byte Spill
	movabsq	$4603179219131243634, %rax      ## imm = 0x3FE1C71C71C71C72
	movq	%rax, 16(%rsp)
	movq	$32, 8(%rsp)
	leaq	L_.r4(%rip), %rdi
	callq	_printf
	movsd	(%rsp), %xmm0                   ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	LCPI0_0(%rip), %xmm0
	mulsd	LCPI0_1(%rip), %xmm0
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ## -- Begin function convertToFahrenheit
LCPI1_0:
	.quad	0x3ffccccccccccccd              ## double 1.8
LCPI1_1:
	.quad	0x4040000000000000              ## double 32
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_convertToFahrenheit
	.p2align	4, 0x90
_convertToFahrenheit:                   ## @convertToFahrenheit
	.cfi_startproc
## %bb.0:                               ## %l4
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movsd	%xmm0, (%rsp)                   ## 8-byte Spill
	movabsq	$4610785298501913805, %rax      ## imm = 0x3FFCCCCCCCCCCCCD
	movq	%rax, 16(%rsp)
	movq	$32, 8(%rsp)
	leaq	L_.r19(%rip), %rdi
	callq	_printf
	movsd	(%rsp), %xmm0                   ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	mulsd	LCPI1_0(%rip), %xmm0
	addsd	LCPI1_1(%rip), %xmm0
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %l6
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movb	$99, 15(%rsp)
	movb	$67, 14(%rsp)
	movb	$0, 13(%rsp)
	movb	$0, 12(%rsp)
	movb	$102, 11(%rsp)
	movb	$70, 10(%rsp)
	movb	$0, 9(%rsp)
	movb	$0, 8(%rsp)
	movq	$0, 32(%rsp)
	movq	$0, 24(%rsp)
	leaq	L_.r37(%rip), %rdi
	callq	_printf
	leaq	L_.r39(%rip), %rdi
	callq	_printf
	leaq	L_.r41(%rip), %rdi
	callq	_printf
	leaq	L_.r43(%rip), %rdi
	leaq	7(%rsp), %rsi
	callq	_scanf
	leaq	L_.r45(%rip), %rdi
	callq	_printf
	leaq	L_.r47(%rip), %rdi
	leaq	16(%rsp), %rsi
	callq	_scanf
	movzbl	7(%rsp), %eax
	addb	$-67, %al
	testb	$-33, %al
	jne	LBB2_2
## %bb.1:                               ## %l7
	movsd	16(%rsp), %xmm0                 ## xmm0 = mem[0],zero
	callq	_convertToFahrenheit
	jmp	LBB2_5
LBB2_2:                                 ## %l8
	movb	$102, %al
	movb	$70, %cl
	movzbl	7(%rsp), %edx
	cmpb	%al, %dl
	sete	%al
	cmpb	%cl, %dl
	sete	%cl
	orb	%al, %cl
	je	LBB2_4
## %bb.3:                               ## %l9
	movsd	16(%rsp), %xmm0                 ## xmm0 = mem[0],zero
	callq	_convertToCelsius
	jmp	LBB2_5
LBB2_4:                                 ## %l10
	leaq	L_.r86(%rip), %rdi
	callq	_printf
	xorps	%xmm0, %xmm0
LBB2_5:                                 ## %l12
	leaq	L_.r90(%rip), %rdi
	callq	_printf
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4, 0x0                          ## @.r4
L_.r4:
	.asciz	"Turning %f Fahrenheit to Celsius\n"

	.p2align	4, 0x0                          ## @.r19
L_.r19:
	.asciz	"Turning %f Celsius to Fahrenheit\n"

	.p2align	4, 0x0                          ## @.r37
L_.r37:
	.asciz	"Select Conversion Mode:\n"

	.p2align	4, 0x0                          ## @.r39
L_.r39:
	.asciz	"(c/C for Celsius to Fahrenheit)\n"

	.p2align	4, 0x0                          ## @.r41
L_.r41:
	.asciz	"(f/F for Fahrenheit to Celsius)\n"

L_.r43:                                 ## @.r43
	.asciz	"%c\n"

L_.r45:                                 ## @.r45
	.asciz	"Gimme the Temp\n"

L_.r47:                                 ## @.r47
	.asciz	"%lf\n"

	.p2align	4, 0x0                          ## @.r86
L_.r86:
	.asciz	"Invalid Selection\n"

	.p2align	4, 0x0                          ## @.r90
L_.r90:
	.asciz	"Current Temp = %f degrees\n"

.subsections_via_symbols
