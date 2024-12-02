.section .text
.globl main
main:
l2:
    addi sp, sp, -80
    fsd fs0, 68(sp)
    sd s1, 60(sp)
    fsd fs1, 52(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    slli t1, t1, 32
    srli t1, t1, 32
    add a0, t1, zero
    la t1, srand
    jalr t1
    la t1, L.15.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 1000
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
    la t1, L.28.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, rand
    jalr t1
    add t1, a0, zero
    fcvt.d.wu fs0, t1
    fsd fs0, 16(fp)
    la t1, rand
    jalr t1
    add t1, a0, zero
    fcvt.d.wu fs0, t1
    fsd fs0, 24(fp)
    addi t1, fp, 16
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.34.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    addi t1, fp, 24
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.38.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fld fs0, 16(fp)
    fld fs1, 24(fp)
    fadd.d fs0, fs0, fs1
    fsd fs0, 32(fp)
    addi t1, fp, 32
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.45.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fld fs0, 16(fp)
    fld fs1, 24(fp)
    fsub.d fs0, fs0, fs1
    fsd fs0, 32(fp)
    addi t1, fp, 32
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.52.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fld fs0, 16(fp)
    fld fs1, 24(fp)
    fmul.d fs0, fs0, fs1
    fsd fs0, 32(fp)
    addi t1, fp, 32
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.59.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fld fs0, 16(fp)
    fld fs1, 24(fp)
    fdiv.d fs0, fs0, fs1
    fsd fs0, 32(fp)
    addi t1, fp, 32
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.66.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai s1, t1, 32
    li a0, 1000
    slli t1, s1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l3.inter
    j l5
l5:
    la t1, L.84.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 1000
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
    la t1, L.97.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, rand
    jalr t1
    add t1, a0, zero
    fcvt.s.wu fs0, t1
    fsw fs0, 40(fp)
    la t1, rand
    jalr t1
    add t1, a0, zero
    fcvt.s.wu fs0, t1
    fsw fs0, 44(fp)
    addi t1, fp, 40
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.103.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    addi t1, fp, 44
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.107.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    flw fs0, 40(fp)
    flw fs1, 44(fp)
    fadd.s fs0, fs0, fs1
    fsw fs0, 48(fp)
    addi t1, fp, 48
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.114.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    flw fs0, 40(fp)
    flw fs1, 44(fp)
    fsub.s fs0, fs0, fs1
    fsw fs0, 48(fp)
    addi t1, fp, 48
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.121.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    flw fs0, 40(fp)
    flw fs1, 44(fp)
    fmul.s fs0, fs0, fs1
    fsw fs0, 48(fp)
    addi t1, fp, 48
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.128.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    flw fs0, 40(fp)
    flw fs1, 44(fp)
    fdiv.s fs0, fs0, fs1
    fsw fs0, 48(fp)
    addi t1, fp, 48
    add t1, t1, zero
    lw a1, (t1)
    la t1, L.135.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 1000
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
    fld fs1, 52(sp)
    ld s1, 60(sp)
    fld fs0, 68(sp)
    addi sp, sp, 80
    ret

.section .data
L.15.string:
	.asciz "Trying Doubles:\n"
L.28.string:
	.asciz "Iteration %d: \n"
L.34.string:
	.asciz "da is %ld\n"
L.38.string:
	.asciz "db is %ld\n"
L.45.string:
	.asciz "Add: %ld\n"
L.52.string:
	.asciz "Sub: %ld\n"
L.59.string:
	.asciz "Multiply: %ld\n"
L.66.string:
	.asciz "Divide: %ld\n"
L.84.string:
	.asciz "Trying Floats:\n"
L.97.string:
	.asciz "Iteration %d: \n"
L.103.string:
	.asciz "fa is %d\n"
L.107.string:
	.asciz "fb is %d\n"
L.114.string:
	.asciz "Add: %d\n"
L.121.string:
	.asciz "Sub: %d\n"
L.128.string:
	.asciz "Multiply: %d\n"
L.135.string:
	.asciz "Divide: %d\n"
