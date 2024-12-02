%struct._mini_intList = type {
    i64,
    ptr
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global i64 zeroinitializer




@.r77 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r95 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r114 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r129 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r144 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_length(ptr %r6) {
l2:
    %r8 = alloca ptr
	store ptr null, ptr %r8
	%r7 = load ptr, ptr %r8
    %r12 = alloca i1
	store i1 0, ptr %r12
	%r11 = load i1, ptr %r12
    %r15 = alloca i64
	store i64 0, ptr %r15
	%r14 = load i64, ptr %r15
    %r17 = alloca i64
	store i64 1, ptr %r17
	%r16 = load i64, ptr %r17
    %r9 = bitcast ptr %r7 to %struct._mini_intList*
    %r10 = icmp eq ptr %r6, %r9
    %r13 = icmp ne i1 %r10, %r11
    br i1 %r13, label %l3, label %l5
l3:
    br label %l1
l5:
    %r18 = getelementptr inbounds %struct._mini_intList, ptr %r6, i32 0, i32 1
    %r19 = load ptr, ptr %r18
    %r20 = call i64 @_mini_length(ptr %r19)
    %r21 = add i64 %r16, %r20
    br label %l1
l1:
    %r22 = phi i64 [%r14, %l3], [%r21, %l5]
    ret i64 %r22
}
define ptr @_mini_addToFront(ptr %r24, i64 %r25) {
l7:
    %r30 = alloca ptr
	store ptr null, ptr %r30
	%r29 = load ptr, ptr %r30
    %r34 = alloca i1
	store i1 0, ptr %r34
	%r33 = load i1, ptr %r34
    %r37 = alloca i64
	store i64 16, ptr %r37
	%r36 = load i64, ptr %r37
    %r42 = alloca ptr
	store ptr null, ptr %r42
	%r41 = load ptr, ptr %r42
    %r46 = alloca i64
	store i64 16, ptr %r46
	%r45 = load i64, ptr %r46
    %r31 = bitcast ptr %r29 to %struct._mini_intList*
    %r32 = icmp eq ptr %r24, %r31
    %r35 = icmp ne i1 %r32, %r33
    br i1 %r35, label %l8, label %l10
l8:
    %r38 = call ptr @malloc(i64 %r36)
    %r39 = bitcast ptr %r38 to %struct._mini_intList*
    %r40 = getelementptr inbounds %struct._mini_intList, ptr %r39, i32 0, i32 0
    store i64 %r25, ptr %r40
    %r43 = getelementptr inbounds %struct._mini_intList, ptr %r39, i32 0, i32 1
    %r44 = bitcast ptr %r41 to %struct._mini_intList*
    store ptr %r44, ptr %r43
    br label %l6
l10:
    %r47 = call ptr @malloc(i64 %r45)
    %r48 = bitcast ptr %r47 to %struct._mini_intList*
    %r49 = getelementptr inbounds %struct._mini_intList, ptr %r48, i32 0, i32 0
    store i64 %r25, ptr %r49
    %r50 = getelementptr inbounds %struct._mini_intList, ptr %r48, i32 0, i32 1
    store ptr %r24, ptr %r50
    br label %l6
l6:
    %r51 = phi ptr [%r39, %l8], [%r48, %l10]
    ret ptr %r51
}
define ptr @_mini_deleteFirst(ptr %r53) {
l12:
    %r58 = alloca ptr
	store ptr null, ptr %r58
	%r57 = load ptr, ptr %r58
    %r62 = alloca i1
	store i1 0, ptr %r62
	%r61 = load i1, ptr %r62
    %r65 = alloca ptr
	store ptr null, ptr %r65
	%r64 = load ptr, ptr %r65
    %r59 = bitcast ptr %r57 to %struct._mini_intList*
    %r60 = icmp eq ptr %r53, %r59
    %r63 = icmp ne i1 %r60, %r61
    br i1 %r63, label %l13, label %l15
l13:
    %r66 = bitcast ptr %r64 to %struct._mini_intList*
    br label %l11
l15:
    %r67 = getelementptr inbounds %struct._mini_intList, ptr %r53, i32 0, i32 1
    %r68 = load ptr, ptr %r67
    %r69 = bitcast ptr %r53 to i8*
    call void @free(ptr %r69)
    br label %l11
l11:
    %r70 = phi ptr [%r66, %l13], [%r68, %l15]
    ret ptr %r70
}
define i64 @_mini_main() {
l17:
    %r80 = alloca i64
	store i64 0, ptr %r80
	%r79 = load i64, ptr %r80
    %r82 = alloca ptr
	store ptr null, ptr %r82
	%r81 = load ptr, ptr %r82
    %r86 = alloca i64
	store i64 0, ptr %r86
	%r85 = load i64, ptr %r86
    %r90 = alloca i1
	store i1 0, ptr %r90
	%r89 = load i1, ptr %r90
    %r101 = alloca i64
	store i64 1, ptr %r101
	%r100 = load i64, ptr %r101
    %r107 = alloca i64
	store i64 0, ptr %r107
	%r106 = load i64, ptr %r107
    %r111 = alloca i1
	store i1 0, ptr %r111
	%r110 = load i1, ptr %r111
    %r119 = alloca i64
	store i64 0, ptr %r119
	%r118 = load i64, ptr %r119
    %r123 = alloca i1
	store i1 0, ptr %r123
	%r122 = load i1, ptr %r123
    %r137 = alloca i64
	store i64 0, ptr %r137
	%r136 = load i64, ptr %r137
    %r141 = alloca i1
	store i1 0, ptr %r141
	%r140 = load i1, ptr %r141
    %r147 = alloca i64
	store i64 0, ptr %r147
	%r146 = load i64, ptr %r147
    %r78 = call i32 @scanf(ptr @.r77, ptr @.r4)
    %r83 = bitcast ptr %r81 to %struct._mini_intList*
    %r84 = load i64, ptr @.r4
    %r87 = icmp sgt i64 %r84, %r85
    %r88 = icmp ne i1 %r87, %r89
    br i1 %r88, label %l18, label %l20
l18:
    %r91 = phi ptr [%r83, %l17], [%r94, %l18]
    %r92 = phi i64 [%r79, %l17], [%r92, %l18]
    %r93 = load i64, ptr @.r4
    %r94 = call ptr @_mini_addToFront(ptr %r91, i64 %r93)
    %r96 = getelementptr inbounds %struct._mini_intList, ptr %r94, i32 0, i32 0
    %r97 = load i64, ptr %r96
    %r98 = call i32 @printf(ptr @.r95, i64 %r97)
    %r99 = load i64, ptr @.r4
    %r102 = sub i64 %r99, %r100
    store i64 %r102, ptr @.r4
    %r105 = load i64, ptr @.r4
    %r108 = icmp sgt i64 %r105, %r106
    %r109 = icmp ne i1 %r108, %r110
    br i1 %r109, label %l18, label %l20
l20:
    %r112 = phi ptr [%r83, %l17], [%r94, %l18]
    %r113 = phi i64 [%r79, %l17], [%r92, %l18]
    %r115 = call i64 @_mini_length(ptr %r112)
    %r116 = call i32 @printf(ptr @.r114, i64 %r115)
    %r117 = call i64 @_mini_length(ptr %r112)
    %r120 = icmp sgt i64 %r117, %r118
    %r121 = icmp ne i1 %r120, %r122
    br i1 %r121, label %l21, label %l23
l21:
    %r124 = phi ptr [%r112, %l20], [%r132, %l21]
    %r125 = phi i64 [%r113, %l20], [%r128, %l21]
    %r126 = getelementptr inbounds %struct._mini_intList, ptr %r124, i32 0, i32 0
    %r127 = load i64, ptr %r126
    %r128 = add i64 %r125, %r127
    %r130 = call i64 @_mini_length(ptr %r124)
    %r131 = call i32 @printf(ptr @.r129, i64 %r130)
    %r132 = call ptr @_mini_deleteFirst(ptr %r124)
    %r135 = call i64 @_mini_length(ptr %r132)
    %r138 = icmp sgt i64 %r135, %r136
    %r139 = icmp ne i1 %r138, %r140
    br i1 %r139, label %l21, label %l23
l23:
    %r143 = phi i64 [%r113, %l20], [%r128, %l21]
    %r145 = call i32 @printf(ptr @.r144, i64 %r143)
    ret i64 %r146
}
define i32 @main() {
l25:
    %r150 = call i64 @_mini_main()
    %r151 = trunc i64 %r150 to i32
    ret i32 %r151
}
