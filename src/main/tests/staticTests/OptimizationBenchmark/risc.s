.section .text
.globl _mini_constantFolding
_mini_constantFolding:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, 226
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_constantPropagation
_mini_constantPropagation:
l4:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, -25457889
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_deadCodeElimination
_mini_deadCodeElimination:
l6:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, 11
    la t1, _mini_global1
    sd t0, (t1)
    li t0, 5
    la t1, _mini_global1
    sd t0, (t1)
    li t0, 9
    la t1, _mini_global1
    sd t0, (t1)
    li t0, 38
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_sum
_mini_sum:
l8:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a0, zero
    li a0, 0
    li t0, 0
    slt t0, t0, t2
    li t1, 0
    sub t0, t0, t1
    sltu a1, zero, t0
    add t1, t2, zero
    add t0, a0, zero
    add a2, a0, zero
    bne a1, zero, l9
    j l11
l9.inter:
    add t1, t2, zero
    add t0, a0, zero
    j l9
l9:
    add a0, t0, t1
    li t0, 1
    sub t2, t1, t0
    li t0, 0
    slt t0, t0, t2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a2, a0, zero
    bne t0, zero, l9.inter
    j l11
l11:
    add a0, a2, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_doesntModifyGlobals
_mini_doesntModifyGlobals:
l13:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, 3
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_interProceduralOptimization
_mini_interProceduralOptimization:
l15:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 1
    la a0, _mini_global1
    sd t1, (a0)
    li t1, 0
    la a0, _mini_global2
    sd t1, (a0)
    li t1, 0
    la a0, _mini_global3
    sd t1, (a0)
    li t1, 100
    add a0, t1, zero
    la t1, _mini_sum
    jalr t1
    add s1, a0, zero
    la t1, _mini_global1
    ld t1, (t1)
    li a0, 1
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l16
    j l17
l16:
    li t1, 10000
    add a0, t1, zero
    la t1, _mini_sum
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l24
l17:
    la t1, _mini_global2
    ld t1, (t1)
    li a0, 2
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    bne t1, zero, l18
    j l20
l18:
    li t1, 20000
    add a0, t1, zero
    la t1, _mini_sum
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    j l20
l20:
    la t1, _mini_global3
    ld t1, (t1)
    li a0, 3
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    bne t1, zero, l21
    j l23
l21:
    li t1, 30000
    add a0, t1, zero
    la t1, _mini_sum
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    j l23
l23:
    add t0, a0, zero
    j l24
l24:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_commonSubexpressionElimination
_mini_commonSubexpressionElimination:
l26:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, -48796
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_hoisting
_mini_hoisting:
l28:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li a0, 2
    li t2, 0
    li t0, 1000000
    slt t0, t2, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, a0, zero
    add t1, t2, zero
    add a0, a0, zero
    bne t0, zero, l29
    j l31
l29.inter:
    add t0, a1, zero
    add a1, t0, zero
    add t1, t2, zero
    j l29
l29:
    li t0, 1
    add t2, t1, t0
    li t0, 1000000
    slt t0, t2, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a0, a1, zero
    bne t0, zero, l29.inter
    j l31
l31:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_doubleIf
_mini_doubleIf:
l33:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, 1
    li t2, 0
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l38
    j l39
l38:
    li t0, 50
    add t1, t0, zero
    j l39
l39:
    add a0, t1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_integerDivide
_mini_integerDivide:
l41:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, 736
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_association
_mini_association:
l43:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t0, 10
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_tailRecursionHelper
_mini_tailRecursionHelper:
l45:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add s1, a0, zero
    li t1, 0
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, a1, zero
    bne t1, zero, l44
    j l47
l47:
    li t1, 1
    sub t1, s1, t1
    add a1, a1, s1
    add a0, t1, zero
    add a1, a1, zero
    la t1, _mini_tailRecursionHelper
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    j l44
l44:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_tailRecursion
_mini_tailRecursion:
l49:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t1, a0, zero
    li a1, 0
    add a0, t1, zero
    add a1, a1, zero
    la t1, _mini_tailRecursionHelper
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_unswitching
_mini_unswitching:
l51:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li a0, 1
    li t2, 2
    li t0, 1000000
    slt t0, a0, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t2, t2, zero
    add a1, a0, zero
    add t1, a0, zero
    bne t0, zero, l52
    j l54
l57.inter:
    add t2, t2, zero
    add a1, a0, zero
    j l52
l52:
    li t0, 2
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l55
    j l56
l55:
    li t0, 1
    add t0, a1, t0
    add t2, t2, zero
    add a0, t0, zero
    j l57
l56:
    li t0, 2
    add t0, a1, t0
    add t2, t2, zero
    add a0, t0, zero
    j l57
l57:
    li t0, 1000000
    slt t0, a0, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l57.inter
    j l54
l54:
    add a0, t1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_randomCalculation
_mini_randomCalculation:
l59:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a0, zero
    li a0, 0
    li a1, 0
    slt t0, a0, t2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a2, t2, zero
    add t1, a0, zero
    add t2, a1, zero
    add a1, a1, zero
    bne t0, zero, l60
    j l62
l60.inter:
    add t0, a2, zero
    add a2, t0, zero
    add t1, t2, zero
    add t2, a0, zero
    j l60
