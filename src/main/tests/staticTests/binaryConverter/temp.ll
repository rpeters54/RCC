declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)





@.r123 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r149 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_wait(i64 %r5) {
l5:
    %r25 = alloca i64
	store i64 0, ptr %r25
	%r24 = load i64, ptr %r25
    ret i64 %r24
}
define i64 @_mini_power(i64 %r28, i64 %r29) {
l7:
    %r33 = alloca i64
	store i64 1, ptr %r33
	%r32 = load i64, ptr %r33
    %r35 = alloca i64
	store i64 0, ptr %r35
	%r34 = load i64, ptr %r35
    %r39 = alloca i1
	store i1 0, ptr %r39
	%r38 = load i1, ptr %r39
    %r45 = alloca i64
	store i64 1, ptr %r45
	%r44 = load i64, ptr %r45
    %r51 = alloca i64
	store i64 0, ptr %r51
	%r50 = load i64, ptr %r51
    %r55 = alloca i1
	store i1 0, ptr %r55
	%r54 = load i1, ptr %r55
    %r36 = icmp sgt i64 %r29, %r34
    %r37 = icmp ne i1 %r36, %r38
    br i1 %r37, label %l8, label %l10
l8:
    %r40 = phi i64 [%r29, %l7], [%r46, %l8]
    %r41 = phi i64 [%r28, %l7], [%r41, %l8]
    %r42 = phi i64 [%r32, %l7], [%r43, %l8]
    %r43 = mul i64 %r42, %r41
    %r46 = sub i64 %r40, %r44
    %r52 = icmp sgt i64 %r46, %r50
    %r53 = icmp ne i1 %r52, %r54
    br i1 %r53, label %l8, label %l10
l10:
    %r58 = phi i64 [%r32, %l7], [%r43, %l8]
    ret i64 %r58
}
define i64 @_mini_recursiveDecimalSum(i64 %r61, i64 %r62, i64 %r63) {
l12:
    %r71 = alloca i64
	store i64 0, ptr %r71
	%r70 = load i64, ptr %r71
    %r74 = alloca i1
	store i1 0, ptr %r74
	%r73 = load i1, ptr %r74
    %r77 = alloca i64
	store i64 2, ptr %r77
	%r76 = load i64, ptr %r77
    %r79 = alloca i64
	store i64 10, ptr %r79
	%r78 = load i64, ptr %r79
    %r82 = alloca i64
	store i64 10, ptr %r82
	%r81 = load i64, ptr %r82
    %r86 = alloca i64
	store i64 1, ptr %r86
	%r85 = load i64, ptr %r86
    %r89 = alloca i1
	store i1 0, ptr %r89
	%r88 = load i1, ptr %r89
    %r100 = alloca i64
	store i64 10, ptr %r100
	%r99 = load i64, ptr %r100
    %r103 = alloca i64
	store i64 1, ptr %r103
	%r102 = load i64, ptr %r103
    %r72 = icmp sgt i64 %r61, %r70
    %r75 = icmp ne i1 %r72, %r73
    br i1 %r75, label %l13, label %l11
l13:
    %r80 = sdiv i64 %r61, %r78
    %r83 = mul i64 %r80, %r81
    %r84 = sub i64 %r61, %r83
    %r87 = icmp eq i64 %r84, %r85
    %r90 = icmp ne i1 %r87, %r88
    br i1 %r90, label %l15, label %l17
l15:
    %r91 = call i64 @_mini_power(i64 %r76, i64 %r63)
    %r92 = add i64 %r62, %r91
    br label %l17
l17:
    %r93 = phi i64 [%r61, %l15], [%r61, %l13]
    %r97 = phi i64 [%r92, %l15], [%r62, %l13]
    %r98 = phi i64 [%r63, %l15], [%r63, %l13]
    %r101 = sdiv i64 %r93, %r99
    %r104 = add i64 %r98, %r102
    %r105 = call i64 @_mini_recursiveDecimalSum(i64 %r101, i64 %r97, i64 %r104)
    br label %l11
l11:
    %r106 = phi i64 [%r105, %l17], [%r62, %l12]
    ret i64 %r106
}
define i64 @_mini_convertToDecimal(i64 %r108) {
l20:
    %r114 = alloca i64
	store i64 0, ptr %r114
	%r113 = load i64, ptr %r114
    %r116 = alloca i64
	store i64 0, ptr %r116
	%r115 = load i64, ptr %r116
    %r117 = call i64 @_mini_recursiveDecimalSum(i64 %r108, i64 %r115, i64 %r113)
    ret i64 %r117
}
define i64 @_mini_main() {
l22:
    %r120 = alloca i64
    %r131 = alloca i64
	store i64 0, ptr %r131
	%r130 = load i64, ptr %r131
    %r135 = alloca i1
	store i1 0, ptr %r135
	%r134 = load i1, ptr %r135
    %r139 = alloca i64
	store i64 1, ptr %r139
	%r138 = load i64, ptr %r139
    %r143 = alloca i64
	store i64 0, ptr %r143
	%r142 = load i64, ptr %r143
    %r147 = alloca i1
	store i1 0, ptr %r147
	%r146 = load i1, ptr %r147
    %r153 = alloca i64
	store i64 0, ptr %r153
	%r152 = load i64, ptr %r153
    %r124 = call i32 @scanf(ptr @.r123, ptr %r120)
    %r125 = load i64, ptr %r120
    %r126 = call i64 @_mini_convertToDecimal(i64 %r125)
    store i64 %r126, ptr %r120
    %r127 = load i64, ptr %r120
    %r128 = load i64, ptr %r120
    %r129 = mul i64 %r127, %r128
    %r132 = icmp sgt i64 %r129, %r130
    %r133 = icmp ne i1 %r132, %r134
    br i1 %r133, label %l23, label %l25
l23:
    %r136 = phi i64 [%r140, %l23], [%r129, %l22]
    %r137 = call i64 @_mini_wait(i64 %r136)
    %r140 = sub i64 %r136, %r138
    %r144 = icmp sgt i64 %r140, %r142
    %r145 = icmp ne i1 %r144, %r146
    br i1 %r145, label %l23, label %l25
l25:
    %r150 = load i64, ptr %r120
    %r151 = call i32 @printf(ptr @.r149, i64 %r150)
    ret i64 %r152
}
define i32 @main() {
l27:
    %r156 = call i64 @_mini_main()
    %r157 = trunc i64 %r156 to i32
    ret i32 %r157
}
