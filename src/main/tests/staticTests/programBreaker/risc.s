.section .text
.globl _mini_fun2
_mini_fun2:
l2:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add s1, a0, zero
    li t1, 0
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, a1, zero
    bne t1, zero, l1
    j l4
l4:
    li t1, 1
    sub t1, s1, t1
    add a0, t1, zero
    add a1, a1, zero
    la t1, _mini_fun2
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    j l1
l1:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_fun1
_mini_fun1:
l6:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a2, zero
    add a1, a1, zero
    add s2, a0, zero
    li a0, 11
    li t1, 2
    mul t1, s2, t1
    sub a0, a0, t1
    li t1, 4
    div t1, t1, a1
    add t1, a0, t1
    add s1, t1, s1
    slt t1, a1, s1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l7
    j l8
l7:
    add a0, s1, zero
    add a1, s2, zero
    la t1, _mini_fun2
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    j l5
l8:
    li t1, 5
    li a0, 6
    slt a0, t1, a0
    slt t1, a1, s1
    xori t1, t1, 1
    and t1, a0, t1
    slli t1, t1, 63
    srai t1, t1, 63
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    bne t1, zero, l9
    j l5
l9:
    add a0, s1, zero
    add a1, a1, zero
    la t1, _mini_fun2
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    j l5
l5:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l14:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    sd t1, 16(fp)
    la t1, L.64.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 10000
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l15
    j l17
l15.inter:
    j l15
l15:
    li t1, 3
    ld a1, 16(fp)
    li a2, 5
    add a0, t1, zero
    add a1, a1, zero
    add a2, a2, zero
    la t1, _mini_fun1
    jalr t1
    add a1, a0, zero
    la t1, L.73.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 1
    add t1, t1, a0
    sd t1, 16(fp)
    ld t1, 16(fp)
    li a0, 10000
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l15.inter
    j l17
l17:
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl main
main:
l19:
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
_mini_GLOBAL:
	.zero 8
_mini_count:
	.zero 8
L.64.string:
	.asciz "%ld"
L.73.string:
	.asciz "%ld\n"
