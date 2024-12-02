.section .text
.globl test_sign
test_sign:
l2:
    addi sp, sp, -48
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a3, zero
    add t1, a2, zero
    add s1, a1, zero
    add s2, a0, zero
    li a0, 0
    slt t1, t1, a0
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3
    j l4
l3:
    la t1, L.12.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    add a0, s3, zero
    add s2, s2, zero
    j l5
l4:
    la t1, L.14.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    add a0, s3, zero
    add s2, s2, zero
    j l5
l5:
    li t1, 0
    sltu t1, a0, t1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l6
    j l7
l6:
    la t1, L.26.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    add t1, s2, zero
    j l8
l7:
    la t1, L.28.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    add t1, s2, zero
    j l8
l8:
    li a0, 0
    slli t1, t1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l9
    j l10
l9:
    la t1, L.41.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add t1, s1, zero
    j l11
l10:
    la t1, L.43.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add t1, s1, zero
    j l11
l11:
    li a0, 0
    slli t1, t1, 32
    srli t1, t1, 32
    slt t1, t1, a0
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l12
    j l13
l12:
    la t1, L.56.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l1
l13:
    la t1, L.58.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l1
l1:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l16:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 4294967295
    slli t1, t1, 32
    srai s1, t1, 32
    li t1, 4294967295
    slli t1, t1, 32
    srli s2, t1, 32
    li t1, -1
    li a3, -1
    add a0, s1, zero
    add a1, s2, zero
    add a2, t1, zero
    add a3, a3, zero
    la t1, test_sign
    jalr t1
    li a0, 3
    slli t1, s1, 32
    srai t1, t1, 32
    sub t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 3
    slli t1, s2, 32
    srli t1, t1, 32
    sub t1, t1, a0
    slli t1, t1, 32
    srli t1, t1, 32
    li a2, -4
    li a3, -4
    add a0, a1, zero
    add a1, t1, zero
    add a2, a2, zero
    add a3, a3, zero
    la t1, test_sign
    jalr t1
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.section .data
L.12.string:
	.asciz "gong >= 0\n"
L.14.string:
	.asciz "gong < 0\n"
L.26.string:
	.asciz "dugong >= 0\n"
L.28.string:
	.asciz "dugong < 0\n"
L.41.string:
	.asciz "nit >= 0\n"
L.43.string:
	.asciz "nit < 0\n"
L.56.string:
	.asciz "unit >= 0\n"
L.58.string:
	.asciz "unit < 0\n"
