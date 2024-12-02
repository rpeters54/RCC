.section .text
.globl main
main:
l2:
    addi sp, sp, -64
    sd s4, 48(sp)
    sd s3, 40(sp)
    fsd fs0, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 8
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s4, t1, zero
    li t1, 0
    slli t1, t1, 32
    srli t1, t1, 32
    add a0, t1, zero
    la t1, srand
    jalr t1
    la t1, rand
    jalr t1
    add s3, a0, zero
    add s2, s4, zero
    li t1, 8
    li s1, 0
    mul t1, t1, s1
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    sw s3, (t1)
    la t1, rand
    jalr t1
    add s1, a0, zero
    add a1, s4, zero
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 4
    add t1, t1, zero
    sw s1, (t1)
    add t1, s4, zero
    lw a1, (t1)
    la t1, L.21.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add t1, s4, zero
    ld a1, (t1)
    la t1, L.25.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add t1, s4, zero
    flw fs0, (t1)
    fcvt.d.s fs0, fs0
    la t1, L.29.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add t1, s4, zero
    fld fs0, (t1)
    la t1, L.34.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a1, s4, zero
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.38.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a1, s4, zero
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 4
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.43.string
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
    ld s2, 16(sp)
    ld s1, 24(sp)
    fld fs0, 32(sp)
    ld s3, 40(sp)
    ld s4, 48(sp)
    addi sp, sp, 64
    ret

.section .data
L.21.string:
	.asciz "%d\n"
L.25.string:
	.asciz "%ld\n"
L.29.string:
	.asciz "%f\n"
L.34.string:
	.asciz "%f\n"
L.38.string:
	.asciz "%d\n"
L.43.string:
	.asciz "%d\n"
