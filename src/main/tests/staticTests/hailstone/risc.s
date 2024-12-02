.section .text
.globl _mini_mod
_mini_mod:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a1, zero
    add t2, a0, zero
    div t1, t2, t0
    mul t0, t1, t0
    sub t0, t2, t0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_hailstone
_mini_hailstone:
l4:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    bne t1, zero, l5
    j l3
l6.inter:
    add s1, a1, zero
    j l5
l5:
    la t1, L.19.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 2
    add a0, s1, zero
    add a1, t1, zero
    la t1, _mini_mod
    jalr t1
    add t1, a0, zero
    li a0, 1
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l8
    j l9
l8:
    li t1, 3
    mul t1, t1, s1
    li a0, 1
    add t1, t1, a0
    add a1, t1, zero
    j l10
l9:
    li t1, 2
    div t1, s1, t1
    add a1, t1, zero
    j l10
l10:
    li t1, 1
    slt t1, t1, a1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l11
    j l6
l11:
    la t1, L.46.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l3
l6:
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l6.inter
    j l3
l3:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l15:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.57.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, t1, zero
    la t1, _mini_hailstone
    jalr t1
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
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
L.19.string:
	.asciz "%ld "
L.46.string:
	.asciz "%ld\n"
L.57.string:
	.asciz "%ld"
