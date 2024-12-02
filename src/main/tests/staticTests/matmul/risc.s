.section .text
.globl main
main:
l2:
    addi sp, sp, -432
    sd s10, 416(sp)
    sd s9, 408(sp)
    sd s7, 400(sp)
    sd s8, 392(sp)
    sd s3, 384(sp)
    sd s4, 376(sp)
    sd s6, 368(sp)
    sd s5, 360(sp)
    sd s1, 352(sp)
    sd s11, 344(sp)
    sd s2, 336(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li a2, 1
    li s1, 2
    li s2, 3
    li s3, 4
    li s4, 5
    li s5, 6
    li s6, 7
    li s7, 8
    li s8, 9
    li s9, 10
    li s10, 11
    li s11, 12
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd a2, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s1, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s2, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 1
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s3, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 1
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s4, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 1
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s5, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 2
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s6, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 2
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s7, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 2
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s8, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 3
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s9, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 3
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s10, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a1, t1, a0
    li t1, 24
    li a0, 3
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s11, (t1)
    li a2, 1
    li s1, 4
    li s2, 7
    li s3, 10
    li s4, 2
    li s5, 5
    li s6, 8
    li s7, 11
    li s8, 3
    li s9, 6
    li s10, 9
    li s11, 12
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd a2, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s1, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s2, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 3
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s3, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 1
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s4, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 1
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s5, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 1
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s6, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 1
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 3
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s7, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 2
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s8, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 2
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s9, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 2
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s10, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a1, t1, a0
    li t1, 32
    li a0, 2
    mul t1, t1, a0
    add a1, t1, a1
    li t1, 8
    li a0, 3
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    sd s11, (t1)
    li a0, 0
    li a2, 128
    addi t1, fp, 16
    add a1, t1, zero
    slli t1, a0, 32
    srai t1, t1, 32
    add a0, a1, zero
    add a1, t1, zero
    add a2, a2, zero
    la t1, memset
    jalr t1
    add t1, a0, zero
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    bne t1, zero, l3
    j l5
l8.inter:
    add s1, a1, zero
    j l3
l3:
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a2, s1, zero
    add a3, a1, zero
    add s1, s1, zero
    bne t1, zero, l6
    j l8
l11.inter:
    add a2, a2, zero
    add a3, a1, zero
    j l6
l6:
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 3
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, a1, zero
    add s1, a2, zero
    add s2, a3, zero
    add a2, a2, zero
    add a3, a3, zero
    bne t1, zero, l9
    j l11
l9.inter:
    add t1, s1, zero
    add a0, s2, zero
    add s3, a1, zero
    add s1, t1, zero
    add s2, a0, zero
    j l9
l9:
    li t1, 128
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 32
    mul t1, t1, s1
    add t1, t1, a0
    add a1, t1, zero
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a0, t1, a1
    li t1, 8
    mul t1, t1, s2
    add t1, t1, a0
    add t1, t1, zero
    ld a3, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 144
    add a0, t1, a0
    li t1, 24
    mul t1, t1, s1
    add t1, t1, a0
    add a1, t1, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add a0, t1, a1
    li t1, 8
    mul t1, t1, s3
    add t1, t1, a0
    add t1, t1, zero
    ld a2, (t1)
    li t1, 96
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 240
    add a0, t1, a0
    li t1, 32
    mul t1, t1, s3
    add t1, t1, a0
    add a1, t1, zero
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a0, t1, a1
    li t1, 8
    mul t1, t1, s2
    add t1, t1, a0
    add t1, t1, zero
    ld t1, (t1)
    mul t1, a2, t1
    add a2, a3, t1
    li t1, 128
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 32
    mul t1, t1, s1
    add t1, t1, a0
    add a1, t1, zero
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a0, t1, a1
    li t1, 8
    mul t1, t1, s2
    add t1, t1, a0
    add t1, t1, zero
    sd a2, (t1)
    li a0, 1
    slli t1, s3, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 3
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a2, s1, zero
    add a3, s2, zero
    bne t1, zero, l9.inter
    j l11
l11:
    li a0, 1
    slli t1, a3, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a2, zero
    bne t1, zero, l11.inter
    j l8
l8:
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l8.inter
    j l5
l5:
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a2, a1, zero
    bne t1, zero, l12
    j l14
l17.inter:
    add a2, a1, zero
    j l12
l12:
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    add s2, a2, zero
    add a2, a2, zero
    bne t1, zero, l15
    j l17
l15.inter:
    add t1, s2, zero
    add s1, a1, zero
    add s2, t1, zero
    j l15
l15:
    li t1, 128
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 32
    mul t1, t1, s2
    add t1, t1, a0
    add a1, t1, zero
    li t1, 32
    li a0, 0
    mul t1, t1, a0
    add a0, t1, a1
    li t1, 8
    mul t1, t1, s1
    add t1, t1, a0
    add t1, t1, zero
    ld a3, (t1)
    la t1, L.242.string
    add a0, t1, zero
    add a1, s2, zero
    add a2, s1, zero
    add a3, a3, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a0, 1
    slli t1, s1, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a2, s2, zero
    bne t1, zero, l15.inter
    j l17
l17:
    li a0, 1
    slli t1, a2, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 4
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
    ld s2, 336(sp)
    ld s11, 344(sp)
    ld s1, 352(sp)
    ld s5, 360(sp)
    ld s6, 368(sp)
    ld s4, 376(sp)
    ld s3, 384(sp)
    ld s8, 392(sp)
    ld s7, 400(sp)
    ld s9, 408(sp)
    ld s10, 416(sp)
    addi sp, sp, 432
    ret

.section .data
L.242.string:
	.asciz "Value at (row: %d, col: %d) = %d\n"
