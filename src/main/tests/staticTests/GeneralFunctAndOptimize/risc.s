.section .text
.globl _mini_multBy4xTimes
_mini_multBy4xTimes:
l2:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a1, zero
    add s2, a0, zero
    li t1, 0
    slt t1, t1, s1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3
    j l5
l3:
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s2
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    add t0, t0, zero
    j l1
l5:
    li a1, 4
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    mul a1, a1, t1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    sd a1, (t1)
    li t1, 1
    sub t1, s1, t1
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_multBy4xTimes
    jalr t1
    add t0, a0, zero
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s2
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    add t0, t0, zero
    j l1
l1:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_divideBy8
_mini_divideBy8:
l7:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a0, a0, zero
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    div t2, t0, t1
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd t2, (t0)
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    div t2, t0, t1
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd t2, (t0)
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    div t2, t0, t1
    li t0, 8
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd t2, (t0)
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l9:
    addi sp, sp, -112
    sd s9, 88(sp)
    sd s7, 80(sp)
    sd s8, 72(sp)
    sd s3, 64(sp)
    sd s4, 56(sp)
    sd s6, 48(sp)
    sd s5, 40(sp)
    sd s1, 32(sp)
    sd s2, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 8
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    li t1, 1000000
    la a0, _mini_end
    sd t1, (a0)
    la t1, L.75.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.77.string
    la a1, _mini_interval
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld a1, 16(fp)
    la t1, L.79.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_interval
    ld a1, (t1)
    la t1, L.82.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 0
    li s2, 0
    li s3, 0
    li t1, 50
    slt t1, a1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, s1, zero
    add s5, a1, zero
    add s9, s3, zero
    add s1, s2, zero
    add s2, s3, zero
    bne t1, zero, l10
    j l12
l15.inter:
    add s4, s8, zero
    add s5, a1, zero
    add s9, s3, zero
    j l10
l10:
    li a1, 0
    la t1, _mini_end
    ld t1, (t1)
    slt t1, t1, a1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, a1, zero
    add s6, s4, zero
    add s7, s5, zero
    add s1, a1, zero
    add s8, s4, zero
    add s2, s5, zero
    add s3, s9, zero
    bne t1, zero, l13
    j l15
l18.inter:
    add a0, a1, zero
    add s6, s4, zero
    add s7, s5, zero
    j l13
l13:
    li s2, 39916800
    li t1, 1
    add s1, a0, t1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li t1, 2
    add a0, s6, zero
    add a1, t1, zero
    la t1, _mini_multBy4xTimes
    jalr t1
    add t1, a0, zero
    add a0, s6, zero
    la t1, _mini_divideBy8
    jalr t1
    la t1, _mini_interval
    ld t1, (t1)
    li a0, 1
    sub a1, t1, a0
    li t1, 0
    slt t1, t1, a1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu a0, zero, t1
    add t1, a1, zero
    add a1, s1, zero
    add s4, s6, zero
    add s5, s7, zero
    add s3, s2, zero
    bne a0, zero, l16
    j l18
l16:
    li t1, 1
    add t1, t1, zero
    add a1, s1, zero
    add s4, s6, zero
    add s5, s7, zero
    add s3, s2, zero
    j l18
l18:
    add a1, a1, t1
    la t1, _mini_end
    ld t1, (t1)
    slt t1, t1, a1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    add s8, s4, zero
    add s2, s5, zero
    add s3, s3, zero
    bne t1, zero, l18.inter
    j l15
l15:
    li t1, 1
    add a1, s2, t1
    li t1, 50
    slt t1, a1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    add s2, s3, zero
    bne t1, zero, l15.inter
    j l12
l12:
    la t1, L.232.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.234.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 24(sp)
    ld s1, 32(sp)
    ld s5, 40(sp)
    ld s6, 48(sp)
    ld s4, 56(sp)
    ld s3, 64(sp)
    ld s8, 72(sp)
    ld s7, 80(sp)
    ld s9, 88(sp)
    addi sp, sp, 112
    ret

.globl main
main:
l20:
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
_mini_interval:
	.zero 8
_mini_end:
	.zero 8
L.75.string:
	.asciz "%ld"
L.77.string:
	.asciz "%ld"
L.79.string:
	.asciz "%ld\n"
L.82.string:
	.asciz "%ld\n"
L.232.string:
	.asciz "%ld\n"
L.234.string:
	.asciz "%ld\n"
