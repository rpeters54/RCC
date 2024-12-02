.section .text
.globl _mini_sum
_mini_sum:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a1, zero
    add t1, a0, zero
    add t0, t1, t0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_fact
_mini_fact:
l4:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 1
    sub t1, s1, t1
    sltiu a0, t1, 1
    li t1, 0
    sub t1, s1, t1
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
    bne t1, zero, l5
    j l7
l5:
    li t0, 1
    add t0, t0, zero
    j l3
l7:
    li t1, 1
    slt t1, t1, s1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l8
    j l10
l8:
    li t1, -1
    mul t1, t1, s1
    add a0, t1, zero
    la t1, _mini_fact
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l3
l10:
    li t1, 1
    sub t1, s1, t1
    add a0, t1, zero
    la t1, _mini_fact
    jalr t1
    add t0, a0, zero
    mul t0, s1, t0
    add t0, t0, zero
    j l3
l3:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l12:
    addi sp, sp, -48
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    sd t1, 32(fp)
    ld t1, 32(fp)
    li a0, -1
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l13
    j l15
l13.inter:
    j l13
l13:
    la t1, L.63.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.65.string
    add a0, t1, zero
    addi t1, fp, 24
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, t1, zero
    la t1, _mini_fact
    jalr t1
    add t1, a0, zero
    sd t1, 16(fp)
    ld t1, 24(fp)
    add a0, t1, zero
    la t1, _mini_fact
    jalr t1
    add t1, a0, zero
    sd t1, 24(fp)
    ld t1, 16(fp)
    ld a1, 24(fp)
    add a0, t1, zero
    add a1, a1, zero
    la t1, _mini_sum
    jalr t1
    add a1, a0, zero
    la t1, L.71.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.76.string
    add a0, t1, zero
    addi t1, fp, 32
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 32(fp)
    li a0, -1
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l13.inter
    j l15
l15:
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l17:
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
L.63.string:
	.asciz "%ld"
L.65.string:
	.asciz "%ld"
L.71.string:
	.asciz "%ld\n"
L.76.string:
	.asciz "%ld"
