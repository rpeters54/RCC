declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global i64 zeroinitializer
@.r5 = global i64 zeroinitializer



@.r64 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r73 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_fun2(i64 %r7, i64 %r8) {
l2:
    %r10 = alloca i64
	store i64 0, ptr %r10
	%r9 = load i64, ptr %r10
    %r13 = alloca i1
	store i1 0, ptr %r13
	%r12 = load i1, ptr %r13
    %r16 = alloca i64
	store i64 1, ptr %r16
	%r15 = load i64, ptr %r16
    %r11 = icmp eq i64 %r7, %r9
    %r14 = icmp ne i1 %r11, %r12
    br i1 %r14, label %l1, label %l4
l4:
    %r17 = sub i64 %r7, %r15
    %r18 = call i64 @_mini_fun2(i64 %r17, i64 %r8)
    br label %l1
l1:
    %r19 = phi i64 [%r8, %l2], [%r18, %l4]
    ret i64 %r19
}
define i64 @_mini_fun1(i64 %r21, i64 %r22, i64 %r23) {
l6:
    %r100 = alloca i64
	store i64 11, ptr %r100
	%r99 = load i64, ptr %r100
    %r32 = alloca i64
	store i64 2, ptr %r32
	%r31 = load i64, ptr %r32
    %r36 = alloca i64
	store i64 4, ptr %r36
	%r35 = load i64, ptr %r36
    %r42 = alloca i1
	store i1 0, ptr %r42
	%r41 = load i1, ptr %r42
    %r46 = alloca i64
	store i64 5, ptr %r46
	%r45 = load i64, ptr %r46
    %r48 = alloca i64
	store i64 6, ptr %r48
	%r47 = load i64, ptr %r48
    %r54 = alloca i1
	store i1 0, ptr %r54
	%r53 = load i1, ptr %r54
    %r56 = alloca i1
	store i1 0, ptr %r56
	%r55 = load i1, ptr %r56
    %r33 = mul i64 %r21, %r31
    %r34 = sub i64 %r99, %r33
    %r37 = sdiv i64 %r35, %r22
    %r38 = add i64 %r34, %r37
    %r39 = add i64 %r38, %r23
    %r40 = icmp sgt i64 %r39, %r22
    %r43 = icmp ne i1 %r40, %r41
    br i1 %r43, label %l7, label %l8
l7:
    %r44 = call i64 @_mini_fun2(i64 %r39, i64 %r21)
    br label %l5
l8:
    %r49 = icmp slt i64 %r45, %r47
    %r50 = icmp sle i64 %r39, %r22
    %r51 = and i1 %r49, %r50
    %r52 = icmp ne i1 %r51, %r53
    %r57 = icmp ne i1 %r52, %r55
    br i1 %r57, label %l9, label %l5
l9:
    %r58 = call i64 @_mini_fun2(i64 %r39, i64 %r22)
    br label %l5
l5:
    %r59 = phi i64 [%r44, %l7], [%r58, %l9], [%r39, %l8]
    ret i64 %r59
}
define i64 @_mini_main() {
l14:
    %r61 = alloca i64
    %r63 = alloca i64
	store i64 0, ptr %r63
	%r62 = load i64, ptr %r63
    %r68 = alloca i64
	store i64 10000, ptr %r68
	%r67 = load i64, ptr %r68
    %r72 = alloca i1
	store i1 0, ptr %r72
	%r71 = load i1, ptr %r72
    %r75 = alloca i64
	store i64 3, ptr %r75
	%r74 = load i64, ptr %r75
    %r78 = alloca i64
	store i64 5, ptr %r78
	%r77 = load i64, ptr %r78
    %r83 = alloca i64
	store i64 1, ptr %r83
	%r82 = load i64, ptr %r83
    %r87 = alloca i64
	store i64 10000, ptr %r87
	%r86 = load i64, ptr %r87
    %r91 = alloca i1
	store i1 0, ptr %r91
	%r90 = load i1, ptr %r91
    %r93 = alloca i64
	store i64 0, ptr %r93
	%r92 = load i64, ptr %r93
    store i64 %r62, ptr %r61
    %r65 = call i32 @scanf(ptr @.r64, ptr %r61)
    %r66 = load i64, ptr %r61
    %r69 = icmp slt i64 %r66, %r67
    %r70 = icmp ne i1 %r69, %r71
    br i1 %r70, label %l15, label %l17
l15:
    %r76 = load i64, ptr %r61
    %r79 = call i64 @_mini_fun1(i64 %r74, i64 %r76, i64 %r77)
    %r80 = call i32 @printf(ptr @.r73, i64 %r79)
    %r81 = load i64, ptr %r61
    %r84 = add i64 %r81, %r82
    store i64 %r84, ptr %r61
    %r85 = load i64, ptr %r61
    %r88 = icmp slt i64 %r85, %r86
    %r89 = icmp ne i1 %r88, %r90
    br i1 %r89, label %l15, label %l17
l17:
    ret i64 %r92
}
define i32 @main() {
l19:
    %r96 = call i64 @_mini_main()
    %r97 = trunc i64 %r96 to i32
    ret i32 %r97
}
