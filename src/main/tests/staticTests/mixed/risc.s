.section .text
.globl _mini_tailrecursive
_mini_tailrecursive:
l2:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    slt t1, t1, s1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l1
    j l5
l5:
    li t1, 1
    sub t1, s1, t1
    add a0, t1, zero
    la t1, _mini_tailrecursive
    jalr t1
    j l1
l1:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_add
_mini_add:
l7:
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

.globl _mini_domath
_mini_domath:
l9:
    addi sp, sp, -64
    sd s3, 48(sp)
    sd s4, 40(sp)
    sd s5, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a0, zero
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s4, t1, zero
    li t1, 8
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add s1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 16
    add t1, t1, zero
    add a0, s1, zero
    sd a0, (t1)
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s5, t1, zero
    li t1, 8
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add s1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 16
    add t1, t1, zero
    add a0, s1, zero
    sd a0, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 0
    add t1, t1, zero
    sd s3, (t1)
    li s1, 3
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 0
    add t1, t1, zero
    ld s2, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 16
    add t1, t1, zero
    ld s1, (t1)
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    sd s2, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 0
    add t1, t1, zero
    ld s2, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s5
    addi t1, t1, 16
    add t1, t1, zero
    ld s1, (t1)
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    sd s2, (t1)
    li t1, 0
    slt t1, t1, s3
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s3, zero
    add s2, s4, zero
    add s3, s5, zero
    add a0, s4, zero
    add s4, s5, zero
    bne t1, zero, l10
    j l12
l10.inter:
    add t1, s2, zero
    add a0, s3, zero
    add s1, s1, zero
    add s2, t1, zero
    add s3, a0, zero
    j l10
l10:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    add a0, a1, zero
    add a1, t1, zero
    la t1, _mini_add
    jalr t1
    add t1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li t1, 1
    sub s1, s1, t1
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s2, zero
    add s4, s3, zero
    bne t1, zero, l10.inter
    j l12
l12:
    add t1, a0, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    add t1, s4, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s5, 32(sp)
    ld s4, 40(sp)
    ld s3, 48(sp)
    addi sp, sp, 64
    ret

.globl _mini_objinstantiation
_mini_objinstantiation:
l14:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    bne t1, zero, l15
    j l13
l15.inter:
    add s1, s1, zero
    j l15
l15:
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add t1, t1, zero
    add t1, t1, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    li t1, 1
    sub s1, s1, t1
    li t1, 0
    slt t1, t1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l15.inter
    j l13
l13:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_ackermann
_mini_ackermann:
l19:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add s2, a0, zero
    li t1, 0
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l20
    j l22
l20:
    li t0, 1
    add t0, a1, t0
    add t0, t0, zero
    j l18
l22:
    li t1, 0
    sub t1, a1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l23
    j l24
l23:
    li t1, 1
    sub t1, s2, t1
    li a1, 1
    add a0, t1, zero
    add a1, a1, zero
    la t1, _mini_ackermann
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l18
l24:
    li t1, 1
    sub s1, s2, t1
    li t1, 1
    sub t1, a1, t1
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_ackermann
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    add a1, t1, zero
    la t1, _mini_ackermann
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l18
l18:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l26:
    addi sp, sp, -64
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.187.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.189.string
    add a0, t1, zero
    addi t1, fp, 24
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.191.string
    add a0, t1, zero
    addi t1, fp, 32
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.193.string
    add a0, t1, zero
    addi t1, fp, 40
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.195.string
    add a0, t1, zero
    addi t1, fp, 48
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, t1, zero
    la t1, _mini_tailrecursive
    jalr t1
    ld a1, 16(fp)
    la t1, L.198.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 24(fp)
    add a0, t1, zero
    la t1, _mini_domath
    jalr t1
    ld a1, 24(fp)
    la t1, L.202.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 32(fp)
    add a0, t1, zero
    la t1, _mini_objinstantiation
    jalr t1
    ld a1, 32(fp)
    la t1, L.206.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 40(fp)
    ld a1, 48(fp)
    add a0, t1, zero
    add a1, a1, zero
    la t1, _mini_ackermann
    jalr t1
    add a1, a0, zero
    la t1, L.209.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 64
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
_mini_globalfoo:
	.zero 8
L.187.string:
	.asciz "%ld"
L.189.string:
	.asciz "%ld"
L.191.string:
	.asciz "%ld"
L.193.string:
	.asciz "%ld"
L.195.string:
	.asciz "%ld"
L.198.string:
	.asciz "%ld\n"
L.202.string:
	.asciz "%ld\n"
L.206.string:
	.asciz "%ld\n"
L.209.string:
	.asciz "%ld\n"
