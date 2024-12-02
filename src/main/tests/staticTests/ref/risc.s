.section .text
.globl swap
swap:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a1, zero
    add t1, a0, zero
    lw t2, (t1)
    lw a0, (t0)
    sw a0, (t1)
    sw t2, (t0)
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl main
main:
l4:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 9
    slli t1, t1, 32
    srai t1, t1, 32
    sw t1, 16(fp)
    li t1, 3
    slli t1, t1, 32
    srai t1, t1, 32
    sw t1, 20(fp)
    addi t1, fp, 16
    add a0, t1, zero
    addi t1, fp, 20
    add a1, t1, zero
    la t1, swap
    jalr t1
    lw a1, 16(fp)
    la t1, L.15.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.section .data
L.15.string:
	.asciz "%d\n"
