.section .text
.globl _mini_concatLists
_mini_concatLists:
l2:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add a1, a1, zero
    add a4, a0, zero
    li t0, 0
    add t0, t0, zero
    sub t0, a4, t0
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add t1, a1, zero
    bne t0, zero, l1
    j l5
l5:
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a4
    addi t0, t0, 8
    add t0, t0, zero
    ld t1, (t0)
    li t0, 0
    add t0, t0, zero
    sub t0, t1, t0
    sltu t0, zero, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a2, a1, zero
    add t2, a4, zero
    add a3, a4, zero
    add a1, a1, zero
    add a0, a4, zero
    add a4, a4, zero
    bne t0, zero, l6
    j l8
l6.inter:
    add t0, a2, zero
    add t1, a3, zero
    add a2, t0, zero
    add t2, t2, zero
    add a3, t1, zero
    j l6
l6:
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t2, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t1, (t0)
    li t0, 0
    add t0, t0, zero
    sub t0, t1, t0
    sltu t0, zero, t0
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    add a1, a2, zero
    add a0, t2, zero
    add a4, a3, zero
    bne t0, zero, l6.inter
    j l8
l8:
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    sd a1, (t0)
    add t1, a4, zero
    j l1
l1:
    add a0, t1, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_add
_mini_add:
l10:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a1, zero
    add s2, a0, zero
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t0, a0, zero
    add t2, t0, zero
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 0
    add t0, t0, zero
    sd s1, (t0)
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    sd s2, (t0)
    add a0, t2, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_size
_mini_size:
l12:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l13
    j l15
l13:
    li t0, 0
    add t0, t0, zero
    j l11
l15:
    li s1, 1
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_size
    jalr t1
    add t0, a0, zero
    add t0, s1, t0
    add t0, t0, zero
    j l11
l11:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_get
_mini_get:
l17:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a1, zero
    add a1, a0, zero
    li t1, 0
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l18
    j l20
l18:
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a1
    addi t0, t0, 0
    add t0, t0, zero
    ld t0, (t0)
    add t0, t0, zero
    j l16
l20:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, a1
    addi t1, t1, 8
    add t1, t1, zero
    ld a0, (t1)
    li t1, 1
    sub t1, s1, t1
    add a0, a0, zero
    add a1, t1, zero
    la t1, _mini_get
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l16
l16:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_pop
_mini_pop:
l22:
    addi sp, sp, -32
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t2, a0, zero
    li t0, 16
    li t1, 0
    mul t0, t0, t1
    add t0, t0, t2
    addi t0, t0, 8
    add t0, t0, zero
    ld t0, (t0)
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    addi sp, sp, 32
    ret

.globl _mini_printList
_mini_printList:
l24:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l25
    j l23
l25:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.114.string
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
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_printList
    jalr t1
    j l23
l23:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_treeprint
_mini_treeprint:
l29:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l30
    j l28
l30:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_treeprint
    jalr t1
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld a1, (t1)
    la t1, L.132.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_treeprint
    jalr t1
    j l28
l28:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_freeList
_mini_freeList:
l34:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l35
    j l33
l35:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_freeList
    jalr t1
    add t1, s1, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    j l33
l33:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_freeTree
_mini_freeTree:
l39:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l40
    j l38
l40:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_freeTree
    jalr t1
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_freeTree
    jalr t1
    add t1, s1, zero
    add a0, t1, zero
    la t1, free
    jalr t1
    j l38
l38:
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_postOrder
_mini_postOrder:
l44:
    addi sp, sp, -48
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s3, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l45
    j l47
l45:
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s2, t1, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld s1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li s1, 0
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    add a0, s1, zero
    sd a0, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_postOrder
    jalr t1
    add s1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_postOrder
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    add a1, t1, zero
    la t1, _mini_concatLists
    jalr t1
    add t1, a0, zero
    add a0, t1, zero
    add a1, s2, zero
    la t1, _mini_concatLists
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l43
l47:
    li t0, 0
    add t0, t0, zero
    add t0, t0, zero
    j l43
l43:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    addi sp, sp, 48
    ret

.globl _mini_treeadd
_mini_treeadd:
l49:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a1, zero
    add s2, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l50
    j l52
