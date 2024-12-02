%struct._mini_foo = type {
    i64,
    i64,
    ptr
}

%struct._mini_simple = type {
    i64
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global ptr zeroinitializer






@.r187 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r189 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r191 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r193 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r195 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r198 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r202 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r206 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r209 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define void @_mini_tailrecursive(i64 %r6) {
l2:
    %r8 = alloca i64
	store i64 0, ptr %r8
	%r7 = load i64, ptr %r8
    %r11 = alloca i1
	store i1 0, ptr %r11
	%r10 = load i1, ptr %r11
    %r14 = alloca i64
	store i64 1, ptr %r14
	%r13 = load i64, ptr %r14
    %r9 = icmp sle i64 %r6, %r7
    %r12 = icmp ne i1 %r9, %r10
    br i1 %r12, label %l1, label %l5
l5:
    %r15 = sub i64 %r6, %r13
    call void @_mini_tailrecursive(i64 %r15)
    br label %l1
l1:
    ret void
}
define i64 @_mini_add(i64 %r17, i64 %r18) {
l7:
    %r19 = add i64 %r17, %r18
    ret i64 %r19
}
define void @_mini_domath(i64 %r22) {
l9:
    %r32 = alloca i64
	store i64 24, ptr %r32
	%r31 = load i64, ptr %r32
    %r36 = alloca i64
	store i64 8, ptr %r36
	%r35 = load i64, ptr %r36
    %r41 = alloca i64
	store i64 24, ptr %r41
	%r40 = load i64, ptr %r41
    %r45 = alloca i64
	store i64 8, ptr %r45
	%r44 = load i64, ptr %r45
    %r51 = alloca i64
	store i64 3, ptr %r51
	%r50 = load i64, ptr %r51
    %r64 = alloca i64
	store i64 0, ptr %r64
	%r63 = load i64, ptr %r64
    %r68 = alloca i1
	store i1 0, ptr %r68
	%r67 = load i1, ptr %r68
    %r99 = alloca i64
	store i64 1, ptr %r99
	%r98 = load i64, ptr %r99
    %r106 = alloca i64
	store i64 0, ptr %r106
	%r105 = load i64, ptr %r106
    %r110 = alloca i1
	store i1 0, ptr %r110
	%r109 = load i1, ptr %r110
    %r33 = call ptr @malloc(i64 %r31)
    %r34 = bitcast ptr %r33 to %struct._mini_foo*
    %r37 = call ptr @malloc(i64 %r35)
    %r38 = getelementptr inbounds %struct._mini_foo, ptr %r34, i32 0, i32 2
    %r39 = bitcast ptr %r37 to %struct._mini_simple*
    store ptr %r39, ptr %r38
    %r42 = call ptr @malloc(i64 %r40)
    %r43 = bitcast ptr %r42 to %struct._mini_foo*
    %r46 = call ptr @malloc(i64 %r44)
    %r47 = getelementptr inbounds %struct._mini_foo, ptr %r43, i32 0, i32 2
    %r48 = bitcast ptr %r46 to %struct._mini_simple*
    store ptr %r48, ptr %r47
    %r49 = getelementptr inbounds %struct._mini_foo, ptr %r34, i32 0, i32 0
    store i64 %r22, ptr %r49
    %r52 = getelementptr inbounds %struct._mini_foo, ptr %r43, i32 0, i32 0
    store i64 %r50, ptr %r52
    %r53 = getelementptr inbounds %struct._mini_foo, ptr %r34, i32 0, i32 0
    %r54 = load i64, ptr %r53
    %r55 = getelementptr inbounds %struct._mini_foo, ptr %r34, i32 0, i32 2
    %r56 = load ptr, ptr %r55
    %r57 = getelementptr inbounds %struct._mini_simple, ptr %r56, i32 0, i32 0
    store i64 %r54, ptr %r57
    %r58 = getelementptr inbounds %struct._mini_foo, ptr %r43, i32 0, i32 0
    %r59 = load i64, ptr %r58
    %r60 = getelementptr inbounds %struct._mini_foo, ptr %r43, i32 0, i32 2
    %r61 = load ptr, ptr %r60
    %r62 = getelementptr inbounds %struct._mini_simple, ptr %r61, i32 0, i32 0
    store i64 %r59, ptr %r62
    %r65 = icmp sgt i64 %r22, %r63
    %r66 = icmp ne i1 %r65, %r67
    br i1 %r66, label %l10, label %l12
l10:
    %r69 = phi i64 [%r100, %l10], [%r22, %l9]
    %r71 = phi ptr [%r71, %l10], [%r34, %l9]
    %r72 = phi ptr [%r72, %l10], [%r43, %l9]
    %r73 = getelementptr inbounds %struct._mini_foo, ptr %r71, i32 0, i32 0
    %r74 = load i64, ptr %r73
    %r75 = getelementptr inbounds %struct._mini_foo, ptr %r72, i32 0, i32 0
    %r76 = load i64, ptr %r75
    %r78 = getelementptr inbounds %struct._mini_foo, ptr %r71, i32 0, i32 2
    %r79 = load ptr, ptr %r78
    %r80 = getelementptr inbounds %struct._mini_simple, ptr %r79, i32 0, i32 0
    %r81 = load i64, ptr %r80
    %r83 = getelementptr inbounds %struct._mini_foo, ptr %r72, i32 0, i32 0
    %r84 = load i64, ptr %r83
    %r86 = getelementptr inbounds %struct._mini_foo, ptr %r72, i32 0, i32 2
    %r87 = load ptr, ptr %r86
    %r88 = getelementptr inbounds %struct._mini_simple, ptr %r87, i32 0, i32 0
    %r89 = load i64, ptr %r88
    %r90 = getelementptr inbounds %struct._mini_foo, ptr %r71, i32 0, i32 0
    %r91 = load i64, ptr %r90
    %r92 = call i64 @_mini_add(i64 %r89, i64 %r91)
    %r93 = getelementptr inbounds %struct._mini_foo, ptr %r72, i32 0, i32 0
    %r94 = load i64, ptr %r93
    %r95 = getelementptr inbounds %struct._mini_foo, ptr %r71, i32 0, i32 0
    %r96 = load i64, ptr %r95
    %r100 = sub i64 %r69, %r98
    %r107 = icmp sgt i64 %r100, %r105
    %r108 = icmp ne i1 %r107, %r109
    br i1 %r108, label %l10, label %l12
l12:
    %r113 = phi ptr [%r71, %l10], [%r34, %l9]
    %r114 = phi ptr [%r72, %l10], [%r43, %l9]
    %r115 = bitcast ptr %r113 to i8*
    call void @free(ptr %r115)
    %r116 = bitcast ptr %r114 to i8*
    call void @free(ptr %r116)
    ret void
}
define void @_mini_objinstantiation(i64 %r118) {
l14:
    %r123 = alloca i64
	store i64 0, ptr %r123
	%r122 = load i64, ptr %r123
    %r127 = alloca i1
	store i1 0, ptr %r127
	%r126 = load i1, ptr %r127
    %r131 = alloca i64
	store i64 24, ptr %r131
	%r130 = load i64, ptr %r131
    %r136 = alloca i64
	store i64 1, ptr %r136
	%r135 = load i64, ptr %r136
    %r141 = alloca i64
	store i64 0, ptr %r141
	%r140 = load i64, ptr %r141
    %r145 = alloca i1
	store i1 0, ptr %r145
	%r144 = load i1, ptr %r145
    %r124 = icmp sgt i64 %r118, %r122
    %r125 = icmp ne i1 %r124, %r126
    br i1 %r125, label %l15, label %l13
l15:
    %r128 = phi i64 [%r137, %l15], [%r118, %l14]
    %r132 = call ptr @malloc(i64 %r130)
    %r133 = bitcast ptr %r132 to %struct._mini_foo*
    %r134 = bitcast ptr %r133 to i8*
    call void @free(ptr %r134)
    %r137 = sub i64 %r128, %r135
    %r142 = icmp sgt i64 %r137, %r140
    %r143 = icmp ne i1 %r142, %r144
    br i1 %r143, label %l15, label %l13
l13:
    ret void
}
define i64 @_mini_ackermann(i64 %r149, i64 %r150) {
l19:
    %r152 = alloca i64
	store i64 0, ptr %r152
	%r151 = load i64, ptr %r152
    %r155 = alloca i1
	store i1 0, ptr %r155
	%r154 = load i1, ptr %r155
    %r158 = alloca i64
	store i64 1, ptr %r158
	%r157 = load i64, ptr %r158
    %r161 = alloca i64
	store i64 0, ptr %r161
	%r160 = load i64, ptr %r161
    %r164 = alloca i1
	store i1 0, ptr %r164
	%r163 = load i1, ptr %r164
    %r167 = alloca i64
	store i64 1, ptr %r167
	%r166 = load i64, ptr %r167
    %r170 = alloca i64
	store i64 1, ptr %r170
	%r169 = load i64, ptr %r170
    %r173 = alloca i64
	store i64 1, ptr %r173
	%r172 = load i64, ptr %r173
    %r176 = alloca i64
	store i64 1, ptr %r176
	%r175 = load i64, ptr %r176
    %r153 = icmp eq i64 %r149, %r151
    %r156 = icmp ne i1 %r153, %r154
    br i1 %r156, label %l20, label %l22
l20:
    %r159 = add i64 %r150, %r157
    br label %l18
l22:
    %r162 = icmp eq i64 %r150, %r160
    %r165 = icmp ne i1 %r162, %r163
    br i1 %r165, label %l23, label %l24
l23:
    %r168 = sub i64 %r149, %r166
    %r171 = call i64 @_mini_ackermann(i64 %r168, i64 %r169)
    br label %l18
l24:
    %r174 = sub i64 %r149, %r172
    %r177 = sub i64 %r150, %r175
    %r178 = call i64 @_mini_ackermann(i64 %r149, i64 %r177)
    %r179 = call i64 @_mini_ackermann(i64 %r174, i64 %r178)
    br label %l18
l18:
    %r180 = phi i64 [%r159, %l20], [%r171, %l23], [%r179, %l24]
    ret i64 %r180
}
define i64 @_mini_main() {
l26:
    %r182 = alloca i64
    %r183 = alloca i64
    %r184 = alloca i64
    %r185 = alloca i64
    %r186 = alloca i64
    %r215 = alloca i64
	store i64 0, ptr %r215
	%r214 = load i64, ptr %r215
    %r188 = call i32 @scanf(ptr @.r187, ptr %r182)
    %r190 = call i32 @scanf(ptr @.r189, ptr %r183)
    %r192 = call i32 @scanf(ptr @.r191, ptr %r184)
    %r194 = call i32 @scanf(ptr @.r193, ptr %r185)
    %r196 = call i32 @scanf(ptr @.r195, ptr %r186)
    %r197 = load i64, ptr %r182
    call void @_mini_tailrecursive(i64 %r197)
    %r199 = load i64, ptr %r182
    %r200 = call i32 @printf(ptr @.r198, i64 %r199)
    %r201 = load i64, ptr %r183
    call void @_mini_domath(i64 %r201)
    %r203 = load i64, ptr %r183
    %r204 = call i32 @printf(ptr @.r202, i64 %r203)
    %r205 = load i64, ptr %r184
    call void @_mini_objinstantiation(i64 %r205)
    %r207 = load i64, ptr %r184
    %r208 = call i32 @printf(ptr @.r206, i64 %r207)
    %r210 = load i64, ptr %r185
    %r211 = load i64, ptr %r186
    %r212 = call i64 @_mini_ackermann(i64 %r210, i64 %r211)
    %r213 = call i32 @printf(ptr @.r209, i64 %r212)
    ret i64 %r214
}
define i32 @main() {
l28:
    %r218 = call i64 @_mini_main()
    %r219 = trunc i64 %r218 to i32
    ret i32 %r219
}
