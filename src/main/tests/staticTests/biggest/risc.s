.section .text
.globl _mini_getIntList
_mini_getIntList:
l2:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s1, 32(sp)
    sd s2, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s3, t1, zero
    la t1, L.13.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li s1, -1
    sub t1, t1, s1
    sltiu t1, t1, 1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    bne t1, zero, l3
    j l4
l3:
    ld t2, 16(fp)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s3
    addi t0, t0, 0
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s3
    addi t0, t0, 8
    add t0, t0, zero
    add t1, t2, zero
    sd t1, (t0)
    add t0, s3, zero
    j l1
l4:
    ld s2, 16(fp)
    li t1, 16
    li s1, 0
    mul t1, t1, s1
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    sd s2, (t1)
    la t1, _mini_getIntList
    jalr t1
    add t2, a0, zero
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s3
    addi t0, t0, 8
    add t0, t0, zero
    sd t2, (t0)
    add t0, s3, zero
    j l1
l1:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 24(sp)
    ld s1, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl _mini_biggest
_mini_biggest:
l6:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add t2, a0, zero
    slt t0, a1, t2
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l5
    j l8
l8:
    add t1, a1, zero
    j l5
l5:
    add a0, t1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_biggestInList
_mini_biggestInList:
l10:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld s1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld a0, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, a0, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, a1, zero
    add a1, s1, zero
    add a0, s1, zero
    bne t1, zero, l11
    j l13
l11.inter:
    add s2, a1, zero
    add a1, s1, zero
    j l11
l11:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    add a0, a1, zero
    add a1, t1, zero
    la t1, _mini_biggest
    jalr t1
    add s1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld a1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld a0, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, a0, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    bne t1, zero, l11.inter
    j l13
l13:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l15:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, _mini_getIntList
    jalr t1
    add t1, a0, zero
    add a0, t1, zero
    la t1, _mini_biggestInList
    jalr t1
    add a1, a0, zero
    la t1, L.85.string
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
L.13.string:
	.asciz "%ld"
L.85.string:
	.asciz "%ld\n"
