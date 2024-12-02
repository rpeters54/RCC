declare i32 @printf(ptr, ...)
declare i32 @scanf(ptr, ...)

@.r4 = private unnamed_addr constant [34 x i8] c"Turning %f Fahrenheit to Celsius\0A\00"

@.r19 = private unnamed_addr constant [34 x i8] c"Turning %f Celsius to Fahrenheit\0A\00"

@.r37 = private unnamed_addr constant [25 x i8] c"Select Conversion Mode:\0A\00"
@.r39 = private unnamed_addr constant [33 x i8] c"(c/C for Celsius to Fahrenheit)\0A\00"
@.r41 = private unnamed_addr constant [33 x i8] c"(f/F for Fahrenheit to Celsius)\0A\00"
@.r43 = private unnamed_addr constant [4 x i8] c"%c\0A\00"
@.r45 = private unnamed_addr constant [16 x i8] c"Gimme the Temp\0A\00"
@.r47 = private unnamed_addr constant [5 x i8] c"%lf\0A\00"
@.r86 = private unnamed_addr constant [19 x i8] c"Invalid Selection\0A\00"
@.r90 = private unnamed_addr constant [27 x i8] c"Current Temp = %f degrees\0A\00"
define double @convertToCelsius(double %r3) {
l2:
    %r97 = alloca double
	store double 0x3fe1c71c71c71c72, ptr %r97
	%r96 = load double, ptr %r97
    %r12 = alloca i64
	store i64 32, ptr %r12
	%r11 = load i64, ptr %r12
    %r5 = call i32 @printf(ptr @.r4, double %r3)
    %r13 = sitofp i64 %r11 to double
    %r14 = fsub double %r3, %r13
    %r15 = fmul double %r96, %r14
    ret double %r15
}
define double @convertToFahrenheit(double %r18) {
l4:
    %r99 = alloca double
	store double 0x3ffccccccccccccd, ptr %r99
	%r98 = load double, ptr %r99
    %r28 = alloca i64
	store i64 32, ptr %r28
	%r27 = load i64, ptr %r28
    %r20 = call i32 @printf(ptr @.r19, double %r18)
    %r26 = fmul double %r98, %r18
    %r29 = sitofp i64 %r27 to double
    %r30 = fadd double %r26, %r29
    ret double %r30
}
define i32 @main() {
l6:
    %r33 = alloca i8
    %r34 = alloca double
    %r51 = alloca i8
	store i8 99, ptr %r51
	%r50 = load i8, ptr %r51
    %r55 = alloca i8
	store i8 67, ptr %r55
	%r54 = load i8, ptr %r55
    %r60 = alloca i1
	store i1 0, ptr %r60
	%r59 = load i1, ptr %r60
    %r62 = alloca i1
	store i1 0, ptr %r62
	%r61 = load i1, ptr %r62
    %r68 = alloca i8
	store i8 102, ptr %r68
	%r67 = load i8, ptr %r68
    %r72 = alloca i8
	store i8 70, ptr %r72
	%r71 = load i8, ptr %r72
    %r77 = alloca i1
	store i1 0, ptr %r77
	%r76 = load i1, ptr %r77
    %r79 = alloca i1
	store i1 0, ptr %r79
	%r78 = load i1, ptr %r79
    %r84 = alloca i64
	store i64 0, ptr %r84
	%r83 = load i64, ptr %r84
    %r93 = alloca i64
	store i64 0, ptr %r93
	%r92 = load i64, ptr %r93
    %r38 = call i32 @printf(ptr @.r37)
    %r40 = call i32 @printf(ptr @.r39)
    %r42 = call i32 @printf(ptr @.r41)
    %r44 = call i32 @scanf(ptr @.r43, ptr %r33)
    %r46 = call i32 @printf(ptr @.r45)
    %r48 = call i32 @scanf(ptr @.r47, ptr %r34)
    %r49 = load i8, ptr %r33
    %r52 = icmp eq i8 %r49, %r50
    %r53 = load i8, ptr %r33
    %r56 = icmp eq i8 %r53, %r54
    %r57 = or i1 %r52, %r56
    %r58 = icmp ne i1 %r57, %r59
    %r63 = icmp ne i1 %r58, %r61
    br i1 %r63, label %l7, label %l8
l7:
    %r64 = load double, ptr %r34
    %r65 = call double @convertToFahrenheit(double %r64)
    br label %l12
l8:
    %r66 = load i8, ptr %r33
    %r69 = icmp eq i8 %r66, %r67
    %r70 = load i8, ptr %r33
    %r73 = icmp eq i8 %r70, %r71
    %r74 = or i1 %r69, %r73
    %r75 = icmp ne i1 %r74, %r76
    %r80 = icmp ne i1 %r75, %r78
    br i1 %r80, label %l9, label %l10
l9:
    %r81 = load double, ptr %r34
    %r82 = call double @convertToCelsius(double %r81)
    br label %l11
l10:
    %r85 = sitofp i64 %r83 to double
    %r87 = call i32 @printf(ptr @.r86)
    br label %l11
l11:
    %r88 = phi double [%r82, %l9], [%r85, %l10]
    br label %l12
l12:
    %r89 = phi double [%r88, %l11], [%r65, %l7]
    %r91 = call i32 @printf(ptr @.r90, double %r89)
    %r94 = trunc i64 %r92 to i32
    ret i32 %r94
}
