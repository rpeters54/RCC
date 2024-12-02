.section .text
.globl main
main:
l2:
    addi sp, sp, -96
    sd s1, 72(sp)
    sd s2, 64(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li s1, 1
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s2, t1, zero
    li s1, 0
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s1, t1, zero
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 4
    add t1, t1, zero
    sd s2, (t1)
    li s1, 2
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s2, t1, zero
    li s1, 1
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s1, t1, zero
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 4
    add t1, t1, zero
    sd s2, (t1)
    li s1, 3
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s2, t1, zero
    li s1, 2
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s1, t1, zero
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 4
    add t1, t1, zero
    sd s2, (t1)
    li s1, 0
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s2, t1, zero
    li s1, 3
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s1
    add t1, t1, a0
    add s1, t1, zero
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 4
    add t1, t1, zero
    sd s2, (t1)
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 4
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, s1, zero
    bne t1, zero, l3
    j l5
l3.inter:
    add s2, s1, zero
    j l3
l3:
    la t1, L.49.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, getchar
    jalr t1
    add s1, a0, zero
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s2
    add t1, t1, a0
    add a1, t1, zero
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add a0, t1, zero
    slli t1, s1, 24
    srai t1, t1, 24
    sb t1, (a0)
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, s2
    add t1, t1, a0
    add a1, t1, zero
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    lb a1, (t1)
    la t1, L.55.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s2, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 4
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3.inter
    j l5
l5:
    li a1, 0
    li t1, 48
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 12
    mul t1, t1, a1
    add t1, t1, a0
    add a1, t1, zero
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 10
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, a1, zero
    add s1, s1, zero
    bne t1, zero, l6
    j l8
l6.inter:
    add s2, a1, zero
    add s1, s1, zero
    j l6
l6:
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    lb a1, (t1)
    la t1, L.91.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 12
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 4
    add t1, t1, zero
    ld a1, (t1)
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 10
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
    ld s2, 64(sp)
    ld s1, 72(sp)
    addi sp, sp, 96
    ret

.section .data
L.49.string:
	.asciz "Gimme a char\n"
L.55.string:
	.asciz "Got Character: %c\n"
L.91.string:
	.asciz "%c\n"
