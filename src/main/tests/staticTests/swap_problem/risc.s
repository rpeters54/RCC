.section .text
.globl print
print:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    la t1, L.6.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl println
println:
l4:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    la t1, L.10.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_read
_mini_read:
l6:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    sd t1, 16(fp)
    la t1, L.16.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t0, a0, zero
    ld t0, 16(fp)
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl main
main:
l8:
    addi sp, sp, -80
    sd s3, 56(sp)
    sd s4, 48(sp)
    sd s6, 40(sp)
    sd s5, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, _mini_read
    jalr t1
    add s3, a0, zero
    la t1, _mini_read
    jalr t1
    add s4, a0, zero
    la t1, _mini_read
    jalr t1
    add s1, a0, zero
    li s2, 0
    slt t1, s2, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s6, s1, zero
    add s5, s3, zero
    add s1, s4, zero
    add a0, s2, zero
    add s3, s3, zero
    add s4, s4, zero
    bne t1, zero, l9
    j l11
l9.inter:
    add t1, s6, zero
    add a0, s1, zero
    add s1, s5, zero
    add s6, t1, zero
    add s5, a0, zero
    add s1, s1, zero
    add a0, s2, zero
    j l9
l9:
    li t1, 1
    add s2, a0, t1
    slt t1, s2, s6
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s1, zero
    add s4, s5, zero
    bne t1, zero, l9.inter
    j l11
l11:
    add a0, s3, zero
    la t1, print
    jalr t1
    add a0, s4, zero
    la t1, println
    jalr t1
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s5, 32(sp)
    ld s6, 40(sp)
    ld s4, 48(sp)
    ld s3, 56(sp)
    addi sp, sp, 80
    ret

.section .data
L.6.string:
	.asciz "%ld "
L.10.string:
	.asciz "%ld\n"
L.16.string:
	.asciz "%ld"
