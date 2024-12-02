.section .text
.globl fib
fib:
l2:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li a0, 1
    slli t1, s2, 32
    srai t1, t1, 32
    slt t1, a0, t1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3
    j l4
l3:
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add t0, t0, zero
    j l1
l4:
    li a0, 2
    slli t1, s2, 32
    srai t1, t1, 32
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l5
    j l6
l5:
    li t0, 1
    slli t0, t0, 32
    srai t0, t0, 32
    add t0, t0, zero
    j l1
l6:
    li a0, 1
    slli t1, s2, 32
    srai t1, t1, 32
    sub t1, t1, a0
    slli t1, t1, 32
    srai t1, t1, 32
    add a0, t1, zero
    la t1, fib
    jalr t1
    add s1, a0, zero
    li a0, 2
    slli t1, s2, 32
    srai t1, t1, 32
    sub t1, t1, a0
    slli t1, t1, 32
    srai t1, t1, 32
    add a0, t1, zero
    la t1, fib
    jalr t1
    add t0, a0, zero
    add t0, s1, t0
    slli t0, t0, 32
    srai t0, t0, 32
    add t0, t0, zero
    j l1
l1:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l8:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.43.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, getchar
    jalr t1
    add a0, a0, zero
    li t1, 48
    slli t1, t1, 24
    srai t1, t1, 24
    sub t1, a0, t1
    slli t1, t1, 32
    srai s1, t1, 32
    add a0, s1, zero
    la t1, fib
    jalr t1
    add a2, a0, zero
    la t1, L.51.string
    add a0, t1, zero
    add a1, s1, zero
    add a2, a2, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.section .data
L.43.string:
	.asciz "Please Provide a Number:\n"
L.51.string:
	.asciz "Fib(%d) = %d\n"
