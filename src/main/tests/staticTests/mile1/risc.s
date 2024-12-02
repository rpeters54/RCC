.section .text
.globl _mini_calcPower
_mini_calcPower:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add t2, a0, zero
    li a0, 1
    li t0, 0
    slt t0, t0, a1
    li t1, 0
    sub t0, t0, t1
    sltu a3, zero, t0
    add a2, t2, zero
    add t1, a1, zero
    add t0, a0, zero
    add a1, a0, zero
    bne a3, zero, l3
    j l5
l3.inter:
    add t0, a2, zero
    add a2, t0, zero
    add t1, t2, zero
    add t0, a0, zero
    j l3
l3:
    mul a0, t0, a2
    li t0, 1
    sub t2, t1, t0
    li t0, 0
    slt t0, t0, t2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, a0, zero
    bne t0, zero, l3.inter
    j l5
l5:
    add a0, a1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l7:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s1, 32(sp)
    sd s2, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li s3, 0
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    la t1, L.54.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld a1, 16(fp)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    sd a1, (t1)
    la t1, L.58.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 0
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l8
    j l10
l8:
    li t0, -1
    add t0, t0, zero
    j l6
l10:
    ld a1, 16(fp)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    sd a1, (t1)
    li a1, 0
    li t1, 1000000
    slt t1, a1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, s1, zero
    add a0, a1, zero
    add a1, s3, zero
    bne t1, zero, l11
    j l13
l11.inter:
    add t1, s2, zero
    add s2, t1, zero
    add a0, s1, zero
    j l11
l11:
    li t1, 1
    add s1, a0, t1
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, a1, zero
    add a1, t1, zero
    la t1, _mini_calcPower
    jalr t1
    add a1, a0, zero
    li t1, 1000000
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a1, a1, zero
    bne t1, zero, l11.inter
    j l13
l13:
    la t1, L.108.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add t0, t0, zero
    j l6
l6:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 24(sp)
    ld s1, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl main
main:
l15:
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
L.54.string:
	.asciz "%ld"
L.58.string:
	.asciz "%ld"
L.108.string:
	.asciz "%ld\n"
