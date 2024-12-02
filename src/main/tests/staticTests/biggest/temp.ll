%struct._mini_IntList = type {
    i64,
    ptr
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)

@.r13 = private unnamed_addr constant [4 x i8] c"%ld\00"



@.r85 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define ptr @_mini_getIntList() {
l2:
    %r8 = alloca i64
    %r10 = alloca i64
	store i64 16, ptr %r10
	%r9 = load i64, ptr %r10
    %r96 = alloca i64
	store i64 -1, ptr %r96
	%r95 = load i64, ptr %r96
    %r23 = alloca i1
	store i1 0, ptr %r23
	%r22 = load i1, ptr %r23
    %r28 = alloca ptr
	store ptr null, ptr %r28
	%r27 = load ptr, ptr %r28
    %r11 = call ptr @malloc(i64 %r9)
    %r12 = bitcast ptr %r11 to %struct._mini_IntList*
    %r14 = call i32 @scanf(ptr @.r13, ptr %r8)
    %r15 = load i64, ptr %r8
    %r21 = icmp eq i64 %r15, %r95
    %r24 = icmp ne i1 %r21, %r22
    br i1 %r24, label %l3, label %l4
l3:
    %r25 = load i64, ptr %r8
    %r26 = getelementptr inbounds %struct._mini_IntList, ptr %r12, i32 0, i32 0
    store i64 %r25, ptr %r26
    %r29 = getelementptr inbounds %struct._mini_IntList, ptr %r12, i32 0, i32 1
    %r30 = bitcast ptr %r27 to %struct._mini_IntList*
    store ptr %r30, ptr %r29
    br label %l1
l4:
    %r31 = load i64, ptr %r8
    %r32 = getelementptr inbounds %struct._mini_IntList, ptr %r12, i32 0, i32 0
    store i64 %r31, ptr %r32
    %r33 = call ptr @_mini_getIntList()
    %r34 = getelementptr inbounds %struct._mini_IntList, ptr %r12, i32 0, i32 1
    store ptr %r33, ptr %r34
    br label %l1
l1:
    %r35 = phi ptr [%r12, %l3], [%r12, %l4]
    ret ptr %r35
}
define i64 @_mini_biggest(i64 %r37, i64 %r38) {
l6:
    %r41 = alloca i1
	store i1 0, ptr %r41
	%r40 = load i1, ptr %r41
    %r39 = icmp sgt i64 %r37, %r38
    %r42 = icmp ne i1 %r39, %r40
    br i1 %r42, label %l5, label %l8
l8:
    br label %l5
l5:
    %r43 = phi i64 [%r37, %l6], [%r38, %l8]
    ret i64 %r43
}
define i64 @_mini_biggestInList(ptr %r45) {
l10:
    %r53 = alloca ptr
	store ptr null, ptr %r53
	%r52 = load ptr, ptr %r53
    %r58 = alloca i1
	store i1 0, ptr %r58
	%r57 = load i1, ptr %r58
    %r71 = alloca ptr
	store ptr null, ptr %r71
	%r70 = load ptr, ptr %r71
    %r76 = alloca i1
	store i1 0, ptr %r76
	%r75 = load i1, ptr %r76
    %r48 = getelementptr inbounds %struct._mini_IntList, ptr %r45, i32 0, i32 0
    %r49 = load i64, ptr %r48
    %r50 = getelementptr inbounds %struct._mini_IntList, ptr %r45, i32 0, i32 1
    %r51 = load ptr, ptr %r50
    %r54 = bitcast ptr %r52 to %struct._mini_IntList*
    %r55 = icmp ne ptr %r51, %r54
    %r56 = icmp ne i1 %r55, %r57
    br i1 %r56, label %l11, label %l13
l11:
    %r59 = phi ptr [%r65, %l11], [%r45, %l10]
    %r60 = phi i64 [%r63, %l11], [%r49, %l10]
    %r61 = getelementptr inbounds %struct._mini_IntList, ptr %r59, i32 0, i32 0
    %r62 = load i64, ptr %r61
    %r63 = call i64 @_mini_biggest(i64 %r60, i64 %r62)
    %r64 = getelementptr inbounds %struct._mini_IntList, ptr %r59, i32 0, i32 1
    %r65 = load ptr, ptr %r64
    %r68 = getelementptr inbounds %struct._mini_IntList, ptr %r65, i32 0, i32 1
    %r69 = load ptr, ptr %r68
    %r72 = bitcast ptr %r70 to %struct._mini_IntList*
    %r73 = icmp ne ptr %r69, %r72
    %r74 = icmp ne i1 %r73, %r75
    br i1 %r74, label %l11, label %l13
l13:
    %r78 = phi i64 [%r63, %l11], [%r49, %l10]
    ret i64 %r78
}
define i64 @_mini_main() {
l15:
    %r89 = alloca i64
	store i64 0, ptr %r89
	%r88 = load i64, ptr %r89
    %r84 = call ptr @_mini_getIntList()
    %r86 = call i64 @_mini_biggestInList(ptr %r84)
    %r87 = call i32 @printf(ptr @.r85, i64 %r86)
    ret i64 %r88
}
define i32 @main() {
l17:
    %r92 = call i64 @_mini_main()
    %r93 = trunc i64 %r92 to i32
    ret i32 %r93
}
