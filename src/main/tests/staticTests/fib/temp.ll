declare i32 @printf(ptr, ...)
declare i32 @getchar()


@.r43 = private unnamed_addr constant [26 x i8] c"Please Provide a Number:\0A\00"
@.r51 = private unnamed_addr constant [14 x i8] c"Fib(%d) = %d\0A\00"
define i32 @fib(i32 %r3) {
l2:
    %r5 = alloca i64
	store i64 1, ptr %r5
	%r4 = load i64, ptr %r5
    %r9 = alloca i1
	store i1 0, ptr %r9
	%r8 = load i1, ptr %r9
    %r12 = alloca i64
	store i64 0, ptr %r12
	%r11 = load i64, ptr %r12
    %r15 = alloca i64
	store i64 2, ptr %r15
	%r14 = load i64, ptr %r15
    %r19 = alloca i1
	store i1 0, ptr %r19
	%r18 = load i1, ptr %r19
    %r22 = alloca i64
	store i64 1, ptr %r22
	%r21 = load i64, ptr %r22
    %r25 = alloca i64
	store i64 1, ptr %r25
	%r24 = load i64, ptr %r25
    %r31 = alloca i64
	store i64 2, ptr %r31
	%r30 = load i64, ptr %r31
    %r6 = sext i32 %r3 to i64
    %r7 = icmp sle i64 %r6, %r4
    %r10 = icmp ne i1 %r7, %r8
    br i1 %r10, label %l3, label %l4
l3:
    %r13 = trunc i64 %r11 to i32
    br label %l1
l4:
    %r16 = sext i32 %r3 to i64
    %r17 = icmp eq i64 %r16, %r14
    %r20 = icmp ne i1 %r17, %r18
    br i1 %r20, label %l5, label %l6
l5:
    %r23 = trunc i64 %r21 to i32
    br label %l1
l6:
    %r26 = sext i32 %r3 to i64
    %r27 = sub i64 %r26, %r24
    %r28 = trunc i64 %r27 to i32
    %r29 = call i32 @fib(i32 %r28)
    %r32 = sext i32 %r3 to i64
    %r33 = sub i64 %r32, %r30
    %r34 = trunc i64 %r33 to i32
    %r35 = call i32 @fib(i32 %r34)
    %r36 = add i32 %r29, %r35
    br label %l1
l1:
    %r37 = phi i32 [%r13, %l3], [%r23, %l5], [%r36, %l6]
    ret i32 %r37
}
define i32 @main() {
l8:
    %r47 = alloca i8
	store i8 48, ptr %r47
	%r46 = load i8, ptr %r47
    %r54 = alloca i64
	store i64 0, ptr %r54
	%r53 = load i64, ptr %r54
    %r44 = call i32 @printf(ptr @.r43)
    %r45 = call i32 @getchar()
    %r48 = sext i8 %r46 to i32
    %r49 = sub i32 %r45, %r48
    %r50 = call i32 @fib(i32 %r49)
    %r52 = call i32 @printf(ptr @.r51, i32 %r49, i32 %r50)
    %r55 = trunc i64 %r53 to i32
    ret i32 %r55
}
