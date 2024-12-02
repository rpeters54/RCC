declare i32 @rand()
declare i32 @printf(ptr, ...)


@.r49 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
define i32 @main() {
l2:
    %r6 = alloca [250 x i32]
    %r8 = alloca i64
	store i64 0, ptr %r8
	%r7 = load i64, ptr %r8
    %r11 = alloca i64
	store i64 250, ptr %r11
	%r10 = load i64, ptr %r11
    %r16 = alloca i1
	store i1 0, ptr %r16
	%r15 = load i1, ptr %r16
    %r22 = alloca i64
	store i64 1, ptr %r22
	%r21 = load i64, ptr %r22
    %r27 = alloca i64
	store i64 250, ptr %r27
	%r26 = load i64, ptr %r27
    %r32 = alloca i1
	store i1 0, ptr %r32
	%r31 = load i1, ptr %r32
    %r36 = alloca i64
	store i64 250, ptr %r36
	%r35 = load i64, ptr %r36
    %r39 = alloca i64
	store i64 0, ptr %r39
	%r38 = load i64, ptr %r39
    %r42 = alloca i64
	store i64 250, ptr %r42
	%r41 = load i64, ptr %r42
    %r47 = alloca i1
	store i1 0, ptr %r47
	%r46 = load i1, ptr %r47
    %r55 = alloca i64
	store i64 1, ptr %r55
	%r54 = load i64, ptr %r55
    %r60 = alloca i64
	store i64 250, ptr %r60
	%r59 = load i64, ptr %r60
    %r65 = alloca i1
	store i1 0, ptr %r65
	%r64 = load i1, ptr %r65
    %r68 = alloca i64
	store i64 0, ptr %r68
	%r67 = load i64, ptr %r68
    %r9 = trunc i64 %r7 to i32
    %r12 = sext i32 %r9 to i64
    %r13 = icmp slt i64 %r12, %r10
    %r14 = icmp ne i1 %r13, %r15
    br i1 %r14, label %l3, label %l5
l3:
    %r17 = phi i32 [%r25, %l3], [%r9, %l2]
    %r18 = call i32 @rand()
    %r19 = getelementptr inbounds [250 x i32], ptr %r6, i32 0, i32 %r17
    store i32 %r18, ptr %r19
    %r23 = sext i32 %r17 to i64
    %r24 = add i64 %r23, %r21
    %r25 = trunc i64 %r24 to i32
    %r28 = sext i32 %r25 to i64
    %r29 = icmp slt i64 %r28, %r26
    %r30 = icmp ne i1 %r29, %r31
    br i1 %r30, label %l3, label %l5
l5:
    %r34 = bitcast ptr %r6 to i32*
    %r37 = trunc i64 %r35 to i32
    call void @selection_sort(ptr %r34, i32 %r37)
    %r40 = trunc i64 %r38 to i32
    %r43 = sext i32 %r40 to i64
    %r44 = icmp slt i64 %r43, %r41
    %r45 = icmp ne i1 %r44, %r46
    br i1 %r45, label %l6, label %l8
l6:
    %r48 = phi i32 [%r58, %l6], [%r40, %l5]
    %r50 = getelementptr inbounds [250 x i32], ptr %r6, i32 0, i32 %r48
    %r51 = load i32, ptr %r50
    %r52 = call i32 @printf(ptr @.r49, i32 %r51)
    %r56 = sext i32 %r48 to i64
    %r57 = add i64 %r56, %r54
    %r58 = trunc i64 %r57 to i32
    %r61 = sext i32 %r58 to i64
    %r62 = icmp slt i64 %r61, %r59
    %r63 = icmp ne i1 %r62, %r64
    br i1 %r63, label %l6, label %l8
l8:
    %r69 = trunc i64 %r67 to i32
    ret i32 %r69
}
define void @selection_sort(ptr %r71, i32 %r72) {
l10:
    %r80 = alloca i64
	store i64 1, ptr %r80
	%r79 = load i64, ptr %r80
    %r84 = alloca i1
	store i1 0, ptr %r84
	%r83 = load i1, ptr %r84
    %r87 = alloca i64
	store i64 0, ptr %r87
	%r86 = load i64, ptr %r87
    %r90 = alloca i64
	store i64 0, ptr %r90
	%r89 = load i64, ptr %r90
    %r95 = alloca i1
	store i1 0, ptr %r95
	%r94 = load i1, ptr %r95
    %r107 = alloca i1
	store i1 0, ptr %r107
	%r106 = load i1, ptr %r107
    %r120 = alloca i64
	store i64 1, ptr %r120
	%r119 = load i64, ptr %r120
    %r127 = alloca i1
	store i1 0, ptr %r127
	%r126 = load i1, ptr %r127
    %r134 = alloca i64
	store i64 0, ptr %r134
	%r133 = load i64, ptr %r134
    %r140 = alloca i64
	store i64 0, ptr %r140
	%r139 = load i64, ptr %r140
    %r144 = alloca i64
	store i64 1, ptr %r144
	%r143 = load i64, ptr %r144
    %r147 = alloca i64
	store i64 1, ptr %r147
	%r146 = load i64, ptr %r147
    %r81 = sext i32 %r72 to i64
    %r82 = icmp sle i64 %r81, %r79
    %r85 = icmp ne i1 %r82, %r83
    br i1 %r85, label %l9, label %l13
l13:
    %r88 = trunc i64 %r86 to i32
    %r91 = trunc i64 %r89 to i32
    %r92 = icmp slt i32 %r91, %r72
    %r93 = icmp ne i1 %r92, %r94
    br i1 %r93, label %l14, label %l16
l14:
    %r96 = phi ptr [%r71, %l13], [%r109, %l19]
    %r98 = phi i32 [%r72, %l13], [%r111, %l19]
    %r99 = phi i32 [%r88, %l13], [%r112, %l19]
    %r100 = phi i32 [%r91, %l13], [%r123, %l19]
    %r101 = getelementptr inbounds i32, ptr %r96, i32 %r100
    %r102 = load i32, ptr %r101
    %r103 = getelementptr inbounds i32, ptr %r96, i32 %r99
    %r104 = load i32, ptr %r103
    %r105 = icmp slt i32 %r102, %r104
    %r108 = icmp ne i1 %r105, %r106
    br i1 %r108, label %l19, label %l18
l18:
    br label %l19
l19:
    %r109 = phi ptr [%r96, %l18], [%r96, %l14]
    %r111 = phi i32 [%r98, %l18], [%r98, %l14]
    %r112 = phi i32 [%r99, %l18], [%r100, %l14]
    %r113 = phi i32 [%r100, %l18], [%r100, %l14]
    %r121 = sext i32 %r113 to i64
    %r122 = add i64 %r121, %r119
    %r123 = trunc i64 %r122 to i32
    %r124 = icmp slt i32 %r123, %r111
    %r125 = icmp ne i1 %r124, %r126
    br i1 %r125, label %l14, label %l16
l16:
    %r128 = phi ptr [%r71, %l13], [%r109, %l19]
    %r130 = phi i32 [%r72, %l13], [%r111, %l19]
    %r131 = phi i32 [%r88, %l13], [%r112, %l19]
    %r135 = getelementptr inbounds i32, ptr %r128, i64 %r133
    %r136 = load i32, ptr %r135
    %r137 = getelementptr inbounds i32, ptr %r128, i32 %r131
    %r138 = load i32, ptr %r137
    %r141 = getelementptr inbounds i32, ptr %r128, i64 %r139
    store i32 %r138, ptr %r141
    %r142 = getelementptr inbounds i32, ptr %r128, i32 %r131
    store i32 %r136, ptr %r142
    %r145 = getelementptr inbounds i32, ptr %r128, i64 %r143
    %r148 = sext i32 %r130 to i64
    %r149 = sub i64 %r148, %r146
    %r150 = trunc i64 %r149 to i32
    call void @selection_sort(ptr %r145, i32 %r150)
    br label %l9
l9:
    ret void
}
