declare i32 @printf(ptr, ...)

@.r5 = private unnamed_addr constant [20 x i8] c"Testing While Loop\0A\00"
@.r15 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@.r31 = private unnamed_addr constant [18 x i8] c"Testing For Loop\0A\00"
@.r44 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@.r60 = private unnamed_addr constant [28 x i8] c"Testing Do-Loop Auto Entry\0A\00"
@.r63 = private unnamed_addr constant [17 x i8] c"Got Here Anyway\0A\00"
@.r74 = private unnamed_addr constant [30 x i8] c"Testing Proper Do-Loop Entry\0A\00"
@.r80 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@.r89 = private unnamed_addr constant [7 x i8] c"Broke\0A\00"
define i32 @main() {
l2:
    %r3 = alloca i64
	store i64 0, ptr %r3
	%r2 = load i64, ptr %r3
    %r8 = alloca i64
	store i64 100, ptr %r8
	%r7 = load i64, ptr %r8
    %r13 = alloca i1
	store i1 0, ptr %r13
	%r12 = load i1, ptr %r13
    %r18 = alloca i64
	store i64 1, ptr %r18
	%r17 = load i64, ptr %r18
    %r24 = alloca i64
	store i64 100, ptr %r24
	%r23 = load i64, ptr %r24
    %r29 = alloca i1
	store i1 0, ptr %r29
	%r28 = load i1, ptr %r29
    %r34 = alloca i64
	store i64 0, ptr %r34
	%r33 = load i64, ptr %r34
    %r37 = alloca i64
	store i64 100, ptr %r37
	%r36 = load i64, ptr %r37
    %r42 = alloca i1
	store i1 0, ptr %r42
	%r41 = load i1, ptr %r42
    %r48 = alloca i64
	store i64 1, ptr %r48
	%r47 = load i64, ptr %r48
    %r53 = alloca i64
	store i64 100, ptr %r53
	%r52 = load i64, ptr %r53
    %r58 = alloca i1
	store i1 0, ptr %r58
	%r57 = load i1, ptr %r58
    %r67 = alloca i64
	store i64 100, ptr %r67
	%r66 = load i64, ptr %r67
    %r72 = alloca i1
	store i1 0, ptr %r72
	%r71 = load i1, ptr %r72
    %r77 = alloca i64
	store i64 0, ptr %r77
	%r76 = load i64, ptr %r77
    %r83 = alloca i64
	store i64 33, ptr %r83
	%r82 = load i64, ptr %r83
    %r87 = alloca i1
	store i1 0, ptr %r87
	%r86 = load i1, ptr %r87
    %r92 = alloca i64
	store i64 1, ptr %r92
	%r91 = load i64, ptr %r92
    %r98 = alloca i64
	store i64 100, ptr %r98
	%r97 = load i64, ptr %r98
    %r103 = alloca i1
	store i1 0, ptr %r103
	%r102 = load i1, ptr %r103
    %r106 = alloca i64
	store i64 0, ptr %r106
	%r105 = load i64, ptr %r106
    %r4 = trunc i64 %r2 to i32
    %r6 = call i32 @printf(ptr @.r5)
    %r9 = sext i32 %r4 to i64
    %r10 = icmp slt i64 %r9, %r7
    %r11 = icmp ne i1 %r10, %r12
    br i1 %r11, label %l3, label %l5
l3:
    %r14 = phi i32 [%r4, %l2], [%r21, %l3]
    %r16 = call i32 @printf(ptr @.r15, i32 %r14)
    %r19 = sext i32 %r14 to i64
    %r20 = add i64 %r19, %r17
    %r21 = trunc i64 %r20 to i32
    %r25 = sext i32 %r21 to i64
    %r26 = icmp slt i64 %r25, %r23
    %r27 = icmp ne i1 %r26, %r28
    br i1 %r27, label %l3, label %l5
l5:
    %r32 = call i32 @printf(ptr @.r31)
    %r35 = trunc i64 %r33 to i32
    %r38 = sext i32 %r35 to i64
    %r39 = icmp slt i64 %r38, %r36
    %r40 = icmp ne i1 %r39, %r41
    br i1 %r40, label %l6, label %l8
l6:
    %r43 = phi i32 [%r35, %l5], [%r51, %l6]
    %r45 = call i32 @printf(ptr @.r44, i32 %r43)
    %r49 = sext i32 %r43 to i64
    %r50 = add i64 %r49, %r47
    %r51 = trunc i64 %r50 to i32
    %r54 = sext i32 %r51 to i64
    %r55 = icmp slt i64 %r54, %r52
    %r56 = icmp ne i1 %r55, %r57
    br i1 %r56, label %l6, label %l8
l8:
    %r59 = phi i32 [%r35, %l5], [%r51, %l6]
    %r61 = call i32 @printf(ptr @.r60)
    br label %l9
l9:
    %r62 = phi i32 [%r62, %l9], [%r59, %l8]
    %r64 = call i32 @printf(ptr @.r63)
    %r68 = sext i32 %r62 to i64
    %r69 = icmp slt i64 %r68, %r66
    %r70 = icmp ne i1 %r69, %r71
    br i1 %r70, label %l9, label %l11
l11:
    %r75 = call i32 @printf(ptr @.r74)
    %r78 = trunc i64 %r76 to i32
    br label %l12
l12:
    %r79 = phi i32 [%r78, %l11], [%r95, %l17]
    %r81 = call i32 @printf(ptr @.r80, i32 %r79)
    %r84 = sext i32 %r79 to i64
    %r85 = icmp eq i64 %r84, %r82
    %r88 = icmp ne i1 %r85, %r86
    br i1 %r88, label %l15, label %l17
l15:
    %r90 = call i32 @printf(ptr @.r89)
    br label %l14
l17:
    %r93 = sext i32 %r79 to i64
    %r94 = add i64 %r93, %r91
    %r95 = trunc i64 %r94 to i32
    %r99 = sext i32 %r95 to i64
    %r100 = icmp slt i64 %r99, %r97
    %r101 = icmp ne i1 %r100, %r102
    br i1 %r101, label %l12, label %l14
l14:
    %r107 = trunc i64 %r105 to i32
    ret i32 %r107
}
