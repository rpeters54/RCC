.section .text
.globl _mini_getRands
_mini_getRands:
l2:
    addi sp, sp, -96
    sd s7, 72(sp)
    sd s8, 64(sp)
    sd s3, 56(sp)
    sd s4, 48(sp)
    sd s6, 40(sp)
    sd s5, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a1, zero
    add s3, a0, zero
    li t1, 0
    add s6, t1, zero
    mul s4, s3, s3
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s5, t1, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    sd s4, (t1)
    li s1, 0
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 8
    add t1, t1, zero
    add a0, s1, zero
    sd a0, (t1)
    li t1, 1
    sub s1, s2, t1
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s7, s3, zero
    add s8, s1, zero
    add a0, s4, zero
    add s4, s5, zero
    add s5, s6, zero
    bne t1, zero, l3
    j l5
l3.inter:
    add t1, s7, zero
    add s7, t1, zero
    add s8, s1, zero
    add a0, s2, zero
    add s4, s3, zero
    j l3
l3:
    mul t1, a0, a0
    div a0, t1, s7
    li t1, 2
    div t1, s7, t1
    mul t1, a0, t1
    li a0, 1
    add s1, t1, a0
    li t1, 1000000000
    div t1, s1, t1
    li a0, 1000000000
    mul t1, t1, a0
    sub s2, s1, t1
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s3, t1, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    sd s2, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 8
    add t1, t1, zero
    sd s4, (t1)
    li t1, 1
    sub s1, s8, t1
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s5, s3, zero
    bne t1, zero, l3.inter
    j l5
l5:
    add a0, s5, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s5, 32(sp)
    ld s6, 40(sp)
    ld s4, 48(sp)
    ld s3, 56(sp)
    ld s8, 64(sp)
    ld s7, 72(sp)
    addi sp, sp, 96
    ret

.globl _mini_calcMean
_mini_calcMean:
l7:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a0, zero
    li a2, 0
    li a0, 0
    li a1, 0
    li t0, 0
    add t0, t0, zero
    sub t0, t2, t0
    sltu t0, zero, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    add a5, a1, zero
    add a6, t2, zero
    add a7, a2, zero
    add a4, a0, zero
    add a3, a1, zero
    add a2, a2, zero
    bne t0, zero, l8
    j l10
l8.inter:
    add t0, a5, zero
    add t1, t2, zero
    add a5, t0, zero
    add a6, a0, zero
    add a7, a1, zero
    j l8
l8:
    li t0, 1
    add t2, t1, t0
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a6
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    add a1, a7, t0
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a6
    addi t0, t0, 8
    add t0, t0, zero
    ld a0, (t0)
    li t0, 0
    add t0, t0, zero
    sub t0, a0, t0
    sltu t0, zero, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a4, t2, zero
    add a3, a5, zero
    add a2, a1, zero
    bne t0, zero, l8.inter
    j l10
l10:
    li t0, 0
    sub t0, a4, t0
    sltu t0, zero, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a3, zero
    bne t0, zero, l11
    j l13
l11:
    div t0, a2, a4
    add t1, t0, zero
    j l13
l13:
    add a0, t1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_approxSqrt
_mini_approxSqrt:
l15:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a0, zero
    li a0, 1
    li t0, 0
    slt t0, t0, t2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a2, t2, zero
    add a1, a0, zero
    add t1, a0, zero
    bne t0, zero, l16
    j l18
l16.inter:
    add t0, a2, zero
    add a2, t0, zero
    add a1, t2, zero
    j l16
l16:
    mul t1, a1, a1
    li t0, 1
    add t2, a1, t0
    slt t0, t1, a2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a1, zero
    bne t0, zero, l16.inter
    j l18
l18:
    add a0, t1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_approxSqrtAll
_mini_approxSqrtAll:
l20:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    bne t1, zero, l21
    j l19
l21.inter:
    add s1, s1, zero
    j l21
l21:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_approxSqrt
    jalr t1
    add a1, a0, zero
    la t1, L.196.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld s1, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l21.inter
    j l19
l19:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_range
_mini_range:
l25:
    addi sp, sp, -96
    sd s9, 80(sp)
    sd s7, 72(sp)
    sd s8, 64(sp)
    sd s3, 56(sp)
    sd s4, 48(sp)
    sd s6, 40(sp)
    sd s5, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li s2, 0
    li s3, 0
    li a1, 1
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s8, s2, zero
    add s4, s3, zero
    add s7, a1, zero
    add s5, s1, zero
    add s6, s2, zero
    add s9, s3, zero
    bne t1, zero, l26
    j l28
l37.inter:
    add s8, a1, zero
    add s4, s2, zero
    add s7, s3, zero
    add s5, s1, zero
    j l26
l26:
    li t1, 0
    sub t1, s7, t1
    sltu t1, zero, t1
    bne t1, zero, l29
    j l30
l29:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li a0, 0
    add a1, a1, zero
    add s2, t1, zero
    add s3, a0, zero
    add s1, s5, zero
    j l37
l30:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    slt t1, t1, s8
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l31
    j l32
l31:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    add a1, t1, zero
    add a0, s4, zero
    add t1, s7, zero
    add s1, s5, zero
    j l36
l32:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    slt t1, s4, t1
    li a0, 0
    sub t1, t1, a0
    sltu s1, zero, t1
    add a1, s8, zero
    add a0, s4, zero
    add t1, s7, zero
    add s2, s5, zero
    bne s1, zero, l33
    j l35
l33:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    add a1, s8, zero
    add a0, t1, zero
    add t1, s7, zero
    add s2, s5, zero
    j l35
l35:
    add a1, a1, zero
    add a0, a0, zero
    add t1, t1, zero
    add s1, s2, zero
    j l36
l36:
    add a1, a1, zero
    add s2, a0, zero
    add s3, t1, zero
    add s1, s1, zero
    j l37
l37:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld s1, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s6, a1, zero
    add s9, s2, zero
    bne t1, zero, l37.inter
    j l28
l28:
    la t1, L.291.string
    add a0, t1, zero
    add a1, s6, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.293.string
    add a0, t1, zero
    add a1, s9, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s5, 32(sp)
    ld s6, 40(sp)
    ld s4, 48(sp)
    ld s3, 56(sp)
    ld s8, 64(sp)
    ld s7, 72(sp)
    ld s9, 80(sp)
    addi sp, sp, 96
    ret

.globl _mini_main
_mini_main:
l39:
    addi sp, sp, -48
    sd s1, 32(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.303.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.305.string
    add a0, t1, zero
    addi t1, fp, 24
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    ld a1, 24(fp)
    add a0, t1, zero
    add a1, a1, zero
    la t1, _mini_getRands
    jalr t1
    add s1, a0, zero
    add a0, s1, zero
    la t1, _mini_calcMean
    jalr t1
    add a1, a0, zero
    la t1, L.311.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    la t1, _mini_range
    jalr t1
    add a0, s1, zero
    la t1, _mini_approxSqrtAll
    jalr t1
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 32(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l41:
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
L.196.string:
	.asciz "%ld\n"
L.291.string:
	.asciz "%ld\n"
L.293.string:
	.asciz "%ld\n"
L.303.string:
	.asciz "%ld"
L.305.string:
	.asciz "%ld"
L.311.string:
	.asciz "%ld\n"
