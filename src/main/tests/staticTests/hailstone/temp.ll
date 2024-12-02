declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)


@.r19 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r46 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r57 = private unnamed_addr constant [4 x i8] c"%ld\00"

define i64 @_mini_mod(i64 %r5, i64 %r6) {
l2:
    %r7 = sdiv i64 %r5, %r6
    %r8 = mul i64 %r7, %r6
    %r9 = sub i64 %r5, %r8
    ret i64 %r9
}
define void @_mini_hailstone(i64 %r12) {
l4:
    %r14 = alloca i64
	store i64 1, ptr %r14
	%r13 = load i64, ptr %r14
    %r17 = alloca i64
	store i64 0, ptr %r17
	%r16 = load i64, ptr %r17
    %r22 = alloca i64
	store i64 2, ptr %r22
	%r21 = load i64, ptr %r22
    %r25 = alloca i64
	store i64 1, ptr %r25
	%r24 = load i64, ptr %r25
    %r28 = alloca i1
	store i1 0, ptr %r28
	%r27 = load i1, ptr %r28
    %r31 = alloca i64
	store i64 3, ptr %r31
	%r30 = load i64, ptr %r31
    %r34 = alloca i64
	store i64 1, ptr %r34
	%r33 = load i64, ptr %r34
    %r37 = alloca i64
	store i64 2, ptr %r37
	%r36 = load i64, ptr %r37
    %r41 = alloca i64
	store i64 1, ptr %r41
	%r40 = load i64, ptr %r41
    %r44 = alloca i1
	store i1 0, ptr %r44
	%r43 = load i1, ptr %r44
    %r50 = alloca i64
	store i64 1, ptr %r50
	%r49 = load i64, ptr %r50
    %r53 = alloca i64
	store i64 0, ptr %r53
	%r52 = load i64, ptr %r53
    %r15 = icmp ne i64 %r13, %r16
    br i1 %r15, label %l5, label %l3
l5:
    %r18 = phi i64 [%r12, %l4], [%r39, %l6]
    %r20 = call i32 @printf(ptr @.r19, i64 %r18)
    %r23 = call i64 @_mini_mod(i64 %r18, i64 %r21)
    %r26 = icmp eq i64 %r23, %r24
    %r29 = icmp ne i1 %r26, %r27
    br i1 %r29, label %l8, label %l9
l8:
    %r32 = mul i64 %r30, %r18
    %r35 = add i64 %r32, %r33
    br label %l10
l9:
    %r38 = sdiv i64 %r18, %r36
    br label %l10
l10:
    %r39 = phi i64 [%r38, %l9], [%r35, %l8]
    %r42 = icmp sle i64 %r39, %r40
    %r45 = icmp ne i1 %r42, %r43
    br i1 %r45, label %l11, label %l6
l11:
    %r47 = call i32 @printf(ptr @.r46, i64 %r39)
    br label %l3
l6:
    %r51 = icmp ne i64 %r49, %r52
    br i1 %r51, label %l5, label %l3
l3:
    ret void
}
define i64 @_mini_main() {
l15:
    %r56 = alloca i64
    %r61 = alloca i64
	store i64 0, ptr %r61
	%r60 = load i64, ptr %r61
    %r58 = call i32 @scanf(ptr @.r57, ptr %r56)
    %r59 = load i64, ptr %r56
    call void @_mini_hailstone(i64 %r59)
    ret i64 %r60
}
define i32 @main() {
l17:
    %r64 = call i64 @_mini_main()
    %r65 = trunc i64 %r64 to i32
    ret i32 %r65
}
