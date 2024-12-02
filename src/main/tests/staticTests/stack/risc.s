.section .text
.globl main
main:
l2:
    addi sp, sp, -64
    sd s4, 40(sp)
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, make
    jalr t1
    add s2, a0, zero
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 100
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, s2, zero
    add s3, s1, zero
    add s2, s2, zero
    bne t1, zero, l3
    j l5
l3.inter:
    add t1, s4, zero
    add s4, t1, zero
    add s3, s1, zero
    j l3
l3:
    li t1, 4
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    sw s3, (s1)
    lw a1, (s1)
    la t1, L.32.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add t1, s1, zero
    add a0, s4, zero
    add a1, t1, zero
    la t1, push
    jalr t1
    li a0, 1
    slli t1, s3, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 100
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, s4, zero
    bne t1, zero, l3.inter
    j l5
l5:
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 100
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, s2, zero
    add s1, s1, zero
    bne t1, zero, l6
    j l8
l6.inter:
    add t1, s2, zero
    add s2, t1, zero
    add s1, s1, zero
    j l6
l6:
    add a0, s2, zero
    la t1, pop
    jalr t1
    add t1, a0, zero
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.69.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 100
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l6.inter
    j l8
l8:
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    ld s4, 40(sp)
    addi sp, sp, 64
    ret

.globl pop
pop:
l10:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 0
    add t0, t0, zero
    lw t0, (t0)
    li t1, 0
    slli t0, t0, 32
    srai t0, t0, 32
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l11
    j l13
l11:
    li t0, 0
    add t0, t0, zero
    j l9
l13:
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 4
    add t0, t0, zero
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 0
    add t0, t0, zero
    ld a0, (t0)
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 4
    add t0, t0, zero
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t2, (t0)
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 4
    add t0, t0, zero
    sd t2, (t0)
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 0
    add t0, t0, zero
    lw t0, (t0)
    li t1, 1
    slli t0, t0, 32
    srai t0, t0, 32
    sub t2, t0, t1
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 0
    add t1, t0, zero
    slli t0, t2, 32
    srai t0, t0, 32
    sw t0, (t1)
    add t0, a0, zero
    j l9
l9:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl push
push:
l15:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a1, zero
    add s1, a0, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    li t0, 0
    add t0, t0, zero
    sub t0, a0, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l14
    j l18
l18:
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd s2, (t0)
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s1
    addi t0, t0, 4
    add t0, t0, zero
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    sd t2, (t0)
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s1
    addi t0, t0, 4
    add t0, t0, zero
    sd a0, (t0)
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s1
    addi t0, t0, 0
    add t0, t0, zero
    lw t0, (t0)
    li t1, 1
    slli t0, t0, 32
    srai t0, t0, 32
    add t2, t0, t1
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s1
    addi t0, t0, 0
    add t1, t0, zero
    slli t0, t2, 32
    srai t0, t0, 32
    sw t0, (t1)
    j l14
l14:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl make
make:
l20:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 12
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    li t0, 0
    add t0, t0, zero
    sub t0, a0, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l21
    j l23
l21:
    li t0, 0
    add t0, t0, zero
    add t0, t0, zero
    j l19
l23:
    li t2, 0
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t1, t0, zero
    slli t0, t2, 32
    srai t0, t0, 32
    sw t0, (t1)
    li t2, 0
    li t0, 12
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 4
    add t0, t0, zero
    add t1, t2, zero
    sd t1, (t0)
    add t0, a0, zero
    j l19
l19:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.section .data
L.32.string:
	.asciz "Value in the stack: %d\n"
L.69.string:
	.asciz "Value in the stack: %d\n"
