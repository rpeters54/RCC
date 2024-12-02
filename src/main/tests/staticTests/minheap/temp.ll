%struct.anon.0 = type {
    ptr,
    ptr,
    i32,
    i32
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
declare ptr @memcpy(ptr, ptr, i64)
declare ptr @realloc(ptr, i64)



@.r251 = private unnamed_addr constant [14 x i8] c"Memory error\0A\00"
@.r279 = private unnamed_addr constant [14 x i8] c"Memory error\0A\00"


@.r502 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
define i32 @compareDoubles(ptr %r7, ptr %r8) {
l2:
    %r19 = alloca i64
	store i64 0, ptr %r19
	%r18 = load i64, ptr %r19
    %r23 = alloca i1
	store i1 0, ptr %r23
	%r22 = load i1, ptr %r23
    %r526 = alloca i64
	store i64 -1, ptr %r526
	%r525 = load i64, ptr %r526
    %r32 = alloca i64
	store i64 1, ptr %r32
	%r31 = load i64, ptr %r32
    %r13 = bitcast ptr %r7 to double*
    %r14 = load double, ptr %r13
    %r15 = bitcast ptr %r8 to double*
    %r16 = load double, ptr %r15
    %r17 = fsub double %r14, %r16
    %r20 = sitofp i64 %r18 to double
    %r21 = fcmp olt double %r17, %r20
    %r24 = icmp ne i1 %r21, %r22
    br i1 %r24, label %l3, label %l4
l3:
    %r30 = trunc i64 %r525 to i32
    br label %l1
l4:
    %r33 = trunc i64 %r31 to i32
    br label %l1
l1:
    %r34 = phi i32 [%r30, %l3], [%r33, %l4]
    ret i32 %r34
}
define void @heapify(ptr %r36, i32 %r37) {
l6:
    %r47 = alloca i64
	store i64 2, ptr %r47
	%r46 = load i64, ptr %r47
    %r51 = alloca i64
	store i64 1, ptr %r51
	%r50 = load i64, ptr %r51
    %r55 = alloca i64
	store i64 2, ptr %r55
	%r54 = load i64, ptr %r55
    %r59 = alloca i64
	store i64 2, ptr %r59
	%r58 = load i64, ptr %r59
    %r66 = alloca i64
	store i64 0, ptr %r66
	%r65 = load i64, ptr %r66
    %r72 = alloca i1
	store i1 0, ptr %r72
	%r71 = load i1, ptr %r72
    %r74 = alloca i1
	store i1 0, ptr %r74
	%r73 = load i1, ptr %r74
    %r528 = alloca i64
	store i64 -1, ptr %r528
	%r527 = load i64, ptr %r528
    %r92 = alloca i64
	store i64 0, ptr %r92
	%r91 = load i64, ptr %r92
    %r98 = alloca i1
	store i1 0, ptr %r98
	%r97 = load i1, ptr %r98
    %r100 = alloca i1
	store i1 0, ptr %r100
	%r99 = load i1, ptr %r100
    %r530 = alloca i64
	store i64 -1, ptr %r530
	%r529 = load i64, ptr %r530
    %r532 = alloca i64
	store i64 -1, ptr %r532
	%r531 = load i64, ptr %r532
    %r122 = alloca i1
	store i1 0, ptr %r122
	%r121 = load i1, ptr %r122
    %r144 = alloca i64
	store i64 0, ptr %r144
	%r143 = load i64, ptr %r144
    %r148 = alloca i1
	store i1 0, ptr %r148
	%r147 = load i1, ptr %r148
    %r534 = alloca i64
	store i64 -1, ptr %r534
	%r533 = load i64, ptr %r534
    %r170 = alloca i1
	store i1 0, ptr %r170
	%r169 = load i1, ptr %r170
    %r192 = alloca i64
	store i64 0, ptr %r192
	%r191 = load i64, ptr %r192
    %r196 = alloca i1
	store i1 0, ptr %r196
	%r195 = load i1, ptr %r196
    %r212 = alloca i1
	store i1 0, ptr %r212
	%r211 = load i1, ptr %r212
    %r48 = sext i32 %r37 to i64
    %r49 = mul i64 %r48, %r46
    %r52 = add i64 %r49, %r50
    %r53 = trunc i64 %r52 to i32
    %r56 = sext i32 %r37 to i64
    %r57 = mul i64 %r56, %r54
    %r60 = add i64 %r57, %r58
    %r61 = trunc i64 %r60 to i32
    %r62 = getelementptr inbounds %struct.anon.0, ptr %r36, i32 0, i32 2
    %r63 = load i32, ptr %r62
    %r64 = icmp sge i32 %r53, %r63
    %r67 = sext i32 %r53 to i64
    %r68 = icmp slt i64 %r67, %r65
    %r69 = or i1 %r64, %r68
    %r70 = icmp ne i1 %r69, %r71
    %r75 = icmp ne i1 %r70, %r73
    br i1 %r75, label %l7, label %l9
l7:
    %r81 = trunc i64 %r527 to i32
    br label %l9
l9:
    %r83 = phi i32 [%r37, %l7], [%r37, %l6]
    %r84 = phi i32 [%r81, %l7], [%r53, %l6]
    %r85 = phi ptr [%r36, %l7], [%r36, %l6]
    %r86 = phi i32 [%r37, %l7], [%r37, %l6]
    %r87 = phi i32 [%r61, %l7], [%r61, %l6]
    %r88 = getelementptr inbounds %struct.anon.0, ptr %r85, i32 0, i32 2
    %r89 = load i32, ptr %r88
    %r90 = icmp sge i32 %r87, %r89
    %r93 = sext i32 %r87 to i64
    %r94 = icmp slt i64 %r93, %r91
    %r95 = or i1 %r90, %r94
    %r96 = icmp ne i1 %r95, %r97
    %r101 = icmp ne i1 %r96, %r99
    br i1 %r101, label %l10, label %l12
l10:
    %r107 = trunc i64 %r529 to i32
    br label %l12
l12:
    %r109 = phi i32 [%r83, %l9], [%r83, %l10]
    %r110 = phi i32 [%r84, %l9], [%r84, %l10]
    %r111 = phi ptr [%r85, %l9], [%r85, %l10]
    %r112 = phi i32 [%r86, %l9], [%r86, %l10]
    %r113 = phi i32 [%r87, %l9], [%r107, %l10]
    %r119 = sext i32 %r110 to i64
    %r120 = icmp ne i64 %r119, %r531
    %r123 = icmp ne i1 %r120, %r121
    br i1 %r123, label %l13, label %l18
l13:
    %r124 = getelementptr inbounds %struct.anon.0, ptr %r111, i32 0, i32 1
    %r125 = load ptr, ptr %r124
    %r126 = getelementptr inbounds %struct.anon.0, ptr %r111, i32 0, i32 0
    %r127 = load ptr, ptr %r126
    %r128 = getelementptr inbounds i8*, ptr %r127, i32 %r110
    %r129 = load ptr, ptr %r128
    %r130 = getelementptr inbounds %struct.anon.0, ptr %r111, i32 0, i32 0
    %r131 = load ptr, ptr %r130
    %r132 = getelementptr inbounds i8*, ptr %r131, i32 %r112
    %r133 = load ptr, ptr %r132
    %r134 = getelementptr inbounds %struct.anon.0, ptr %r111, i32 0, i32 0
    %r135 = load ptr, ptr %r134
    %r136 = getelementptr inbounds i8*, ptr %r135, i32 %r110
    %r137 = load ptr, ptr %r136
    %r138 = getelementptr inbounds %struct.anon.0, ptr %r111, i32 0, i32 0
    %r139 = load ptr, ptr %r138
    %r140 = getelementptr inbounds i8*, ptr %r139, i32 %r112
    %r141 = load ptr, ptr %r140
    %r142 = call i32 %r125(ptr %r137, ptr %r141, ptr %r125)
    %r145 = sext i32 %r142 to i64
    %r146 = icmp slt i64 %r145, %r143
    %r149 = icmp ne i1 %r146, %r147
    br i1 %r149, label %l17, label %l16
l16:
    br label %l17
l17:
    %r151 = phi i32 [%r110, %l13], [%r109, %l16]
    %r153 = phi ptr [%r111, %l13], [%r111, %l16]
    %r154 = phi i32 [%r112, %l13], [%r112, %l16]
    %r155 = phi i32 [%r113, %l13], [%r113, %l16]
    br label %l18
l18:
    %r157 = phi i32 [%r151, %l17], [%r109, %l12]
    %r159 = phi ptr [%r153, %l17], [%r111, %l12]
    %r160 = phi i32 [%r154, %l17], [%r112, %l12]
    %r161 = phi i32 [%r155, %l17], [%r113, %l12]
    %r167 = sext i32 %r161 to i64
    %r168 = icmp ne i64 %r167, %r533
    %r171 = icmp ne i1 %r168, %r169
    br i1 %r171, label %l19, label %l24
l19:
    %r172 = getelementptr inbounds %struct.anon.0, ptr %r159, i32 0, i32 1
    %r173 = load ptr, ptr %r172
    %r174 = getelementptr inbounds %struct.anon.0, ptr %r159, i32 0, i32 0
    %r175 = load ptr, ptr %r174
    %r176 = getelementptr inbounds i8*, ptr %r175, i32 %r161
    %r177 = load ptr, ptr %r176
    %r178 = getelementptr inbounds %struct.anon.0, ptr %r159, i32 0, i32 0
    %r179 = load ptr, ptr %r178
    %r180 = getelementptr inbounds i8*, ptr %r179, i32 %r157
    %r181 = load ptr, ptr %r180
    %r182 = getelementptr inbounds %struct.anon.0, ptr %r159, i32 0, i32 0
    %r183 = load ptr, ptr %r182
    %r184 = getelementptr inbounds i8*, ptr %r183, i32 %r161
    %r185 = load ptr, ptr %r184
    %r186 = getelementptr inbounds %struct.anon.0, ptr %r159, i32 0, i32 0
    %r187 = load ptr, ptr %r186
    %r188 = getelementptr inbounds i8*, ptr %r187, i32 %r157
    %r189 = load ptr, ptr %r188
    %r190 = call i32 %r173(ptr %r185, ptr %r189, ptr %r173)
    %r193 = sext i32 %r190 to i64
    %r194 = icmp slt i64 %r193, %r191
    %r197 = icmp ne i1 %r194, %r195
    br i1 %r197, label %l23, label %l22
l22:
    br label %l23
l23:
    %r199 = phi i32 [%r161, %l19], [%r157, %l22]
    %r201 = phi ptr [%r159, %l19], [%r159, %l22]
    %r202 = phi i32 [%r160, %l19], [%r160, %l22]
    br label %l24
l24:
    %r205 = phi i32 [%r157, %l18], [%r199, %l23]
    %r207 = phi ptr [%r159, %l18], [%r201, %l23]
    %r208 = phi i32 [%r160, %l18], [%r202, %l23]
    %r210 = icmp ne i32 %r205, %r208
    %r213 = icmp ne i1 %r210, %r211
    br i1 %r213, label %l25, label %l5
l25:
    %r214 = getelementptr inbounds %struct.anon.0, ptr %r207, i32 0, i32 0
    %r215 = load ptr, ptr %r214
    %r216 = getelementptr inbounds i8*, ptr %r215, i32 %r205
    %r217 = load ptr, ptr %r216
    %r218 = getelementptr inbounds %struct.anon.0, ptr %r207, i32 0, i32 0
    %r219 = load ptr, ptr %r218
    %r220 = getelementptr inbounds i8*, ptr %r219, i32 %r208
    %r221 = load ptr, ptr %r220
    %r222 = getelementptr inbounds %struct.anon.0, ptr %r207, i32 0, i32 0
    %r223 = load ptr, ptr %r222
    %r224 = getelementptr inbounds i8*, ptr %r223, i32 %r205
    store ptr %r221, ptr %r224
    %r225 = getelementptr inbounds %struct.anon.0, ptr %r207, i32 0, i32 0
    %r226 = load ptr, ptr %r225
    %r227 = getelementptr inbounds i8*, ptr %r226, i32 %r208
    store ptr %r217, ptr %r227
    call void @heapify(ptr %r207, i32 %r205)
    br label %l5
l5:
    ret void
}
define ptr @make(i32 %r235, ptr %r236, ptr %r237) {
l29:
    %r241 = alloca i64
	store i64 24, ptr %r241
	%r240 = load i64, ptr %r241
    %r245 = alloca ptr
	store ptr null, ptr %r245
	%r244 = load ptr, ptr %r245
    %r249 = alloca i1
	store i1 0, ptr %r249
	%r248 = load i1, ptr %r249
    %r254 = alloca ptr
	store ptr null, ptr %r254
	%r253 = load ptr, ptr %r254
    %r257 = alloca i64
	store i64 0, ptr %r257
	%r256 = load i64, ptr %r257
    %r263 = alloca i64
	store i64 8, ptr %r263
	%r262 = load i64, ptr %r263
    %r273 = alloca ptr
	store ptr null, ptr %r273
	%r272 = load ptr, ptr %r273
    %r277 = alloca i1
	store i1 0, ptr %r277
	%r276 = load i1, ptr %r277
    %r282 = alloca ptr
	store ptr null, ptr %r282
	%r281 = load ptr, ptr %r282
    %r285 = alloca i64
	store i64 0, ptr %r285
	%r284 = load i64, ptr %r285
    %r290 = alloca i1
	store i1 0, ptr %r290
	%r289 = load i1, ptr %r290
    %r307 = alloca i64
	store i64 1, ptr %r307
	%r306 = load i64, ptr %r307
    %r314 = alloca i1
	store i1 0, ptr %r314
	%r313 = load i1, ptr %r314
    %r324 = alloca i64
	store i64 2, ptr %r324
	%r323 = load i64, ptr %r324
    %r328 = alloca i64
	store i64 2, ptr %r328
	%r327 = load i64, ptr %r328
    %r332 = alloca i64
	store i64 0, ptr %r332
	%r331 = load i64, ptr %r332
    %r337 = alloca i1
	store i1 0, ptr %r337
	%r336 = load i1, ptr %r337
    %r344 = alloca i64
	store i64 1, ptr %r344
	%r343 = load i64, ptr %r344
    %r354 = alloca i64
	store i64 0, ptr %r354
	%r353 = load i64, ptr %r354
    %r359 = alloca i1
	store i1 0, ptr %r359
	%r358 = load i1, ptr %r359
    %r242 = call ptr @malloc(i64 %r240)
    %r243 = bitcast ptr %r242 to %struct.anon.0*
    %r246 = bitcast ptr %r244 to %struct.anon.0*
    %r247 = icmp eq ptr %r243, %r246
    %r250 = icmp ne i1 %r247, %r248
    br i1 %r250, label %l30, label %l32
l30:
    %r252 = call i32 @printf(ptr @.r251)
    %r255 = bitcast ptr %r253 to %struct.anon.0*
    br label %l28
l32:
    %r258 = getelementptr inbounds %struct.anon.0, ptr %r243, i32 0, i32 2
    %r259 = trunc i64 %r256 to i32
    store i32 %r259, ptr %r258
    %r260 = getelementptr inbounds %struct.anon.0, ptr %r243, i32 0, i32 3
    store i32 %r235, ptr %r260
    %r261 = getelementptr inbounds %struct.anon.0, ptr %r243, i32 0, i32 1
    store ptr %r237, ptr %r261
    %r264 = sext i32 %r235 to i64
    %r265 = mul i64 %r264, %r262
    %r266 = call ptr @malloc(i64 %r265)
    %r267 = bitcast ptr %r266 to i8*
    %r268 = getelementptr inbounds %struct.anon.0, ptr %r243, i32 0, i32 0
    %r269 = bitcast ptr %r267 to i8**
    store ptr %r269, ptr %r268
    %r270 = getelementptr inbounds %struct.anon.0, ptr %r243, i32 0, i32 0
    %r271 = load ptr, ptr %r270
    %r274 = bitcast ptr %r272 to i8**
    %r275 = icmp eq ptr %r271, %r274
    %r278 = icmp ne i1 %r275, %r276
    br i1 %r278, label %l33, label %l35
l33:
    %r280 = call i32 @printf(ptr @.r279)
    %r283 = bitcast ptr %r281 to %struct.anon.0*
    br label %l28
l35:
    %r286 = trunc i64 %r284 to i32
    %r287 = icmp slt i32 %r286, %r235
    %r288 = icmp ne i1 %r287, %r289
    br i1 %r288, label %l36, label %l38
l36:
    %r291 = phi ptr [%r236, %l35], [%r291, %l36]
    %r292 = phi ptr [%r243, %l35], [%r292, %l36]
    %r293 = phi i32 [%r286, %l35], [%r310, %l36]
    %r295 = phi i32 [%r235, %l35], [%r295, %l36]
    %r296 = getelementptr inbounds i8*, ptr %r291, i32 %r293
    %r297 = load ptr, ptr %r296
    %r298 = getelementptr inbounds %struct.anon.0, ptr %r292, i32 0, i32 0
    %r299 = load ptr, ptr %r298
    %r300 = getelementptr inbounds i8*, ptr %r299, i32 %r293
    store ptr %r297, ptr %r300
    %r308 = sext i32 %r293 to i64
    %r309 = add i64 %r308, %r306
    %r310 = trunc i64 %r309 to i32
    %r311 = icmp slt i32 %r310, %r295
    %r312 = icmp ne i1 %r311, %r313
    br i1 %r312, label %l36, label %l38
l38:
    %r316 = phi ptr [%r243, %l35], [%r292, %l36]
    %r317 = phi i32 [%r286, %l35], [%r310, %l36]
    %r320 = getelementptr inbounds %struct.anon.0, ptr %r316, i32 0, i32 2
    store i32 %r317, ptr %r320
    %r321 = getelementptr inbounds %struct.anon.0, ptr %r316, i32 0, i32 2
    %r322 = load i32, ptr %r321
    %r325 = sext i32 %r322 to i64
    %r326 = sub i64 %r325, %r323
    %r329 = sdiv i64 %r326, %r327
    %r330 = trunc i64 %r329 to i32
    %r333 = sext i32 %r330 to i64
    %r334 = icmp sge i64 %r333, %r331
    %r335 = icmp ne i1 %r334, %r336
    br i1 %r335, label %l39, label %l41
l39:
    %r339 = phi ptr [%r316, %l38], [%r339, %l39]
    %r340 = phi i32 [%r330, %l38], [%r347, %l39]
    call void @heapify(ptr %r339, i32 %r340)
    %r345 = sext i32 %r340 to i64
    %r346 = sub i64 %r345, %r343
    %r347 = trunc i64 %r346 to i32
    %r355 = sext i32 %r347 to i64
    %r356 = icmp sge i64 %r355, %r353
    %r357 = icmp ne i1 %r356, %r358
    br i1 %r357, label %l39, label %l41
l41:
    %r361 = phi ptr [%r316, %l38], [%r339, %l39]
    br label %l28
l28:
    %r365 = phi ptr [%r255, %l30], [%r283, %l33], [%r361, %l41]
    ret ptr %r365
}
define ptr @popFirst(ptr %r367) {
l43:
    %r373 = alloca i64
	store i64 0, ptr %r373
	%r372 = load i64, ptr %r373
    %r377 = alloca i1
	store i1 0, ptr %r377
	%r376 = load i1, ptr %r377
    %r380 = alloca ptr
	store ptr null, ptr %r380
	%r379 = load ptr, ptr %r380
    %r384 = alloca i64
	store i64 0, ptr %r384
	%r383 = load i64, ptr %r384
    %r392 = alloca i64
	store i64 1, ptr %r392
	%r391 = load i64, ptr %r392
    %r400 = alloca i64
	store i64 0, ptr %r400
	%r399 = load i64, ptr %r400
    %r405 = alloca i64
	store i64 1, ptr %r405
	%r404 = load i64, ptr %r405
    %r411 = alloca i64
	store i64 0, ptr %r411
	%r410 = load i64, ptr %r411
    %r370 = getelementptr inbounds %struct.anon.0, ptr %r367, i32 0, i32 2
    %r371 = load i32, ptr %r370
    %r374 = sext i32 %r371 to i64
    %r375 = icmp eq i64 %r374, %r372
    %r378 = icmp ne i1 %r375, %r376
    br i1 %r378, label %l44, label %l46
l44:
    br label %l42
l46:
    %r381 = getelementptr inbounds %struct.anon.0, ptr %r367, i32 0, i32 0
    %r382 = load ptr, ptr %r381
    %r385 = getelementptr inbounds i8*, ptr %r382, i64 %r383
    %r386 = load ptr, ptr %r385
    %r387 = getelementptr inbounds %struct.anon.0, ptr %r367, i32 0, i32 0
    %r388 = load ptr, ptr %r387
    %r389 = getelementptr inbounds %struct.anon.0, ptr %r367, i32 0, i32 2
    %r390 = load i32, ptr %r389
    %r393 = sext i32 %r390 to i64
    %r394 = sub i64 %r393, %r391
    %r395 = getelementptr inbounds i8*, ptr %r388, i64 %r394
    %r396 = load ptr, ptr %r395
    %r397 = getelementptr inbounds %struct.anon.0, ptr %r367, i32 0, i32 0
    %r398 = load ptr, ptr %r397
    %r401 = getelementptr inbounds i8*, ptr %r398, i64 %r399
    store ptr %r396, ptr %r401
    %r402 = getelementptr inbounds %struct.anon.0, ptr %r367, i32 0, i32 2
    %r403 = load i32, ptr %r402
    %r406 = sext i32 %r403 to i64
    %r407 = sub i64 %r406, %r404
    %r408 = getelementptr inbounds %struct.anon.0, ptr %r367, i32 0, i32 2
    %r409 = trunc i64 %r407 to i32
    store i32 %r409, ptr %r408
    %r412 = trunc i64 %r410 to i32
    call void @heapify(ptr %r367, i32 %r412)
    br label %l42
l42:
    %r413 = phi ptr [%r379, %l44], [%r386, %l46]
    ret ptr %r413
}
define i32 @main() {
l48:
    %r423 = alloca [9 x ptr]
    %r425 = alloca double
	store double 0x3fe0000000000000, ptr %r425
	%r424 = load double, ptr %r425
    %r427 = alloca double
	store double 0x400999999999999a, ptr %r427
	%r426 = load double, ptr %r427
    %r429 = alloca double
	store double 0x4010cccccccccccd, ptr %r429
	%r428 = load double, ptr %r429
    %r431 = alloca double
	store double 0x3ff8000000000000, ptr %r431
	%r430 = load double, ptr %r431
    %r433 = alloca double
	store double 0x400999999999999a, ptr %r433
	%r432 = load double, ptr %r433
    %r435 = alloca double
	store double 0x4022000000000000, ptr %r435
	%r434 = load double, ptr %r435
    %r437 = alloca double
	store double 0x3fb999999999999a, ptr %r437
	%r436 = load double, ptr %r437
    %r439 = alloca double
	store double 0x4008000000000000, ptr %r439
	%r438 = load double, ptr %r439
    %r441 = alloca double
	store double 0x401e000000000000, ptr %r441
	%r440 = load double, ptr %r441
    %r442 = alloca [9 x double]
    %r453 = alloca i64
	store i64 0, ptr %r453
	%r452 = load i64, ptr %r453
    %r456 = alloca i64
	store i64 9, ptr %r456
	%r455 = load i64, ptr %r456
    %r461 = alloca i1
	store i1 0, ptr %r461
	%r460 = load i1, ptr %r461
    %r471 = alloca i64
	store i64 1, ptr %r471
	%r470 = load i64, ptr %r471
    %r476 = alloca i64
	store i64 9, ptr %r476
	%r475 = load i64, ptr %r476
    %r481 = alloca i1
	store i1 0, ptr %r481
	%r480 = load i1, ptr %r481
    %r486 = alloca i64
	store i64 9, ptr %r486
	%r485 = load i64, ptr %r486
    %r493 = alloca ptr
	store ptr null, ptr %r493
	%r492 = load ptr, ptr %r493
    %r498 = alloca i1
	store i1 0, ptr %r498
	%r497 = load i1, ptr %r498
    %r512 = alloca ptr
	store ptr null, ptr %r512
	%r511 = load ptr, ptr %r512
    %r517 = alloca i1
	store i1 0, ptr %r517
	%r516 = load i1, ptr %r517
    %r522 = alloca i64
	store i64 0, ptr %r522
	%r521 = load i64, ptr %r522
    %r443 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 0
    store double %r424, ptr %r443
    %r444 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 1
    store double %r426, ptr %r444
    %r445 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 2
    store double %r428, ptr %r445
    %r446 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 3
    store double %r430, ptr %r446
    %r447 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 4
    store double %r432, ptr %r447
    %r448 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 5
    store double %r434, ptr %r448
    %r449 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 6
    store double %r436, ptr %r449
    %r450 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 7
    store double %r438, ptr %r450
    %r451 = getelementptr inbounds [9 x double], ptr %r442, i64 0, i64 8
    store double %r440, ptr %r451
    %r454 = trunc i64 %r452 to i32
    %r457 = sext i32 %r454 to i64
    %r458 = icmp slt i64 %r457, %r455
    %r459 = icmp ne i1 %r458, %r460
    br i1 %r459, label %l49, label %l51
l49:
    %r463 = phi i32 [%r454, %l48], [%r474, %l49]
    %r465 = getelementptr inbounds [9 x double], ptr %r442, i32 0, i32 %r463
    %r466 = getelementptr inbounds [9 x i8*], ptr %r423, i32 0, i32 %r463
    store ptr %r465, ptr %r466
    %r472 = sext i32 %r463 to i64
    %r473 = add i64 %r472, %r470
    %r474 = trunc i64 %r473 to i32
    %r477 = sext i32 %r474 to i64
    %r478 = icmp slt i64 %r477, %r475
    %r479 = icmp ne i1 %r478, %r480
    br i1 %r479, label %l49, label %l51
l51:
    %r487 = trunc i64 %r485 to i32
    %r488 = bitcast ptr %r423 to i8**
    %r489 = call ptr @make(i32 %r487, ptr %r488, ptr @compareDoubles)
    %r490 = call ptr @popFirst(ptr %r489)
    %r491 = bitcast ptr %r490 to double*
    %r494 = bitcast ptr %r492 to double*
    %r495 = icmp ne ptr %r491, %r494
    %r496 = icmp ne i1 %r495, %r497
    br i1 %r496, label %l52, label %l54
l52:
    %r499 = phi ptr [%r510, %l52], [%r491, %l51]
    %r501 = phi ptr [%r501, %l52], [%r489, %l51]
    %r503 = bitcast ptr %r499 to i64*
    %r504 = load i64, ptr %r503
    %r505 = call i32 @printf(ptr @.r502, i64 %r504)
    %r509 = call ptr @popFirst(ptr %r501)
    %r510 = bitcast ptr %r509 to double*
    %r513 = bitcast ptr %r511 to double*
    %r514 = icmp ne ptr %r510, %r513
    %r515 = icmp ne i1 %r514, %r516
    br i1 %r515, label %l52, label %l54
l54:
    %r523 = trunc i64 %r521 to i32
    ret i32 %r523
}
