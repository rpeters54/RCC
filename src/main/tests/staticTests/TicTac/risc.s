.section .text
.globl _mini_cleanBoard
_mini_cleanBoard:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a0, a0, zero
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 16
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 24
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 32
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 40
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 48
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 56
    add t0, t0, zero
    sd t2, (t0)
    li t2, 0
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 64
    add t0, t0, zero
    sd t2, (t0)
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_printBoard
_mini_printBoard:
l4:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.35.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.39.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.43.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 24
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.47.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 32
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.51.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 40
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.55.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 48
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.59.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 56
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.63.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 72
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 64
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.67.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_printMoveBoard
_mini_printMoveBoard:
l6:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li a1, 123
    la t1, L.72.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 456
    la t1, L.76.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 789
    la t1, L.80.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_placePiece
_mini_placePiece:
l8:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a2, zero
    add a1, a1, zero
    add a0, a0, zero
    li t0, 1
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l9
    j l10
l9:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd a1, (t0)
    j l7
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
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    sd a1, (t0)
    j l7
l12:
    li t0, 3
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l13
    j l14
l13:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 16
    add t0, t0, zero
    sd a1, (t0)
    j l7
l14:
    li t0, 4
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l15
    j l16
l15:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 24
    add t0, t0, zero
    sd a1, (t0)
    j l7
l16:
    li t0, 5
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l17
    j l18
l17:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 32
    add t0, t0, zero
    sd a1, (t0)
    j l7
l18:
    li t0, 6
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l19
    j l20
l19:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 40
    add t0, t0, zero
    sd a1, (t0)
    j l7
l20:
    li t0, 7
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l21
    j l22
l21:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 48
    add t0, t0, zero
    sd a1, (t0)
    j l7
l22:
    li t0, 8
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l23
    j l24
l23:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 56
    add t0, t0, zero
    sd a1, (t0)
    j l7
l24:
    li t0, 9
    sub t0, t2, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l25
    j l7
l25:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 64
    add t0, t0, zero
    sd a1, (t0)
    j l7
l7:
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_checkWinner
_mini_checkWinner:
l37:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a0, zero
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, t2, zero
    bne t0, zero, l38
    j l46
l38:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l40
    j l45
l40:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 16
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l42
    j l45
l42:
    li t0, 0
    add t0, t0, zero
    j l36
l45:
    add a1, t1, zero
    j l46
l46:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a0, a1, zero
    bne t0, zero, l47
    j l55
l47:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a1, zero
    bne t0, zero, l49
    j l54
l49:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 16
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a1, zero
    bne t0, zero, l51
    j l54
l51:
    li t0, 1
    add t0, t0, zero
    j l36
l54:
    add a0, t1, zero
    j l55
l55:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 24
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t2, a0, zero
    bne t0, zero, l56
    j l64
l56:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 32
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l58
    j l63
l58:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 40
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l60
    j l63
l60:
    li t0, 0
    add t0, t0, zero
    j l36
l63:
    add t2, t1, zero
    j l64
l64:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 24
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a0, t2, zero
    bne t0, zero, l65
    j l73
l65:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 32
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l67
    j l72
l67:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 40
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l69
    j l72
l69:
    li t0, 1
    add t0, t0, zero
    j l36
l72:
    add a0, t1, zero
    j l73
l73:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 48
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t2, a0, zero
    bne t0, zero, l74
    j l82
l74:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 56
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l76
    j l81
l76:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 64
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l78
    j l81
l78:
    li t0, 0
    add t0, t0, zero
    j l36
l81:
    add t2, t1, zero
    j l82
l82:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 48
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a0, t2, zero
    bne t0, zero, l83
    j l91
l83:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 56
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l85
    j l90
l85:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 64
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l87
    j l90
l87:
    li t0, 1
    add t0, t0, zero
    j l36
l90:
    add a0, t1, zero
    j l91
l91:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t2, a0, zero
    bne t0, zero, l92
    j l100
l92:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 24
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l94
    j l99
l94:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 48
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l96
    j l99
l96:
    li t0, 0
    add t0, t0, zero
    j l36
l99:
    add t2, t1, zero
    j l100
l100:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a0, t2, zero
    bne t0, zero, l101
    j l109
l101:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 24
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l103
    j l108
l103:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 48
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l105
    j l108
l105:
    li t0, 1
    add t0, t0, zero
    j l36
l108:
    add a0, t1, zero
    j l109
l109:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t2, a0, zero
    bne t0, zero, l110
    j l118
l110:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 32
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l112
    j l117
