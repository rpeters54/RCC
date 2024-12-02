.section .text
.globl convertToCelsius
convertToCelsius:
l2:
    addi sp, sp, -48
    fsd fs0, 32(sp)
    fsd fs1, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    fadd.d fs1, fa0, fs0
    fmv.d.x fs0, zero
    la t1, L.4.string
    add a0, t1, zero
    fmv.x.d t1, fs1
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0x3fe1c71c71c71c72
    sd t0, 16(fp)
    fld ft1, 16(fp)
    li t0, 32
    fcvt.d.lu ft0, t0
    fsub.d ft0, fs1, ft0
    fmul.d ft0, ft1, ft0
    fmv.d.x ft1, zero
    fadd.d fa0, ft0, ft1
    ld ra, 0(sp)
    ld fp, 8(sp)
    fld fs1, 24(sp)
    fld fs0, 32(sp)
    addi sp, sp, 48
    ret

.globl convertToFahrenheit
convertToFahrenheit:
l4:
    addi sp, sp, -48
    fsd fs0, 32(sp)
    fsd fs1, 24(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    fadd.d fs1, fa0, fs0
    fmv.d.x fs0, zero
    la t1, L.19.string
    add a0, t1, zero
    fmv.x.d t1, fs1
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0x3ffccccccccccccd
    sd t0, 16(fp)
    fld ft0, 16(fp)
    fmul.d ft0, ft0, fs1
    li t0, 32
    fcvt.d.lu ft1, t0
    fadd.d ft0, ft0, ft1
    fmv.d.x ft1, zero
    fadd.d fa0, ft0, ft1
    ld ra, 0(sp)
    ld fp, 8(sp)
    fld fs1, 24(sp)
    fld fs0, 32(sp)
    addi sp, sp, 48
    ret

.globl main
main:
l6:
    addi sp, sp, -80
    fsd fs3, 68(sp)
    fsd fs0, 60(sp)
    fsd fs2, 52(sp)
    sd s1, 44(sp)
    fsd fs1, 36(sp)
    sd s2, 28(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    la t1, L.37.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.39.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.41.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.43.string
    add a0, t1, zero
    addi t1, fp, 16
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    la t1, L.45.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.47.string
    add a0, t1, zero
    addi t1, fp, 20
    add a1, t1, zero
    la t1, scanf
    jalr t1
    add t1, a0, zero
    lb t1, 16(fp)
    li s1, 99
    sub t1, t1, s1
    sltiu s2, t1, 1
    lb t1, 16(fp)
    li s1, 67
    sub t1, t1, s1
    sltiu t1, t1, 1
    or t1, s2, t1
    slli t1, t1, 63
    srai t1, t1, 63
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    bne t1, zero, l7
    j l8
l7:
    fld fa0, 20(fp)
    fmv.d.x fs0, zero
    fadd.d fa0, fa0, fs0
    la t1, convertToFahrenheit
    jalr t1
    fmv.d.x fs0, zero
    fadd.d fs1, fa0, fs0
    fmv.d.x fs0, zero
    fadd.d fs0, fs2, fs0
    fmv.d.x fs2, zero
    fadd.d fs0, fs1, fs0
    j l12
l8:
    lb t1, 16(fp)
    li s1, 102
    sub t1, t1, s1
    sltiu s2, t1, 1
    lb t1, 16(fp)
    li s1, 70
    sub t1, t1, s1
    sltiu t1, t1, 1
    or t1, s2, t1
    slli t1, t1, 63
    srai t1, t1, 63
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    li s1, 0
    sub t1, t1, s1
    sltu t1, zero, t1
    bne t1, zero, l9
    j l10
l9:
    fld fa0, 20(fp)
    fmv.d.x fs0, zero
    fadd.d fa0, fa0, fs0
    la t1, convertToCelsius
    jalr t1
    fmv.d.x fs0, zero
    fadd.d fs1, fa0, fs0
    fmv.d.x fs0, zero
    fadd.d fs0, fs2, fs0
    fmv.d.x fs2, zero
    fadd.d fs1, fs1, fs0
    j l11
l10:
    li t1, 0
    fcvt.d.lu fs1, t1
    la t1, L.86.string
    add a0, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fmv.d.x fs0, zero
    fadd.d fs0, fs2, fs0
    fmv.d.x fs2, zero
    fadd.d fs1, fs1, fs0
    j l11
l11:
    fmv.d.x fs0, zero
    fadd.d fs0, fs3, fs0
    fmv.d.x fs3, zero
    fadd.d fs0, fs1, fs0
    j l12
l12:
    la t1, L.90.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t0, a0, zero
    li t0, 0
    slli t0, t0, 32
    srai t0, t0, 32
    add a0, t0, zero
    ld ra, 0(sp)
    ld fp, 8(sp)
    ld s2, 28(sp)
    fld fs1, 36(sp)
    ld s1, 44(sp)
    fld fs2, 52(sp)
    fld fs0, 60(sp)
    fld fs3, 68(sp)
    addi sp, sp, 80
    ret

.section .data
L.4.string:
	.asciz "Turning %f Fahrenheit to Celsius\n"
L.19.string:
	.asciz "Turning %f Celsius to Fahrenheit\n"
L.37.string:
	.asciz "Select Conversion Mode:\n"
L.39.string:
	.asciz "(c/C for Celsius to Fahrenheit)\n"
L.41.string:
	.asciz "(f/F for Fahrenheit to Celsius)\n"
L.43.string:
	.asciz "%c\n"
L.45.string:
	.asciz "Gimme the Temp\n"
L.47.string:
	.asciz "%lf\n"
L.86.string:
	.asciz "Invalid Selection\n"
L.90.string:
	.asciz "Current Temp = %f degrees\n"