l50:
    li t1, 24
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    li t0, 24
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 0
    add t0, t0, zero
    sd s1, (t0)
    li t2, 0
    li t0, 24
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 8
    add t0, t0, zero
    add t1, t2, zero
    sd t1, (t0)
    li t2, 0
    li t0, 24
    li t1, 0
    mul t0, t0, t1
    add t0, t0, a0
    addi t0, t0, 16
    add t0, t0, zero
    add t1, t2, zero
    sd t1, (t0)
    add t0, a0, zero
    j l48
l52:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l53
    j l54
l53:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    add a1, s1, zero
    la t1, _mini_treeadd
    jalr t1
    add t2, a0, zero
    li t0, 24
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s2
    addi t0, t0, 8
    add t0, t0, zero
    sd t2, (t0)
    add t0, s2, zero
    j l55
l54:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    add a1, s1, zero
    la t1, _mini_treeadd
    jalr t1
    add t2, a0, zero
    li t0, 24
    li t1, 0
    mul t0, t0, t1
    add t0, t0, s2
    addi t0, t0, 16
    add t0, t0, zero
    sd t2, (t0)
    add t0, s2, zero
    j l55
l55:
    add t0, t0, zero
    j l48
l48:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_quickSort
_mini_quickSort:
l57:
    addi sp, sp, -112
    sd s10, 96(sp)
    sd s9, 88(sp)
    sd s7, 80(sp)
    sd s8, 72(sp)
    sd s3, 64(sp)
    sd s4, 56(sp)
    sd s6, 48(sp)
    sd s5, 40(sp)
    sd s1, 32(sp)
    sd s11, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s9, a0, zero
    li t1, 0
    add s11, t1, zero
    li t1, 0
    add s10, t1, zero
    add a0, s9, zero
    la t1, _mini_size
    jalr t1
    add t1, a0, zero
    li a0, 1
    slt t1, a0, t1
    xori t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s9, zero
    bne t1, zero, l56
    j l60
l60:
    li t1, 0
    add a0, s9, zero
    add a1, t1, zero
    la t1, _mini_get
    jalr t1
    add s1, a0, zero
    add a0, s9, zero
    la t1, _mini_size
    jalr t1
    add t1, a0, zero
    li a0, 1
    sub t1, t1, a0
    add a0, s9, zero
    add a1, t1, zero
    la t1, _mini_get
    jalr t1
    add t1, a0, zero
    add t1, s1, t1
    li a0, 2
    div s1, t1, a0
    li s2, 0
    li t1, 0
    add t1, t1, zero
    sub t1, s9, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s7, s9, zero
    add s4, s1, zero
    add s5, s11, zero
    add s6, s10, zero
    add s8, s9, zero
    add s3, s2, zero
    add a0, s9, zero
    add s9, s11, zero
    add s10, s10, zero
    bne t1, zero, l61
    j l63
l66.inter:
    add s7, s1, zero
    add s4, s4, zero
    add s5, s5, zero
    add s6, s6, zero
    add s8, s2, zero
    add s3, s3, zero
    j l61
l61:
    add a0, s7, zero
    add a1, s3, zero
    la t1, _mini_get
    jalr t1
    add t1, a0, zero
    slt t1, s4, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l64
    j l65
l64:
    add a0, s7, zero
    add a1, s3, zero
    la t1, _mini_get
    jalr t1
    add t1, a0, zero
    add a0, s6, zero
    add a1, t1, zero
    la t1, _mini_add
    jalr t1
    add t1, a0, zero
    add s1, s7, zero
    add s4, s4, zero
    add s5, s5, zero
    add s6, t1, zero
    add s2, s8, zero
    add s3, s3, zero
    j l66
l65:
    add a0, s7, zero
    add a1, s3, zero
    la t1, _mini_get
    jalr t1
    add t1, a0, zero
    add a0, s5, zero
    add a1, t1, zero
    la t1, _mini_add
    jalr t1
    add t1, a0, zero
    add s1, s7, zero
    add s4, s4, zero
    add s5, t1, zero
    add s6, s6, zero
    add s2, s8, zero
    add s3, s3, zero
    j l66
l66:
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld s2, (t1)
    li t1, 1
    add s3, s3, t1
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    add s9, s5, zero
    add s10, s6, zero
    bne t1, zero, l66.inter
    j l63
l63:
    add a0, a0, zero
    la t1, _mini_freeList
    jalr t1
    add a0, s9, zero
    la t1, _mini_quickSort
    jalr t1
    add s1, a0, zero
    add a0, s10, zero
    la t1, _mini_quickSort
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    add a1, t1, zero
    la t1, _mini_concatLists
    jalr t1
    add t0, a0, zero
    add a0, t0, zero
    j l56
