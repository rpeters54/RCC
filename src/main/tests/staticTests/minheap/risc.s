.section .text
.globl compareDoubles
compareDoubles:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t1, a1, zero
    add t0, a0, zero
    add t0, t0, zero
    fld ft0, (t0)
    add t0, t1, zero
    fld ft1, (t0)
    fsub.d ft0, ft0, ft1
    li t0, 0
    fcvt.d.lu ft1, t0
    flt.d t0, ft0, ft1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l3
    j l4
l3:
    li t0, -1
    slli t0, t0, 32
    srai t0, t0, 32
    add t0, t0, zero
    j l1
l4:
    li t0, 1
    slli t0, t0, 32
    srai t0, t0, 32
    add t0, t0, zero
    j l1
l1:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl heapify
heapify:
l6:
    addi sp, sp, -112
    sd s8, 100(sp)
    sd s7, 92(sp)
    sd s10, 84(sp)
    sd s5, 76(sp)
    sd s4, 68(sp)
    sd s3, 60(sp)
    sd s9, 52(sp)
    sd s6, 44(sp)
    sd s1, 36(sp)
    sd s11, 28(sp)
    sd s2, 20(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s8, a1, zero
    add s4, a0, zero
    li a1, 2
    slli a0, s8, 32
    srai a0, a0, 32
    mul a0, a0, a1
    li a1, 1
    add a0, a0, a1
    slli a0, a0, 32
    srai s2, a0, 32
    li a1, 2
    slli a0, s8, 32
    srai a0, a0, 32
    mul a0, a0, a1
    li a1, 2
    add a0, a0, a1
    slli a0, a0, 32
    srai s3, a0, 32
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s4
    addi a0, a0, 16
    add a0, a0, zero
    lw a0, (a0)
    slt a0, s2, a0
    xori s1, a0, 1
    li a1, 0
    slli a0, s2, 32
    srai a0, a0, 32
    slt a0, a0, a1
    or a0, s1, a0
    slli a0, a0, 63
    srai a0, a0, 63
    li a1, 0
    sub a0, a0, a1
    sltu a0, zero, a0
    li a1, 0
    sub a0, a0, a1
    sltu a0, zero, a0
    add t5, s8, zero
    sd t5, 16(fp)
    add s6, s2, zero
    add s7, s4, zero
    add s5, s8, zero
    add s11, s3, zero
    bne a0, zero, l7
    j l9
l7:
    li a0, -1
    slli a0, a0, 32
    srai a0, a0, 32
    add t5, s8, zero
    sd t5, 16(fp)
    add s6, a0, zero
    add s7, s4, zero
    add s5, s8, zero
    add s11, s3, zero
    j l9
l9:
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s7
    addi a0, a0, 16
    add a0, a0, zero
    lw a0, (a0)
    slt a0, s11, a0
    xori s1, a0, 1
    li a1, 0
    slli a0, s11, 32
    srai a0, a0, 32
    slt a0, a0, a1
    or a0, s1, a0
    slli a0, a0, 63
    srai a0, a0, 63
    li a1, 0
    sub a0, a0, a1
    sltu a0, zero, a0
    li a1, 0
    sub a0, a0, a1
    sltu a0, zero, a0
    ld t5, 16(fp)
    add s9, t5, zero
    add s2, s6, zero
    add s10, s7, zero
    add s4, s5, zero
    add s11, s11, zero
    bne a0, zero, l10
    j l12
l10:
    li a0, -1
    slli a0, a0, 32
    srai a0, a0, 32
    ld t5, 16(fp)
    add s9, t5, zero
    add s2, s6, zero
    add s10, s7, zero
    add s4, s5, zero
    add s11, a0, zero
    j l12
l12:
    li a1, -1
    slli a0, s2, 32
    srai a0, a0, 32
    sub a0, a0, a1
    sltu a0, zero, a0
    li a1, 0
    sub a0, a0, a1
    sltu a0, zero, a0
    add s5, s9, zero
    add s6, s10, zero
    add s7, s4, zero
    add s8, s11, zero
    bne a0, zero, l13
    j l18
l13:
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s10
    addi a0, a0, 8
    add a0, a0, zero
    ld s1, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s10
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s2
    add a0, a0, a1
    add a0, a0, zero
    ld a0, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s10
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s4
    add a0, a0, a1
    add a0, a0, zero
    ld a0, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s10
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s2
    add a0, a0, a1
    add a0, a0, zero
    ld a2, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s10
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s4
    add a0, a0, a1
    add a0, a0, zero
    ld a1, (a0)
    add a0, a2, zero
    add a1, a1, zero
    add a2, s1, zero
    jalr s1
    add a0, a0, zero
    li a1, 0
    slli a0, a0, 32
    srai a0, a0, 32
    slt a0, a0, a1
    li a1, 0
    sub a0, a0, a1
    sltu a0, zero, a0
    add a1, s2, zero
    add s2, s10, zero
    add s1, s4, zero
    add s3, s11, zero
    bne a0, zero, l17
    j l16
l16:
    add a1, s9, zero
    add s2, s10, zero
    add s1, s4, zero
    add s3, s11, zero
    j l17
l17:
    add s5, a1, zero
    add s6, s2, zero
    add s7, s1, zero
    add s8, s3, zero
    j l18
l18:
    li a1, -1
    slli a0, s8, 32
    srai a0, a0, 32
    sub a0, a0, a1
    sltu a0, zero, a0
    li a1, 0
    sub a0, a0, a1
    sltu a0, zero, a0
    add s3, s5, zero
    add s2, s6, zero
    add s4, s7, zero
    bne a0, zero, l19
    j l24
l19:
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s6
    addi a0, a0, 8
    add a0, a0, zero
    ld s1, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s6
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s8
    add a0, a0, a1
    add a0, a0, zero
    ld a0, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s6
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s5
    add a0, a0, a1
    add a0, a0, zero
    ld a0, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s6
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s8
    add a0, a0, a1
    add a0, a0, zero
    ld a2, (a0)
    li a0, 24
    li a1, 0
    mul a0, a0, a1
    add a0, a0, s6
    addi a0, a0, 0
    add a0, a0, zero
    ld a1, (a0)
    li a0, 8
    mul a0, a0, s5
    add a0, a0, a1
    add a0, a0, zero
    ld a1, (a0)
    add a0, a2, zero
    add a1, a1, zero
    add a2, s1, zero
    jalr s1
    add t1, a0, zero
    li a0, 0
    slli t1, t1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu a0, zero, t1
    add t1, s8, zero
    add a1, s6, zero
    add s1, s7, zero
    bne a0, zero, l23
    j l22
l22:
    add t1, s5, zero
    add a1, s6, zero
    add s1, s7, zero
    j l23
l23:
    add s3, t1, zero
    add s2, a1, zero
    add s4, s1, zero
    j l24
l24:
    sub t1, s3, s4
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l25
    j l5
l25:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld a0, (t1)
    li t1, 8
    mul t1, t1, s3
    add t1, t1, a0
    add t1, t1, zero
    ld s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld a0, (t1)
    li t1, 8
    mul t1, t1, s4
    add t1, t1, a0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld a0, (t1)
    li t1, 8
    mul t1, t1, s3
    add t1, t1, a0
    add t1, t1, zero
    sd a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld a0, (t1)
    li t1, 8
    mul t1, t1, s4
    add t1, t1, a0
    add t1, t1, zero
    sd s1, (t1)
    add a0, s2, zero
    add a1, s3, zero
    la t1, heapify
    jalr t1
    j l5
l5:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 20(sp)
    ld s11, 28(sp)
    ld s1, 36(sp)
    ld s6, 44(sp)
    ld s9, 52(sp)
    ld s3, 60(sp)
    ld s4, 68(sp)
    ld s5, 76(sp)
    ld s10, 84(sp)
    ld s7, 92(sp)
    ld s8, 100(sp)
    addi sp, sp, 112
    ret

.globl make
make:
l29:
    addi sp, sp, -80
    sd s5, 56(sp)
    sd s4, 48(sp)
    sd s3, 40(sp)
    sd s6, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a2, zero
    add s2, a1, zero
    add s4, a0, zero
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s6, t1, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s6, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l30
    j l32
l30:
    la t1, L.251.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add t0, t0, zero
    add t0, t0, zero
    j l28
l32:
    li s1, 0
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 16
    add a0, t1, zero
    slli t1, s1, 32
    srai t1, t1, 32
    sw t1, (a0)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 20
    add t1, t1, zero
    sw s4, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 8
    add t1, t1, zero
    sd s3, (t1)
    li a0, 8
    slli t1, s4, 32
    srai t1, t1, 32
    mul t1, t1, a0
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 0
    add t1, t1, zero
    add a0, s1, zero
    sd a0, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s6
    addi t1, t1, 0
    add t1, t1, zero
    ld a0, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, a0, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l33
    j l35
l33:
    la t1, L.279.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add t0, t0, zero
    add t0, t0, zero
    j l28
l35:
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    slt t1, a1, s4
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s5, s2, zero
    add s3, s6, zero
    add s2, a1, zero
    add s1, s4, zero
    add s4, s6, zero
    add s6, a1, zero
    bne t1, zero, l36
    j l38
l36.inter:
    add t1, s5, zero
    add a0, s3, zero
    add s1, s1, zero
    add s5, t1, zero
    add s3, a0, zero
    add s2, a1, zero
    add s1, s1, zero
    j l36
l36:
    li t1, 8
    mul t1, t1, s2
    add t1, t1, s5
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld a0, (t1)
    li t1, 8
    mul t1, t1, s2
    add t1, t1, a0
    add t1, t1, zero
    sd a1, (t1)
    li a0, 1
    slli t1, s2, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    slt t1, a1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, s3, zero
    add s6, a1, zero
    bne t1, zero, l36.inter
    j l38
l38:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 16
    add t1, t1, zero
    sw s6, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s4
    addi t1, t1, 16
    add t1, t1, zero
    lw t1, (t1)
    li a0, 2
    slli t1, t1, 32
    srai t1, t1, 32
    sub t1, t1, a0
    li a0, 2
    div t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 0
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s4, zero
    add s2, a1, zero
    add a0, s4, zero
    bne t1, zero, l39
    j l41
l39.inter:
    add t1, s1, zero
    add s1, t1, zero
    add s2, a1, zero
    j l39
l39:
    add a0, s1, zero
    add a1, s2, zero
    la t1, heapify
    jalr t1
    li a0, 1
    slli t1, s2, 32
    srai t1, t1, 32
    sub t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 0
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    bne t1, zero, l39.inter
    j l41
l41:
    add t0, a0, zero
    j l28
l28:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s6, 32(sp)
    ld s3, 40(sp)
    ld s4, 48(sp)
    ld s5, 56(sp)
    addi sp, sp, 80
    ret

.globl popFirst
popFirst:
l43:
    addi sp, sp, -48
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    lw t1, (t1)
    li a0, 0
    slli t1, t1, 32
    srai t1, t1, 32
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l44
    j l46
l44:
    li t0, 0
    add t0, t0, zero
    j l42
l46:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 0
    li a0, 8
    mul t1, a0, t1
    add t1, t1, a1
    add t1, t1, zero
    ld s2, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    lw t1, (t1)
    li a0, 1
    slli t1, t1, 32
    srai t1, t1, 32
    sub t1, t1, a0
    li a0, 8
    mul t1, a0, t1
    add t1, t1, a1
    add t1, t1, zero
    ld s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    li t1, 0
    li a0, 8
    mul t1, a0, t1
    add t1, t1, a1
    add t1, t1, zero
    sd s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    lw t1, (t1)
    li a0, 1
    slli t1, t1, 32
    srai t1, t1, 32
    sub a1, t1, a0
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add a0, t1, zero
    slli t1, a1, 32
    srai t1, t1, 32
    sw t1, (a0)
    li t1, 0
    slli t1, t1, 32
    srai t1, t1, 32
    add a0, s3, zero
    add a1, t1, zero
    la t1, heapify
    jalr t1
    add t0, s2, zero
    j l42
l42:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l48:
    addi sp, sp, -320
    fsd fs0, 304(sp)
    sd s1, 296(sp)
    fsd fs1, 288(sp)
    fsd fs8, 280(sp)
    fsd fs7, 272(sp)
    fsd fs5, 264(sp)
    fsd fs6, 256(sp)
    fsd fs2, 248(sp)
    fsd fs4, 240(sp)
    fsd fs3, 232(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0x3fe0000000000000
    sd t1, 88(fp)
    fld fs0, 88(fp)
    li t1, 0x400999999999999a
    sd t1, 96(fp)
    fld fs1, 96(fp)
    li t1, 0x4010cccccccccccd
    sd t1, 104(fp)
    fld fs2, 104(fp)
    li t1, 0x3ff8000000000000
    sd t1, 112(fp)
    fld fs3, 112(fp)
    li t1, 0x400999999999999a
    sd t1, 120(fp)
    fld fs4, 120(fp)
    li t1, 0x4022000000000000
    sd t1, 128(fp)
    fld fs5, 128(fp)
    li t1, 0x3fb999999999999a
    sd t1, 136(fp)
    fld fs6, 136(fp)
    li t1, 0x4008000000000000
    sd t1, 144(fp)
    fld fs7, 144(fp)
    li t1, 0x401e000000000000
    sd t1, 152(fp)
    fld fs8, 152(fp)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs0, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 1
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs1, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 2
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs2, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 3
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs3, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 4
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs4, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 5
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs5, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 6
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs6, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 7
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs7, (t1)
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a1, t1, a0
    li t1, 8
    li a0, 8
    mul t1, t1, a0
    add t1, t1, a1
    add t1, t1, zero
    fsd fs8, (t1)
    li t1, 0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 9
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a2, a1, zero
    bne t1, zero, l49
    j l51
l49.inter:
    add a2, a1, zero
    j l49
l49:
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 160
    add a0, t1, a0
    li t1, 8
    mul t1, t1, a2
    add t1, t1, a0
    add a1, t1, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    addi a0, fp, 16
    add a0, t1, a0
    li t1, 8
    mul t1, t1, a2
    add t1, t1, a0
    add t1, t1, zero
    sd a1, (t1)
    li a0, 1
    slli t1, a2, 32
    srai t1, t1, 32
    add t1, t1, a0
    slli t1, t1, 32
    srai a1, t1, 32
    li a0, 9
    slli t1, a1, 32
    srai t1, t1, 32
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l49.inter
    j l51
l51:
    li t1, 9
    slli t1, t1, 32
    srai a0, t1, 32
    addi t1, fp, 16
    add t1, t1, zero
    la a2, compareDoubles
    add a0, a0, zero
    add a1, t1, zero
    add a2, a2, zero
    la t1, make
    jalr t1
    add s1, a0, zero
    add a0, s1, zero
    la t1, popFirst
    jalr t1
    add t1, a0, zero
    add a1, t1, zero
    li t1, 0
    add t1, t1, zero
    sub t1, a1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, a1, zero
    add s1, s1, zero
    bne t1, zero, l52
    j l54
l52.inter:
    add t1, s1, zero
    add a0, a1, zero
    add s1, t1, zero
    j l52
l52:
    add t1, a0, zero
    ld a1, (t1)
    la t1, L.502.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    la t1, popFirst
    jalr t1
    add t1, a0, zero
    add a1, t1, zero
    li t1, 0
    add t1, t1, zero
    sub t1, a1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l52.inter
    j l54
l54:
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    fld fs3, 232(sp)
    fld fs4, 240(sp)
    fld fs2, 248(sp)
    fld fs6, 256(sp)
    fld fs5, 264(sp)
    fld fs7, 272(sp)
    fld fs8, 280(sp)
    fld fs1, 288(sp)
    ld s1, 296(sp)
    fld fs0, 304(sp)
    addi sp, sp, 320
    ret

.section .data
L.251.string:
	.asciz "Memory error\n"
L.279.string:
	.asciz "Memory error\n"
L.502.string:
	.asciz "%ld\n"
