.section .text
.globl _mini_buildList
_mini_buildList:
l2:
    addi sp, sp, -80
    sd s3, 56(sp)
    sd s4, 48(sp)
    sd s6, 40(sp)
    sd s5, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s6, t1, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s2, t1, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s3, t1, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s4, t1, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s5, t1, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 0
    add a1, t1, zero
    la t1, L.51.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add a1, t1, zero
    la t1, L.54.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add a1, t1, zero
    la t1, L.57.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add a1, t1, zero
    la t1, L.60.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 0
    add a1, t1, zero
    la t1, L.63.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add a1, t1, zero
    la t1, L.66.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, scanf
    jalr t1
    add t0, a0, zero
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s6
    addi t0, t0, 8
    add t0, t0, zero
    sd s1, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s1
    addi t0, t0, 8
    add t0, t0, zero
    sd s2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s2
    addi t0, t0, 8
    add t0, t0, zero
    sd s3, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s3
    addi t0, t0, 8
    add t0, t0, zero
    sd s4, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s4
    addi t0, t0, 8
    add t0, t0, zero
    sd s5, (t0)
    li t2, 0
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s5
    addi t0, t0, 8
    add t0, t0, zero
    add t1, t2, zero
    sd t1, (t0)
    add a0, s6, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s5, 32(sp)
    ld s6, 40(sp)
    ld s4, 48(sp)
    ld s3, 56(sp)
    addi sp, sp, 80
    ret

.globl _mini_multiple
_mini_multiple:
l4:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s4, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    li s1, 0
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld s2, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld a1, (t1)
    li t1, 5
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, a1, zero
    add s3, s1, zero
    add a1, s2, zero
    add a0, s2, zero
    bne t1, zero, l5
    j l7
l5.inter:
    add s4, s1, zero
    add s3, a1, zero
    add a1, s2, zero
    j l5
l5:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    mul s2, a1, t1
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 8
    add t1, t1, zero
    ld s1, (t1)
    la t1, L.109.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add a1, s3, t1
    li t1, 5
    slt t1, a1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s2, zero
    bne t1, zero, l5.inter
    j l7
l7:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s4, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl _mini_add
_mini_add:
l9:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s4, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    li s1, 0
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld s2, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld a1, (t1)
    li t1, 5
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, a1, zero
    add s3, s1, zero
    add a1, s2, zero
    add a0, s2, zero
    bne t1, zero, l10
    j l12
l10.inter:
    add s4, s1, zero
    add s3, a1, zero
    add a1, s2, zero
    j l10
l10:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    add s2, a1, t1
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 8
    add t1, t1, zero
    ld s1, (t1)
    la t1, L.159.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add a1, s3, t1
    li t1, 5
    slt t1, a1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s2, zero
    bne t1, zero, l10.inter
    j l12
l12:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s4, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl _mini_recurseList
_mini_recurseList:
l14:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld a0, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, a0, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l15
    j l16
l15:
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s2
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    add t0, t0, zero
    j l13
l16:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld s1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_recurseList
    jalr t1
    add t0, a0, zero
    mul t0, s1, t0
    add t0, t0, zero
    j l13
l13:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l18:
    addi sp, sp, -80
    sd s7, 64(sp)
    sd s3, 56(sp)
    sd s4, 48(sp)
    sd s6, 40(sp)
    sd s5, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li s3, 0
    li s4, 0
    la t1, _mini_buildList
    jalr t1
    add s2, a0, zero
    add a0, s2, zero
    la t1, _mini_multiple
    jalr t1
    add s1, a0, zero
    add a0, s2, zero
    la t1, _mini_add
    jalr t1
    add t1, a0, zero
    li a0, 2
    div t1, t1, a0
    sub s1, s1, t1
    li t1, 2
    slt t1, s3, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s7, s2, zero
    add s6, s4, zero
    add s5, s1, zero
    add s2, s3, zero
    add s3, s4, zero
    add s4, s1, zero
    bne t1, zero, l19
    j l21
l19.inter:
    add t1, s7, zero
    add a0, s5, zero
    add s7, t1, zero
    add s6, s1, zero
    add s5, a0, zero
    add s2, s2, zero
    j l19
l19:
    add a0, s7, zero
    la t1, _mini_recurseList
    jalr t1
    add t1, a0, zero
    add s1, s6, t1
    li t1, 1
    add s2, s2, t1
    li t1, 2
    slt t1, s2, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s1, zero
    add s4, s5, zero
    bne t1, zero, l19.inter
    j l21
l21:
    la t1, L.259.string
    add a0, t1, zero
    add a1, s3, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0
    sub t1, s3, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s3, zero
    add s2, s4, zero
    add s1, s3, zero
    add s3, s4, zero
    bne t1, zero, l22
    j l24
l22.inter:
    add t1, s2, zero
    add a0, a1, zero
    add s2, t1, zero
    j l22
l22:
    li t1, 1
    sub a1, a0, t1
    li t1, 0
    sub t1, a1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    add s3, s2, zero
    bne t1, zero, l22.inter
    j l24
l24:
    la t1, L.294.string
    add a0, t1, zero
    add a1, s3, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.296.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s5, 32(sp)
    ld s6, 40(sp)
    ld s4, 48(sp)
    ld s3, 56(sp)
    ld s7, 64(sp)
    addi sp, sp, 80
    ret

.globl main
main:
l26:
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
L.51.string:
	.asciz "%ld"
L.54.string:
	.asciz "%ld"
L.57.string:
	.asciz "%ld"
L.60.string:
	.asciz "%ld"
L.63.string:
	.asciz "%ld"
L.66.string:
	.asciz "%ld"
L.109.string:
	.asciz "%ld\n"
L.159.string:
	.asciz "%ld\n"
L.259.string:
	.asciz "%ld\n"
L.294.string:
	.asciz "%ld\n"
L.296.string:
	.asciz "%ld\n"
