declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)

@.r29 = private unnamed_addr constant [5 x i8] c"%ld \00"

@.r52 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r56 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_function(i64 %r5) {
l2:
    %r11 = alloca i64
	store i64 0, ptr %r11
	%r10 = load i64, ptr %r11
    %r14 = alloca i1
	store i1 0, ptr %r14
	%r13 = load i1, ptr %r14
    %r17 = alloca i64
	store i64 0, ptr %r17
	%r16 = load i64, ptr %r17
    %r19 = alloca i64
	store i64 0, ptr %r19
	%r18 = load i64, ptr %r19
    %r24 = alloca i1
	store i1 0, ptr %r24
	%r23 = load i1, ptr %r24
    %r32 = alloca i64
	store i64 1, ptr %r32
	%r31 = load i64, ptr %r32
    %r41 = alloca i1
	store i1 0, ptr %r41
	%r40 = load i1, ptr %r41
    %r46 = alloca i64
	store i64 1, ptr %r46
	%r45 = load i64, ptr %r46
    %r12 = icmp sle i64 %r5, %r10
    %r15 = icmp ne i1 %r12, %r13
    br i1 %r15, label %l3, label %l5
l3:
    br label %l1
l5:
    %r20 = mul i64 %r5, %r5
    %r21 = icmp slt i64 %r18, %r20
    %r22 = icmp ne i1 %r21, %r23
    br i1 %r22, label %l6, label %l8
l6:
    %r26 = phi i64 [%r18, %l5], [%r33, %l6]
    %r27 = phi i64 [%r5, %l5], [%r27, %l6]
    %r28 = add i64 %r26, %r27
    %r30 = call i32 @printf(ptr @.r29, i64 %r28)
    %r33 = add i64 %r26, %r31
    %r37 = mul i64 %r27, %r27
    %r38 = icmp slt i64 %r33, %r37
    %r39 = icmp ne i1 %r38, %r40
    br i1 %r39, label %l6, label %l8
l8:
    %r44 = phi i64 [%r5, %l5], [%r27, %l6]
    %r47 = sub i64 %r44, %r45
    %r48 = call i64 @_mini_function(i64 %r47)
    br label %l1
l1:
    %r49 = phi i64 [%r16, %l3], [%r48, %l8]
    ret i64 %r49
}
define i64 @_mini_main() {
l10:
    %r51 = alloca i64
    %r58 = alloca i64
	store i64 0, ptr %r58
	%r57 = load i64, ptr %r58
    %r61 = alloca i64
	store i64 0, ptr %r61
	%r60 = load i64, ptr %r61
    %r53 = call i32 @scanf(ptr @.r52, ptr %r51)
    %r54 = load i64, ptr %r51
    %r55 = call i64 @_mini_function(i64 %r54)
    %r59 = call i32 @printf(ptr @.r56, i64 %r57)
    ret i64 %r60
}
define i32 @main() {
l12:
    %r64 = call i64 @_mini_main()
    %r65 = trunc i64 %r64 to i32
    ret i32 %r65
}
