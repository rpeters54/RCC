%struct.anon.0 = type {
    i32,
    i32
}

%union.anon.1 = type {
    i32,
    i64,
    float,
    double,
    %struct.anon.0
}

declare i32 @printf(ptr, ...)
declare i32 @rand()
declare void @srand(i32)
declare ptr @malloc(i64)

@.r21 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@.r25 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r29 = private unnamed_addr constant [4 x i8] c"%f\0A\00"
@.r34 = private unnamed_addr constant [4 x i8] c"%f\0A\00"
@.r38 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@.r43 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
define i32 @main() {
l2:
    %r9 = alloca i64
	store i64 8, ptr %r9
	%r8 = load i64, ptr %r9
    %r13 = alloca i64
	store i64 0, ptr %r13
	%r12 = load i64, ptr %r13
    %r49 = alloca i64
	store i64 0, ptr %r49
	%r48 = load i64, ptr %r49
    %r10 = call ptr @malloc(i64 %r8)
    %r11 = bitcast ptr %r10 to %union.anon.1*
    %r14 = trunc i64 %r12 to i32
    call void @srand(i32 %r14)
    %r15 = call i32 @rand()
    %r16 = bitcast ptr %r11 to %struct.anon.0*
    %r17 = getelementptr inbounds %struct.anon.0, ptr %r16, i32 0, i32 0
    store i32 %r15, ptr %r17
    %r18 = call i32 @rand()
    %r19 = bitcast ptr %r11 to %struct.anon.0*
    %r20 = getelementptr inbounds %struct.anon.0, ptr %r19, i32 0, i32 1
    store i32 %r18, ptr %r20
    %r22 = bitcast ptr %r11 to i32*
    %r23 = load i32, ptr %r22
    %r24 = call i32 @printf(ptr @.r21, i32 %r23)
    %r26 = bitcast ptr %r11 to i64*
    %r27 = load i64, ptr %r26
    %r28 = call i32 @printf(ptr @.r25, i64 %r27)
    %r30 = bitcast ptr %r11 to float*
    %r31 = load float, ptr %r30
    %r32 = fpext float %r31 to double
    %r33 = call i32 @printf(ptr @.r29, double %r32)
    %r35 = bitcast ptr %r11 to double*
    %r36 = load double, ptr %r35
    %r37 = call i32 @printf(ptr @.r34, double %r36)
    %r39 = bitcast ptr %r11 to %struct.anon.0*
    %r40 = getelementptr inbounds %struct.anon.0, ptr %r39, i32 0, i32 0
    %r41 = load i32, ptr %r40
    %r42 = call i32 @printf(ptr @.r38, i32 %r41)
    %r44 = bitcast ptr %r11 to %struct.anon.0*
    %r45 = getelementptr inbounds %struct.anon.0, ptr %r44, i32 0, i32 1
    %r46 = load i32, ptr %r45
    %r47 = call i32 @printf(ptr @.r43, i32 %r46)
    %r50 = trunc i64 %r48 to i32
    ret i32 %r50
}
