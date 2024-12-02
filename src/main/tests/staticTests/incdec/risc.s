.section .text
.globl main
main:
l2:
    addi sp, sp, -160
    fsd fs3, 136(sp)
    sd s3, 128(sp)
    sd s4, 120(sp)
    fsd fs0, 112(sp)
    fsd fs2, 104(sp)
    sd s5, 96(sp)
    sd s1, 88(sp)
    fsd fs1, 80(sp)
    sd s2, 72(sp)
    sd ra, 0(sp)
    sd fp, 8(sp)
    add fp, sp, zero
    li s5, 102
    slli t1, s5, 8
    srai s4, t1, 8
    slli t1, s4, 16
    srai s3, t1, 16
    slli t1, s3, 32
    srai a1, t1, 32
    li t1, 0x4010000000000000
    sd t1, 16(fp)
    fld fs3, 16(fp)
    fcvt.s.d fs1, fs3
    li t1, 1
    add s1, a1, t1
    la t1, L.22.string
    add a0, t1, zero
    add a1, a1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.27.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    sub s2, s1, t1
    la t1, L.29.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.34.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add s1, s2, t1
    la t1, L.36.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.41.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    sub s1, s1, t1
    la t1, L.43.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.48.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add t1, s3, t1
    slli t1, t1, 32
    srai s1, t1, 32
    la t1, L.50.string
    add a0, t1, zero
    add a1, s3, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.55.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    sub t1, s1, t1
    slli t1, t1, 32
    srai s2, t1, 32
    la t1, L.57.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.62.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add t1, s2, t1
    slli t1, t1, 32
    srai s1, t1, 32
    la t1, L.64.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.69.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    sub t1, s1, t1
    slli t1, t1, 32
    srai s1, t1, 32
    la t1, L.71.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.76.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add t1, s4, t1
    slli t1, t1, 48
    srai s1, t1, 48
    la t1, L.78.string
    add a0, t1, zero
    add a1, s4, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.83.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    sub t1, s1, t1
    slli t1, t1, 48
    srai s2, t1, 48
    la t1, L.85.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.90.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    add t1, s2, t1
    slli t1, t1, 48
    srai s1, t1, 48
    la t1, L.92.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.97.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 1
    sub t1, s1, t1
    slli t1, t1, 48
    srai s1, t1, 48
    la t1, L.99.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.104.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li s1, 103
    la t1, L.106.string
    add a0, t1, zero
    add a1, s5, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.111.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li s2, 102
    la t1, L.113.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.118.string
    add a0, t1, zero
    add a1, s2, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li s1, 103
    la t1, L.120.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.125.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li s1, 102
    la t1, L.127.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.132.string
    add a0, t1, zero
    add a1, s1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x3f800000
    sd t1, 24(fp)
    flw fs0, 24(fp)
    fadd.s fs2, fs1, fs0
    fcvt.d.s fs0, fs1
    la t1, L.134.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fcvt.d.s fs0, fs2
    la t1, L.140.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x3f800000
    sd t1, 28(fp)
    flw fs0, 28(fp)
    fsub.s fs1, fs2, fs0
    fcvt.d.s fs0, fs2
    la t1, L.143.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fcvt.d.s fs0, fs1
    la t1, L.149.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x3f800000
    sd t1, 32(fp)
    flw fs0, 32(fp)
    fadd.s fs1, fs1, fs0
    fcvt.d.s fs0, fs1
    la t1, L.152.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fcvt.d.s fs0, fs1
    la t1, L.158.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x3f800000
    sd t1, 36(fp)
    flw fs0, 36(fp)
    fsub.s fs1, fs1, fs0
    fcvt.d.s fs0, fs1
    la t1, L.161.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    fcvt.d.s fs0, fs1
    la t1, L.167.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x4014000000000000
    sd t1, 40(fp)
    fld fs0, 40(fp)
    la t1, L.170.string
    add a0, t1, zero
    fmv.x.d t1, fs3
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.175.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x4010000000000000
    sd t1, 48(fp)
    fld fs1, 48(fp)
    la t1, L.177.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.182.string
    add a0, t1, zero
    fmv.x.d t1, fs1
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x4014000000000000
    sd t1, 56(fp)
    fld fs0, 56(fp)
    la t1, L.184.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.189.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    li t1, 0x4010000000000000
    sd t1, 64(fp)
    fld fs0, 64(fp)
    la t1, L.191.string
    add a0, t1, zero
    fmv.x.d t1, fs0
    add a1, t1, zero
    la t1, printf
    jalr t1
    add t1, a0, zero
    la t1, L.196.string
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
    ld s2, 72(sp)
    fld fs1, 80(sp)
    ld s1, 88(sp)
    ld s5, 96(sp)
    fld fs2, 104(sp)
    fld fs0, 112(sp)
    ld s4, 120(sp)
    ld s3, 128(sp)
    fld fs3, 136(sp)
    addi sp, sp, 160
    ret

