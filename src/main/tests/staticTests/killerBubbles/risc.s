.section .text
.globl _mini_compare
_mini_compare:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add t2, a0, zero
    li t0, 24
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 0
    add t0, t0, zero
    ld t2, (t0)
    li t0, 24
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    sub t0, t2, t0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_deathSort
_mini_deathSort:
l4:
    addi sp, sp, -64
    sd s5, 48(sp)
    sd s4, 40(sp)
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    li t1, 1
    li a0, 1
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, a1, zero
    bne t1, zero, l5
    j l3
l10.inter:
    add s2, s5, zero
    j l5
l5:
    li a1, 0
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    sub t1, t1, s2
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s2, zero
    add s1, a1, zero
    add s4, s2, zero
    add a0, a1, zero
    add s5, s2, zero
    bne t1, zero, l8
    j l10
l13.inter:
    add s3, a1, zero
    add s1, s1, zero
    add s4, s2, zero
    j l8
l8:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, s3, zero
    add a1, t1, zero
    la t1, _mini_compare
    jalr t1
    add t1, a0, zero
    li a0, 0
    slt t1, a0, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a1, s3, zero
    add s1, s1, zero
    add s2, s4, zero
    bne t1, zero, l11
    j l13
l11:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    sd a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li t1, 1
    add a1, s3, zero
    add s1, t1, zero
    add s2, s4, zero
    j l13
l13:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    sub t1, t1, s2
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    add s5, s2, zero
    bne t1, zero, l13.inter
    j l10
l10:
    li t1, 1
    sub t1, a0, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l10.inter
    j l3
l3:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    ld s4, 40(sp)
    ld s5, 48(sp)
    addi sp, sp, 64
    ret

.globl _mini_printEVILList
_mini_printEVILList:
l15:
    addi sp, sp, -48
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.112.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add t1, s2, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    sub t1, s1, s2
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s1, zero
    add s2, s2, zero
    bne t1, zero, l16
    j l14
l16.inter:
    add t1, s2, zero
    add s3, s1, zero
    add s2, t1, zero
    j l16
l16:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.124.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    ld s1, (t1)
    add t1, s3, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    sub t1, s1, s2
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l16.inter
    j l14
l14:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l20:
    addi sp, sp, -80
    sd s5, 64(sp)
    sd s4, 56(sp)
    sd s3, 48(sp)
    sd s6, 40(sp)
    sd s1, 32(sp)
    sd s2, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 666
    la a0, _mini_swapped
    sd t1, (a0)
    la t1, L.156.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 0
    slt t1, a0, t1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l21
    j l23
l21:
    li a1, -1
    la t1, L.165.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, -1
    add t0, t0, zero
    j l19
l23:
    ld t1, 16(fp)
    li a0, 1000
    mul t1, t1, a0
    sd t1, 16(fp)
    ld s1, 16(fp)
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s2, t1, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    sd s2, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    sd s2, (t1)
    li t1, 1
    sub s1, s1, t1
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, s2, zero
    add s5, s1, zero
    add s3, s2, zero
    add s6, s2, zero
    bne t1, zero, l24
    j l26
l24.inter:
    add t1, s3, zero
    add s4, s1, zero
    add s5, s2, zero
    add s3, t1, zero
    j l24
l24:
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    sd s5, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    sd s4, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    sd s3, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 16
    add t1, t1, zero
    sd s1, (t1)
    li t1, 1
    sub s2, s5, t1
    li t1, 0
    slt t1, t1, s2
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s6, s3, zero
    bne t1, zero, l24.inter
    j l26
l26:
    add a0, s6, zero
    la t1, _mini_deathSort
    jalr t1
    add a0, s6, zero
    la t1, _mini_printEVILList
    jalr t1
    li t0, 0
    add t0, t0, zero
    j l19
l19:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 24(sp)
    ld s1, 32(sp)
    ld s6, 40(sp)
    ld s3, 48(sp)
    ld s4, 56(sp)
    ld s5, 64(sp)
    addi sp, sp, 80
    ret

.globl main
main:
l28:
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
_mini_swapped:
	.zero 8
L.112.string:
	.asciz "%ld\n"
L.124.string:
	.asciz "%ld\n"
L.156.string:
	.asciz "%ld"
L.165.string:
	.asciz "%ld\n"
