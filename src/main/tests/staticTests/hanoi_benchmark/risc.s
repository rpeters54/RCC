.section .text
.globl _mini_move
_mini_move:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add t2, a0, zero
    li t0, 1
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l3
    j l4
l3:
    la t0, _mini_peg1
    ld a0, (t0)
    la t0, _mini_peg1
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    la t1, _mini_peg1
    sd t0, (t1)
    add t2, a1, zero
    add a0, a0, zero
    j l8
l4:
    li t0, 2
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l5
    j l6
l5:
    la t0, _mini_peg2
    ld a0, (t0)
    la t0, _mini_peg2
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    la t1, _mini_peg2
    sd t0, (t1)
    add t0, a1, zero
    add t1, a0, zero
    j l7
l6:
    la t0, _mini_peg3
    ld a0, (t0)
    la t0, _mini_peg3
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    la t1, _mini_peg3
    sd t0, (t1)
    add t0, a1, zero
    add t1, a0, zero
    j l7
l7:
    add t2, t0, zero
    add a0, t1, zero
    j l8
l8:
    li t0, 1
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l9
    j l10
l9:
    la t0, _mini_peg1
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    sd t2, (t0)
    la t0, _mini_peg1
    sd a0, (t0)
    j l14
l10:
    li t0, 2
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l11
    j l12
l11:
    la t0, _mini_peg2
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    sd t2, (t0)
    la t0, _mini_peg2
    sd a0, (t0)
    j l14
l12:
    la t0, _mini_peg3
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    sd t2, (t0)
    la t0, _mini_peg3
    sd a0, (t0)
    j l14
l14:
    la t0, _mini_numMoves
    ld t0, (t0)
    li t1, 1
    add t0, t0, t1
    la t1, _mini_numMoves
    sd t0, (t1)
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_hanoi
_mini_hanoi:
l16:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s4, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a3, zero
    add s1, a2, zero
    add s4, a1, zero
    add s2, a0, zero
    li t1, 1
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l17
    j l18
l17:
    add a0, s4, zero
    add a1, s1, zero
    la t1, _mini_move
    jalr t1
    j l15
l18:
    li t1, 1
    sub t1, s2, t1
    add a0, t1, zero
    add a1, s4, zero
    add a2, s3, zero
    add a3, s1, zero
    la t1, _mini_hanoi
    jalr t1
    add a0, s4, zero
    add a1, s1, zero
    la t1, _mini_move
    jalr t1
    li t1, 1
    sub t1, s2, t1
    add a0, t1, zero
    add a1, s3, zero
    add a2, s1, zero
    add a3, s4, zero
    la t1, _mini_hanoi
    jalr t1
    j l15
l15:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s4, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl _mini_printPeg
_mini_printPeg:
l21:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, a1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    bne t1, zero, l22
    j l20
l22.inter:
    add s1, a1, zero
    j l22
l22:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.107.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld a1, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, a1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l22.inter
    j l20
l20:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l26:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s1, 32(sp)
    sd s2, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    add t1, t1, zero
    la a0, _mini_peg1
    sd t1, (a0)
    li t1, 0
    add t1, t1, zero
    la a0, _mini_peg2
    sd t1, (a0)
    li t1, 0
    add t1, t1, zero
    la a0, _mini_peg3
    sd t1, (a0)
    li t1, 0
    la a0, _mini_numMoves
    sd t1, (a0)
    la t1, L.142.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    li a0, 1
    slt t1, t1, a0
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l27
    j l35
l27:
    ld s1, 16(fp)
    li t1, 0
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s3, s1, zero
    bne t1, zero, l29
    j l31
l29.inter:
    add s3, s1, zero
    j l29
l29:
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s2, t1, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    sd s3, (t1)
    la t1, _mini_peg1
    ld s1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    sd s1, (t1)
    la t1, _mini_peg1
    sd s2, (t1)
    li t1, 1
    sub s1, s3, t1
    li t1, 0
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l29.inter
    j l31
l31:
    li a1, 1
    la t1, L.180.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_peg1
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_printPeg
    jalr t1
    li a1, 2
    la t1, L.185.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_peg2
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_printPeg
    jalr t1
    li a1, 3
    la t1, L.190.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_peg3
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_printPeg
    jalr t1
    ld t1, 16(fp)
    li a1, 1
    li a2, 3
    li a3, 2
    add a0, t1, zero
    add a1, a1, zero
    add a2, a2, zero
    add a3, a3, zero
    la t1, _mini_hanoi
    jalr t1
    li a1, 1
    la t1, L.202.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_peg1
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_printPeg
    jalr t1
    li a1, 2
    la t1, L.207.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_peg2
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_printPeg
    jalr t1
    li a1, 3
    la t1, L.212.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_peg3
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_printPeg
    jalr t1
    la t1, _mini_numMoves
    ld a1, (t1)
    la t1, L.217.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_peg3
    ld a0, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, a0, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l32
    j l35
l32.inter:
    j l32
l32:
    la t1, _mini_peg3
    ld s2, (t1)
    la t1, _mini_peg3
    ld s1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    la a0, _mini_peg3
    sd t1, (a0)
    add t1, s2, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    la t1, _mini_peg3
    ld a0, (t1)
    li t1, 0
    add t1, t1, zero
    sub t1, a0, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l32.inter
    j l35
l35:
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 24(sp)
    ld s1, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl main
main:
l37:
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
_mini_peg1:
	.zero 8
_mini_peg2:
	.zero 8
_mini_peg3:
	.zero 8
_mini_numMoves:
	.zero 8
L.107.string:
	.asciz "%ld\n"
L.142.string:
	.asciz "%ld"
L.180.string:
	.asciz "%ld\n"
L.185.string:
	.asciz "%ld\n"
L.190.string:
	.asciz "%ld\n"
L.202.string:
	.asciz "%ld\n"
L.207.string:
	.asciz "%ld\n"
L.212.string:
	.asciz "%ld\n"
L.217.string:
	.asciz "%ld\n"
