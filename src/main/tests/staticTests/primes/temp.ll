declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)



@.r102 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r116 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_isqrt(i64 %r5) {
l2:
    %r11 = alloca i64
	store i64 1, ptr %r11
	%r10 = load i64, ptr %r11
    %r13 = alloca i64
	store i64 3, ptr %r13
	%r12 = load i64, ptr %r13
    %r17 = alloca i1
	store i1 0, ptr %r17
	%r16 = load i1, ptr %r17
    %r23 = alloca i64
	store i64 2, ptr %r23
	%r22 = load i64, ptr %r23
    %r31 = alloca i1
	store i1 0, ptr %r31
	%r30 = load i1, ptr %r31
    %r36 = alloca i64
	store i64 2, ptr %r36
	%r35 = load i64, ptr %r36
    %r39 = alloca i64
	store i64 1, ptr %r39
	%r38 = load i64, ptr %r39
    %r14 = icmp sle i64 %r10, %r5
    %r15 = icmp ne i1 %r14, %r16
    br i1 %r15, label %l3, label %l5
l3:
    %r18 = phi i64 [%r18, %l3], [%r5, %l2]
    %r19 = phi i64 [%r21, %l3], [%r10, %l2]
    %r20 = phi i64 [%r24, %l3], [%r12, %l2]
    %r21 = add i64 %r19, %r20
    %r24 = add i64 %r20, %r22
    %r28 = icmp sle i64 %r21, %r18
    %r29 = icmp ne i1 %r28, %r30
    br i1 %r29, label %l3, label %l5
l5:
    %r34 = phi i64 [%r24, %l3], [%r12, %l2]
    %r37 = sdiv i64 %r34, %r35
    %r40 = sub i64 %r37, %r38
    ret i64 %r40
}
define i64 @_mini_prime(i64 %r43) {
l7:
    %r51 = alloca i64
	store i64 2, ptr %r51
	%r50 = load i64, ptr %r51
    %r54 = alloca i1
	store i1 0, ptr %r54
	%r53 = load i1, ptr %r54
    %r57 = alloca i64
	store i64 0, ptr %r57
	%r56 = load i64, ptr %r57
    %r60 = alloca i64
	store i64 2, ptr %r60
	%r59 = load i64, ptr %r60
    %r64 = alloca i1
	store i1 0, ptr %r64
	%r63 = load i1, ptr %r64
    %r73 = alloca i64
	store i64 0, ptr %r73
	%r72 = load i64, ptr %r73
    %r76 = alloca i1
	store i1 0, ptr %r76
	%r75 = load i1, ptr %r76
    %r79 = alloca i64
	store i64 0, ptr %r79
	%r78 = load i64, ptr %r79
    %r81 = alloca i64
	store i64 1, ptr %r81
	%r80 = load i64, ptr %r81
    %r90 = alloca i1
	store i1 0, ptr %r90
	%r89 = load i1, ptr %r90
    %r96 = alloca i64
	store i64 1, ptr %r96
	%r95 = load i64, ptr %r96
    %r52 = icmp slt i64 %r43, %r50
    %r55 = icmp ne i1 %r52, %r53
    br i1 %r55, label %l8, label %l9
l8:
    br label %l6
l9:
    %r58 = call i64 @_mini_isqrt(i64 %r43)
    %r61 = icmp sle i64 %r59, %r58
    %r62 = icmp ne i1 %r61, %r63
    br i1 %r62, label %l10, label %l12
l10:
    %r65 = phi i64 [%r65, %l15], [%r43, %l9]
    %r66 = phi i64 [%r66, %l15], [%r58, %l9]
    %r68 = phi i64 [%r82, %l15], [%r59, %l9]
    %r69 = sdiv i64 %r65, %r68
    %r70 = mul i64 %r69, %r68
    %r71 = sub i64 %r65, %r70
    %r74 = icmp eq i64 %r71, %r72
    %r77 = icmp ne i1 %r74, %r75
    br i1 %r77, label %l13, label %l15
l13:
    br label %l6
l15:
    %r82 = add i64 %r68, %r80
    %r87 = icmp sle i64 %r82, %r66
    %r88 = icmp ne i1 %r87, %r89
    br i1 %r88, label %l10, label %l12
l12:
    br label %l6
l6:
    %r97 = phi i64 [%r56, %l8], [%r78, %l13], [%r95, %l12]
    ret i64 %r97
}
define i64 @_mini_main() {
l17:
    %r99 = alloca i64
    %r105 = alloca i64
	store i64 0, ptr %r105
	%r104 = load i64, ptr %r105
    %r110 = alloca i1
	store i1 0, ptr %r110
	%r109 = load i1, ptr %r110
    %r114 = alloca i64
	store i64 0, ptr %r114
	%r113 = load i64, ptr %r114
    %r120 = alloca i64
	store i64 1, ptr %r120
	%r119 = load i64, ptr %r120
    %r127 = alloca i1
	store i1 0, ptr %r127
	%r126 = load i1, ptr %r127
    %r130 = alloca i64
	store i64 0, ptr %r130
	%r129 = load i64, ptr %r130
    %r103 = call i32 @scanf(ptr @.r102, ptr %r99)
    %r106 = load i64, ptr %r99
    %r107 = icmp sle i64 %r104, %r106
    %r108 = icmp ne i1 %r107, %r109
    br i1 %r108, label %l18, label %l20
l18:
    %r111 = phi i64 [%r121, %l23], [%r104, %l17]
    %r112 = call i64 @_mini_prime(i64 %r111)
    %r115 = icmp ne i64 %r112, %r113
    br i1 %r115, label %l21, label %l23
l21:
    %r117 = call i32 @printf(ptr @.r116, i64 %r111)
    br label %l23
l23:
    %r118 = phi i64 [%r111, %l18], [%r111, %l21]
    %r121 = add i64 %r118, %r119
    %r123 = load i64, ptr %r99
    %r124 = icmp sle i64 %r121, %r123
    %r125 = icmp ne i1 %r124, %r126
    br i1 %r125, label %l18, label %l20
l20:
    ret i64 %r129
}
define i32 @main() {
l25:
    %r133 = call i64 @_mini_main()
    %r134 = trunc i64 %r133 to i32
    ret i32 %r134
}
