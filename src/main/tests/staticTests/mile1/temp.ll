%struct._mini_Power = type {
    i64,
    i64
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)


@.r54 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r58 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r108 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_calcPower(i64 %r5, i64 %r6) {
l2:
    %r10 = alloca i64
	store i64 1, ptr %r10
	%r9 = load i64, ptr %r10
    %r12 = alloca i64
	store i64 0, ptr %r12
	%r11 = load i64, ptr %r12
    %r16 = alloca i1
	store i1 0, ptr %r16
	%r15 = load i1, ptr %r16
    %r22 = alloca i64
	store i64 1, ptr %r22
	%r21 = load i64, ptr %r22
    %r28 = alloca i64
	store i64 0, ptr %r28
	%r27 = load i64, ptr %r28
    %r32 = alloca i1
	store i1 0, ptr %r32
	%r31 = load i1, ptr %r32
    %r13 = icmp sgt i64 %r6, %r11
    %r14 = icmp ne i1 %r13, %r15
    br i1 %r14, label %l3, label %l5
l3:
    %r17 = phi i64 [%r5, %l2], [%r17, %l3]
    %r18 = phi i64 [%r6, %l2], [%r23, %l3]
    %r19 = phi i64 [%r9, %l2], [%r20, %l3]
    %r20 = mul i64 %r19, %r17
    %r23 = sub i64 %r18, %r21
    %r29 = icmp sgt i64 %r23, %r27
    %r30 = icmp ne i1 %r29, %r31
    br i1 %r30, label %l3, label %l5
l5:
    %r35 = phi i64 [%r9, %l2], [%r20, %l3]
    ret i64 %r35
}
define i64 @_mini_main() {
l7:
    %r41 = alloca i64
    %r49 = alloca i64
	store i64 0, ptr %r49
	%r48 = load i64, ptr %r49
    %r51 = alloca i64
	store i64 16, ptr %r51
	%r50 = load i64, ptr %r51
    %r62 = alloca i64
	store i64 0, ptr %r62
	%r61 = load i64, ptr %r62
    %r65 = alloca i1
	store i1 0, ptr %r65
	%r64 = load i1, ptr %r65
    %r118 = alloca i64
	store i64 -1, ptr %r118
	%r117 = load i64, ptr %r118
    %r75 = alloca i64
	store i64 0, ptr %r75
	%r74 = load i64, ptr %r75
    %r77 = alloca i64
	store i64 1000000, ptr %r77
	%r76 = load i64, ptr %r77
    %r81 = alloca i1
	store i1 0, ptr %r81
	%r80 = load i1, ptr %r81
    %r87 = alloca i64
	store i64 1, ptr %r87
	%r86 = load i64, ptr %r87
    %r99 = alloca i64
	store i64 1000000, ptr %r99
	%r98 = load i64, ptr %r99
    %r103 = alloca i1
	store i1 0, ptr %r103
	%r102 = load i1, ptr %r103
    %r111 = alloca i64
	store i64 0, ptr %r111
	%r110 = load i64, ptr %r111
    %r52 = call ptr @malloc(i64 %r50)
    %r53 = bitcast ptr %r52 to %struct._mini_Power*
    %r55 = call i32 @scanf(ptr @.r54, ptr %r41)
    %r56 = load i64, ptr %r41
    %r57 = getelementptr inbounds %struct._mini_Power, ptr %r53, i32 0, i32 0
    store i64 %r56, ptr %r57
    %r59 = call i32 @scanf(ptr @.r58, ptr %r41)
    %r60 = load i64, ptr %r41
    %r63 = icmp slt i64 %r60, %r61
    %r66 = icmp ne i1 %r63, %r64
    br i1 %r66, label %l8, label %l10
l8:
    br label %l6
l10:
    %r72 = load i64, ptr %r41
    %r73 = getelementptr inbounds %struct._mini_Power, ptr %r53, i32 0, i32 1
    store i64 %r72, ptr %r73
    %r78 = icmp slt i64 %r74, %r76
    %r79 = icmp ne i1 %r78, %r80
    br i1 %r79, label %l11, label %l13
l11:
    %r82 = phi ptr [%r82, %l11], [%r53, %l10]
    %r85 = phi i64 [%r88, %l11], [%r74, %l10]
    %r88 = add i64 %r85, %r86
    %r89 = getelementptr inbounds %struct._mini_Power, ptr %r82, i32 0, i32 0
    %r90 = load i64, ptr %r89
    %r91 = getelementptr inbounds %struct._mini_Power, ptr %r82, i32 0, i32 1
    %r92 = load i64, ptr %r91
    %r93 = call i64 @_mini_calcPower(i64 %r90, i64 %r92)
    %r100 = icmp slt i64 %r88, %r98
    %r101 = icmp ne i1 %r100, %r102
    br i1 %r101, label %l11, label %l13
l13:
    %r106 = phi i64 [%r93, %l11], [%r48, %l10]
    %r109 = call i32 @printf(ptr @.r108, i64 %r106)
    br label %l6
l6:
    %r112 = phi i64 [%r117, %l8], [%r110, %l13]
    ret i64 %r112
}
define i32 @main() {
l15:
    %r114 = call i64 @_mini_main()
    %r115 = trunc i64 %r114 to i32
    ret i32 %r115
}
