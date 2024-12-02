%struct._mini_linkedNums = type {
    i64,
    ptr
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)




@.r196 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r291 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r293 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r303 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r305 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r311 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define ptr @_mini_getRands(i64 %r5, i64 %r6) {
l2:
    %r18 = alloca ptr
	store ptr null, ptr %r18
	%r17 = load ptr, ptr %r18
    %r22 = alloca i64
	store i64 16, ptr %r22
	%r21 = load i64, ptr %r22
    %r27 = alloca ptr
	store ptr null, ptr %r27
	%r26 = load ptr, ptr %r27
    %r31 = alloca i64
	store i64 1, ptr %r31
	%r30 = load i64, ptr %r31
    %r34 = alloca i64
	store i64 0, ptr %r34
	%r33 = load i64, ptr %r34
    %r38 = alloca i1
	store i1 0, ptr %r38
	%r37 = load i1, ptr %r38
    %r48 = alloca i64
	store i64 2, ptr %r48
	%r47 = load i64, ptr %r48
    %r52 = alloca i64
	store i64 1, ptr %r52
	%r51 = load i64, ptr %r52
    %r55 = alloca i64
	store i64 1000000000, ptr %r55
	%r54 = load i64, ptr %r55
    %r58 = alloca i64
	store i64 1000000000, ptr %r58
	%r57 = load i64, ptr %r58
    %r62 = alloca i64
	store i64 16, ptr %r62
	%r61 = load i64, ptr %r62
    %r68 = alloca i64
	store i64 1, ptr %r68
	%r67 = load i64, ptr %r68
    %r77 = alloca i64
	store i64 0, ptr %r77
	%r76 = load i64, ptr %r77
    %r81 = alloca i1
	store i1 0, ptr %r81
	%r80 = load i1, ptr %r81
    %r19 = bitcast ptr %r17 to %struct._mini_linkedNums*
    %r20 = mul i64 %r5, %r5
    %r23 = call ptr @malloc(i64 %r21)
    %r24 = bitcast ptr %r23 to %struct._mini_linkedNums*
    %r25 = getelementptr inbounds %struct._mini_linkedNums, ptr %r24, i32 0, i32 0
    store i64 %r20, ptr %r25
    %r28 = getelementptr inbounds %struct._mini_linkedNums, ptr %r24, i32 0, i32 1
    %r29 = bitcast ptr %r26 to %struct._mini_linkedNums*
    store ptr %r29, ptr %r28
    %r32 = sub i64 %r6, %r30
    %r35 = icmp sgt i64 %r32, %r33
    %r36 = icmp ne i1 %r35, %r37
    br i1 %r36, label %l3, label %l5
l3:
    %r39 = phi i64 [%r39, %l3], [%r5, %l2]
    %r40 = phi i64 [%r69, %l3], [%r32, %l2]
    %r42 = phi i64 [%r60, %l3], [%r20, %l2]
    %r44 = phi ptr [%r64, %l3], [%r24, %l2]
    %r45 = mul i64 %r42, %r42
    %r46 = sdiv i64 %r45, %r39
    %r49 = sdiv i64 %r39, %r47
    %r50 = mul i64 %r46, %r49
    %r53 = add i64 %r50, %r51
    %r56 = sdiv i64 %r53, %r54
    %r59 = mul i64 %r56, %r57
    %r60 = sub i64 %r53, %r59
    %r63 = call ptr @malloc(i64 %r61)
    %r64 = bitcast ptr %r63 to %struct._mini_linkedNums*
    %r65 = getelementptr inbounds %struct._mini_linkedNums, ptr %r64, i32 0, i32 0
    store i64 %r60, ptr %r65
    %r66 = getelementptr inbounds %struct._mini_linkedNums, ptr %r64, i32 0, i32 1
    store ptr %r44, ptr %r66
    %r69 = sub i64 %r40, %r67
    %r78 = icmp sgt i64 %r69, %r76
    %r79 = icmp ne i1 %r78, %r80
    br i1 %r79, label %l3, label %l5
l5:
    %r84 = phi ptr [%r64, %l3], [%r19, %l2]
    ret ptr %r84
}
define i64 @_mini_calcMean(ptr %r90) {
l7:
    %r98 = alloca i64
	store i64 0, ptr %r98
	%r97 = load i64, ptr %r98
    %r100 = alloca i64
	store i64 0, ptr %r100
	%r99 = load i64, ptr %r100
    %r102 = alloca i64
	store i64 0, ptr %r102
	%r101 = load i64, ptr %r102
    %r104 = alloca ptr
	store ptr null, ptr %r104
	%r103 = load ptr, ptr %r104
    %r109 = alloca i1
	store i1 0, ptr %r109
	%r108 = load i1, ptr %r109
    %r115 = alloca i64
	store i64 1, ptr %r115
	%r114 = load i64, ptr %r115
    %r127 = alloca ptr
	store ptr null, ptr %r127
	%r126 = load ptr, ptr %r127
    %r132 = alloca i1
	store i1 0, ptr %r132
	%r131 = load i1, ptr %r132
    %r138 = alloca i64
	store i64 0, ptr %r138
	%r137 = load i64, ptr %r138
    %r141 = alloca i1
	store i1 0, ptr %r141
	%r140 = load i1, ptr %r141
    %r105 = bitcast ptr %r103 to %struct._mini_linkedNums*
    %r106 = icmp ne ptr %r90, %r105
    %r107 = icmp ne i1 %r106, %r108
    br i1 %r107, label %l8, label %l10
l8:
    %r110 = phi i64 [%r116, %l8], [%r99, %l7]
    %r111 = phi i64 [%r111, %l8], [%r101, %l7]
    %r112 = phi ptr [%r121, %l8], [%r90, %l7]
    %r113 = phi i64 [%r119, %l8], [%r97, %l7]
    %r116 = add i64 %r110, %r114
    %r117 = getelementptr inbounds %struct._mini_linkedNums, ptr %r112, i32 0, i32 0
    %r118 = load i64, ptr %r117
    %r119 = add i64 %r113, %r118
    %r120 = getelementptr inbounds %struct._mini_linkedNums, ptr %r112, i32 0, i32 1
    %r121 = load ptr, ptr %r120
    %r128 = bitcast ptr %r126 to %struct._mini_linkedNums*
    %r129 = icmp ne ptr %r121, %r128
    %r130 = icmp ne i1 %r129, %r131
    br i1 %r130, label %l8, label %l10
l10:
    %r133 = phi i64 [%r116, %l8], [%r99, %l7]
    %r134 = phi i64 [%r111, %l8], [%r101, %l7]
    %r136 = phi i64 [%r119, %l8], [%r97, %l7]
    %r139 = icmp ne i64 %r133, %r137
    %r142 = icmp ne i1 %r139, %r140
    br i1 %r142, label %l11, label %l13
l11:
    %r143 = sdiv i64 %r136, %r133
    br label %l13
l13:
    %r145 = phi i64 [%r143, %l11], [%r134, %l10]
    ret i64 %r145
}
define i64 @_mini_approxSqrt(i64 %r150) {
l15:
    %r158 = alloca i64
	store i64 1, ptr %r158
	%r157 = load i64, ptr %r158
    %r160 = alloca i64
	store i64 0, ptr %r160
	%r159 = load i64, ptr %r160
    %r164 = alloca i1
	store i1 0, ptr %r164
	%r163 = load i1, ptr %r164
    %r171 = alloca i64
	store i64 1, ptr %r171
	%r170 = load i64, ptr %r171
    %r180 = alloca i1
	store i1 0, ptr %r180
	%r179 = load i1, ptr %r180
    %r161 = icmp slt i64 %r159, %r150
    %r162 = icmp ne i1 %r161, %r163
    br i1 %r162, label %l16, label %l18
l16:
    %r165 = phi i64 [%r165, %l16], [%r150, %l15]
    %r168 = phi i64 [%r172, %l16], [%r157, %l15]
    %r169 = mul i64 %r168, %r168
    %r172 = add i64 %r168, %r170
    %r177 = icmp slt i64 %r169, %r165
    %r178 = icmp ne i1 %r177, %r179
    br i1 %r178, label %l16, label %l18
l18:
    %r182 = phi i64 [%r168, %l16], [%r157, %l15]
    ret i64 %r182
}
define void @_mini_approxSqrtAll(ptr %r187) {
l20:
    %r189 = alloca ptr
	store ptr null, ptr %r189
	%r188 = load ptr, ptr %r189
    %r194 = alloca i1
	store i1 0, ptr %r194
	%r193 = load i1, ptr %r194
    %r205 = alloca ptr
	store ptr null, ptr %r205
	%r204 = load ptr, ptr %r205
    %r210 = alloca i1
	store i1 0, ptr %r210
	%r209 = load i1, ptr %r210
    %r190 = bitcast ptr %r188 to %struct._mini_linkedNums*
    %r191 = icmp ne ptr %r187, %r190
    %r192 = icmp ne i1 %r191, %r193
    br i1 %r192, label %l21, label %l19
l21:
    %r195 = phi ptr [%r202, %l21], [%r187, %l20]
    %r197 = getelementptr inbounds %struct._mini_linkedNums, ptr %r195, i32 0, i32 0
    %r198 = load i64, ptr %r197
    %r199 = call i64 @_mini_approxSqrt(i64 %r198)
    %r200 = call i32 @printf(ptr @.r196, i64 %r199)
    %r201 = getelementptr inbounds %struct._mini_linkedNums, ptr %r195, i32 0, i32 1
    %r202 = load ptr, ptr %r201
    %r206 = bitcast ptr %r204 to %struct._mini_linkedNums*
    %r207 = icmp ne ptr %r202, %r206
    %r208 = icmp ne i1 %r207, %r209
    br i1 %r208, label %l21, label %l19
l19:
    ret void
}
define void @_mini_range(ptr %r213) {
l25:
    %r221 = alloca i64
	store i64 0, ptr %r221
	%r220 = load i64, ptr %r221
    %r223 = alloca i64
	store i64 0, ptr %r223
	%r222 = load i64, ptr %r223
    %r225 = alloca i64
	store i64 1, ptr %r225
	%r224 = load i64, ptr %r225
    %r227 = alloca ptr
	store ptr null, ptr %r227
	%r226 = load ptr, ptr %r227
    %r232 = alloca i1
	store i1 0, ptr %r232
	%r231 = load i1, ptr %r232
    %r238 = alloca i64
	store i64 0, ptr %r238
	%r237 = load i64, ptr %r238
    %r245 = alloca i64
	store i64 0, ptr %r245
	%r244 = load i64, ptr %r245
    %r250 = alloca i1
	store i1 0, ptr %r250
	%r249 = load i1, ptr %r250
    %r258 = alloca i1
	store i1 0, ptr %r258
	%r257 = load i1, ptr %r258
    %r281 = alloca ptr
	store ptr null, ptr %r281
	%r280 = load ptr, ptr %r281
    %r286 = alloca i1
	store i1 0, ptr %r286
	%r285 = load i1, ptr %r286
    %r228 = bitcast ptr %r226 to %struct._mini_linkedNums*
    %r229 = icmp ne ptr %r213, %r228
    %r230 = icmp ne i1 %r229, %r231
    br i1 %r230, label %l26, label %l28
l26:
    %r233 = phi i64 [%r220, %l25], [%r270, %l37]
    %r234 = phi i64 [%r222, %l25], [%r271, %l37]
    %r235 = phi i64 [%r224, %l25], [%r272, %l37]
    %r236 = phi ptr [%r213, %l25], [%r275, %l37]
    %r239 = icmp ne i64 %r235, %r237
    br i1 %r239, label %l29, label %l30
l29:
    %r240 = getelementptr inbounds %struct._mini_linkedNums, ptr %r236, i32 0, i32 0
    %r241 = load i64, ptr %r240
    %r242 = getelementptr inbounds %struct._mini_linkedNums, ptr %r236, i32 0, i32 0
    %r243 = load i64, ptr %r242
    br label %l37
l30:
    %r246 = getelementptr inbounds %struct._mini_linkedNums, ptr %r236, i32 0, i32 0
    %r247 = load i64, ptr %r246
    %r248 = icmp slt i64 %r247, %r233
    %r251 = icmp ne i1 %r248, %r249
    br i1 %r251, label %l31, label %l32
l31:
    %r252 = getelementptr inbounds %struct._mini_linkedNums, ptr %r236, i32 0, i32 0
    %r253 = load i64, ptr %r252
    br label %l36
l32:
    %r254 = getelementptr inbounds %struct._mini_linkedNums, ptr %r236, i32 0, i32 0
    %r255 = load i64, ptr %r254
    %r256 = icmp sgt i64 %r255, %r234
    %r259 = icmp ne i1 %r256, %r257
    br i1 %r259, label %l33, label %l35
l33:
    %r260 = getelementptr inbounds %struct._mini_linkedNums, ptr %r236, i32 0, i32 0
    %r261 = load i64, ptr %r260
    br label %l35
l35:
    %r262 = phi i64 [%r233, %l33], [%r233, %l32]
    %r263 = phi i64 [%r261, %l33], [%r234, %l32]
    %r264 = phi i64 [%r235, %l33], [%r235, %l32]
    %r265 = phi ptr [%r236, %l33], [%r236, %l32]
    br label %l36
l36:
    %r266 = phi i64 [%r253, %l31], [%r262, %l35]
    %r267 = phi i64 [%r234, %l31], [%r263, %l35]
    %r268 = phi i64 [%r235, %l31], [%r264, %l35]
    %r269 = phi ptr [%r236, %l31], [%r265, %l35]
    br label %l37
l37:
    %r270 = phi i64 [%r241, %l29], [%r266, %l36]
    %r271 = phi i64 [%r243, %l29], [%r267, %l36]
    %r272 = phi i64 [%r244, %l29], [%r268, %l36]
    %r273 = phi ptr [%r236, %l29], [%r269, %l36]
    %r274 = getelementptr inbounds %struct._mini_linkedNums, ptr %r273, i32 0, i32 1
    %r275 = load ptr, ptr %r274
    %r282 = bitcast ptr %r280 to %struct._mini_linkedNums*
    %r283 = icmp ne ptr %r275, %r282
    %r284 = icmp ne i1 %r283, %r285
    br i1 %r284, label %l26, label %l28
l28:
    %r287 = phi i64 [%r220, %l25], [%r270, %l37]
    %r288 = phi i64 [%r222, %l25], [%r271, %l37]
    %r292 = call i32 @printf(ptr @.r291, i64 %r287)
    %r294 = call i32 @printf(ptr @.r293, i64 %r288)
    ret void
}
define i64 @_mini_main() {
l39:
    %r296 = alloca i64
    %r297 = alloca i64
    %r314 = alloca i64
	store i64 0, ptr %r314
	%r313 = load i64, ptr %r314
    %r304 = call i32 @scanf(ptr @.r303, ptr %r296)
    %r306 = call i32 @scanf(ptr @.r305, ptr %r297)
    %r307 = load i64, ptr %r296
    %r308 = load i64, ptr %r297
    %r309 = call ptr @_mini_getRands(i64 %r307, i64 %r308)
    %r310 = call i64 @_mini_calcMean(ptr %r309)
    %r312 = call i32 @printf(ptr @.r311, i64 %r310)
    call void @_mini_range(ptr %r309)
    call void @_mini_approxSqrtAll(ptr %r309)
    ret i64 %r313
}
define i32 @main() {
l41:
    %r317 = call i64 @_mini_main()
    %r318 = trunc i64 %r317 to i32
    ret i32 %r318
}
