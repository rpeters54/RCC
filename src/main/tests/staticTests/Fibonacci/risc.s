.section .text
.globl _mini_computeFib
_mini_computeFib:
l2:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 0
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3
    j l4
l3:
    li t0, 0
    add t0, t0, zero
    j l1
l4:
    li t1, 2
    slt t1, t1, s2
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l5
    j l6
l5:
    li t0, 1
    add t0, t0, zero
    j l1
l6:
    li t1, 1
    sub t1, s2, t1
    add a0, t1, zero
    la t1, _mini_computeFib
    jalr t1
    add s1, a0, zero
    li t1, 2
    sub t1, s2, t1
    add a0, t1, zero
    la t1, _mini_computeFib
    jalr t1
    add t0, a0, zero
    add t0, s1, t0
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

.globl _mini_main
_mini_main:
l8:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.34.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, t1, zero
    la t1, _mini_computeFib
    jalr t1
    add a1, a0, zero
    la t1, L.36.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl main
main:
l10:
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
L.34.string:
	.asciz "%ld"
L.36.string:
	.asciz "%ld\n"
