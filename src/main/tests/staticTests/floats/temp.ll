declare i32 @printf(ptr, ...)
declare i32 @rand()
declare void @srand(i32)

@.r15 = private unnamed_addr constant [17 x i8] c"Trying Doubles:\0A\00"
@.r28 = private unnamed_addr constant [16 x i8] c"Iteration %d: \0A\00"
@.r34 = private unnamed_addr constant [11 x i8] c"da is %ld\0A\00"
@.r38 = private unnamed_addr constant [11 x i8] c"db is %ld\0A\00"
@.r45 = private unnamed_addr constant [10 x i8] c"Add: %ld\0A\00"
@.r52 = private unnamed_addr constant [10 x i8] c"Sub: %ld\0A\00"
@.r59 = private unnamed_addr constant [15 x i8] c"Multiply: %ld\0A\00"
@.r66 = private unnamed_addr constant [13 x i8] c"Divide: %ld\0A\00"
@.r84 = private unnamed_addr constant [16 x i8] c"Trying Floats:\0A\00"
@.r97 = private unnamed_addr constant [16 x i8] c"Iteration %d: \0A\00"
@.r103 = private unnamed_addr constant [10 x i8] c"fa is %d\0A\00"
@.r107 = private unnamed_addr constant [10 x i8] c"fb is %d\0A\00"
@.r114 = private unnamed_addr constant [9 x i8] c"Add: %d\0A\00"
@.r121 = private unnamed_addr constant [9 x i8] c"Sub: %d\0A\00"
@.r128 = private unnamed_addr constant [14 x i8] c"Multiply: %d\0A\00"
@.r135 = private unnamed_addr constant [12 x i8] c"Divide: %d\0A\00"
define i32 @main() {
l2:
    %r6 = alloca double
    %r7 = alloca double
    %r8 = alloca double
    %r9 = alloca float
    %r10 = alloca float
    %r11 = alloca float
    %r13 = alloca i64
	store i64 0, ptr %r13
	%r12 = load i64, ptr %r13
    %r18 = alloca i64
	store i64 0, ptr %r18
	%r17 = load i64, ptr %r18
    %r21 = alloca i64
	store i64 1000, ptr %r21
	%r20 = load i64, ptr %r21
    %r26 = alloca i1
	store i1 0, ptr %r26
	%r25 = load i1, ptr %r26
    %r72 = alloca i64
	store i64 1, ptr %r72
	%r71 = load i64, ptr %r72
    %r77 = alloca i64
	store i64 1000, ptr %r77
	%r76 = load i64, ptr %r77
    %r82 = alloca i1
	store i1 0, ptr %r82
	%r81 = load i1, ptr %r82
    %r87 = alloca i64
	store i64 0, ptr %r87
	%r86 = load i64, ptr %r87
    %r90 = alloca i64
	store i64 1000, ptr %r90
	%r89 = load i64, ptr %r90
    %r95 = alloca i1
	store i1 0, ptr %r95
	%r94 = load i1, ptr %r95
    %r141 = alloca i64
	store i64 1, ptr %r141
	%r140 = load i64, ptr %r141
    %r146 = alloca i64
	store i64 1000, ptr %r146
	%r145 = load i64, ptr %r146
    %r151 = alloca i1
	store i1 0, ptr %r151
	%r150 = load i1, ptr %r151
    %r154 = alloca i64
	store i64 0, ptr %r154
	%r153 = load i64, ptr %r154
    %r14 = trunc i64 %r12 to i32
    call void @srand(i32 %r14)
    %r16 = call i32 @printf(ptr @.r15)
    %r19 = trunc i64 %r17 to i32
    %r22 = sext i32 %r19 to i64
    %r23 = icmp slt i64 %r22, %r20
    %r24 = icmp ne i1 %r23, %r25
    br i1 %r24, label %l3, label %l5
l3:
    %r27 = phi i32 [%r19, %l2], [%r75, %l3]
    %r29 = call i32 @printf(ptr @.r28, i32 %r27)
    %r30 = call i32 @rand()
    %r31 = sitofp i32 %r30 to double
    store double %r31, ptr %r6
    %r32 = call i32 @rand()
    %r33 = sitofp i32 %r32 to double
    store double %r33, ptr %r7
    %r35 = bitcast ptr %r6 to i64*
    %r36 = load i64, ptr %r35
    %r37 = call i32 @printf(ptr @.r34, i64 %r36)
    %r39 = bitcast ptr %r7 to i64*
    %r40 = load i64, ptr %r39
    %r41 = call i32 @printf(ptr @.r38, i64 %r40)
    %r42 = load double, ptr %r6
    %r43 = load double, ptr %r7
    %r44 = fadd double %r42, %r43
    store double %r44, ptr %r8
    %r46 = bitcast ptr %r8 to i64*
    %r47 = load i64, ptr %r46
    %r48 = call i32 @printf(ptr @.r45, i64 %r47)
    %r49 = load double, ptr %r6
    %r50 = load double, ptr %r7
    %r51 = fsub double %r49, %r50
    store double %r51, ptr %r8
    %r53 = bitcast ptr %r8 to i64*
    %r54 = load i64, ptr %r53
    %r55 = call i32 @printf(ptr @.r52, i64 %r54)
    %r56 = load double, ptr %r6
    %r57 = load double, ptr %r7
    %r58 = fmul double %r56, %r57
    store double %r58, ptr %r8
    %r60 = bitcast ptr %r8 to i64*
    %r61 = load i64, ptr %r60
    %r62 = call i32 @printf(ptr @.r59, i64 %r61)
    %r63 = load double, ptr %r6
    %r64 = load double, ptr %r7
    %r65 = fdiv double %r63, %r64
    store double %r65, ptr %r8
    %r67 = bitcast ptr %r8 to i64*
    %r68 = load i64, ptr %r67
    %r69 = call i32 @printf(ptr @.r66, i64 %r68)
    %r73 = sext i32 %r27 to i64
    %r74 = add i64 %r73, %r71
    %r75 = trunc i64 %r74 to i32
    %r78 = sext i32 %r75 to i64
    %r79 = icmp slt i64 %r78, %r76
    %r80 = icmp ne i1 %r79, %r81
    br i1 %r80, label %l3, label %l5
l5:
    %r85 = call i32 @printf(ptr @.r84)
    %r88 = trunc i64 %r86 to i32
    %r91 = sext i32 %r88 to i64
    %r92 = icmp slt i64 %r91, %r89
    %r93 = icmp ne i1 %r92, %r94
    br i1 %r93, label %l6, label %l8
l6:
    %r96 = phi i32 [%r88, %l5], [%r144, %l6]
    %r98 = call i32 @printf(ptr @.r97, i32 %r96)
    %r99 = call i32 @rand()
    %r100 = sitofp i32 %r99 to float
    store float %r100, ptr %r9
    %r101 = call i32 @rand()
    %r102 = sitofp i32 %r101 to float
    store float %r102, ptr %r10
    %r104 = bitcast ptr %r9 to i32*
    %r105 = load i32, ptr %r104
    %r106 = call i32 @printf(ptr @.r103, i32 %r105)
    %r108 = bitcast ptr %r10 to i32*
    %r109 = load i32, ptr %r108
    %r110 = call i32 @printf(ptr @.r107, i32 %r109)
    %r111 = load float, ptr %r9
    %r112 = load float, ptr %r10
    %r113 = fadd float %r111, %r112
    store float %r113, ptr %r11
    %r115 = bitcast ptr %r11 to i32*
    %r116 = load i32, ptr %r115
    %r117 = call i32 @printf(ptr @.r114, i32 %r116)
    %r118 = load float, ptr %r9
    %r119 = load float, ptr %r10
    %r120 = fsub float %r118, %r119
    store float %r120, ptr %r11
    %r122 = bitcast ptr %r11 to i32*
    %r123 = load i32, ptr %r122
    %r124 = call i32 @printf(ptr @.r121, i32 %r123)
    %r125 = load float, ptr %r9
    %r126 = load float, ptr %r10
    %r127 = fmul float %r125, %r126
    store float %r127, ptr %r11
    %r129 = bitcast ptr %r11 to i32*
    %r130 = load i32, ptr %r129
    %r131 = call i32 @printf(ptr @.r128, i32 %r130)
    %r132 = load float, ptr %r9
    %r133 = load float, ptr %r10
    %r134 = fdiv float %r132, %r133
    store float %r134, ptr %r11
    %r136 = bitcast ptr %r11 to i32*
    %r137 = load i32, ptr %r136
    %r138 = call i32 @printf(ptr @.r135, i32 %r137)
    %r142 = sext i32 %r96 to i64
    %r143 = add i64 %r142, %r140
    %r144 = trunc i64 %r143 to i32
    %r147 = sext i32 %r144 to i64
    %r148 = icmp slt i64 %r147, %r145
    %r149 = icmp ne i1 %r148, %r150
    br i1 %r149, label %l6, label %l8
l8:
    %r155 = trunc i64 %r153 to i32
    ret i32 %r155
}
