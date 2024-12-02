declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)


@.r34 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r36 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_computeFib(i64 %r5) {
l2:
    %r7 = alloca i64
	store i64 0, ptr %r7
	%r6 = load i64, ptr %r7
    %r10 = alloca i1
	store i1 0, ptr %r10
	%r9 = load i1, ptr %r10
    %r13 = alloca i64
	store i64 0, ptr %r13
	%r12 = load i64, ptr %r13
    %r15 = alloca i64
	store i64 2, ptr %r15
	%r14 = load i64, ptr %r15
    %r18 = alloca i1
	store i1 0, ptr %r18
	%r17 = load i1, ptr %r18
    %r21 = alloca i64
	store i64 1, ptr %r21
	%r20 = load i64, ptr %r21
    %r23 = alloca i64
	store i64 1, ptr %r23
	%r22 = load i64, ptr %r23
    %r27 = alloca i64
	store i64 2, ptr %r27
	%r26 = load i64, ptr %r27
    %r8 = icmp eq i64 %r5, %r6
    %r11 = icmp ne i1 %r8, %r9
    br i1 %r11, label %l3, label %l4
l3:
    br label %l1
l4:
    %r16 = icmp sle i64 %r5, %r14
    %r19 = icmp ne i1 %r16, %r17
    br i1 %r19, label %l5, label %l6
l5:
    br label %l1
l6:
    %r24 = sub i64 %r5, %r22
    %r25 = call i64 @_mini_computeFib(i64 %r24)
    %r28 = sub i64 %r5, %r26
    %r29 = call i64 @_mini_computeFib(i64 %r28)
    %r30 = add i64 %r25, %r29
    br label %l1
l1:
    %r31 = phi i64 [%r12, %l3], [%r20, %l5], [%r30, %l6]
    ret i64 %r31
}
define i64 @_mini_main() {
l8:
    %r33 = alloca i64
    %r41 = alloca i64
	store i64 0, ptr %r41
	%r40 = load i64, ptr %r41
    %r35 = call i32 @scanf(ptr @.r34, ptr %r33)
    %r37 = load i64, ptr %r33
    %r38 = call i64 @_mini_computeFib(i64 %r37)
    %r39 = call i32 @printf(ptr @.r36, i64 %r38)
    ret i64 %r40
}
define i32 @main() {
l10:
    %r44 = call i64 @_mini_main()
    %r45 = trunc i64 %r44 to i32
    ret i32 %r45
}
