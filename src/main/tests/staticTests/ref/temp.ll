declare i32 @printf(ptr, ...)


@.r15 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
define void @swap(ptr %r2, ptr %r3) {
l2:
    %r4 = load i32, ptr %r2
    %r5 = load i32, ptr %r3
    store i32 %r5, ptr %r2
    store i32 %r4, ptr %r3
    ret void
}
define i32 @main() {
l4:
    %r7 = alloca i32
    %r8 = alloca i32
    %r10 = alloca i64
	store i64 9, ptr %r10
	%r9 = load i64, ptr %r10
    %r13 = alloca i64
	store i64 3, ptr %r13
	%r12 = load i64, ptr %r13
    %r19 = alloca i64
	store i64 0, ptr %r19
	%r18 = load i64, ptr %r19
    %r11 = trunc i64 %r9 to i32
    store i32 %r11, ptr %r7
    %r14 = trunc i64 %r12 to i32
    store i32 %r14, ptr %r8
    call void @swap(ptr %r7, ptr %r8)
    %r16 = load i32, ptr %r7
    %r17 = call i32 @printf(ptr @.r15, i32 %r16)
    %r20 = trunc i64 %r18 to i32
    ret i32 %r20
}
