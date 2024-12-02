.section .text
.globl _mini_length
_mini_length:
l2:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3
    j l5
l3:
    li t0, 0
    add t0, t0, zero
    j l1
l5:
    li s1, 1
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_length
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

.globl _mini_addToFront
_mini_addToFront:
l7:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a1, zero
    add s2, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l8
    j l10
l8:
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd s1, (t0)
    li t2, 0
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    add t1, t2, zero
    sd t1, (t0)
    add t0, a0, zero
    j l6
l10:
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t0, a0, zero
    add t2, t0, zero
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 0
    add t0, t0, zero
    sd s1, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    sd s2, (t0)
    add t0, t2, zero
    j l6
l6:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_deleteFirst
_mini_deleteFirst:
l12:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l13
    j l15
l13:
    li t0, 0
    add t0, t0, zero
    add t0, t0, zero
    j l11
l15:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld s1, (t1)
    add t1, s2, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    add t0, s1, zero
    j l11
l11:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l17:
    addi sp, sp, -64
    sd s4, 40(sp)
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.77.string
    la a1, _mini_intList
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li s2, 0
    li t1, 0
    add s1, t1, zero
    la t1, _mini_intList
    ld t1, (t1)
    li a0, 0
    slt t1, a0, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    add s4, s2, zero
    add s3, s1, zero
    add s2, s2, zero
    bne t1, zero, l18
    j l20
l18.inter:
    add t1, s4, zero
    add a0, s1, zero
    add s4, t1, zero
    j l18
l18:
    la t1, _mini_intList
    ld t1, (t1)
    add a0, a0, zero
    add a1, t1, zero
    la t1, _mini_addToFront
    jalr t1
    add s1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.95.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_intList
    ld t1, (t1)
    li a0, 1
    sub t1, t1, a0
    la a0, _mini_intList
    sd t1, (a0)
    la t1, _mini_intList
    ld t1, (t1)
    li a0, 0
    slt t1, a0, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s1, zero
    add s2, s4, zero
    bne t1, zero, l18.inter
    j l20
l20:
    add a0, s3, zero
    la t1, _mini_length
    jalr t1
    add a1, a0, zero
    la t1, L.114.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s3, zero
    la t1, _mini_length
    jalr t1
    add t1, a0, zero
    li a0, 0
    slt t1, a0, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s3, zero
    add s1, s2, zero
    add s4, s2, zero
    bne t1, zero, l21
    j l23
l21.inter:
    add s3, s1, zero
    add s1, s2, zero
    j l21
l21:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    add s2, s1, t1
    add a0, s3, zero
    la t1, _mini_length
    jalr t1
    add a1, a0, zero
    la t1, L.129.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s3, zero
    la t1, _mini_deleteFirst
    jalr t1
    add s1, a0, zero
    add a0, s1, zero
    la t1, _mini_length
    jalr t1
    add t1, a0, zero
    li a0, 0
    slt t1, a0, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, s2, zero
    bne t1, zero, l21.inter
    j l23
l23:
    la t1, L.144.string
    add a0, t1, zero
    add a1, s4, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    ld s4, 40(sp)
    addi sp, sp, 64
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
_mini_intList:
	.zero 8
L.77.string:
	.asciz "%ld"
L.95.string:
	.asciz "%ld "
L.114.string:
	.asciz "%ld "
L.129.string:
	.asciz "%ld "
L.144.string:
	.asciz "%ld\n"