l60:
    li t0, 19
    add a0, t2, t0
    li t0, 2
    mul t0, t1, t0
    li t1, 2
    div t0, t0, t1
    li t1, 3
    mul t0, t1, t0
    li t1, 3
    div t0, t0, t1
    li t1, 4
    mul t0, t0, t1
    li t1, 4
    div t0, t0, t1
    li t1, 1
    add t2, t0, t1
    slt t0, t2, a2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, a0, zero
    bne t0, zero, l60.inter
    j l62
l62:
    add a0, a1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_iterativeFibonacci
_mini_iterativeFibonacci:
l64:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a0, a0, zero
    li t2, -1
    li a2, 1
    li a1, 0
    slt t0, a1, a0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a4, t2, zero
    add a5, a0, zero
    add a3, a2, zero
    add t1, a1, zero
    add a1, a2, zero
    bne t0, zero, l65
    j l67
l65.inter:
    add t0, a3, zero
    add t1, a5, zero
    add a4, t0, zero
    add a5, t1, zero
    add a3, t2, zero
    add t1, a0, zero
    j l65
l65:
    add t2, a3, a4
    li t0, 1
    add a0, t1, t0
    slt t0, a0, a5
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, t2, zero
    bne t0, zero, l65.inter
    j l67
l67:
    add a0, a1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_recursiveFibonacci
_mini_recursiveFibonacci:
l69:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 0
    slt t1, t1, s2
    xori a0, t1, 1
    li t1, 1
    sub t1, s2, t1
    sltiu t1, t1, 1
    or t1, a0, t1
    slli t1, t1, 63
    srai t1, t1, 63
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s2, zero
    bne t1, zero, l68
    j l71
l71:
    li t1, 1
    sub t1, s2, t1
    add a0, t1, zero
    la t1, _mini_recursiveFibonacci
    jalr t1
    add s1, a0, zero
    li t1, 2
    sub t1, s2, t1
    add a0, t1, zero
    la t1, _mini_recursiveFibonacci
    jalr t1
    add t0, a0, zero
    add t0, s1, t0
    add a0, t0, zero
    j l68
l68:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l73:
    addi sp, sp, -48
    sd s1, 32(sp)
    sd s2, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.933.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li s2, 1
    ld t1, 16(fp)
    slt t1, s2, t1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    add s1, s2, zero
    bne t1, zero, l74
    j l76
l74.inter:
    add s1, s2, zero
    j l74
l74:
    la t1, _mini_constantFolding
    jalr t1
    add a1, a0, zero
    la t1, L.945.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_constantPropagation
    jalr t1
    add a1, a0, zero
    la t1, L.948.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_deadCodeElimination
    jalr t1
    add a1, a0, zero
    la t1, L.951.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_interProceduralOptimization
    jalr t1
    add a1, a0, zero
    la t1, L.954.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_commonSubexpressionElimination
    jalr t1
    add a1, a0, zero
    la t1, L.957.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_hoisting
    jalr t1
    add a1, a0, zero
    la t1, L.960.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_doubleIf
    jalr t1
    add a1, a0, zero
    la t1, L.963.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_integerDivide
    jalr t1
    add a1, a0, zero
    la t1, L.966.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_association
    jalr t1
    add a1, a0, zero
    la t1, L.969.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 1000
    div t1, t1, a0
    add a0, t1, zero
    la t1, _mini_tailRecursion
    jalr t1
    add a1, a0, zero
    la t1, L.976.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_unswitching
    jalr t1
    add a1, a0, zero
    la t1, L.979.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, t1, zero
    la t1, _mini_randomCalculation
    jalr t1
    add a1, a0, zero
    la t1, L.983.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 5
    div t1, t1, a0
    add a0, t1, zero
    la t1, _mini_iterativeFibonacci
    jalr t1
    add a1, a0, zero
    la t1, L.990.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 1000
    div t1, t1, a0
    add a0, t1, zero
    la t1, _mini_recursiveFibonacci
    jalr t1
    add a1, a0, zero
    la t1, L.997.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add s2, s1, t1
    ld t1, 16(fp)
    slt t1, s2, t1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    bne t1, zero, l74.inter
    j l76
l76:
    li a1, 9999
    la t1, L.1011.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 24(sp)
    ld s1, 32(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l78:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, _mini_main
    jalr t1
    add t0, a0, zero
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.section .data
_mini_global1:
	.zero 8
_mini_global2:
	.zero 8
_mini_global3:
	.zero 8
L.933.string:
	.asciz "%ld"
L.945.string:
	.asciz "%ld\n"
L.948.string:
	.asciz "%ld\n"
L.951.string:
	.asciz "%ld\n"
L.954.string:
	.asciz "%ld\n"
L.957.string:
	.asciz "%ld\n"
L.960.string:
	.asciz "%ld\n"
L.963.string:
	.asciz "%ld\n"
L.966.string:
	.asciz "%ld\n"
L.969.string:
	.asciz "%ld\n"
L.976.string:
	.asciz "%ld\n"
L.979.string:
	.asciz "%ld\n"
L.983.string:
	.asciz "%ld\n"
L.990.string:
	.asciz "%ld\n"
L.997.string:
	.asciz "%ld\n"
L.1011.string:
	.asciz "%ld\n"
