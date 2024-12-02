.section .text
.globl _mini_isqrt
_mini_isqrt:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a0, zero
    li a0, 1
    li a1, 3
    slt t0, t2, a0
    xori t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu a3, zero, t0
    add a2, t2, zero
    add t0, a0, zero
    add t1, a1, zero
    add a1, a1, zero
    bne a3, zero, l3
    j l5
l3.inter:
    add t0, a2, zero
    add a2, t0, zero
    add t0, t2, zero
    add t1, a0, zero
    j l3
l3:
    add t2, t0, t1
    li t0, 2
    add a0, t1, t0
    slt t0, a2, t2
    xori t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, a0, zero
    bne t0, zero, l3.inter
    j l5
l5:
    li t0, 2
    div t0, a1, t0
    li t1, 1
    sub t0, t0, t1
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_prime
_mini_prime:
l7:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 2
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l8
    j l9
l8:
    li t0, 0
    add t0, t0, zero
    j l6
l9:
    add a0, s1, zero
    la t1, _mini_isqrt
    jalr t1
    add t2, a0, zero
    li a0, 2
    slt t0, t2, a0
    xori t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, s1, zero
    add a2, t2, zero
    add t2, a0, zero
    bne t0, zero, l10
    j l12
l15.inter:
    add t0, a1, zero
    add t1, a2, zero
    add a1, t0, zero
    add a2, t1, zero
    add t2, t2, zero
    j l10
l10:
    div t0, a1, t2
    mul t0, t0, t2
    sub t0, a1, t0
    li t1, 0
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l13
    j l15
l13:
    li t0, 0
    add t0, t0, zero
    j l6
l15:
    li t0, 1
    add t2, t2, t0
    slt t0, a2, t2
    xori t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l15.inter
    j l12
l12:
    li t0, 1
    add t0, t0, zero
    j l6
l6:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l17:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.102.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li s1, 0
    ld t1, 16(fp)
    slt t1, t1, s1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    bne t1, zero, l18
    j l20
l23.inter:
    add s1, s1, zero
    j l18
l18:
    add a0, s1, zero
    la t1, _mini_prime
    jalr t1
    add t1, a0, zero
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    bne t1, zero, l21
    j l23
l21:
    la t1, L.116.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    j l23
l23:
    li t1, 1
    add s1, a0, t1
    ld t1, 16(fp)
    slt t1, t1, s1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l23.inter
    j l20
l20:
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l25:
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
L.102.string:
	.asciz "%ld"
L.116.string:
	.asciz "%ld\n"
