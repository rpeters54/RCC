declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)

@.r6 = private unnamed_addr constant [5 x i8] c"%ld \00"

@.r10 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r16 = private unnamed_addr constant [4 x i8] c"%ld\00"

define void @print(i64 %r5) {
l2:
    %r7 = call i32 @printf(ptr @.r6, i64 %r5)
    ret void
}
define void @println(i64 %r9) {
l4:
    %r11 = call i32 @printf(ptr @.r10, i64 %r9)
    ret void
}
define i64 @_mini_read() {
l6:
    %r14 = alloca i64
	store i64 0, ptr %r14
	%r13 = load i64, ptr %r14
    %r15 = alloca i64
    store i64 %r13, ptr %r15
    %r17 = call i32 @scanf(ptr @.r16, ptr %r15)
    %r18 = load i64, ptr %r15
    ret i64 %r18
}
define i32 @main() {
l8:
    %r35 = alloca i64
	store i64 0, ptr %r35
	%r34 = load i64, ptr %r35
    %r39 = alloca i1
	store i1 0, ptr %r39
	%r38 = load i1, ptr %r39
    %r46 = alloca i64
	store i64 1, ptr %r46
	%r45 = load i64, ptr %r46
    %r56 = alloca i1
	store i1 0, ptr %r56
	%r55 = load i1, ptr %r56
    %r63 = alloca i64
	store i64 0, ptr %r63
	%r62 = load i64, ptr %r63
    %r31 = call i64 @_mini_read()
    %r32 = call i64 @_mini_read()
    %r33 = call i64 @_mini_read()
    %r36 = icmp slt i64 %r34, %r33
    %r37 = icmp ne i1 %r36, %r38
    br i1 %r37, label %l9, label %l11
l9:
    %r40 = phi i64 [%r33, %l8], [%r40, %l9]
    %r42 = phi i64 [%r31, %l8], [%r43, %l9]
    %r43 = phi i64 [%r32, %l8], [%r42, %l9]
    %r44 = phi i64 [%r34, %l8], [%r47, %l9]
    %r47 = add i64 %r44, %r45
    %r53 = icmp slt i64 %r47, %r40
    %r54 = icmp ne i1 %r53, %r55
    br i1 %r54, label %l9, label %l11
l11:
    %r59 = phi i64 [%r31, %l8], [%r43, %l9]
    %r60 = phi i64 [%r32, %l8], [%r42, %l9]
    call void @print(i64 %r59)
    call void @println(i64 %r60)
    %r64 = trunc i64 %r62 to i32
    ret i32 %r64
}
