.section .text
.globl fizzbuzz
fizzbuzz:
l2:
    addi sp, sp, -64
    sd s5, 48(sp)
    sd s4, 40(sp)
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    slt t1, s1, s2
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s1, zero
    add s2, s2, zero
    bne t1, zero, l3
    j l1
l14.inter:
    add s3, s1, zero
    add s2, s4, zero
    j l3
l3:
    li t1, 0
    slli t1, t1, 48
    srai s1, t1, 48
    li a0, 3
    slli t1, s3, 32
    srai t1, t1, 32
    rem t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    add s4, s3, zero
    add s5, s2, zero
    bne t1, zero, l6
    j l8
l6:
    la t1, L.28.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    slli t1, t1, 48
    srai t1, t1, 48
    add s1, t1, zero
    add s4, s3, zero
    add s5, s2, zero
    j l8
l8:
    li a0, 5
    slli t1, s4, 32
    srai t1, t1, 32
    rem t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    add s2, s4, zero
    add s3, s5, zero
    bne t1, zero, l9
    j l11
l9:
    la t1, L.46.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    slli t1, t1, 48
    srai t1, t1, 48
    add s1, t1, zero
    add s2, s4, zero
    add s3, s5, zero
    j l11
l11:
    li a0, 0
    slli t1, s1, 48
    srai t1, t1, 48
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s2, zero
    add s4, s3, zero
    bne t1, zero, l12
    j l14
l12:
    la t1, L.61.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s2, zero
    add s4, s3, zero
    j l14
l14:
    la t1, L.66.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai s1, t1, 32
    slt t1, s1, s4
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l14.inter
    j l1
l1:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    ld s4, 40(sp)
    ld s5, 48(sp)
    addi sp, sp, 64
    ret

.globl main
main:
l16:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 100
    slli t1, t1, 32
    srai t1, t1, 32
    add a0, t1, zero
    la t1, fizzbuzz
    jalr t1
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.section .data
L.28.string:
	.asciz "Fizz"
L.46.string:
	.asciz "Buzz"
L.61.string:
	.asciz "%d"
L.66.string:
	.asciz "\n"
