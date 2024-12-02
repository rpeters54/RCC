.section .text
.globl _mini_function
_mini_function:
l2:
    addi sp, sp, -48
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a0, zero
    li t1, 0
    slt t1, t1, s3
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3
    j l5
l3:
    li t0, 0
    add t0, t0, zero
    j l1
l5:
    li s1, 0
    mul t1, s3, s3
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    add s2, s3, zero
    add a0, s3, zero
    bne t1, zero, l6
    j l8
l6.inter:
    add t1, s2, zero
    add s1, s1, zero
    add s2, t1, zero
    j l6
l6:
    add a1, s1, s2
    la t1, L.29.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add s1, s1, t1
    mul t1, s2, s2
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s2, zero
    bne t1, zero, l6.inter
    j l8
l8:
    li t1, 1
    sub t1, a0, t1
    add a0, t1, zero
    la t1, _mini_function
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l1
l1:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l10:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.52.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, t1, zero
    la t1, _mini_function
    jalr t1
    add t1, a0, zero
    li a1, 0
    la t1, L.56.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl main
main:
l12:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, _mini_main
    jalr t1
    add t0, a0, zero
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.section .data
L.29.string:
	.asciz "%ld "
L.52.string:
	.asciz "%ld"
L.56.string:
	.asciz "%ld\n"
