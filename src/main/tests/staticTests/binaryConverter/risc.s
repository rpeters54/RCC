.section .text
.globl _mini_wait
_mini_wait:
l5:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_power
_mini_power:
l7:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a1, zero
    add a0, a0, zero
    li a1, 1
    li t0, 0
    slt t0, t0, t2
    li t1, 0
    sub t0, t0, t1
    sltu t1, zero, t0
    add t2, t2, zero
    add a2, a0, zero
    add t0, a1, zero
    add a1, a1, zero
    bne t1, zero, l8
    j l10
l8.inter:
    add t0, a2, zero
    add t2, t2, zero
    add a2, t0, zero
    add t0, a0, zero
    j l8
l8:
    mul a0, t0, a2
    li t0, 1
    sub t2, t2, t0
    li t0, 0
    slt t0, t0, t2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, a0, zero
    bne t0, zero, l8.inter
    j l10
l10:
    add a0, a1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_recursiveDecimalSum
_mini_recursiveDecimalSum:
l12:
    addi sp, sp, -64
    sd s5, 48(sp)
    sd s4, 40(sp)
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s5, a2, zero
    add s3, a1, zero
    add s4, a0, zero
    li t1, 0
    slt t1, t1, s4
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s3, zero
    bne t1, zero, l13
    j l11
l13:
    li a1, 2
    li t1, 10
    div t1, s4, t1
    li a0, 10
    mul t1, t1, a0
    sub t1, s4, t1
    li a0, 1
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s4, zero
    add s1, s3, zero
    add s2, s5, zero
    bne t1, zero, l15
    j l17
l15:
    add a0, a1, zero
    add a1, s5, zero
    la t1, _mini_power
    jalr t1
    add t1, a0, zero
    add t1, s3, t1
    add a0, s4, zero
    add s1, t1, zero
    add s2, s5, zero
    j l17
l17:
    li t1, 10
    div a0, a0, t1
    li t1, 1
    add t1, s2, t1
    add a0, a0, zero
    add a1, s1, zero
    add a2, t1, zero
    la t1, _mini_recursiveDecimalSum
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    j l11
l11:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    ld s4, 40(sp)
    ld s5, 48(sp)
    addi sp, sp, 64
    ret

.globl _mini_convertToDecimal
_mini_convertToDecimal:
l20:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t1, a0, zero
    li a2, 0
    li a1, 0
    add a0, t1, zero
    add a1, a1, zero
    add a2, a2, zero
    la t1, _mini_recursiveDecimalSum
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l22:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.123.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, t1, zero
    la t1, _mini_convertToDecimal
    jalr t1
    add t1, a0, zero
    sd t1, 16(fp)
    ld t1, 16(fp)
    ld a0, 16(fp)
    mul s1, t1, a0
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    bne t1, zero, l23
    j l25
l23.inter:
    add s1, s1, zero
    j l23
l23:
    add a0, s1, zero
    la t1, _mini_wait
    jalr t1
    add t1, a0, zero
    li t1, 1
    sub s1, s1, t1
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l23.inter
    j l25
l25:
    ld a1, 16(fp)
    la t1, L.149.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l27:
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
L.123.string:
	.asciz "%ld"
L.149.string:
	.asciz "%ld\n"
