declare i32 @printf(ptr, ...)

@.r12 = private unnamed_addr constant [11 x i8] c"gong >= 0\0A\00"
@.r14 = private unnamed_addr constant [10 x i8] c"gong < 0\0A\00"
@.r26 = private unnamed_addr constant [13 x i8] c"dugong >= 0\0A\00"
@.r28 = private unnamed_addr constant [12 x i8] c"dugong < 0\0A\00"
@.r41 = private unnamed_addr constant [10 x i8] c"nit >= 0\0A\00"
@.r43 = private unnamed_addr constant [9 x i8] c"nit < 0\0A\00"
@.r56 = private unnamed_addr constant [11 x i8] c"unit >= 0\0A\00"
@.r58 = private unnamed_addr constant [10 x i8] c"unit < 0\0A\00"

define void @test_sign(i32 %r2, i32 %r3, i64 %r4, i64 %r5) {
l2:
    %r7 = alloca i64
	store i64 0, ptr %r7
	%r6 = load i64, ptr %r7
    %r10 = alloca i1
	store i1 0, ptr %r10
	%r9 = load i1, ptr %r10
    %r21 = alloca i64
	store i64 0, ptr %r21
	%r20 = load i64, ptr %r21
    %r24 = alloca i1
	store i1 0, ptr %r24
	%r23 = load i1, ptr %r24
    %r35 = alloca i64
	store i64 0, ptr %r35
	%r34 = load i64, ptr %r35
    %r39 = alloca i1
	store i1 0, ptr %r39
	%r38 = load i1, ptr %r39
    %r50 = alloca i64
	store i64 0, ptr %r50
	%r49 = load i64, ptr %r50
    %r54 = alloca i1
	store i1 0, ptr %r54
	%r53 = load i1, ptr %r54
    %r8 = icmp sge i64 %r4, %r6
    %r11 = icmp ne i1 %r8, %r9
    br i1 %r11, label %l3, label %l4
l3:
    %r13 = call i32 @printf(ptr @.r12)
    br label %l5
l4:
    %r15 = call i32 @printf(ptr @.r14)
    br label %l5
l5:
    %r17 = phi i32 [%r3, %l4], [%r3, %l3]
    %r18 = phi i64 [%r5, %l4], [%r5, %l3]
    %r19 = phi i32 [%r2, %l4], [%r2, %l3]
    %r22 = icmp uge i64 %r18, %r20
    %r25 = icmp ne i1 %r22, %r23
    br i1 %r25, label %l6, label %l7
l6:
    %r27 = call i32 @printf(ptr @.r26)
    br label %l8
l7:
    %r29 = call i32 @printf(ptr @.r28)
    br label %l8
l8:
    %r31 = phi i32 [%r17, %l7], [%r17, %l6]
    %r33 = phi i32 [%r19, %l7], [%r19, %l6]
    %r36 = sext i32 %r33 to i64
    %r37 = icmp sge i64 %r36, %r34
    %r40 = icmp ne i1 %r37, %r38
    br i1 %r40, label %l9, label %l10
l9:
    %r42 = call i32 @printf(ptr @.r41)
    br label %l11
l10:
    %r44 = call i32 @printf(ptr @.r43)
    br label %l11
l11:
    %r46 = phi i32 [%r31, %l10], [%r31, %l9]
    %r51 = zext i32 %r46 to i64
    %r52 = icmp sge i64 %r51, %r49
    %r55 = icmp ne i1 %r52, %r53
    br i1 %r55, label %l12, label %l13
l12:
    %r57 = call i32 @printf(ptr @.r56)
    br label %l1
l13:
    %r59 = call i32 @printf(ptr @.r58)
    br label %l1
l1:
    ret void
}
define i32 @main() {
l16:
    %r74 = alloca i64
	store i64 4294967295, ptr %r74
	%r73 = load i64, ptr %r74
    %r77 = alloca i64
	store i64 4294967295, ptr %r77
	%r76 = load i64, ptr %r77
    %r80 = alloca i64
	store i64 -1, ptr %r80
	%r79 = load i64, ptr %r80
    %r82 = alloca i64
	store i64 -1, ptr %r82
	%r81 = load i64, ptr %r82
    %r84 = alloca i64
	store i64 3, ptr %r84
	%r83 = load i64, ptr %r84
    %r89 = alloca i64
	store i64 3, ptr %r89
	%r88 = load i64, ptr %r89
    %r104 = alloca i64
	store i64 -4, ptr %r104
	%r103 = load i64, ptr %r104
    %r106 = alloca i64
	store i64 -4, ptr %r106
	%r105 = load i64, ptr %r106
    %r100 = alloca i64
	store i64 0, ptr %r100
	%r99 = load i64, ptr %r100
    %r75 = trunc i64 %r73 to i32
    %r78 = trunc i64 %r76 to i32
    call void @test_sign(i32 %r75, i32 %r78, i64 %r79, i64 %r81)
    %r85 = sext i32 %r75 to i64
    %r86 = sub i64 %r85, %r83
    %r87 = trunc i64 %r86 to i32
    %r90 = zext i32 %r78 to i64
    %r91 = sub i64 %r90, %r88
    %r92 = trunc i64 %r91 to i32
    call void @test_sign(i32 %r87, i32 %r92, i64 %r103, i64 %r105)
    %r101 = trunc i64 %r99 to i32
    ret i32 %r101
}
