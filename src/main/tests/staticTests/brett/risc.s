.section .text
.globl _mini_printgroup
_mini_printgroup:
l2:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li a1, 1
    la t1, L.10.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 0
    la t1, L.14.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 1
    la t1, L.18.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 0
    la t1, L.22.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 1
    la t1, L.26.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 0
    la t1, L.30.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.34.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_setcounter
_mini_setcounter:
l4:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a0, zero
    la t1, _mini_counter
    sd t0, (t1)
    li t0, 1
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_takealltypes
_mini_takealltypes:
l6:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a2, zero
    add s2, a1, zero
    add t1, a0, zero
    li a0, 3
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l7
    j l8
l7:
    li a1, 1
    la t1, L.51.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    add a0, s2, zero
    j l9
l8:
    li a1, 0
    la t1, L.55.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    add a0, s2, zero
    j l9
l9:
    li t1, 0
    sub t1, a0, t1
    sltu t1, zero, t1
    bne t1, zero, l10
    j l11
l10:
    li a1, 1
    la t1, L.65.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a1, s1, zero
    j l12
l11:
    li a1, 0
    la t1, L.69.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a1, s1, zero
    j l12
l12:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l13
    j l14
l13:
    li a1, 1
    la t1, L.81.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l5
l14:
    li a1, 0
    la t1, L.85.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l5
l5:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_tonofargs
_mini_tonofargs:
l17:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s4, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a7, zero
    add s4, a6, zero
    add s1, a5, zero
    add s3, a4, zero
    add t1, a3, zero
    add t1, a2, zero
    add t1, a1, zero
    add t1, a0, zero
    li t1, 5
    sub t1, s3, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l18
    j l19
l18:
    li a1, 1
    la t1, L.107.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s2, s2, zero
    add s1, s1, zero
    add s3, s4, zero
    j l20
l19:
    li a1, 0
    la t1, L.111.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.115.string
    add a0, t1, zero
    add a1, s3, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s2, s2, zero
    add s1, s1, zero
    add s3, s4, zero
    j l20
l20:
    li t1, 6
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l21
    j l22
l21:
    li a1, 1
    la t1, L.131.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s2, zero
    add s2, s3, zero
    j l23
l22:
    li a1, 0
    la t1, L.135.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.139.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s2, zero
    add s2, s3, zero
    j l23
l23:
    li t1, 7
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l24
    j l25
l24:
    li a1, 1
    la t1, L.155.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l26
l25:
    li a1, 0
    la t1, L.159.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.163.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l26
l26:
    li t1, 8
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l27
    j l28
l27:
    li a1, 1
    la t1, L.179.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l16
l28:
    li a1, 0
    la t1, L.183.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.187.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    j l16
l16:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s4, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl _mini_returnint
_mini_returnint:
l30:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a0, zero
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_returnbool
_mini_returnbool:
l32:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a0, zero
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_returnstruct
_mini_returnstruct:
l34:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t0, a0, zero
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_main
_mini_main:
l37:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    la a0, _mini_counter
    sd t1, (a0)
    li t1, 1
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l38
    j l39
l38:
    li a1, 0
    la t1, L.238.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l40
l39:
    li a1, 1
    la t1, L.242.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l40
l40:
    li t1, 0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l41
    j l42
l41:
    li a1, 0
    la t1, L.264.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l43
l42:
    li a1, 1
    la t1, L.268.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l43
l43:
    li t1, 0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l44
    j l45
l44:
    li a1, 0
    la t1, L.290.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l46
l45:
    li a1, 1
    la t1, L.294.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l46
l46:
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l47
    j l48
l47:
    li a1, 1
    la t1, L.316.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l49
l48:
    li a1, 0
    la t1, L.320.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l49
l49:
    li t1, 0
    la a0, _mini_counter
    sd t1, (a0)
    li t1, 2
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l50
    j l51
l50:
    li a1, 1
    la t1, L.346.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l52
l51:
    li a1, 0
    la t1, L.350.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l52
l52:
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l53
    j l54
l53:
    li a1, 1
    la t1, L.372.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l55
l54:
    li a1, 0
    la t1, L.376.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l55
l55:
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l56
    j l57
l56:
    li a1, 1
    la t1, L.398.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l58
l57:
    li a1, 0
    la t1, L.402.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l58
l58:
    li t1, 0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l59
    j l60
l59:
    li a1, 0
    la t1, L.424.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l61
l60:
    li a1, 1
    la t1, L.428.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l61