l112:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 56
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l114
    j l117
l114:
    li t0, 0
    add t0, t0, zero
    j l36
l117:
    add t2, t1, zero
    j l118
l118:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a0, t2, zero
    bne t0, zero, l119
    j l127
l119:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 32
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l121
    j l126
l121:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 56
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, t2, zero
    bne t0, zero, l123
    j l126
l123:
    li t0, 1
    add t0, t0, zero
    j l36
l126:
    add a0, t1, zero
    j l127
l127:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 16
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t2, a0, zero
    bne t0, zero, l128
    j l136
l128:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 40
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l130
    j l135
l130:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 64
    add t0, t0, zero
    ld t0, (t0)
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a0, zero
    bne t0, zero, l132
    j l135
l132:
    li t0, 0
    add t0, t0, zero
    j l36
l135:
    add t2, t1, zero
    j l136
l136:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 16
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l137
    j l145
l137:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 40
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l139
    j l145
l139:
    li t0, 72
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 64
    add t0, t0, zero
    ld t0, (t0)
    li t1, 2
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l141
    j l145
l141:
    li t0, 1
    add t0, t0, zero
    j l36
l145:
    li t0, -1
    add t0, t0, zero
    j l36
l36:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l147:
    addi sp, sp, -80
    sd s5, 64(sp)
    sd s4, 56(sp)
    sd s3, 48(sp)
    sd s1, 40(sp)
    sd s2, 32(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li s2, 0
    li s3, 0
    li t1, 0
    sd t1, 16(fp)
    li t1, 0
    sd t1, 24(fp)
    li s4, -1
    li t1, 72
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    add a0, s1, zero
    la t1, _mini_cleanBoard
    jalr t1
    li t1, 0
    slt a0, s4, t1
    li t1, 8
    sub t1, s2, t1
    sltu t1, zero, t1
    and t1, a0, t1
    slli t1, t1, 63
    srai t1, t1, 63
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s5, s1, zero
    add s2, s2, zero
    add s1, s3, zero
    add a0, s4, zero
    bne t1, zero, l148
    j l150
l153.inter:
    add s5, s3, zero
    add s2, s2, zero
    add s1, s4, zero
    j l148
l148:
    add a0, s5, zero
    la t1, _mini_printBoard
    jalr t1
    li t1, 0
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l151
    j l152
l151:
    li t1, 1
    add s1, s1, t1
    la t1, L.577.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li t1, 1
    ld a2, 16(fp)
    add a0, s5, zero
    add a1, t1, zero
    add a2, a2, zero
    la t1, _mini_placePiece
    jalr t1
    add s3, s5, zero
    add s2, s2, zero
    add s4, s1, zero
    j l153
l152:
    li t1, 1
    sub s1, s1, t1
    la t1, L.585.string
    add a0, t1, zero
    addi t1, fp, 24
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    li t1, 2
    ld a2, 24(fp)
    add a0, s5, zero
    add a1, t1, zero
    add a2, a2, zero
    la t1, _mini_placePiece
    jalr t1
    add s3, s5, zero
    add s2, s2, zero
    add s4, s1, zero
    j l153
l153:
    add a0, s3, zero
    la t1, _mini_checkWinner
    jalr t1
    add s1, a0, zero
    li t1, 1
    add s2, s2, t1
    li t1, 0
    slt a0, s1, t1
    li t1, 8
    sub t1, s2, t1
    sltu t1, zero, t1
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
    bne t1, zero, l153.inter
    j l150
l150:
    li t1, 1
    add a1, a0, t1
    la t1, L.619.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 32(sp)
    ld s1, 40(sp)
    ld s3, 48(sp)
    ld s4, 56(sp)
    ld s5, 64(sp)
    addi sp, sp, 80
    ret

.globl main
main:
l155:
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
L.35.string:
	.asciz "%ld "
L.39.string:
	.asciz "%ld "
L.43.string:
	.asciz "%ld\n"
L.47.string:
	.asciz "%ld "
L.51.string:
	.asciz "%ld "
L.55.string:
	.asciz "%ld\n"
L.59.string:
	.asciz "%ld "
L.63.string:
	.asciz "%ld "
L.67.string:
	.asciz "%ld\n"
L.72.string:
	.asciz "%ld\n"
L.76.string:
	.asciz "%ld\n"
L.80.string:
	.asciz "%ld\n"
L.577.string:
	.asciz "%ld"
L.585.string:
	.asciz "%ld"
L.619.string:
	.asciz "%ld\n"
