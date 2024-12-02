declare i32 @printf(ptr, ...)

@.r22 = private unnamed_addr constant [22 x i8] c"before post-inc: %ld\0A\00"
@.r27 = private unnamed_addr constant [21 x i8] c"after post-inc: %ld\0A\00"
@.r29 = private unnamed_addr constant [22 x i8] c"before post-dec: %ld\0A\00"
@.r34 = private unnamed_addr constant [21 x i8] c"after post-dec: %ld\0A\00"
@.r36 = private unnamed_addr constant [21 x i8] c"before pre-inc: %ld\0A\00"
@.r41 = private unnamed_addr constant [20 x i8] c"after pre-inc: %ld\0A\00"
@.r43 = private unnamed_addr constant [21 x i8] c"before pre-dec: %ld\0A\00"
@.r48 = private unnamed_addr constant [20 x i8] c"after pre-dec: %ld\0A\00"
@.r50 = private unnamed_addr constant [21 x i8] c"before post-inc: %d\0A\00"
@.r55 = private unnamed_addr constant [20 x i8] c"after post-inc: %d\0A\00"
@.r57 = private unnamed_addr constant [21 x i8] c"before post-dec: %d\0A\00"
@.r62 = private unnamed_addr constant [20 x i8] c"after post-dec: %d\0A\00"
@.r64 = private unnamed_addr constant [20 x i8] c"before pre-inc: %d\0A\00"
@.r69 = private unnamed_addr constant [19 x i8] c"after pre-inc: %d\0A\00"
@.r71 = private unnamed_addr constant [20 x i8] c"before pre-dec: %d\0A\00"
@.r76 = private unnamed_addr constant [19 x i8] c"after pre-dec: %d\0A\00"
@.r78 = private unnamed_addr constant [21 x i8] c"before post-inc: %d\0A\00"
@.r83 = private unnamed_addr constant [20 x i8] c"after post-inc: %d\0A\00"
@.r85 = private unnamed_addr constant [21 x i8] c"before post-dec: %d\0A\00"
@.r90 = private unnamed_addr constant [20 x i8] c"after post-dec: %d\0A\00"
@.r92 = private unnamed_addr constant [20 x i8] c"before pre-inc: %d\0A\00"
@.r97 = private unnamed_addr constant [19 x i8] c"after pre-inc: %d\0A\00"
@.r99 = private unnamed_addr constant [20 x i8] c"before pre-dec: %d\0A\00"
@.r104 = private unnamed_addr constant [19 x i8] c"after pre-dec: %d\0A\00"
@.r106 = private unnamed_addr constant [21 x i8] c"before post-inc: %c\0A\00"
@.r111 = private unnamed_addr constant [20 x i8] c"after post-inc: %c\0A\00"
@.r113 = private unnamed_addr constant [21 x i8] c"before post-dec: %c\0A\00"
@.r118 = private unnamed_addr constant [20 x i8] c"after post-dec: %c\0A\00"
@.r120 = private unnamed_addr constant [20 x i8] c"before pre-inc: %c\0A\00"
@.r125 = private unnamed_addr constant [19 x i8] c"after pre-inc: %c\0A\00"
@.r127 = private unnamed_addr constant [20 x i8] c"before pre-dec: %c\0A\00"
@.r132 = private unnamed_addr constant [19 x i8] c"after pre-dec: %c\0A\00"
@.r134 = private unnamed_addr constant [21 x i8] c"before post-inc: %f\0A\00"
@.r140 = private unnamed_addr constant [20 x i8] c"after post-inc: %f\0A\00"
@.r143 = private unnamed_addr constant [21 x i8] c"before post-dec: %f\0A\00"
@.r149 = private unnamed_addr constant [20 x i8] c"after post-dec: %f\0A\00"
@.r152 = private unnamed_addr constant [20 x i8] c"before pre-inc: %f\0A\00"
@.r158 = private unnamed_addr constant [19 x i8] c"after pre-inc: %f\0A\00"
@.r161 = private unnamed_addr constant [20 x i8] c"before pre-dec: %f\0A\00"
@.r167 = private unnamed_addr constant [19 x i8] c"after pre-dec: %f\0A\00"
@.r170 = private unnamed_addr constant [21 x i8] c"before post-inc: %f\0A\00"
@.r175 = private unnamed_addr constant [20 x i8] c"after post-inc: %f\0A\00"
@.r177 = private unnamed_addr constant [21 x i8] c"before post-dec: %f\0A\00"
@.r182 = private unnamed_addr constant [20 x i8] c"after post-dec: %f\0A\00"
@.r184 = private unnamed_addr constant [20 x i8] c"before pre-inc: %f\0A\00"
@.r189 = private unnamed_addr constant [19 x i8] c"after pre-inc: %f\0A\00"
@.r191 = private unnamed_addr constant [20 x i8] c"before pre-dec: %f\0A\00"
@.r196 = private unnamed_addr constant [19 x i8] c"after pre-dec: %f\0A\00"
define i32 @main() {
l2:
    %r15 = alloca i8
	store i8 102, ptr %r15
	%r14 = load i8, ptr %r15
    %r20 = alloca double
	store double 0x4010000000000000, ptr %r20
	%r19 = load double, ptr %r20
    %r24 = alloca i64
	store i64 1, ptr %r24
	%r23 = load i64, ptr %r24
    %r31 = alloca i64
	store i64 1, ptr %r31
	%r30 = load i64, ptr %r31
    %r38 = alloca i64
	store i64 1, ptr %r38
	%r37 = load i64, ptr %r38
    %r45 = alloca i64
	store i64 1, ptr %r45
	%r44 = load i64, ptr %r45
    %r52 = alloca i32
	store i32 1, ptr %r52
	%r51 = load i32, ptr %r52
    %r59 = alloca i32
	store i32 1, ptr %r59
	%r58 = load i32, ptr %r59
    %r66 = alloca i32
	store i32 1, ptr %r66
	%r65 = load i32, ptr %r66
    %r73 = alloca i32
	store i32 1, ptr %r73
	%r72 = load i32, ptr %r73
    %r80 = alloca i16
	store i16 1, ptr %r80
	%r79 = load i16, ptr %r80
    %r87 = alloca i16
	store i16 1, ptr %r87
	%r86 = load i16, ptr %r87
    %r94 = alloca i16
	store i16 1, ptr %r94
	%r93 = load i16, ptr %r94
    %r101 = alloca i16
	store i16 1, ptr %r101
	%r100 = load i16, ptr %r101
    %r203 = alloca i8
	store i8 103, ptr %r203
	%r202 = load i8, ptr %r203
    %r207 = alloca i8
	store i8 102, ptr %r207
	%r206 = load i8, ptr %r207
    %r211 = alloca i8
	store i8 103, ptr %r211
	%r210 = load i8, ptr %r211
    %r215 = alloca i8
	store i8 102, ptr %r215
	%r214 = load i8, ptr %r215
    %r136 = alloca float
	store float 0x3ff0000000000000, ptr %r136
	%r135 = load float, ptr %r136
    %r145 = alloca float
	store float 0x3ff0000000000000, ptr %r145
	%r144 = load float, ptr %r145
    %r154 = alloca float
	store float 0x3ff0000000000000, ptr %r154
	%r153 = load float, ptr %r154
    %r163 = alloca float
	store float 0x3ff0000000000000, ptr %r163
	%r162 = load float, ptr %r163
    %r205 = alloca double
	store double 0x4014000000000000, ptr %r205
	%r204 = load double, ptr %r205
    %r209 = alloca double
	store double 0x4010000000000000, ptr %r209
	%r208 = load double, ptr %r209
    %r213 = alloca double
	store double 0x4014000000000000, ptr %r213
	%r212 = load double, ptr %r213
    %r217 = alloca double
	store double 0x4010000000000000, ptr %r217
	%r216 = load double, ptr %r217
    %r199 = alloca i64
	store i64 0, ptr %r199
	%r198 = load i64, ptr %r199
    %r16 = sext i8 %r14 to i16
    %r17 = sext i16 %r16 to i32
    %r18 = sext i32 %r17 to i64
    %r21 = fptrunc double %r19 to float
    %r25 = add i64 %r18, %r23
    %r26 = call i32 @printf(ptr @.r22, i64 %r18)
    %r28 = call i32 @printf(ptr @.r27, i64 %r25)
    %r32 = sub i64 %r25, %r30
    %r33 = call i32 @printf(ptr @.r29, i64 %r25)
    %r35 = call i32 @printf(ptr @.r34, i64 %r32)
    %r39 = add i64 %r32, %r37
    %r40 = call i32 @printf(ptr @.r36, i64 %r39)
    %r42 = call i32 @printf(ptr @.r41, i64 %r39)
    %r46 = sub i64 %r39, %r44
    %r47 = call i32 @printf(ptr @.r43, i64 %r46)
    %r49 = call i32 @printf(ptr @.r48, i64 %r46)
    %r53 = add i32 %r17, %r51
    %r54 = call i32 @printf(ptr @.r50, i32 %r17)
    %r56 = call i32 @printf(ptr @.r55, i32 %r53)
    %r60 = sub i32 %r53, %r58
    %r61 = call i32 @printf(ptr @.r57, i32 %r53)
    %r63 = call i32 @printf(ptr @.r62, i32 %r60)
    %r67 = add i32 %r60, %r65
    %r68 = call i32 @printf(ptr @.r64, i32 %r67)
    %r70 = call i32 @printf(ptr @.r69, i32 %r67)
    %r74 = sub i32 %r67, %r72
    %r75 = call i32 @printf(ptr @.r71, i32 %r74)
    %r77 = call i32 @printf(ptr @.r76, i32 %r74)
    %r81 = add i16 %r16, %r79
    %r82 = call i32 @printf(ptr @.r78, i16 %r16)
    %r84 = call i32 @printf(ptr @.r83, i16 %r81)
    %r88 = sub i16 %r81, %r86
    %r89 = call i32 @printf(ptr @.r85, i16 %r81)
    %r91 = call i32 @printf(ptr @.r90, i16 %r88)
    %r95 = add i16 %r88, %r93
    %r96 = call i32 @printf(ptr @.r92, i16 %r95)
    %r98 = call i32 @printf(ptr @.r97, i16 %r95)
    %r102 = sub i16 %r95, %r100
    %r103 = call i32 @printf(ptr @.r99, i16 %r102)
    %r105 = call i32 @printf(ptr @.r104, i16 %r102)
    %r110 = call i32 @printf(ptr @.r106, i8 %r14)
    %r112 = call i32 @printf(ptr @.r111, i8 %r202)
    %r117 = call i32 @printf(ptr @.r113, i8 %r202)
    %r119 = call i32 @printf(ptr @.r118, i8 %r206)
    %r124 = call i32 @printf(ptr @.r120, i8 %r210)
    %r126 = call i32 @printf(ptr @.r125, i8 %r210)
    %r131 = call i32 @printf(ptr @.r127, i8 %r214)
    %r133 = call i32 @printf(ptr @.r132, i8 %r214)
    %r137 = fadd float %r21, %r135
    %r138 = fpext float %r21 to double
    %r139 = call i32 @printf(ptr @.r134, double %r138)
    %r141 = fpext float %r137 to double
    %r142 = call i32 @printf(ptr @.r140, double %r141)
    %r146 = fsub float %r137, %r144
    %r147 = fpext float %r137 to double
    %r148 = call i32 @printf(ptr @.r143, double %r147)
    %r150 = fpext float %r146 to double
    %r151 = call i32 @printf(ptr @.r149, double %r150)
    %r155 = fadd float %r146, %r153
    %r156 = fpext float %r155 to double
    %r157 = call i32 @printf(ptr @.r152, double %r156)
    %r159 = fpext float %r155 to double
    %r160 = call i32 @printf(ptr @.r158, double %r159)
    %r164 = fsub float %r155, %r162
    %r165 = fpext float %r164 to double
    %r166 = call i32 @printf(ptr @.r161, double %r165)
    %r168 = fpext float %r164 to double
    %r169 = call i32 @printf(ptr @.r167, double %r168)
    %r174 = call i32 @printf(ptr @.r170, double %r19)
    %r176 = call i32 @printf(ptr @.r175, double %r204)
    %r181 = call i32 @printf(ptr @.r177, double %r204)
    %r183 = call i32 @printf(ptr @.r182, double %r208)
    %r188 = call i32 @printf(ptr @.r184, double %r212)
    %r190 = call i32 @printf(ptr @.r189, double %r212)
    %r195 = call i32 @printf(ptr @.r191, double %r216)
    %r197 = call i32 @printf(ptr @.r196, double %r216)
    %r200 = trunc i64 %r198 to i32
    ret i32 %r200
}