l61:
    li t1, 3
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 42
    li a0, 1
    slt t1, a0, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l62
    j l63
l62:
    li a1, 1
    la t1, L.449.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l64
l63:
    li a1, 0
    la t1, L.453.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l64
l64:
    li t1, 42
    li a0, 1
    slt t1, t1, a0
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l65
    j l66
l65:
    li a1, 1
    la t1, L.472.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l67
l66:
    li a1, 0
    la t1, L.476.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l67
l67:
    li t1, 42
    li a0, 1
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l68
    j l69
l68:
    li a1, 0
    la t1, L.495.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l70
l69:
    li a1, 1
    la t1, L.499.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l70
l70:
    li t1, 42
    li a0, 1
    slt t1, a0, t1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l71
    j l72
l71:
    li a1, 0
    la t1, L.518.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l73
l72:
    li a1, 1
    la t1, L.522.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l73
l73:
    li t1, 42
    li a0, 1
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l74
    j l75
l74:
    li a1, 0
    la t1, L.541.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l76
l75:
    li a1, 1
    la t1, L.545.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l76
l76:
    li t1, 42
    li a0, 1
    sub t1, t1, a0
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l77
    j l78
l77:
    li a1, 1
    la t1, L.564.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l79
l78:
    li a1, 0
    la t1, L.568.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l79
l79:
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l80
    j l81
l80:
    li a1, 1
    la t1, L.584.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l82
l81:
    li a1, 0
    la t1, L.588.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l82
l82:
    li t1, 1
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l83
    j l84
l83:
    li a1, 0
    la t1, L.607.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l85
l84:
    li a1, 1
    la t1, L.611.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l85
l85:
    li t1, 0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l86
    j l87
l86:
    li a1, 0
    la t1, L.627.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l88
l87:
    li a1, 1
    la t1, L.631.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l88
l88:
    li t1, 0
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l89
    j l90
l89:
    li a1, 1
    la t1, L.650.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l91
l90:
    li a1, 0
    la t1, L.654.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l91
l91:
    li t1, 0
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l92
    j l93
l92:
    li a1, 1
    la t1, L.673.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l94
l93:
    li a1, 0
    la t1, L.677.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l94
l94:
    li t1, 4
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 5
    li a0, 5
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l95
    j l96
l95:
    li a1, 1
    la t1, L.701.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l97
l96:
    li a1, 0
    la t1, L.705.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 5
    la t1, L.709.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l97
l97:
    li t1, 6
    li a0, 6
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l98
    j l99
l98:
    li a1, 1
    la t1, L.734.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l100
l99:
    li a1, 0
    la t1, L.738.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 6
    la t1, L.742.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l100
l100:
    li t1, 1
    li a0, 1
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l101
    j l102
l101:
    li a1, 1
    la t1, L.767.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l103
l102:
    li a1, 0
    la t1, L.771.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 1
    la t1, L.775.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l103
l103:
    li t1, 2
    li a0, 2
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l104
    j l105
l104:
    li a1, 1
    la t1, L.800.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l106
l105:
    li a1, 0
    la t1, L.804.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, 2
    la t1, L.808.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l106
l106:
    li t1, -6
    li a0, 0
    slt t1, t1, a0
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l107
    j l108
l107:
    li a1, 1
    la t1, L.833.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l109
l108:
    li a1, 0
    la t1, L.837.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l109
l109:
    li t1, 5
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 42
    li a0, 42
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l110
    j l111
l110:
    li a1, 1
    la t1, L.858.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l112
l111:
    li a1, 0
    la t1, L.862.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l112
l112:
    li t1, 5
    li a0, 5
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l113
    j l114
l113:
    li a1, 1
    la t1, L.884.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l115
l114:
    li a1, 0
    la t1, L.888.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l115
l115:
    li s1, 1
    li t1, 0
    sub t1, s1, t1
    sltu t1, zero, t1
    bne t1, zero, l116
    j l117
l116:
    li a1, 1
    la t1, L.904.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    j l118
l117:
    li a1, 0
    la t1, L.908.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    j l118
l118:
    li t1, 0
    sub t1, a0, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l119
    j l120
l119:
    li a1, 0
    la t1, L.925.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l121
l120:
    li a1, 1
    la t1, L.929.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l121
l121:
    li s1, 0
    li t1, 0
    sub t1, s1, t1
    sltu t1, zero, t1
    bne t1, zero, l122
    j l123
l122:
    li a1, 0
    la t1, L.945.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l124