.section .data
L.22.string:
	.asciz "before post-inc: %ld\n"
L.27.string:
	.asciz "after post-inc: %ld\n"
L.29.string:
	.asciz "before post-dec: %ld\n"
L.34.string:
	.asciz "after post-dec: %ld\n"
L.36.string:
	.asciz "before pre-inc: %ld\n"
L.41.string:
	.asciz "after pre-inc: %ld\n"
L.43.string:
	.asciz "before pre-dec: %ld\n"
L.48.string:
	.asciz "after pre-dec: %ld\n"
L.50.string:
	.asciz "before post-inc: %d\n"
L.55.string:
	.asciz "after post-inc: %d\n"
L.57.string:
	.asciz "before post-dec: %d\n"
L.62.string:
	.asciz "after post-dec: %d\n"
L.64.string:
	.asciz "before pre-inc: %d\n"
L.69.string:
	.asciz "after pre-inc: %d\n"
L.71.string:
	.asciz "before pre-dec: %d\n"
L.76.string:
	.asciz "after pre-dec: %d\n"
L.78.string:
	.asciz "before post-inc: %d\n"
L.83.string:
	.asciz "after post-inc: %d\n"
L.85.string:
	.asciz "before post-dec: %d\n"
L.90.string:
	.asciz "after post-dec: %d\n"
L.92.string:
	.asciz "before pre-inc: %d\n"
L.97.string:
	.asciz "after pre-inc: %d\n"
L.99.string:
	.asciz "before pre-dec: %d\n"
L.104.string:
	.asciz "after pre-dec: %d\n"
L.106.string:
	.asciz "before post-inc: %c\n"
L.111.string:
	.asciz "after post-inc: %c\n"
L.113.string:
	.asciz "before post-dec: %c\n"
L.118.string:
	.asciz "after post-dec: %c\n"
L.120.string:
	.asciz "before pre-inc: %c\n"
L.125.string:
	.asciz "after pre-inc: %c\n"
L.127.string:
	.asciz "before pre-dec: %c\n"
L.132.string:
	.asciz "after pre-dec: %c\n"
L.134.string:
	.asciz "before post-inc: %f\n"
L.140.string:
	.asciz "after post-inc: %f\n"
L.143.string:
	.asciz "before post-dec: %f\n"
L.149.string:
	.asciz "after post-dec: %f\n"
L.152.string:
	.asciz "before pre-inc: %f\n"
L.158.string:
	.asciz "after pre-inc: %f\n"
L.161.string:
	.asciz "before pre-dec: %f\n"
L.167.string:
	.asciz "after pre-dec: %f\n"
L.170.string:
	.asciz "before post-inc: %f\n"
L.175.string:
	.asciz "after post-inc: %f\n"
L.177.string:
	.asciz "before post-dec: %f\n"
L.182.string:
	.asciz "after post-dec: %f\n"
L.184.string:
	.asciz "before pre-inc: %f\n"
L.189.string:
	.asciz "after pre-inc: %f\n"
L.191.string:
	.asciz "before pre-dec: %f\n"
L.196.string:
	.asciz "after pre-dec: %f\n"