l56:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s11, 24(sp)
    ld s1, 32(sp)
    ld s5, 40(sp)
    ld s6, 48(sp)
    ld s4, 56(sp)
    ld s3, 64(sp)
    ld s8, 72(sp)
    ld s7, 80(sp)
    ld s9, 88(sp)
    ld s10, 96(sp)
    addi sp, sp, 112
    ret

.globl _mini_quickSortMain
_mini_quickSortMain:
l68:
    addi sp, sp, -32
    sd s1, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    add a0, s1, zero
    la t1, _mini_printList
    jalr t1
    li a1, -999
    la t1, L.349.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    la t1, _mini_printList
    jalr t1
    li a1, -999
    la t1, L.356.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    la t1, _mini_printList
    jalr t1
    li a1, -999
    la t1, L.363.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    add t0, t0, zero
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s1, 16(sp)
    addi sp, sp, 32
    ret

.globl _mini_treesearch
_mini_treesearch:
l70:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a1, zero
    add s2, a0, zero
    li a1, -1
    la t1, L.377.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l71
    j l81
l71:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    sub t1, t1, s1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l73
    j l75
l73:
    li t0, 1
    add t0, t0, zero
    j l69
l75:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    add a1, s1, zero
    la t1, _mini_treesearch
    jalr t1
    add t1, a0, zero
    li a0, 1
    sub t1, t1, a0
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l76
    j l78
l76:
    li t0, 1
    add t0, t0, zero
    j l69
l78:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    add a1, s1, zero
    la t1, _mini_treesearch
    jalr t1
    add t0, a0, zero
    li t1, 1
    sub t0, t0, t1
    sltiu t0, t0, 1
    li t1, 0
    sub t0, t0, t1
    sltu t0, zero, t0
    bne t0, zero, l79
    j l80
l79:
    li t0, 1
    add t0, t0, zero
    j l69
l80:
    li t0, 0
    add t0, t0, zero
    j l69
l81:
    li t0, 0
    add t0, t0, zero
    j l69
l69:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_inOrder
_mini_inOrder:
l83:
    addi sp, sp, -48
    sd s3, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s3, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s3, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l84
    j l85
l84:
    li t1, 16
    add a0, t1, zero
    la t1, malloc
    jalr t1
    add t1, a0, zero
    add s2, t1, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 0
    add t1, t1, zero
    ld s1, (t1)
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    sd s1, (t1)
    li s1, 0
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    add a0, s1, zero
    sd a0, (t1)
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_inOrder
    jalr t1
    add s1, a0, zero
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s3
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_inOrder
    jalr t1
    add t1, a0, zero
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_concatLists
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    add a1, t1, zero
    la t1, _mini_concatLists
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l82
l85:
    li t0, 0
    add t0, t0, zero
    add t0, t0, zero
    j l82
l82:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s3, 32(sp)
    addi sp, sp, 48
    ret

.globl _mini_bintreesearch
_mini_bintreesearch:
l87:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a1, zero
    add s1, a0, zero
    li a1, -1
    la t1, L.464.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s1, t1
    sltu t1, zero, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l88
    j l95
l88:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    sub t1, t1, s2
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l90
    j l92
l90:
    li t0, 1
    add t0, t0, zero
    j l86
l92:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 0
    add t1, t1, zero
    ld t1, (t1)
    slt t1, s2, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l93
    j l94
l93:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    add a1, s2, zero
    la t1, _mini_bintreesearch
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l86
l94:
    li t1, 24
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s1
    addi t1, t1, 16
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    add a1, s2, zero
    la t1, _mini_bintreesearch
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l86
l95:
    li t0, 0
    add t0, t0, zero
    j l86
l86:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_buildTree
_mini_buildTree:
l97:
    addi sp, sp, -64
    sd s3, 40(sp)
    sd s4, 32(sp)
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s1, a0, zero
    li t1, 0
    add s3, t1, zero
    li s2, 0
    add a0, s1, zero
    la t1, _mini_size
    jalr t1
    add t1, a0, zero
    slt t1, s2, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s4, s1, zero
    add s1, s3, zero
    add s2, s2, zero
    add a0, s3, zero
    bne t1, zero, l98
    j l100