l123:
    li a1, 1
    la t1, L.949.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l124
l124:
    li t1, 0
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l125
    j l126
l125:
    li a1, 1
    la t1, L.966.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    j l127
l126:
    li a1, 0
    la t1, L.970.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    j l127
l127:
    li t1, 0
    sub t1, a0, t1
    sltu t1, zero, t1
    bne t1, zero, l128
    j l129
l128:
    li a1, 0
    la t1, L.984.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l130
l129:
    li a1, 1
    la t1, L.988.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l130
l130:
    li t1, 6
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li a1, 0
    li t1, 5
    slt t1, a1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, a1, zero
    add s2, a1, zero
    bne t1, zero, l131
    j l133
l136.inter:
    add s1, a1, zero
    j l131
l131:
    li t1, 5
    slt t1, s1, t1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    bne t1, zero, l134
    j l136
l134:
    li a1, 0
    la t1, L.1022.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    j l136
l136:
    li t1, 5
    add a1, a0, t1
    li t1, 5
    slt t1, a1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s2, a1, zero
    bne t1, zero, l136.inter
    j l133
l133:
    li t1, 5
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l137
    j l138
l137:
    li a1, 1
    la t1, L.1062.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l139
l138:
    li a1, 0
    la t1, L.1066.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.1070.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l139
l139:
    li t1, 7
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    li a1, 42
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    sd a1, (t1)
    li a1, 1
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    sd a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li a0, 42
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l140
    j l141
l140:
    li a1, 1
    la t1, L.1099.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l142
l141:
    li a1, 0
    la t1, L.1103.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.1107.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l142
l142:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l143
    j l144
l143:
    li a1, 1
    la t1, L.1123.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s2, s1, zero
    j l145
l144:
    li a1, 0
    la t1, L.1127.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s2, s1, zero
    j l145
l145:
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add a1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    add a0, a1, zero
    sd a0, (t1)
    li s1, 13
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li s1, 0
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    sd s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li a0, 13
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l146
    j l147
l146:
    li a1, 1
    la t1, L.1163.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s2, zero
    j l148
l147:
    li a1, 0
    la t1, L.1167.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.1171.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s2, zero
    j l148
l148:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l149
    j l150
l149:
    li a1, 1
    la t1, L.1194.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l151
l150:
    li a1, 0
    la t1, L.1198.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l151
l151:
    sub t1, s1, s1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l152
    j l153
l152:
    li a1, 1
    la t1, L.1213.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l154
l153:
    li a1, 0
    la t1, L.1217.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l154
l154:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l155
    j l156
l155:
    li a1, 1
    la t1, L.1234.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l157
l156:
    li a1, 0
    la t1, L.1238.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add s1, s1, zero
    j l157
l157:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add t1, t1, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    add t1, s1, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    li t1, 8
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 7
    la a0, _mini_gi1
    sd t1, (a0)
    la t1, _mini_gi1
    ld t1, (t1)
    li a0, 7
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l158
    j l159
l158:
    li a1, 1
    la t1, L.1264.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l160
l159:
    li a1, 0
    la t1, L.1268.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_gi1
    ld a1, (t1)
    la t1, L.1272.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l160
l160:
    li t1, 1
    la a0, _mini_gb1
    sd t1, (a0)
    la t1, _mini_gb1
    ld t1, (t1)
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l161
    j l162
l161:
    li a1, 1
    la t1, L.1288.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l163
l162:
    li a1, 0
    la t1, L.1292.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l163
l163:
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add t1, t1, zero
    la a0, _mini_gs1
    sd t1, (a0)
    li s1, 34
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li s1, 0
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    sd s1, (t1)
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li a0, 34
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l164
    j l165
l164:
    li a1, 1
    la t1, L.1324.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l166
l165:
    li a1, 0
    la t1, L.1328.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.1332.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l166
l166:
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l167
    j l168
l167:
    li a1, 1
    la t1, L.1353.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l169
l168:
    li a1, 0
    la t1, L.1357.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l169
l169:
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add s1, a0, zero
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    add a0, s1, zero
    sd a0, (t1)
    li s1, 16
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li s1, 1
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    sd s1, (t1)
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    li a0, 16
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l170
    j l171
l170:
    li a1, 1
    la t1, L.1397.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l172
l171:
    li a1, 0
    la t1, L.1401.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.1405.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l172
l172:
    la t1, _mini_gs1
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 16
    add t1, t1, zero
    ld a1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l173
    j l174
l173:
    li a1, 1
    la t1, L.1427.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l175
