%struct._mini_Node = type {
    i64,
    ptr,
    ptr
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global i64 zeroinitializer



@.r112 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r124 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r156 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r165 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_compare(ptr %r6, ptr %r7) {
l2:
    %r8 = getelementptr inbounds %struct._mini_Node, ptr %r6, i32 0, i32 0
    %r9 = load i64, ptr %r8
    %r10 = getelementptr inbounds %struct._mini_Node, ptr %r7, i32 0, i32 0
    %r11 = load i64, ptr %r10
    %r12 = sub i64 %r9, %r11
    ret i64 %r12
}
define void @_mini_deathSort(ptr %r15) {
l4:
    %r24 = alloca i64
	store i64 1, ptr %r24
	%r23 = load i64, ptr %r24
    %r26 = alloca i64
	store i64 1, ptr %r26
	%r25 = load i64, ptr %r26
    %r30 = alloca i1
	store i1 0, ptr %r30
	%r29 = load i1, ptr %r30
    %r36 = alloca i64
	store i64 0, ptr %r36
	%r35 = load i64, ptr %r36
    %r42 = alloca i1
	store i1 0, ptr %r42
	%r41 = load i1, ptr %r42
    %r51 = alloca i64
	store i64 0, ptr %r51
	%r50 = load i64, ptr %r51
    %r54 = alloca i1
	store i1 0, ptr %r54
	%r53 = load i1, ptr %r54
    %r67 = alloca i64
	store i64 1, ptr %r67
	%r66 = load i64, ptr %r67
    %r83 = alloca i1
	store i1 0, ptr %r83
	%r82 = load i1, ptr %r83
    %r93 = alloca i64
	store i64 1, ptr %r93
	%r92 = load i64, ptr %r93
    %r97 = alloca i1
	store i1 0, ptr %r97
	%r96 = load i1, ptr %r97
    %r27 = icmp eq i64 %r23, %r25
    %r28 = icmp ne i1 %r27, %r29
    br i1 %r28, label %l5, label %l3
l5:
    %r34 = phi ptr [%r87, %l10], [%r15, %l4]
    %r37 = getelementptr inbounds %struct._mini_Node, ptr %r34, i32 0, i32 2
    %r38 = load ptr, ptr %r37
    %r39 = icmp ne ptr %r38, %r34
    %r40 = icmp ne i1 %r39, %r41
    br i1 %r40, label %l8, label %l10
l8:
    %r43 = phi ptr [%r34, %l5], [%r73, %l13]
    %r45 = phi i64 [%r35, %l5], [%r70, %l13]
    %r46 = phi ptr [%r34, %l5], [%r71, %l13]
    %r47 = getelementptr inbounds %struct._mini_Node, ptr %r43, i32 0, i32 2
    %r48 = load ptr, ptr %r47
    %r49 = call i64 @_mini_compare(ptr %r43, ptr %r48)
    %r52 = icmp sgt i64 %r49, %r50
    %r55 = icmp ne i1 %r52, %r53
    br i1 %r55, label %l11, label %l13
l11:
    %r56 = getelementptr inbounds %struct._mini_Node, ptr %r43, i32 0, i32 0
    %r57 = load i64, ptr %r56
    %r58 = getelementptr inbounds %struct._mini_Node, ptr %r43, i32 0, i32 2
    %r59 = load ptr, ptr %r58
    %r60 = getelementptr inbounds %struct._mini_Node, ptr %r59, i32 0, i32 0
    %r61 = load i64, ptr %r60
    %r62 = getelementptr inbounds %struct._mini_Node, ptr %r43, i32 0, i32 0
    store i64 %r61, ptr %r62
    %r63 = getelementptr inbounds %struct._mini_Node, ptr %r43, i32 0, i32 2
    %r64 = load ptr, ptr %r63
    %r65 = getelementptr inbounds %struct._mini_Node, ptr %r64, i32 0, i32 0
    store i64 %r57, ptr %r65
    br label %l13
l13:
    %r68 = phi ptr [%r43, %l8], [%r43, %l11]
    %r70 = phi i64 [%r45, %l8], [%r66, %l11]
    %r71 = phi ptr [%r46, %l8], [%r46, %l11]
    %r72 = getelementptr inbounds %struct._mini_Node, ptr %r68, i32 0, i32 2
    %r73 = load ptr, ptr %r72
    %r78 = getelementptr inbounds %struct._mini_Node, ptr %r73, i32 0, i32 2
    %r79 = load ptr, ptr %r78
    %r80 = icmp ne ptr %r79, %r71
    %r81 = icmp ne i1 %r80, %r82
    br i1 %r81, label %l8, label %l10
l10:
    %r86 = phi i64 [%r35, %l5], [%r70, %l13]
    %r87 = phi ptr [%r34, %l5], [%r71, %l13]
    %r94 = icmp eq i64 %r86, %r92
    %r95 = icmp ne i1 %r94, %r96
    br i1 %r95, label %l5, label %l3
l3:
    ret void
}
define void @_mini_printEVILList(ptr %r103) {
l15:
    %r120 = alloca i1
	store i1 0, ptr %r120
	%r119 = load i1, ptr %r120
    %r137 = alloca i1
	store i1 0, ptr %r137
	%r136 = load i1, ptr %r137
    %r110 = getelementptr inbounds %struct._mini_Node, ptr %r103, i32 0, i32 2
    %r111 = load ptr, ptr %r110
    %r113 = getelementptr inbounds %struct._mini_Node, ptr %r103, i32 0, i32 0
    %r114 = load i64, ptr %r113
    %r115 = call i32 @printf(ptr @.r112, i64 %r114)
    %r116 = bitcast ptr %r103 to i8*
    call void @free(ptr %r116)
    %r117 = icmp ne ptr %r111, %r103
    %r118 = icmp ne i1 %r117, %r119
    br i1 %r118, label %l16, label %l14
l16:
    %r121 = phi ptr [%r129, %l16], [%r111, %l15]
    %r122 = phi ptr [%r122, %l16], [%r103, %l15]
    %r125 = getelementptr inbounds %struct._mini_Node, ptr %r121, i32 0, i32 0
    %r126 = load i64, ptr %r125
    %r127 = call i32 @printf(ptr @.r124, i64 %r126)
    %r128 = getelementptr inbounds %struct._mini_Node, ptr %r121, i32 0, i32 2
    %r129 = load ptr, ptr %r128
    %r130 = bitcast ptr %r121 to i8*
    call void @free(ptr %r130)
    %r134 = icmp ne ptr %r129, %r122
    %r135 = icmp ne i1 %r134, %r136
    br i1 %r135, label %l16, label %l14
l14:
    ret void
}
define i64 @_mini_main() {
l20:
    %r142 = alloca i64
    %r155 = alloca i64
	store i64 666, ptr %r155
	%r154 = load i64, ptr %r155
    %r160 = alloca i64
	store i64 0, ptr %r160
	%r159 = load i64, ptr %r160
    %r163 = alloca i1
	store i1 0, ptr %r163
	%r162 = load i1, ptr %r163
    %r235 = alloca i64
	store i64 -1, ptr %r235
	%r234 = load i64, ptr %r235
    %r237 = alloca i64
	store i64 -1, ptr %r237
	%r236 = load i64, ptr %r237
    %r179 = alloca i64
	store i64 1000, ptr %r179
	%r178 = load i64, ptr %r179
    %r183 = alloca i64
	store i64 24, ptr %r183
	%r182 = load i64, ptr %r183
    %r190 = alloca i64
	store i64 1, ptr %r190
	%r189 = load i64, ptr %r190
    %r193 = alloca i64
	store i64 0, ptr %r193
	%r192 = load i64, ptr %r193
    %r197 = alloca i1
	store i1 0, ptr %r197
	%r196 = load i1, ptr %r197
    %r203 = alloca i64
	store i64 24, ptr %r203
	%r202 = load i64, ptr %r203
    %r211 = alloca i64
	store i64 1, ptr %r211
	%r210 = load i64, ptr %r211
    %r218 = alloca i64
	store i64 0, ptr %r218
	%r217 = load i64, ptr %r218
    %r222 = alloca i1
	store i1 0, ptr %r222
	%r221 = load i1, ptr %r222
    %r228 = alloca i64
	store i64 0, ptr %r228
	%r227 = load i64, ptr %r228
    store i64 %r154, ptr @.r4
    %r157 = call i32 @scanf(ptr @.r156, ptr %r142)
    %r158 = load i64, ptr %r142
    %r161 = icmp sle i64 %r158, %r159
    %r164 = icmp ne i1 %r161, %r162
    br i1 %r164, label %l21, label %l23
l21:
    %r171 = call i32 @printf(ptr @.r165, i64 %r234)
    br label %l19
l23:
    %r177 = load i64, ptr %r142
    %r180 = mul i64 %r177, %r178
    store i64 %r180, ptr %r142
    %r181 = load i64, ptr %r142
    %r184 = call ptr @malloc(i64 %r182)
    %r185 = bitcast ptr %r184 to %struct._mini_Node*
    %r186 = getelementptr inbounds %struct._mini_Node, ptr %r185, i32 0, i32 0
    store i64 %r181, ptr %r186
    %r187 = getelementptr inbounds %struct._mini_Node, ptr %r185, i32 0, i32 1
    store ptr %r185, ptr %r187
    %r188 = getelementptr inbounds %struct._mini_Node, ptr %r185, i32 0, i32 2
    store ptr %r185, ptr %r188
    %r191 = sub i64 %r181, %r189
    %r194 = icmp sgt i64 %r191, %r192
    %r195 = icmp ne i1 %r194, %r196
    br i1 %r195, label %l24, label %l26
l24:
    %r198 = phi ptr [%r205, %l24], [%r185, %l23]
    %r200 = phi i64 [%r212, %l24], [%r191, %l23]
    %r201 = phi ptr [%r201, %l24], [%r185, %l23]
    %r204 = call ptr @malloc(i64 %r202)
    %r205 = bitcast ptr %r204 to %struct._mini_Node*
    %r206 = getelementptr inbounds %struct._mini_Node, ptr %r205, i32 0, i32 0
    store i64 %r200, ptr %r206
    %r207 = getelementptr inbounds %struct._mini_Node, ptr %r205, i32 0, i32 1
    store ptr %r198, ptr %r207
    %r208 = getelementptr inbounds %struct._mini_Node, ptr %r205, i32 0, i32 2
    store ptr %r201, ptr %r208
    %r209 = getelementptr inbounds %struct._mini_Node, ptr %r198, i32 0, i32 2
    store ptr %r205, ptr %r209
    %r212 = sub i64 %r200, %r210
    %r219 = icmp sgt i64 %r212, %r217
    %r220 = icmp ne i1 %r219, %r221
    br i1 %r220, label %l24, label %l26
l26:
    %r226 = phi ptr [%r201, %l24], [%r185, %l23]
    call void @_mini_deathSort(ptr %r226)
    call void @_mini_printEVILList(ptr %r226)
    br label %l19
l19:
    %r229 = phi i64 [%r236, %l21], [%r227, %l26]
    ret i64 %r229
}
define i32 @main() {
l28:
    %r231 = call i64 @_mini_main()
    %r232 = trunc i64 %r231 to i32
    ret i32 %r232
}
