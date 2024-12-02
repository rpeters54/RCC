%struct._mini_node = type {
    i64,
    ptr
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)

@.r51 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r54 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r57 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r60 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r63 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r66 = private unnamed_addr constant [4 x i8] c"%ld\00"

@.r109 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r159 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"


@.r259 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r294 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r296 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define ptr @_mini_buildList() {
l2:
    %r28 = alloca i64
	store i64 16, ptr %r28
	%r27 = load i64, ptr %r28
    %r32 = alloca i64
	store i64 16, ptr %r32
	%r31 = load i64, ptr %r32
    %r36 = alloca i64
	store i64 16, ptr %r36
	%r35 = load i64, ptr %r36
    %r40 = alloca i64
	store i64 16, ptr %r40
	%r39 = load i64, ptr %r40
    %r44 = alloca i64
	store i64 16, ptr %r44
	%r43 = load i64, ptr %r44
    %r48 = alloca i64
	store i64 16, ptr %r48
	%r47 = load i64, ptr %r48
    %r75 = alloca ptr
	store ptr null, ptr %r75
	%r74 = load ptr, ptr %r75
    %r29 = call ptr @malloc(i64 %r27)
    %r30 = bitcast ptr %r29 to %struct._mini_node*
    %r33 = call ptr @malloc(i64 %r31)
    %r34 = bitcast ptr %r33 to %struct._mini_node*
    %r37 = call ptr @malloc(i64 %r35)
    %r38 = bitcast ptr %r37 to %struct._mini_node*
    %r41 = call ptr @malloc(i64 %r39)
    %r42 = bitcast ptr %r41 to %struct._mini_node*
    %r45 = call ptr @malloc(i64 %r43)
    %r46 = bitcast ptr %r45 to %struct._mini_node*
    %r49 = call ptr @malloc(i64 %r47)
    %r50 = bitcast ptr %r49 to %struct._mini_node*
    %r52 = getelementptr inbounds %struct._mini_node, ptr %r30, i32 0, i32 0
    %r53 = call i32 @scanf(ptr @.r51, ptr %r52)
    %r55 = getelementptr inbounds %struct._mini_node, ptr %r34, i32 0, i32 0
    %r56 = call i32 @scanf(ptr @.r54, ptr %r55)
    %r58 = getelementptr inbounds %struct._mini_node, ptr %r38, i32 0, i32 0
    %r59 = call i32 @scanf(ptr @.r57, ptr %r58)
    %r61 = getelementptr inbounds %struct._mini_node, ptr %r42, i32 0, i32 0
    %r62 = call i32 @scanf(ptr @.r60, ptr %r61)
    %r64 = getelementptr inbounds %struct._mini_node, ptr %r46, i32 0, i32 0
    %r65 = call i32 @scanf(ptr @.r63, ptr %r64)
    %r67 = getelementptr inbounds %struct._mini_node, ptr %r50, i32 0, i32 0
    %r68 = call i32 @scanf(ptr @.r66, ptr %r67)
    %r69 = getelementptr inbounds %struct._mini_node, ptr %r30, i32 0, i32 1
    store ptr %r34, ptr %r69
    %r70 = getelementptr inbounds %struct._mini_node, ptr %r34, i32 0, i32 1
    store ptr %r38, ptr %r70
    %r71 = getelementptr inbounds %struct._mini_node, ptr %r38, i32 0, i32 1
    store ptr %r42, ptr %r71
    %r72 = getelementptr inbounds %struct._mini_node, ptr %r42, i32 0, i32 1
    store ptr %r46, ptr %r72
    %r73 = getelementptr inbounds %struct._mini_node, ptr %r46, i32 0, i32 1
    store ptr %r50, ptr %r73
    %r76 = getelementptr inbounds %struct._mini_node, ptr %r50, i32 0, i32 1
    %r77 = bitcast ptr %r74 to %struct._mini_node*
    store ptr %r77, ptr %r76
    ret ptr %r30
}
define i64 @_mini_multiple(ptr %r80) {
l4:
    %r89 = alloca i64
	store i64 0, ptr %r89
	%r88 = load i64, ptr %r89
    %r95 = alloca i64
	store i64 5, ptr %r95
	%r94 = load i64, ptr %r95
    %r99 = alloca i1
	store i1 0, ptr %r99
	%r98 = load i1, ptr %r99
    %r112 = alloca i64
	store i64 1, ptr %r112
	%r111 = load i64, ptr %r112
    %r119 = alloca i64
	store i64 5, ptr %r119
	%r118 = load i64, ptr %r119
    %r123 = alloca i1
	store i1 0, ptr %r123
	%r122 = load i1, ptr %r123
    %r90 = getelementptr inbounds %struct._mini_node, ptr %r80, i32 0, i32 0
    %r91 = load i64, ptr %r90
    %r92 = getelementptr inbounds %struct._mini_node, ptr %r80, i32 0, i32 1
    %r93 = load ptr, ptr %r92
    %r96 = icmp slt i64 %r88, %r94
    %r97 = icmp ne i1 %r96, %r98
    br i1 %r97, label %l5, label %l7
l5:
    %r101 = phi ptr [%r108, %l5], [%r93, %l4]
    %r102 = phi i64 [%r113, %l5], [%r88, %l4]
    %r103 = phi i64 [%r106, %l5], [%r91, %l4]
    %r104 = getelementptr inbounds %struct._mini_node, ptr %r101, i32 0, i32 0
    %r105 = load i64, ptr %r104
    %r106 = mul i64 %r103, %r105
    %r107 = getelementptr inbounds %struct._mini_node, ptr %r101, i32 0, i32 1
    %r108 = load ptr, ptr %r107
    %r110 = call i32 @printf(ptr @.r109, i64 %r106)
    %r113 = add i64 %r102, %r111
    %r120 = icmp slt i64 %r113, %r118
    %r121 = icmp ne i1 %r120, %r122
    br i1 %r121, label %l5, label %l7
l7:
    %r127 = phi i64 [%r106, %l5], [%r91, %l4]
    ret i64 %r127
}
define i64 @_mini_add(ptr %r130) {
l9:
    %r139 = alloca i64
	store i64 0, ptr %r139
	%r138 = load i64, ptr %r139
    %r145 = alloca i64
	store i64 5, ptr %r145
	%r144 = load i64, ptr %r145
    %r149 = alloca i1
	store i1 0, ptr %r149
	%r148 = load i1, ptr %r149
    %r162 = alloca i64
	store i64 1, ptr %r162
	%r161 = load i64, ptr %r162
    %r169 = alloca i64
	store i64 5, ptr %r169
	%r168 = load i64, ptr %r169
    %r173 = alloca i1
	store i1 0, ptr %r173
	%r172 = load i1, ptr %r173
    %r140 = getelementptr inbounds %struct._mini_node, ptr %r130, i32 0, i32 0
    %r141 = load i64, ptr %r140
    %r142 = getelementptr inbounds %struct._mini_node, ptr %r130, i32 0, i32 1
    %r143 = load ptr, ptr %r142
    %r146 = icmp slt i64 %r138, %r144
    %r147 = icmp ne i1 %r146, %r148
    br i1 %r147, label %l10, label %l12
l10:
    %r151 = phi ptr [%r158, %l10], [%r143, %l9]
    %r152 = phi i64 [%r163, %l10], [%r138, %l9]
    %r153 = phi i64 [%r156, %l10], [%r141, %l9]
    %r154 = getelementptr inbounds %struct._mini_node, ptr %r151, i32 0, i32 0
    %r155 = load i64, ptr %r154
    %r156 = add i64 %r153, %r155
    %r157 = getelementptr inbounds %struct._mini_node, ptr %r151, i32 0, i32 1
    %r158 = load ptr, ptr %r157
    %r160 = call i32 @printf(ptr @.r159, i64 %r156)
    %r163 = add i64 %r152, %r161
    %r170 = icmp slt i64 %r163, %r168
    %r171 = icmp ne i1 %r170, %r172
    br i1 %r171, label %l10, label %l12
l12:
    %r177 = phi i64 [%r156, %l10], [%r141, %l9]
    ret i64 %r177
}
define i64 @_mini_recurseList(ptr %r180) {
l14:
    %r184 = alloca ptr
	store ptr null, ptr %r184
	%r183 = load ptr, ptr %r184
    %r188 = alloca i1
	store i1 0, ptr %r188
	%r187 = load i1, ptr %r188
    %r181 = getelementptr inbounds %struct._mini_node, ptr %r180, i32 0, i32 1
    %r182 = load ptr, ptr %r181
    %r185 = bitcast ptr %r183 to %struct._mini_node*
    %r186 = icmp eq ptr %r182, %r185
    %r189 = icmp ne i1 %r186, %r187
    br i1 %r189, label %l15, label %l16
l15:
    %r190 = getelementptr inbounds %struct._mini_node, ptr %r180, i32 0, i32 0
    %r191 = load i64, ptr %r190
    br label %l13
l16:
    %r192 = getelementptr inbounds %struct._mini_node, ptr %r180, i32 0, i32 0
    %r193 = load i64, ptr %r192
    %r194 = getelementptr inbounds %struct._mini_node, ptr %r180, i32 0, i32 1
    %r195 = load ptr, ptr %r194
    %r196 = call i64 @_mini_recurseList(ptr %r195)
    %r197 = mul i64 %r193, %r196
    br label %l13
l13:
    %r198 = phi i64 [%r191, %l15], [%r197, %l16]
    ret i64 %r198
}
define i64 @_mini_main() {
l18:
    %r214 = alloca i64
	store i64 0, ptr %r214
	%r213 = load i64, ptr %r214
    %r216 = alloca i64
	store i64 0, ptr %r216
	%r215 = load i64, ptr %r216
    %r221 = alloca i64
	store i64 2, ptr %r221
	%r220 = load i64, ptr %r221
    %r225 = alloca i64
	store i64 2, ptr %r225
	%r224 = load i64, ptr %r225
    %r229 = alloca i1
	store i1 0, ptr %r229
	%r228 = load i1, ptr %r229
    %r239 = alloca i64
	store i64 1, ptr %r239
	%r238 = load i64, ptr %r239
    %r248 = alloca i64
	store i64 2, ptr %r248
	%r247 = load i64, ptr %r248
    %r252 = alloca i1
	store i1 0, ptr %r252
	%r251 = load i1, ptr %r252
    %r262 = alloca i64
	store i64 0, ptr %r262
	%r261 = load i64, ptr %r262
    %r266 = alloca i1
	store i1 0, ptr %r266
	%r265 = load i1, ptr %r266
    %r274 = alloca i64
	store i64 1, ptr %r274
	%r273 = load i64, ptr %r274
    %r283 = alloca i64
	store i64 0, ptr %r283
	%r282 = load i64, ptr %r283
    %r287 = alloca i1
	store i1 0, ptr %r287
	%r286 = load i1, ptr %r287
    %r299 = alloca i64
	store i64 0, ptr %r299
	%r298 = load i64, ptr %r299
    %r217 = call ptr @_mini_buildList()
    %r218 = call i64 @_mini_multiple(ptr %r217)
    %r219 = call i64 @_mini_add(ptr %r217)
    %r222 = sdiv i64 %r219, %r220
    %r223 = sub i64 %r218, %r222
    %r226 = icmp slt i64 %r213, %r224
    %r227 = icmp ne i1 %r226, %r228
    br i1 %r227, label %l19, label %l21
l19:
    %r230 = phi ptr [%r230, %l19], [%r217, %l18]
    %r231 = phi i64 [%r237, %l19], [%r215, %l18]
    %r232 = phi i64 [%r232, %l19], [%r223, %l18]
    %r234 = phi i64 [%r240, %l19], [%r213, %l18]
    %r236 = call i64 @_mini_recurseList(ptr %r230)
    %r237 = add i64 %r231, %r236
    %r240 = add i64 %r234, %r238
    %r249 = icmp slt i64 %r240, %r247
    %r250 = icmp ne i1 %r249, %r251
    br i1 %r250, label %l19, label %l21
l21:
    %r254 = phi i64 [%r237, %l19], [%r215, %l18]
    %r255 = phi i64 [%r232, %l19], [%r223, %l18]
    %r260 = call i32 @printf(ptr @.r259, i64 %r254)
    %r263 = icmp ne i64 %r254, %r261
    %r264 = icmp ne i1 %r263, %r265
    br i1 %r264, label %l22, label %l24
l22:
    %r268 = phi i64 [%r275, %l22], [%r254, %l21]
    %r269 = phi i64 [%r269, %l22], [%r255, %l21]
    %r275 = sub i64 %r268, %r273
    %r284 = icmp ne i64 %r275, %r282
    %r285 = icmp ne i1 %r284, %r286
    br i1 %r285, label %l22, label %l24
l24:
    %r289 = phi i64 [%r275, %l22], [%r254, %l21]
    %r290 = phi i64 [%r269, %l22], [%r255, %l21]
    %r295 = call i32 @printf(ptr @.r294, i64 %r290)
    %r297 = call i32 @printf(ptr @.r296, i64 %r289)
    ret i64 %r298
}
define i32 @main() {
l26:
    %r302 = call i64 @_mini_main()
    %r303 = trunc i64 %r302 to i32
    ret i32 %r303
}
