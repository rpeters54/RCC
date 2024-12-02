declare i32 @printf(ptr, ...)
declare i32 @getchar()

@.r19 = private unnamed_addr constant [14 x i8] c"Hello World!\0A\00"
@.r29 = private unnamed_addr constant [14 x i8] c"Greater Than\0A\00"
@.r31 = private unnamed_addr constant [23 x i8] c"Less Than Or Equal To\0A\00"
define i32 @main() {
l2:
    %r23 = alloca i8
	store i8 97, ptr %r23
	%r22 = load i8, ptr %r23
    %r27 = alloca i1
	store i1 0, ptr %r27
	%r26 = load i1, ptr %r27
    %r81 = alloca i64
	store i64 0, ptr %r81
	%r80 = load i64, ptr %r81
    %r20 = call i32 @printf(ptr @.r19)
    %r21 = call i32 @getchar()
    %r24 = sext i8 %r22 to i32
    %r25 = icmp sgt i32 %r21, %r24
    %r28 = icmp ne i1 %r25, %r26
    br i1 %r28, label %l3, label %l4
l3:
    %r30 = call i32 @printf(ptr @.r29)
    br label %l5
l4:
    %r32 = call i32 @printf(ptr @.r31)
    br label %l5
l5:
    %r82 = trunc i64 %r80 to i32
    ret i32 %r82
}