l174:
    li a1, 0
    la t1, L.1431.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l175
l175:
    la t1, _mini_gs1
    ld s1, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add t1, t1, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    la t1, _mini_gs1
    ld t1, (t1)
    add t1, t1, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    li t1, 9
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add a2, t1, zero
    li a1, 1
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a2
    addi t1, t1, 8
    add t1, t1, zero
    sd a1, (t1)
    li t1, 3
    li a1, 1
    add a0, t1, zero
    add a1, a1, zero
    add a2, a2, zero
    la t1, _mini_takealltypes
    jalr t1
    li a1, 2
    la t1, L.1461.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    li a1, 2
    li a2, 3
    li a3, 4
    li a4, 5
    li a5, 6
    li a6, 7
    li a7, 8
    add a0, t1, zero
    add a1, a1, zero
    add a2, a2, zero
    add a3, a3, zero
    add a4, a4, zero
    add a5, a5, zero
    add a6, a6, zero
    add a7, a7, zero
    la t1, _mini_tonofargs
    jalr t1
    li a1, 3
    la t1, L.1481.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 3
    add a0, t1, zero
    la t1, _mini_returnint
    jalr t1
    add s1, a0, zero
    li t1, 3
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l176
    j l177
l176:
    li a1, 1
    la t1, L.1494.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l178
l177:
    li a1, 0
    la t1, L.1498.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.1502.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l178
l178:
    li t1, 1
    add a0, t1, zero
    la t1, _mini_returnbool
    jalr t1
    add t1, a0, zero
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l179
    j l180
l179:
    li a1, 1
    la t1, L.1517.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l181
l180:
    li a1, 0
    la t1, L.1521.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l181
l181:
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s1, t1, zero
    add a0, s1, zero
    la t1, _mini_returnstruct
    jalr t1
    add t1, a0, zero
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l182
    j l183
l182:
    li a1, 1
    la t1, L.1541.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l184
l183:
    li a1, 0
    la t1, L.1545.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    j l184
l184:
    li t1, 10
    add a0, t1, zero
    la t1, _mini_printgroup
    jalr t1
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l186:
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
_mini_gi1:
	.zero 8
_mini_gb1:
	.zero 8
_mini_gs1:
	.zero 8
_mini_counter:
	.zero 8
L.10.string:
	.asciz "%ld "
L.14.string:
	.asciz "%ld "
L.18.string:
	.asciz "%ld "
L.22.string:
	.asciz "%ld "
L.26.string:
	.asciz "%ld "
L.30.string:
	.asciz "%ld "
L.34.string:
	.asciz "%ld\n"
L.51.string:
	.asciz "%ld\n"
L.55.string:
	.asciz "%ld\n"
L.65.string:
	.asciz "%ld\n"
L.69.string:
	.asciz "%ld\n"
L.81.string:
	.asciz "%ld\n"
L.85.string:
	.asciz "%ld\n"
L.107.string:
	.asciz "%ld\n"
L.111.string:
	.asciz "%ld "
L.115.string:
	.asciz "%ld\n"
L.131.string:
	.asciz "%ld\n"
L.135.string:
	.asciz "%ld "
L.139.string:
	.asciz "%ld\n"
L.155.string:
	.asciz "%ld\n"
L.159.string:
	.asciz "%ld "
L.163.string:
	.asciz "%ld\n"
L.179.string:
	.asciz "%ld\n"
L.183.string:
	.asciz "%ld "
L.187.string:
	.asciz "%ld\n"
L.238.string:
	.asciz "%ld\n"
L.242.string:
	.asciz "%ld\n"
L.264.string:
	.asciz "%ld\n"
L.268.string:
	.asciz "%ld\n"
L.290.string:
	.asciz "%ld\n"
L.294.string:
	.asciz "%ld\n"
L.316.string:
	.asciz "%ld\n"
L.320.string:
	.asciz "%ld\n"
L.346.string:
	.asciz "%ld\n"
L.350.string:
	.asciz "%ld\n"
L.372.string:
	.asciz "%ld\n"
L.376.string:
	.asciz "%ld\n"
L.398.string:
	.asciz "%ld\n"
L.402.string:
	.asciz "%ld\n"
L.424.string:
	.asciz "%ld\n"
L.428.string:
	.asciz "%ld\n"
L.449.string:
	.asciz "%ld\n"
L.453.string:
	.asciz "%ld\n"
L.472.string:
	.asciz "%ld\n"
L.476.string:
	.asciz "%ld\n"
