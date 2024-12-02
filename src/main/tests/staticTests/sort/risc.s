.section .text
.globl main
main:
l2:
    addi sp, sp, -1056
    sd s3, 1032(sp)
    sd s1, 1024(sp)
    sd s2, 1016(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    slli t1, t1, 32
    srai s2, t1, 32
    li s1, 250
    slli t1, s2, 32
    srai t1, t1, 32
    slt t1, t1, s1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    add s3, s2, zero
    bne t1, zero, l3
    j l5
l3.inter:
    add s3, s2, zero
    j l3
l3:
    la t1, rand
    jalr t1
    add s2, a0, zero
    li t1, 1000
    li s1, 0
    mul t1, t1, s1
    addi s1, fp, 16
    add s1, t1, s1
    li t1, 4
    mul t1, t1, s3
    add t1, t1, s1
    add t1, t1, zero
    sw s2, (t1)
    li s1, 1
    slli t1, s3, 32
    srai t1, t1, 32
    add t1, t1, s1
    slli t1, t1, 32
    srai s2, t1, 32
    li s1, 250
    slli t1, s2, 32
    srai t1, t1, 32
    slt t1, t1, s1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    bne t1, zero, l3.inter
    j l5
l5:
    addi t1, fp, 16
    add a0, t1, zero
    li t1, 250
    slli t1, t1, 32
    srai t1, t1, 32
    add a0, a0, zero
    add a1, t1, zero
    la t1, selection_sort
    jalr t1
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 250
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    bne t1, zero, l6
    j l8
l6.inter:
    add s1, a1, zero
    j l6
l6:
    li t1, 1000
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 4
    mul t1, t1, s1
    add t1, t1, a0
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.49.string
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
    srai a1, t1, 32
    li a0, 250
    slli t1, a1, 32
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
    ld s2, 1016(sp)
    ld s1, 1024(sp)
    ld s3, 1032(sp)
    addi sp, sp, 1056
    ret

.globl selection_sort
selection_sort:
l10:
    addi sp, sp, -112
    sd s8, 88(sp)
    sd s7, 80(sp)
    sd s10, 72(sp)
    sd s5, 64(sp)
    sd s4, 56(sp)
    sd s3, 48(sp)
    sd s9, 40(sp)
    sd s6, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a1, zero
    add s2, a0, zero
    li a0, 1
    slli t1, s3, 32
    srai t1, t1, 32
    slt t1, a0, t1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l9
    j l13
l13:
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    slt t1, a1, s3
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, s2, zero
    add s8, s3, zero
    add s5, s1, zero
    add s9, a1, zero
    add s7, s2, zero
    add s6, s3, zero
    add s10, s1, zero
    bne t1, zero, l14
    j l16
l19.inter:
    add s4, a1, zero
    add s8, s2, zero
    add s5, s3, zero
    add s9, s1, zero
    j l14
l14:
    li t1, 4
    mul t1, t1, s9
    add t1, t1, s4
    add t1, t1, zero
    lw a0, (t1)
    li t1, 4
    mul t1, t1, s5
    add t1, t1, s4
    add t1, t1, zero
    lw t1, (t1)
    slt t1, a0, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a1, s4, zero
    add s2, s8, zero
    add s3, s9, zero
    add s1, s9, zero
    bne t1, zero, l19
    j l18
l18:
    add a1, s4, zero
    add s2, s8, zero
    add s3, s5, zero
    add s1, s9, zero
    j l19
l19:
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai s1, t1, 32
    slt t1, s1, s2
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s7, a1, zero
    add s6, s2, zero
    add s10, s3, zero
    bne t1, zero, l19.inter
    j l16
l16:
    li t1, 0
    li a0, 4
    mul t1, a0, t1
    add t1, t1, s7
    add t1, t1, zero
    lw s1, (t1)
    li t1, 4
    mul t1, t1, s10
    add t1, t1, s7
    add t1, t1, zero
    lw a1, (t1)
    li t1, 0
    li a0, 4
    mul t1, a0, t1
    add t1, t1, s7
    add t1, t1, zero
    sw a1, (t1)
    li t1, 4
    mul t1, t1, s10
    add t1, t1, s7
    add t1, t1, zero
    sw s1, (t1)
    li t1, 1
    li a0, 4
    mul t1, a0, t1
    add t1, t1, s7
    add a1, t1, zero
    li a0, 1
    slli t1, s6, 32
    srai t1, t1, 32
    sub t1, t1, a0
    slli t1, t1, 32
    srai t1, t1, 32
    add a0, a1, zero
    add a1, t1, zero
    la t1, selection_sort
    jalr t1
    j l9
l9:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s6, 32(sp)
    ld s9, 40(sp)
    ld s3, 48(sp)
    ld s4, 56(sp)
    ld s5, 64(sp)
    ld s10, 72(sp)
    ld s7, 80(sp)
    ld s8, 88(sp)
    addi sp, sp, 112
    ret

.section .data
L.49.string:
	.asciz "%d\n"
