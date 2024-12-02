.section .text
.globl main
main:
l2:
    addi sp, sp, -448
    sd s3, 432(sp)
    sd s1, 424(sp)
    sd s2, 416(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    slli t1, t1, 32
    srli t1, t1, 32
    add a0, t1, zero
    la t1, srand
    jalr t1
    li t1, 0
    slli t1, t1, 32
    srai s2, t1, 32
    li s1, 100
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
    la t1, L.25.string
    add a0, t1, zero
    add a1, s3, zero
    add a2, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 400
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
    li s1, 100
    slli t1, s2, 32
    srai t1, t1, 32
    slt t1, t1, s1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    bne t1, zero, l3.inter
    j l5
l5:
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 100
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
    li t1, 400
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 4
    mul t1, t1, s1
    add t1, t1, a0
    add t1, t1, zero
    lw a2, (t1)
    la t1, L.56.string
    add a0, t1, zero
    add a1, s1, zero
    add a2, a2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 100
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
    ld s2, 416(sp)
    ld s1, 424(sp)
    ld s3, 432(sp)
    addi sp, sp, 448
    ret

.section .data
L.25.string:
	.asciz "Iteration %d: Generated Value %d\n"
L.56.string:
	.asciz "Iteration %d: Read Value %d\n"