l98.inter:
    add t1, s4, zero
    add s4, t1, zero
    add s1, s1, zero
    add s2, s2, zero
    j l98
l98:
    add a0, s4, zero
    add a1, s2, zero
    la t1, _mini_get
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    add a1, t1, zero
    la t1, _mini_treeadd
    jalr t1
    add s1, a0, zero
    li t1, 1
    add s2, s2, t1
    add a0, s4, zero
    la t1, _mini_size
    jalr t1
    add t1, a0, zero
    slt t1, s2, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add a0, s1, zero
    bne t1, zero, l98.inter
    j l100
l100:
    add a0, a0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    ld s4, 32(sp)
    ld s3, 40(sp)
    addi sp, sp, 64
    ret

.globl _mini_treeMain
_mini_treeMain:
l102:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add t1, a0, zero
    add a0, t1, zero
    la t1, _mini_buildTree
    jalr t1
    add s2, a0, zero
    add a0, s2, zero
    la t1, _mini_treeprint
    jalr t1
    li a1, -999
    la t1, L.550.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s2, zero
    la t1, _mini_inOrder
    jalr t1
    add s1, a0, zero
    add a0, s1, zero
    la t1, _mini_printList
    jalr t1
    li a1, -999
    la t1, L.558.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    la t1, _mini_freeList
    jalr t1
    add a0, s2, zero
    la t1, _mini_postOrder
    jalr t1
    add s1, a0, zero
    add a0, s1, zero
    la t1, _mini_printList
    jalr t1
    li a1, -999
    la t1, L.566.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    la t1, _mini_freeList
    jalr t1
    li t1, 0
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_treesearch
    jalr t1
    add a1, a0, zero
    la t1, L.573.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.578.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 10
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_treesearch
    jalr t1
    add a1, a0, zero
    la t1, L.585.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.590.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, -2
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_treesearch
    jalr t1
    add a1, a0, zero
    la t1, L.597.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.605.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 2
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_treesearch
    jalr t1
    add a1, a0, zero
    la t1, L.612.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.617.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 3
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_treesearch
    jalr t1
    add a1, a0, zero
    la t1, L.624.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.629.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 9
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_treesearch
    jalr t1
    add a1, a0, zero
    la t1, L.636.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.641.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_treesearch
    jalr t1
    add a1, a0, zero
    la t1, L.648.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.653.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_bintreesearch
    jalr t1
    add a1, a0, zero
    la t1, L.660.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.665.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 10
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_bintreesearch
    jalr t1
    add a1, a0, zero
    la t1, L.672.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.677.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, -2
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_bintreesearch
    jalr t1
    add a1, a0, zero
    la t1, L.684.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.692.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 2
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_bintreesearch
    jalr t1
    add a1, a0, zero
    la t1, L.699.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.704.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 3
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_bintreesearch
    jalr t1
    add a1, a0, zero
    la t1, L.711.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.716.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 9
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_bintreesearch
    jalr t1
    add a1, a0, zero
    la t1, L.723.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.728.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add a0, s2, zero
    add a1, t1, zero
    la t1, _mini_bintreesearch
    jalr t1
    add a1, a0, zero
    la t1, L.735.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li a1, -999
    la t1, L.740.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    add a0, s2, zero
    la t1, _mini_freeTree
    jalr t1
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_myCopy
_mini_myCopy:
l104:
    addi sp, sp, -48
    sd s1, 24(sp)
    sd s2, 16(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    add s2, a0, zero
    li t1, 0
    add t1, t1, zero
    sub t1, s2, t1
    sltiu t1, t1, 1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    bne t1, zero, l105
    j l107
l105:
    li t0, 0
    add t0, t0, zero
    add t0, t0, zero
    j l103
l107:
    li a1, 0
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 0
    add t1, t1, zero
    ld s1, (t1)
    add t1, a1, zero
    add a0, t1, zero
    add a1, s1, zero
    la t1, _mini_add
    jalr t1
    add s1, a0, zero
    li t1, 16
    li a0, 0
    mul t1, t1, a0
    add t1, t1, s2
    addi t1, t1, 8
    add t1, t1, zero
    ld t1, (t1)
    add a0, t1, zero
    la t1, _mini_myCopy
    jalr t1
    add t1, a0, zero
    add a0, s1, zero
    add a1, t1, zero
    la t1, _mini_concatLists
    jalr t1
    add t0, a0, zero
    add t0, t0, zero
    j l103
l103:
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 16(sp)
    ld s1, 24(sp)
    addi sp, sp, 48
    ret

.globl _mini_main
_mini_main:
l109:
    addi sp, sp, -80
    sd s3, 64(sp)
    sd s4, 56(sp)
    sd s6, 48(sp)
    sd s5, 40(sp)
    sd s1, 32(sp)
    sd s2, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li t1, 0
    add s3, t1, zero
    li t1, 0
    add s4, t1, zero
    li t1, 0
    add s2, t1, zero
    li s1, 0
    li t1, 10
    slt t1, s1, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s5, s1, zero
    add s6, s3, zero
    add s1, s2, zero
    add a0, s3, zero
    add s2, s4, zero
    bne t1, zero, l110
    j l112
l110.inter:
    add s5, s3, zero
    add s6, s4, zero
    j l110
l110:
    la t1, L.808.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    ld t1, 16(fp)
    add a0, s6, zero
    add a1, t1, zero
    la t1, _mini_add
    jalr t1
    add s4, a0, zero
    add a0, s4, zero
    la t1, _mini_myCopy
    jalr t1
    add s2, a0, zero
    add a0, s4, zero
    la t1, _mini_myCopy
    jalr t1
    add s1, a0, zero
    add a0, s2, zero
    la t1, _mini_quickSortMain
    jalr t1
    add t1, a0, zero
    add a0, t1, zero
    la t1, _mini_freeList
    jalr t1
    add a0, s1, zero
    la t1, _mini_treeMain
    jalr t1
    li t1, 1
    add s3, s5, t1
    li t1, 10
    slt t1, s3, t1
    li a0, 0
    sub t1, t1, a0
    sltu t1, zero, t1
    add s1, s1, zero
    add a0, s4, zero
    add s2, s2, zero
    bne t1, zero, l110.inter
    j l112
l112:
    add a0, a0, zero
    la t1, _mini_freeList
    jalr t1
    add a0, s2, zero
    la t1, _mini_freeList
    jalr t1
    add a0, s1, zero
    la t1, _mini_freeList
    jalr t1
    li t0, 0
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 24(sp)
    ld s1, 32(sp)
    ld s5, 40(sp)
    ld s6, 48(sp)
    ld s4, 56(sp)
    ld s3, 64(sp)
    addi sp, sp, 80
    ret

.globl main
main:
l114:
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
_mini_a:
	.zero 8
_mini_b:
	.zero 8
_mini_i:
	.zero 8
L.114.string:
	.asciz "%ld\n"
L.132.string:
	.asciz "%ld\n"
L.349.string:
	.asciz "%ld\n"
L.356.string:
	.asciz "%ld\n"
L.363.string:
	.asciz "%ld\n"
L.377.string:
	.asciz "%ld\n"
L.464.string:
	.asciz "%ld\n"
L.550.string:
	.asciz "%ld\n"
L.558.string:
	.asciz "%ld\n"
L.566.string:
	.asciz "%ld\n"
L.573.string:
	.asciz "%ld\n"
L.578.string:
	.asciz "%ld\n"
L.585.string:
	.asciz "%ld\n"
L.590.string:
	.asciz "%ld\n"
L.597.string:
	.asciz "%ld\n"
L.605.string:
	.asciz "%ld\n"
L.612.string:
	.asciz "%ld\n"
L.617.string:
	.asciz "%ld\n"
L.624.string:
	.asciz "%ld\n"
L.629.string:
	.asciz "%ld\n"
L.636.string:
	.asciz "%ld\n"
L.641.string:
	.asciz "%ld\n"
L.648.string:
	.asciz "%ld\n"
L.653.string:
	.asciz "%ld\n"
L.660.string:
	.asciz "%ld\n"
L.665.string:
	.asciz "%ld\n"
L.672.string:
	.asciz "%ld\n"
L.677.string:
	.asciz "%ld\n"
L.684.string:
	.asciz "%ld\n"
L.692.string:
	.asciz "%ld\n"
L.699.string:
	.asciz "%ld\n"
L.704.string:
	.asciz "%ld\n"
L.711.string:
	.asciz "%ld\n"
L.716.string:
	.asciz "%ld\n"
L.723.string:
	.asciz "%ld\n"
L.728.string:
	.asciz "%ld\n"
L.735.string:
	.asciz "%ld\n"
L.740.string:
	.asciz "%ld\n"
L.808.string:
	.asciz "%ld"
