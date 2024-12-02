.section .text
.globl main
main:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.19.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, getchar
    jalr t1
    add a0, a0, zero
    li t1, 97
    slli t1, t1, 24
    srai t1, t1, 24
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3
    j l4
l3:
    la t1, L.29.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l5
l4:
    la t1, L.31.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l5
l5:
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.section .data
L.19.string:
	.asciz "Hello World!\n"
L.29.string:
	.asciz "Greater Than\n"
L.31.string:
	.asciz "Less Than Or Equal To\n"
