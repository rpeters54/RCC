declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)



@.r63 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r65 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r71 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r76 = private unnamed_addr constant [4 x i8] c"%ld\00"

define i64 @_mini_sum(i64 %r5, i64 %r6) {
l2:
    %r7 = add i64 %r5, %r6
    ret i64 %r7
}
define i64 @_mini_fact(i64 %r10) {
l4:
    %r14 = alloca i64
	store i64 1, ptr %r14
	%r13 = load i64, ptr %r14
    %r17 = alloca i64
	store i64 0, ptr %r17
	%r16 = load i64, ptr %r17
    %r22 = alloca i1
	store i1 0, ptr %r22
	%r21 = load i1, ptr %r22
    %r24 = alloca i1
	store i1 0, ptr %r24
	%r23 = load i1, ptr %r24
    %r27 = alloca i64
	store i64 1, ptr %r27
	%r26 = load i64, ptr %r27
    %r29 = alloca i64
	store i64 1, ptr %r29
	%r28 = load i64, ptr %r29
    %r32 = alloca i1
	store i1 0, ptr %r32
	%r31 = load i1, ptr %r32
    %r96 = alloca i64
	store i64 -1, ptr %r96
	%r95 = load i64, ptr %r96
    %r42 = alloca i64
	store i64 1, ptr %r42
	%r41 = load i64, ptr %r42
    %r15 = icmp eq i64 %r10, %r13
    %r18 = icmp eq i64 %r10, %r16
    %r19 = or i1 %r15, %r18
    %r20 = icmp ne i1 %r19, %r21
    %r25 = icmp ne i1 %r20, %r23
    br i1 %r25, label %l5, label %l7
l5:
    br label %l3
l7:
    %r30 = icmp sle i64 %r10, %r28
    %r33 = icmp ne i1 %r30, %r31
    br i1 %r33, label %l8, label %l10
l8:
    %r39 = mul i64 %r95, %r10
    %r40 = call i64 @_mini_fact(i64 %r39)
    br label %l3
l10:
    %r43 = sub i64 %r10, %r41
    %r44 = call i64 @_mini_fact(i64 %r43)
    %r45 = mul i64 %r10, %r44
    br label %l3
l3:
    %r46 = phi i64 [%r26, %l5], [%r40, %l8], [%r45, %l10]
    ret i64 %r46
}
define i64 @_mini_main() {
l12:
    %r48 = alloca i64
    %r49 = alloca i64
    %r50 = alloca i64
    %r52 = alloca i64
	store i64 0, ptr %r52
	%r51 = load i64, ptr %r52
    %r98 = alloca i64
	store i64 -1, ptr %r98
	%r97 = load i64, ptr %r98
    %r62 = alloca i1
	store i1 0, ptr %r62
	%r61 = load i1, ptr %r62
    %r100 = alloca i64
	store i64 -1, ptr %r100
	%r99 = load i64, ptr %r100
    %r87 = alloca i1
	store i1 0, ptr %r87
	%r86 = load i1, ptr %r87
    %r89 = alloca i64
	store i64 0, ptr %r89
	%r88 = load i64, ptr %r89
    store i64 %r51, ptr %r50
    %r53 = load i64, ptr %r50
    %r59 = icmp ne i64 %r53, %r97
    %r60 = icmp ne i1 %r59, %r61
    br i1 %r60, label %l13, label %l15
l13:
    %r64 = call i32 @scanf(ptr @.r63, ptr %r48)
    %r66 = call i32 @scanf(ptr @.r65, ptr %r49)
    %r67 = load i64, ptr %r48
    %r68 = call i64 @_mini_fact(i64 %r67)
    store i64 %r68, ptr %r48
    %r69 = load i64, ptr %r49
    %r70 = call i64 @_mini_fact(i64 %r69)
    store i64 %r70, ptr %r49
    %r72 = load i64, ptr %r48
    %r73 = load i64, ptr %r49
    %r74 = call i64 @_mini_sum(i64 %r72, i64 %r73)
    %r75 = call i32 @printf(ptr @.r71, i64 %r74)
    %r77 = call i32 @scanf(ptr @.r76, ptr %r50)
    %r78 = load i64, ptr %r50
    %r84 = icmp ne i64 %r78, %r99
    %r85 = icmp ne i1 %r84, %r86
    br i1 %r85, label %l13, label %l15
l15:
    ret i64 %r88
}
define i32 @main() {
l17:
    %r92 = call i64 @_mini_main()
    %r93 = trunc i64 %r92 to i32
    ret i32 %r93
}