L.495.string:
	.asciz "%ld\n"
L.499.string:
	.asciz "%ld\n"
L.518.string:
	.asciz "%ld\n"
L.522.string:
	.asciz "%ld\n"
L.541.string:
	.asciz "%ld\n"
L.545.string:
	.asciz "%ld\n"
L.564.string:
	.asciz "%ld\n"
L.568.string:
	.asciz "%ld\n"
L.584.string:
	.asciz "%ld\n"
L.588.string:
	.asciz "%ld\n"
L.607.string:
	.asciz "%ld\n"
L.611.string:
	.asciz "%ld\n"
L.627.string:
	.asciz "%ld\n"
L.631.string:
	.asciz "%ld\n"
L.650.string:
	.asciz "%ld\n"
L.654.string:
	.asciz "%ld\n"
L.673.string:
	.asciz "%ld\n"
L.677.string:
	.asciz "%ld\n"
L.701.string:
	.asciz "%ld\n"
L.705.string:
	.asciz "%ld "
L.709.string:
	.asciz "%ld\n"
L.734.string:
	.asciz "%ld\n"
L.738.string:
	.asciz "%ld "
L.742.string:
	.asciz "%ld\n"
L.767.string:
	.asciz "%ld\n"
L.771.string:
	.asciz "%ld "
L.775.string:
	.asciz "%ld\n"
L.800.string:
	.asciz "%ld\n"
L.804.string:
	.asciz "%ld "
L.808.string:
	.asciz "%ld\n"
L.833.string:
	.asciz "%ld\n"
L.837.string:
	.asciz "%ld\n"
L.858.string:
	.asciz "%ld\n"
L.862.string:
	.asciz "%ld\n"
L.884.string:
	.asciz "%ld\n"
L.888.string:
	.asciz "%ld\n"
L.904.string:
	.asciz "%ld\n"
L.908.string:
	.asciz "%ld\n"
L.925.string:
	.asciz "%ld\n"
L.929.string:
	.asciz "%ld\n"
L.945.string:
	.asciz "%ld\n"
L.949.string:
	.asciz "%ld\n"
L.966.string:
	.asciz "%ld\n"
L.970.string:
	.asciz "%ld\n"
L.984.string:
	.asciz "%ld\n"
L.988.string:
	.asciz "%ld\n"
L.1022.string:
	.asciz "%ld\n"
L.1062.string:
	.asciz "%ld\n"
L.1066.string:
	.asciz "%ld "
L.1070.string:
	.asciz "%ld\n"
L.1099.string:
	.asciz "%ld\n"
L.1103.string:
	.asciz "%ld "
L.1107.string:
	.asciz "%ld\n"
L.1123.string:
	.asciz "%ld\n"
L.1127.string:
	.asciz "%ld\n"
L.1163.string:
	.asciz "%ld\n"
L.1167.string:
	.asciz "%ld "
L.1171.string:
	.asciz "%ld\n"
L.1194.string:
	.asciz "%ld\n"
L.1198.string:
	.asciz "%ld\n"
L.1213.string:
	.asciz "%ld\n"
L.1217.string:
	.asciz "%ld\n"
L.1234.string:
	.asciz "%ld\n"
L.1238.string:
	.asciz "%ld\n"
L.1264.string:
	.asciz "%ld\n"
L.1268.string:
	.asciz "%ld "
L.1272.string:
	.asciz "%ld\n"
L.1288.string:
	.asciz "%ld\n"
L.1292.string:
	.asciz "%ld\n"
L.1324.string:
	.asciz "%ld\n"
L.1328.string:
	.asciz "%ld "
L.1332.string:
	.asciz "%ld\n"
L.1353.string:
	.asciz "%ld\n"
L.1357.string:
	.asciz "%ld\n"
L.1397.string:
	.asciz "%ld\n"
L.1401.string:
	.asciz "%ld "
L.1405.string:
	.asciz "%ld\n"
L.1427.string:
	.asciz "%ld\n"
L.1431.string:
	.asciz "%ld\n"
L.1461.string:
	.asciz "%ld\n"
L.1481.string:
	.asciz "%ld\n"
L.1494.string:
	.asciz "%ld\n"
L.1498.string:
	.asciz "%ld "
L.1502.string:
	.asciz "%ld\n"
L.1517.string:
	.asciz "%ld\n"
L.1521.string:
	.asciz "%ld\n"
L.1541.string:
	.asciz "%ld\n"
L.1545.string:
	.asciz "%ld\n"
