.section .text
.globl main
main:
l2:
    addi sp, sp, -48
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    la t1, L.5.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 100
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    bne t1, zero, l3
    j l5
l3.inter:
    add s1, s1, zero
    j l3
l3:
    la t1, L.15.string
    add a0, t1, zero
    add a1, s1, zero
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
    bne t1, zero, l3.inter
    j l5
l5:
    la t1, L.31.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
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
    add s2, s1, zero
    add s3, s1, zero
    bne t1, zero, l6
    j l8
l6.inter:
    add s2, s1, zero
    j l6
l6:
    la t1, L.44.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s2, 32
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
    add s3, s1, zero
    bne t1, zero, l6.inter
    j l8
l8:
    la t1, L.60.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s3, zero
    j l9
l9.inter:
    add t1, s1, zero
    add s1, t1, zero
    j l9
l9:
    la t1, L.63.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 100
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l9.inter
    j l11
l11:
    la t1, L.74.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0
    slli t1, t1, 32
    srai t1, t1, 32
    add s1, t1, zero
    j l12
l17.inter:
    add s1, a1, zero
    j l12
l12:
    la t1, L.80.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 33
    slli t1, s1, 32
    srai t1, t1, 32
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l15
    j l17
l15:
    la t1, L.89.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l14
l17:
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
    bne t1, zero, l17.inter
    j l14
l14:
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    addi sp, sp, 48
    ret

.section .data
L.5.string:
	.asciz "Testing While Loop\n"
L.15.string:
	.asciz "%d\n"
L.31.string:
	.asciz "Testing For Loop\n"
L.44.string:
	.asciz "%d\n"
L.60.string:
	.asciz "Testing Do-Loop Auto Entry\n"
L.63.string:
	.asciz "Got Here Anyway\n"
L.74.string:
	.asciz "Testing Proper Do-Loop Entry\n"
L.80.string:
	.asciz "%d\n"
L.89.string:
	.asciz "Broke\n"
