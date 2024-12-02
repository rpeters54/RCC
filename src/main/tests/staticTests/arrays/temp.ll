declare i32 @printf(ptr, ...)
declare i32 @rand()
declare void @srand(i32)

@.r25 = private unnamed_addr constant [34 x i8] c"Iteration %d: Generated Value %d\0A\00"
@.r56 = private unnamed_addr constant [29 x i8] c"Iteration %d: Read Value %d\0A\00"
define i32 @main() {
l2:
    %r8 = alloca [100 x i32]
    %r10 = alloca i64
	store i64 0, ptr %r10
	%r9 = load i64, ptr %r10
    %r13 = alloca i64
	store i64 0, ptr %r13
	%r12 = load i64, ptr %r13
    %r16 = alloca i64
	store i64 100, ptr %r16
	%r15 = load i64, ptr %r16
    %r21 = alloca i1
	store i1 0, ptr %r21
	%r20 = load i1, ptr %r21
    %r31 = alloca i64
	store i64 1, ptr %r31
	%r30 = load i64, ptr %r31
    %r36 = alloca i64
	store i64 100, ptr %r36
	%r35 = load i64, ptr %r36
    %r41 = alloca i1
	store i1 0, ptr %r41
	%r40 = load i1, ptr %r41
    %r45 = alloca i64
	store i64 0, ptr %r45
	%r44 = load i64, ptr %r45
    %r48 = alloca i64
	store i64 100, ptr %r48
	%r47 = load i64, ptr %r48
    %r53 = alloca i1
	store i1 0, ptr %r53
	%r52 = load i1, ptr %r53
    %r63 = alloca i64
	store i64 1, ptr %r63
	%r62 = load i64, ptr %r63
    %r68 = alloca i64
	store i64 100, ptr %r68
	%r67 = load i64, ptr %r68
    %r73 = alloca i1
	store i1 0, ptr %r73
	%r72 = load i1, ptr %r73
    %r77 = alloca i64
	store i64 0, ptr %r77
	%r76 = load i64, ptr %r77
    %r11 = trunc i64 %r9 to i32
    call void @srand(i32 %r11)
    %r14 = trunc i64 %r12 to i32
    %r17 = sext i32 %r14 to i64
    %r18 = icmp slt i64 %r17, %r15
    %r19 = icmp ne i1 %r18, %r20
    br i1 %r19, label %l3, label %l5
l3:
    %r23 = phi i32 [%r34, %l3], [%r14, %l2]
    %r24 = call i32 @rand()
    %r26 = call i32 @printf(ptr @.r25, i32 %r23, i32 %r24)
    %r27 = getelementptr inbounds [100 x i32], ptr %r8, i32 0, i32 %r23
    store i32 %r24, ptr %r27
    %r32 = sext i32 %r23 to i64
    %r33 = add i64 %r32, %r30
    %r34 = trunc i64 %r33 to i32
    %r37 = sext i32 %r34 to i64
    %r38 = icmp slt i64 %r37, %r35
    %r39 = icmp ne i1 %r38, %r40
    br i1 %r39, label %l3, label %l5
l5:
    %r46 = trunc i64 %r44 to i32
    %r49 = sext i32 %r46 to i64
    %r50 = icmp slt i64 %r49, %r47
    %r51 = icmp ne i1 %r50, %r52
    br i1 %r51, label %l6, label %l8
l6:
    %r55 = phi i32 [%r66, %l6], [%r46, %l5]
    %r57 = getelementptr inbounds [100 x i32], ptr %r8, i32 0, i32 %r55
    %r58 = load i32, ptr %r57
    %r59 = call i32 @printf(ptr @.r56, i32 %r55, i32 %r58)
    %r64 = sext i32 %r55 to i64
    %r65 = add i64 %r64, %r62
    %r66 = trunc i64 %r65 to i32
    %r69 = sext i32 %r66 to i64
    %r70 = icmp slt i64 %r69, %r67
    %r71 = icmp ne i1 %r70, %r72
    br i1 %r71, label %l6, label %l8
l8:
    %r78 = trunc i64 %r76 to i32
    ret i32 %r78
}
