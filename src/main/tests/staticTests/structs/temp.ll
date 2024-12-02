%struct.test = type {
    i32,
    float,
    double,
    i64
}

%struct.Node = type {
    i8,
    ptr
}

declare i32 @printf(ptr, ...)
declare i32 @getchar()

@.r49 = private unnamed_addr constant [14 x i8] c"Gimme a char\0A\00"
@.r55 = private unnamed_addr constant [19 x i8] c"Got Character: %c\0A\00"
@.r91 = private unnamed_addr constant [4 x i8] c"%c\0A\00"
define i32 @main() {
l2:
    %r3 = alloca [4 x %struct.Node]
    %r10 = alloca i64
	store i64 1, ptr %r10
	%r9 = load i64, ptr %r10
    %r13 = alloca i64
	store i64 0, ptr %r13
	%r12 = load i64, ptr %r13
    %r17 = alloca i64
	store i64 2, ptr %r17
	%r16 = load i64, ptr %r17
    %r20 = alloca i64
	store i64 1, ptr %r20
	%r19 = load i64, ptr %r20
    %r24 = alloca i64
	store i64 3, ptr %r24
	%r23 = load i64, ptr %r24
    %r27 = alloca i64
	store i64 2, ptr %r27
	%r26 = load i64, ptr %r27
    %r31 = alloca i64
	store i64 0, ptr %r31
	%r30 = load i64, ptr %r31
    %r34 = alloca i64
	store i64 3, ptr %r34
	%r33 = load i64, ptr %r34
    %r38 = alloca i64
	store i64 0, ptr %r38
	%r37 = load i64, ptr %r38
    %r41 = alloca i64
	store i64 4, ptr %r41
	%r40 = load i64, ptr %r41
    %r46 = alloca i1
	store i1 0, ptr %r46
	%r45 = load i1, ptr %r46
    %r63 = alloca i64
	store i64 1, ptr %r63
	%r62 = load i64, ptr %r63
    %r68 = alloca i64
	store i64 4, ptr %r68
	%r67 = load i64, ptr %r68
    %r73 = alloca i1
	store i1 0, ptr %r73
	%r72 = load i1, ptr %r73
    %r77 = alloca i64
	store i64 0, ptr %r77
	%r76 = load i64, ptr %r77
    %r80 = alloca i64
	store i64 0, ptr %r80
	%r79 = load i64, ptr %r80
    %r83 = alloca i64
	store i64 10, ptr %r83
	%r82 = load i64, ptr %r83
    %r88 = alloca i1
	store i1 0, ptr %r88
	%r87 = load i1, ptr %r88
    %r100 = alloca i64
	store i64 1, ptr %r100
	%r99 = load i64, ptr %r100
    %r105 = alloca i64
	store i64 10, ptr %r105
	%r104 = load i64, ptr %r105
    %r110 = alloca i1
	store i1 0, ptr %r110
	%r109 = load i1, ptr %r110
    %r114 = alloca i64
	store i64 0, ptr %r114
	%r113 = load i64, ptr %r114
    %r11 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r9
    %r14 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r12
    %r15 = getelementptr inbounds %struct.Node, ptr %r14, i32 0, i32 1
    store ptr %r11, ptr %r15
    %r18 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r16
    %r21 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r19
    %r22 = getelementptr inbounds %struct.Node, ptr %r21, i32 0, i32 1
    store ptr %r18, ptr %r22
    %r25 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r23
    %r28 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r26
    %r29 = getelementptr inbounds %struct.Node, ptr %r28, i32 0, i32 1
    store ptr %r25, ptr %r29
    %r32 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r30
    %r35 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r33
    %r36 = getelementptr inbounds %struct.Node, ptr %r35, i32 0, i32 1
    store ptr %r32, ptr %r36
    %r39 = trunc i64 %r37 to i32
    %r42 = sext i32 %r39 to i64
    %r43 = icmp slt i64 %r42, %r40
    %r44 = icmp ne i1 %r43, %r45
    br i1 %r44, label %l3, label %l5
l3:
    %r48 = phi i32 [%r66, %l3], [%r39, %l2]
    %r50 = call i32 @printf(ptr @.r49)
    %r51 = call i32 @getchar()
    %r52 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i32 %r48
    %r53 = getelementptr inbounds %struct.Node, ptr %r52, i32 0, i32 0
    %r54 = trunc i32 %r51 to i8
    store i8 %r54, ptr %r53
    %r56 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i32 %r48
    %r57 = getelementptr inbounds %struct.Node, ptr %r56, i32 0, i32 0
    %r58 = load i8, ptr %r57
    %r59 = call i32 @printf(ptr @.r55, i8 %r58)
    %r64 = sext i32 %r48 to i64
    %r65 = add i64 %r64, %r62
    %r66 = trunc i64 %r65 to i32
    %r69 = sext i32 %r66 to i64
    %r70 = icmp slt i64 %r69, %r67
    %r71 = icmp ne i1 %r70, %r72
    br i1 %r71, label %l3, label %l5
l5:
    %r78 = getelementptr inbounds [4 x %struct.Node], ptr %r3, i32 0, i64 %r76
    %r81 = trunc i64 %r79 to i32
    %r84 = sext i32 %r81 to i64
    %r85 = icmp slt i64 %r84, %r82
    %r86 = icmp ne i1 %r85, %r87
    br i1 %r86, label %l6, label %l8
l6:
    %r89 = phi ptr [%r96, %l6], [%r78, %l5]
    %r90 = phi i32 [%r103, %l6], [%r81, %l5]
    %r92 = getelementptr inbounds %struct.Node, ptr %r89, i32 0, i32 0
    %r93 = load i8, ptr %r92
    %r94 = call i32 @printf(ptr @.r91, i8 %r93)
    %r95 = getelementptr inbounds %struct.Node, ptr %r89, i32 0, i32 1
    %r96 = load ptr, ptr %r95
    %r101 = sext i32 %r90 to i64
    %r102 = add i64 %r101, %r99
    %r103 = trunc i64 %r102 to i32
    %r106 = sext i32 %r103 to i64
    %r107 = icmp slt i64 %r106, %r104
    %r108 = icmp ne i1 %r107, %r109
    br i1 %r108, label %l6, label %l8
l8:
    %r115 = trunc i64 %r113 to i32
    ret i32 %r115
}
