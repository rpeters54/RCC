declare i32 @printf(ptr, ...)

@.r28 = private unnamed_addr constant [5 x i8] c"Fizz\00"
@.r46 = private unnamed_addr constant [5 x i8] c"Buzz\00"
@.r61 = private unnamed_addr constant [3 x i8] c"%d\00"
@.r66 = private unnamed_addr constant [2 x i8] c"\0A\00"

define void @fizzbuzz(i32 %r2) {
l2:
    %r6 = alloca i64
	store i64 0, ptr %r6
	%r5 = load i64, ptr %r6
    %r11 = alloca i1
	store i1 0, ptr %r11
	%r10 = load i1, ptr %r11
    %r16 = alloca i64
	store i64 0, ptr %r16
	%r15 = load i64, ptr %r16
    %r19 = alloca i64
	store i64 3, ptr %r19
	%r18 = load i64, ptr %r19
    %r23 = alloca i64
	store i64 0, ptr %r23
	%r22 = load i64, ptr %r23
    %r26 = alloca i1
	store i1 0, ptr %r26
	%r25 = load i1, ptr %r26
    %r31 = alloca i64
	store i64 1, ptr %r31
	%r30 = load i64, ptr %r31
    %r37 = alloca i64
	store i64 5, ptr %r37
	%r36 = load i64, ptr %r37
    %r41 = alloca i64
	store i64 0, ptr %r41
	%r40 = load i64, ptr %r41
    %r44 = alloca i1
	store i1 0, ptr %r44
	%r43 = load i1, ptr %r44
    %r49 = alloca i64
	store i64 1, ptr %r49
	%r48 = load i64, ptr %r49
    %r55 = alloca i64
	store i64 0, ptr %r55
	%r54 = load i64, ptr %r55
    %r59 = alloca i1
	store i1 0, ptr %r59
	%r58 = load i1, ptr %r59
    %r69 = alloca i64
	store i64 1, ptr %r69
	%r68 = load i64, ptr %r69
    %r79 = alloca i1
	store i1 0, ptr %r79
	%r78 = load i1, ptr %r79
    %r7 = trunc i64 %r5 to i32
    %r8 = icmp slt i32 %r7, %r2
    %r9 = icmp ne i1 %r8, %r10
    br i1 %r9, label %l3, label %l1
l3:
    %r13 = phi i32 [%r72, %l14], [%r7, %l2]
    %r14 = phi i32 [%r65, %l14], [%r2, %l2]
    %r17 = trunc i64 %r15 to i16
    %r20 = sext i32 %r13 to i64
    %r21 = srem i64 %r20, %r18
    %r24 = icmp eq i64 %r21, %r22
    %r27 = icmp ne i1 %r24, %r25
    br i1 %r27, label %l6, label %l8
l6:
    %r29 = call i32 @printf(ptr @.r28)
    %r32 = trunc i64 %r30 to i16
    br label %l8
l8:
    %r33 = phi i16 [%r32, %l6], [%r17, %l3]
    %r34 = phi i32 [%r13, %l6], [%r13, %l3]
    %r35 = phi i32 [%r14, %l6], [%r14, %l3]
    %r38 = sext i32 %r34 to i64
    %r39 = srem i64 %r38, %r36
    %r42 = icmp eq i64 %r39, %r40
    %r45 = icmp ne i1 %r42, %r43
    br i1 %r45, label %l9, label %l11
l9:
    %r47 = call i32 @printf(ptr @.r46)
    %r50 = trunc i64 %r48 to i16
    br label %l11
l11:
    %r51 = phi i16 [%r33, %l8], [%r50, %l9]
    %r52 = phi i32 [%r34, %l8], [%r34, %l9]
    %r53 = phi i32 [%r35, %l8], [%r35, %l9]
    %r56 = sext i16 %r51 to i64
    %r57 = icmp eq i64 %r56, %r54
    %r60 = icmp ne i1 %r57, %r58
    br i1 %r60, label %l12, label %l14
l12:
    %r62 = call i32 @printf(ptr @.r61, i32 %r52)
    br label %l14
l14:
    %r64 = phi i32 [%r52, %l11], [%r52, %l12]
    %r65 = phi i32 [%r53, %l11], [%r53, %l12]
    %r67 = call i32 @printf(ptr @.r66)
    %r70 = sext i32 %r64 to i64
    %r71 = add i64 %r70, %r68
    %r72 = trunc i64 %r71 to i32
    %r76 = icmp slt i32 %r72, %r65
    %r77 = icmp ne i1 %r76, %r78
    br i1 %r77, label %l3, label %l1
l1:
    ret void
}
define i32 @main() {
l16:
    %r85 = alloca i64
	store i64 100, ptr %r85
	%r84 = load i64, ptr %r85
    %r88 = alloca i64
	store i64 0, ptr %r88
	%r87 = load i64, ptr %r88
    %r86 = trunc i64 %r84 to i32
    call void @fizzbuzz(i32 %r86)
    %r89 = trunc i64 %r87 to i32
    ret i32 %r89
}
