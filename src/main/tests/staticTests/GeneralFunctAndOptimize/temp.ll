%struct._mini_IntHolder = type {
    i64
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global i64 zeroinitializer
@.r5 = global i64 zeroinitializer



@.r75 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r77 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r79 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r82 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r232 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r234 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_multBy4xTimes(ptr %r7, i64 %r8) {
l2:
    %r10 = alloca i64
	store i64 0, ptr %r10
	%r9 = load i64, ptr %r10
    %r13 = alloca i1
	store i1 0, ptr %r13
	%r12 = load i1, ptr %r13
    %r18 = alloca i64
	store i64 4, ptr %r18
	%r17 = load i64, ptr %r18
    %r24 = alloca i64
	store i64 1, ptr %r24
	%r23 = load i64, ptr %r24
    %r11 = icmp sle i64 %r8, %r9
    %r14 = icmp ne i1 %r11, %r12
    br i1 %r14, label %l3, label %l5
l3:
    %r15 = getelementptr inbounds %struct._mini_IntHolder, ptr %r7, i32 0, i32 0
    %r16 = load i64, ptr %r15
    br label %l1
l5:
    %r19 = getelementptr inbounds %struct._mini_IntHolder, ptr %r7, i32 0, i32 0
    %r20 = load i64, ptr %r19
    %r21 = mul i64 %r17, %r20
    %r22 = getelementptr inbounds %struct._mini_IntHolder, ptr %r7, i32 0, i32 0
    store i64 %r21, ptr %r22
    %r25 = sub i64 %r8, %r23
    %r26 = call i64 @_mini_multBy4xTimes(ptr %r7, i64 %r25)
    %r27 = getelementptr inbounds %struct._mini_IntHolder, ptr %r7, i32 0, i32 0
    %r28 = load i64, ptr %r27
    br label %l1
l1:
    %r29 = phi i64 [%r16, %l3], [%r28, %l5]
    ret i64 %r29
}
define void @_mini_divideBy8(ptr %r31) {
l7:
    %r35 = alloca i64
	store i64 2, ptr %r35
	%r34 = load i64, ptr %r35
    %r41 = alloca i64
	store i64 2, ptr %r41
	%r40 = load i64, ptr %r41
    %r47 = alloca i64
	store i64 2, ptr %r47
	%r46 = load i64, ptr %r47
    %r32 = getelementptr inbounds %struct._mini_IntHolder, ptr %r31, i32 0, i32 0
    %r33 = load i64, ptr %r32
    %r36 = sdiv i64 %r33, %r34
    %r37 = getelementptr inbounds %struct._mini_IntHolder, ptr %r31, i32 0, i32 0
    store i64 %r36, ptr %r37
    %r38 = getelementptr inbounds %struct._mini_IntHolder, ptr %r31, i32 0, i32 0
    %r39 = load i64, ptr %r38
    %r42 = sdiv i64 %r39, %r40
    %r43 = getelementptr inbounds %struct._mini_IntHolder, ptr %r31, i32 0, i32 0
    store i64 %r42, ptr %r43
    %r44 = getelementptr inbounds %struct._mini_IntHolder, ptr %r31, i32 0, i32 0
    %r45 = load i64, ptr %r44
    %r48 = sdiv i64 %r45, %r46
    %r49 = getelementptr inbounds %struct._mini_IntHolder, ptr %r31, i32 0, i32 0
    store i64 %r48, ptr %r49
    ret void
}
define i64 @_mini_main() {
l9:
    %r51 = alloca i64
    %r70 = alloca i64
	store i64 8, ptr %r70
	%r69 = load i64, ptr %r70
    %r74 = alloca i64
	store i64 1000000, ptr %r74
	%r73 = load i64, ptr %r74
    %r86 = alloca i64
	store i64 0, ptr %r86
	%r85 = load i64, ptr %r86
    %r88 = alloca i64
	store i64 0, ptr %r88
	%r87 = load i64, ptr %r88
    %r90 = alloca i64
	store i64 0, ptr %r90
	%r89 = load i64, ptr %r90
    %r92 = alloca i64
	store i64 50, ptr %r92
	%r91 = load i64, ptr %r92
    %r96 = alloca i1
	store i1 0, ptr %r96
	%r95 = load i1, ptr %r96
    %r106 = alloca i64
	store i64 0, ptr %r106
	%r105 = load i64, ptr %r106
    %r111 = alloca i1
	store i1 0, ptr %r111
	%r110 = load i1, ptr %r111
    %r262 = alloca i64
	store i64 39916800, ptr %r262
	%r261 = load i64, ptr %r262
    %r153 = alloca i64
	store i64 1, ptr %r153
	%r152 = load i64, ptr %r153
    %r159 = alloca i64
	store i64 2, ptr %r159
	%r158 = load i64, ptr %r159
    %r163 = alloca i64
	store i64 1, ptr %r163
	%r162 = load i64, ptr %r163
    %r170 = alloca i64
	store i64 0, ptr %r170
	%r169 = load i64, ptr %r170
    %r173 = alloca i1
	store i1 0, ptr %r173
	%r172 = load i1, ptr %r173
    %r176 = alloca i64
	store i64 1, ptr %r176
	%r175 = load i64, ptr %r176
    %r198 = alloca i1
	store i1 0, ptr %r198
	%r197 = load i1, ptr %r198
    %r208 = alloca i64
	store i64 1, ptr %r208
	%r207 = load i64, ptr %r208
    %r219 = alloca i64
	store i64 50, ptr %r219
	%r218 = load i64, ptr %r219
    %r223 = alloca i1
	store i1 0, ptr %r223
	%r222 = load i1, ptr %r223
    %r237 = alloca i64
	store i64 0, ptr %r237
	%r236 = load i64, ptr %r237
    %r71 = call ptr @malloc(i64 %r69)
    %r72 = bitcast ptr %r71 to %struct._mini_IntHolder*
    store i64 %r73, ptr @.r5
    %r76 = call i32 @scanf(ptr @.r75, ptr %r51)
    %r78 = call i32 @scanf(ptr @.r77, ptr @.r4)
    %r80 = load i64, ptr %r51
    %r81 = call i32 @printf(ptr @.r79, i64 %r80)
    %r83 = load i64, ptr @.r4
    %r84 = call i32 @printf(ptr @.r82, i64 %r83)
    %r93 = icmp slt i64 %r85, %r91
    %r94 = icmp ne i1 %r93, %r95
    br i1 %r94, label %l10, label %l12
l10:
    %r99 = phi ptr [%r72, %l9], [%r201, %l15]
    %r102 = phi i64 [%r85, %l9], [%r209, %l15]
    %r103 = phi i64 [%r89, %l9], [%r205, %l15]
    %r107 = load i64, ptr @.r5
    %r108 = icmp sle i64 %r105, %r107
    %r109 = icmp ne i1 %r108, %r110
    br i1 %r109, label %l13, label %l15
l13:
    %r113 = phi i64 [%r105, %l10], [%r185, %l18]
    %r114 = phi ptr [%r99, %l10], [%r179, %l18]
    %r117 = phi i64 [%r102, %l10], [%r182, %l18]
    %r154 = add i64 %r113, %r152
    %r155 = getelementptr inbounds %struct._mini_IntHolder, ptr %r114, i32 0, i32 0
    store i64 %r154, ptr %r155
    %r156 = getelementptr inbounds %struct._mini_IntHolder, ptr %r114, i32 0, i32 0
    %r157 = load i64, ptr %r156
    %r160 = call i64 @_mini_multBy4xTimes(ptr %r114, i64 %r158)
    call void @_mini_divideBy8(ptr %r114)
    %r161 = load i64, ptr @.r4
    %r164 = sub i64 %r161, %r162
    %r171 = icmp sle i64 %r164, %r169
    %r174 = icmp ne i1 %r171, %r172
    br i1 %r174, label %l16, label %l18
l16:
    br label %l18
l18:
    %r177 = phi i64 [%r175, %l16], [%r164, %l13]
    %r178 = phi i64 [%r154, %l16], [%r154, %l13]
    %r179 = phi ptr [%r114, %l16], [%r114, %l13]
    %r182 = phi i64 [%r117, %l16], [%r117, %l13]
    %r183 = phi i64 [%r261, %l16], [%r261, %l13]
    %r185 = add i64 %r178, %r177
    %r194 = load i64, ptr @.r5
    %r195 = icmp sle i64 %r185, %r194
    %r196 = icmp ne i1 %r195, %r197
    br i1 %r196, label %l13, label %l15
l15:
    %r200 = phi i64 [%r105, %l10], [%r185, %l18]
    %r201 = phi ptr [%r99, %l10], [%r179, %l18]
    %r204 = phi i64 [%r102, %l10], [%r182, %l18]
    %r205 = phi i64 [%r103, %l10], [%r183, %l18]
    %r209 = add i64 %r204, %r207
    %r220 = icmp slt i64 %r209, %r218
    %r221 = icmp ne i1 %r220, %r222
    br i1 %r221, label %l10, label %l12
l12:
    %r225 = phi i64 [%r87, %l9], [%r200, %l15]
    %r230 = phi i64 [%r89, %l9], [%r205, %l15]
    %r233 = call i32 @printf(ptr @.r232, i64 %r225)
    %r235 = call i32 @printf(ptr @.r234, i64 %r230)
    ret i64 %r236
}
define i32 @main() {
l20:
    %r240 = call i64 @_mini_main()
    %r241 = trunc i64 %r240 to i32
    ret i32 %r241
}
