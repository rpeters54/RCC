%struct._mini_gameBoard = type {
    i64,
    i64,
    i64,
    i64,
    i64,
    i64,
    i64,
    i64,
    i64
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)


@.r35 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r39 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r43 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r47 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r51 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r55 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r59 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r63 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r67 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r72 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r76 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r80 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"



@.r577 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r585 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r619 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define void @_mini_cleanBoard(ptr %r5) {
l2:
    %r7 = alloca i64
	store i64 0, ptr %r7
	%r6 = load i64, ptr %r7
    %r10 = alloca i64
	store i64 0, ptr %r10
	%r9 = load i64, ptr %r10
    %r13 = alloca i64
	store i64 0, ptr %r13
	%r12 = load i64, ptr %r13
    %r16 = alloca i64
	store i64 0, ptr %r16
	%r15 = load i64, ptr %r16
    %r19 = alloca i64
	store i64 0, ptr %r19
	%r18 = load i64, ptr %r19
    %r22 = alloca i64
	store i64 0, ptr %r22
	%r21 = load i64, ptr %r22
    %r25 = alloca i64
	store i64 0, ptr %r25
	%r24 = load i64, ptr %r25
    %r28 = alloca i64
	store i64 0, ptr %r28
	%r27 = load i64, ptr %r28
    %r31 = alloca i64
	store i64 0, ptr %r31
	%r30 = load i64, ptr %r31
    %r8 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 0
    store i64 %r6, ptr %r8
    %r11 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 1
    store i64 %r9, ptr %r11
    %r14 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 2
    store i64 %r12, ptr %r14
    %r17 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 3
    store i64 %r15, ptr %r17
    %r20 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 4
    store i64 %r18, ptr %r20
    %r23 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 5
    store i64 %r21, ptr %r23
    %r26 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 6
    store i64 %r24, ptr %r26
    %r29 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 7
    store i64 %r27, ptr %r29
    %r32 = getelementptr inbounds %struct._mini_gameBoard, ptr %r5, i32 0, i32 8
    store i64 %r30, ptr %r32
    ret void
}
define void @_mini_printBoard(ptr %r34) {
l4:
    %r36 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 0
    %r37 = load i64, ptr %r36
    %r38 = call i32 @printf(ptr @.r35, i64 %r37)
    %r40 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 1
    %r41 = load i64, ptr %r40
    %r42 = call i32 @printf(ptr @.r39, i64 %r41)
    %r44 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 2
    %r45 = load i64, ptr %r44
    %r46 = call i32 @printf(ptr @.r43, i64 %r45)
    %r48 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 3
    %r49 = load i64, ptr %r48
    %r50 = call i32 @printf(ptr @.r47, i64 %r49)
    %r52 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 4
    %r53 = load i64, ptr %r52
    %r54 = call i32 @printf(ptr @.r51, i64 %r53)
    %r56 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 5
    %r57 = load i64, ptr %r56
    %r58 = call i32 @printf(ptr @.r55, i64 %r57)
    %r60 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 6
    %r61 = load i64, ptr %r60
    %r62 = call i32 @printf(ptr @.r59, i64 %r61)
    %r64 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 7
    %r65 = load i64, ptr %r64
    %r66 = call i32 @printf(ptr @.r63, i64 %r65)
    %r68 = getelementptr inbounds %struct._mini_gameBoard, ptr %r34, i32 0, i32 8
    %r69 = load i64, ptr %r68
    %r70 = call i32 @printf(ptr @.r67, i64 %r69)
    ret void
}
define void @_mini_printMoveBoard() {
l6:
    %r74 = alloca i64
	store i64 123, ptr %r74
	%r73 = load i64, ptr %r74
    %r78 = alloca i64
	store i64 456, ptr %r78
	%r77 = load i64, ptr %r78
    %r82 = alloca i64
	store i64 789, ptr %r82
	%r81 = load i64, ptr %r82
    %r75 = call i32 @printf(ptr @.r72, i64 %r73)
    %r79 = call i32 @printf(ptr @.r76, i64 %r77)
    %r83 = call i32 @printf(ptr @.r80, i64 %r81)
    ret void
}
define void @_mini_placePiece(ptr %r85, i64 %r86, i64 %r87) {
l8:
    %r89 = alloca i64
	store i64 1, ptr %r89
	%r88 = load i64, ptr %r89
    %r92 = alloca i1
	store i1 0, ptr %r92
	%r91 = load i1, ptr %r92
    %r96 = alloca i64
	store i64 2, ptr %r96
	%r95 = load i64, ptr %r96
    %r99 = alloca i1
	store i1 0, ptr %r99
	%r98 = load i1, ptr %r99
    %r103 = alloca i64
	store i64 3, ptr %r103
	%r102 = load i64, ptr %r103
    %r106 = alloca i1
	store i1 0, ptr %r106
	%r105 = load i1, ptr %r106
    %r110 = alloca i64
	store i64 4, ptr %r110
	%r109 = load i64, ptr %r110
    %r113 = alloca i1
	store i1 0, ptr %r113
	%r112 = load i1, ptr %r113
    %r117 = alloca i64
	store i64 5, ptr %r117
	%r116 = load i64, ptr %r117
    %r120 = alloca i1
	store i1 0, ptr %r120
	%r119 = load i1, ptr %r120
    %r124 = alloca i64
	store i64 6, ptr %r124
	%r123 = load i64, ptr %r124
    %r127 = alloca i1
	store i1 0, ptr %r127
	%r126 = load i1, ptr %r127
    %r131 = alloca i64
	store i64 7, ptr %r131
	%r130 = load i64, ptr %r131
    %r134 = alloca i1
	store i1 0, ptr %r134
	%r133 = load i1, ptr %r134
    %r138 = alloca i64
	store i64 8, ptr %r138
	%r137 = load i64, ptr %r138
    %r141 = alloca i1
	store i1 0, ptr %r141
	%r140 = load i1, ptr %r141
    %r145 = alloca i64
	store i64 9, ptr %r145
	%r144 = load i64, ptr %r145
    %r148 = alloca i1
	store i1 0, ptr %r148
	%r147 = load i1, ptr %r148
    %r90 = icmp eq i64 %r87, %r88
    %r93 = icmp ne i1 %r90, %r91
    br i1 %r93, label %l9, label %l10
l9:
    %r94 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 0
    store i64 %r86, ptr %r94
    br label %l7
l10:
    %r97 = icmp eq i64 %r87, %r95
    %r100 = icmp ne i1 %r97, %r98
    br i1 %r100, label %l11, label %l12
l11:
    %r101 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 1
    store i64 %r86, ptr %r101
    br label %l7
l12:
    %r104 = icmp eq i64 %r87, %r102
    %r107 = icmp ne i1 %r104, %r105
    br i1 %r107, label %l13, label %l14
l13:
    %r108 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 2
    store i64 %r86, ptr %r108
    br label %l7
l14:
    %r111 = icmp eq i64 %r87, %r109
    %r114 = icmp ne i1 %r111, %r112
    br i1 %r114, label %l15, label %l16
l15:
    %r115 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 3
    store i64 %r86, ptr %r115
    br label %l7
l16:
    %r118 = icmp eq i64 %r87, %r116
    %r121 = icmp ne i1 %r118, %r119
    br i1 %r121, label %l17, label %l18
l17:
    %r122 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 4
    store i64 %r86, ptr %r122
    br label %l7
l18:
    %r125 = icmp eq i64 %r87, %r123
    %r128 = icmp ne i1 %r125, %r126
    br i1 %r128, label %l19, label %l20
l19:
    %r129 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 5
    store i64 %r86, ptr %r129
    br label %l7
l20:
    %r132 = icmp eq i64 %r87, %r130
    %r135 = icmp ne i1 %r132, %r133
    br i1 %r135, label %l21, label %l22
l21:
    %r136 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 6
    store i64 %r86, ptr %r136
    br label %l7
l22:
    %r139 = icmp eq i64 %r87, %r137
    %r142 = icmp ne i1 %r139, %r140
    br i1 %r142, label %l23, label %l24
l23:
    %r143 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 7
    store i64 %r86, ptr %r143
    br label %l7
l24:
    %r146 = icmp eq i64 %r87, %r144
    %r149 = icmp ne i1 %r146, %r147
    br i1 %r149, label %l25, label %l7
l25:
    %r150 = getelementptr inbounds %struct._mini_gameBoard, ptr %r85, i32 0, i32 8
    store i64 %r86, ptr %r150
    br label %l7
l7:
    ret void
}
define i64 @_mini_checkWinner(ptr %r179) {
l37:
    %r183 = alloca i64
	store i64 1, ptr %r183
	%r182 = load i64, ptr %r183
    %r186 = alloca i1
	store i1 0, ptr %r186
	%r185 = load i1, ptr %r186
    %r191 = alloca i64
	store i64 1, ptr %r191
	%r190 = load i64, ptr %r191
    %r194 = alloca i1
	store i1 0, ptr %r194
	%r193 = load i1, ptr %r194
    %r199 = alloca i64
	store i64 1, ptr %r199
	%r198 = load i64, ptr %r199
    %r202 = alloca i1
	store i1 0, ptr %r202
	%r201 = load i1, ptr %r202
    %r205 = alloca i64
	store i64 0, ptr %r205
	%r204 = load i64, ptr %r205
    %r211 = alloca i64
	store i64 2, ptr %r211
	%r210 = load i64, ptr %r211
    %r214 = alloca i1
	store i1 0, ptr %r214
	%r213 = load i1, ptr %r214
    %r219 = alloca i64
	store i64 2, ptr %r219
	%r218 = load i64, ptr %r219
    %r222 = alloca i1
	store i1 0, ptr %r222
	%r221 = load i1, ptr %r222
    %r227 = alloca i64
	store i64 2, ptr %r227
	%r226 = load i64, ptr %r227
    %r230 = alloca i1
	store i1 0, ptr %r230
	%r229 = load i1, ptr %r230
    %r233 = alloca i64
	store i64 1, ptr %r233
	%r232 = load i64, ptr %r233
    %r239 = alloca i64
	store i64 1, ptr %r239
	%r238 = load i64, ptr %r239
    %r242 = alloca i1
	store i1 0, ptr %r242
	%r241 = load i1, ptr %r242
    %r247 = alloca i64
	store i64 1, ptr %r247
	%r246 = load i64, ptr %r247
    %r250 = alloca i1
	store i1 0, ptr %r250
	%r249 = load i1, ptr %r250
    %r255 = alloca i64
	store i64 1, ptr %r255
	%r254 = load i64, ptr %r255
    %r258 = alloca i1
	store i1 0, ptr %r258
	%r257 = load i1, ptr %r258
    %r261 = alloca i64
	store i64 0, ptr %r261
	%r260 = load i64, ptr %r261
    %r267 = alloca i64
	store i64 2, ptr %r267
	%r266 = load i64, ptr %r267
    %r270 = alloca i1
	store i1 0, ptr %r270
	%r269 = load i1, ptr %r270
    %r275 = alloca i64
	store i64 2, ptr %r275
	%r274 = load i64, ptr %r275
    %r278 = alloca i1
	store i1 0, ptr %r278
	%r277 = load i1, ptr %r278
    %r283 = alloca i64
	store i64 2, ptr %r283
	%r282 = load i64, ptr %r283
    %r286 = alloca i1
	store i1 0, ptr %r286
	%r285 = load i1, ptr %r286
    %r289 = alloca i64
	store i64 1, ptr %r289
	%r288 = load i64, ptr %r289
    %r295 = alloca i64
	store i64 1, ptr %r295
	%r294 = load i64, ptr %r295
    %r298 = alloca i1
	store i1 0, ptr %r298
	%r297 = load i1, ptr %r298
    %r303 = alloca i64
	store i64 1, ptr %r303
	%r302 = load i64, ptr %r303
    %r306 = alloca i1
	store i1 0, ptr %r306
	%r305 = load i1, ptr %r306
    %r311 = alloca i64
	store i64 1, ptr %r311
	%r310 = load i64, ptr %r311
    %r314 = alloca i1
	store i1 0, ptr %r314
	%r313 = load i1, ptr %r314
    %r317 = alloca i64
	store i64 0, ptr %r317
	%r316 = load i64, ptr %r317
    %r323 = alloca i64
	store i64 2, ptr %r323
	%r322 = load i64, ptr %r323
    %r326 = alloca i1
	store i1 0, ptr %r326
	%r325 = load i1, ptr %r326
    %r331 = alloca i64
	store i64 2, ptr %r331
	%r330 = load i64, ptr %r331
    %r334 = alloca i1
	store i1 0, ptr %r334
	%r333 = load i1, ptr %r334
    %r339 = alloca i64
	store i64 2, ptr %r339
	%r338 = load i64, ptr %r339
    %r342 = alloca i1
	store i1 0, ptr %r342
	%r341 = load i1, ptr %r342
    %r345 = alloca i64
	store i64 1, ptr %r345
	%r344 = load i64, ptr %r345
    %r351 = alloca i64
	store i64 1, ptr %r351
	%r350 = load i64, ptr %r351
    %r354 = alloca i1
	store i1 0, ptr %r354
	%r353 = load i1, ptr %r354
    %r359 = alloca i64
	store i64 1, ptr %r359
	%r358 = load i64, ptr %r359
    %r362 = alloca i1
	store i1 0, ptr %r362
	%r361 = load i1, ptr %r362
    %r367 = alloca i64
	store i64 1, ptr %r367
	%r366 = load i64, ptr %r367
    %r370 = alloca i1
	store i1 0, ptr %r370
	%r369 = load i1, ptr %r370
    %r373 = alloca i64
	store i64 0, ptr %r373
	%r372 = load i64, ptr %r373
    %r379 = alloca i64
	store i64 2, ptr %r379
	%r378 = load i64, ptr %r379
    %r382 = alloca i1
	store i1 0, ptr %r382
	%r381 = load i1, ptr %r382
    %r387 = alloca i64
	store i64 2, ptr %r387
	%r386 = load i64, ptr %r387
    %r390 = alloca i1
	store i1 0, ptr %r390
	%r389 = load i1, ptr %r390
    %r395 = alloca i64
	store i64 2, ptr %r395
	%r394 = load i64, ptr %r395
    %r398 = alloca i1
	store i1 0, ptr %r398
	%r397 = load i1, ptr %r398
    %r401 = alloca i64
	store i64 1, ptr %r401
	%r400 = load i64, ptr %r401
    %r407 = alloca i64
	store i64 1, ptr %r407
	%r406 = load i64, ptr %r407
    %r410 = alloca i1
	store i1 0, ptr %r410
	%r409 = load i1, ptr %r410
    %r415 = alloca i64
	store i64 1, ptr %r415
	%r414 = load i64, ptr %r415
    %r418 = alloca i1
	store i1 0, ptr %r418
	%r417 = load i1, ptr %r418
    %r423 = alloca i64
	store i64 1, ptr %r423
	%r422 = load i64, ptr %r423
    %r426 = alloca i1
	store i1 0, ptr %r426
	%r425 = load i1, ptr %r426
    %r429 = alloca i64
	store i64 0, ptr %r429
	%r428 = load i64, ptr %r429
    %r435 = alloca i64
	store i64 2, ptr %r435
	%r434 = load i64, ptr %r435
    %r438 = alloca i1
	store i1 0, ptr %r438
	%r437 = load i1, ptr %r438
    %r443 = alloca i64
	store i64 2, ptr %r443
	%r442 = load i64, ptr %r443
    %r446 = alloca i1
	store i1 0, ptr %r446
	%r445 = load i1, ptr %r446
    %r451 = alloca i64
	store i64 2, ptr %r451
	%r450 = load i64, ptr %r451
    %r454 = alloca i1
	store i1 0, ptr %r454
	%r453 = load i1, ptr %r454
    %r457 = alloca i64
	store i64 1, ptr %r457
	%r456 = load i64, ptr %r457
    %r463 = alloca i64
	store i64 1, ptr %r463
	%r462 = load i64, ptr %r463
    %r466 = alloca i1
	store i1 0, ptr %r466
	%r465 = load i1, ptr %r466
    %r471 = alloca i64
	store i64 1, ptr %r471
	%r470 = load i64, ptr %r471
    %r474 = alloca i1
	store i1 0, ptr %r474
	%r473 = load i1, ptr %r474
    %r479 = alloca i64
	store i64 1, ptr %r479
	%r478 = load i64, ptr %r479
    %r482 = alloca i1
	store i1 0, ptr %r482
	%r481 = load i1, ptr %r482
    %r485 = alloca i64
	store i64 0, ptr %r485
	%r484 = load i64, ptr %r485
    %r491 = alloca i64
	store i64 2, ptr %r491
	%r490 = load i64, ptr %r491
    %r494 = alloca i1
	store i1 0, ptr %r494
	%r493 = load i1, ptr %r494
    %r499 = alloca i64
	store i64 2, ptr %r499
	%r498 = load i64, ptr %r499
    %r502 = alloca i1
	store i1 0, ptr %r502
	%r501 = load i1, ptr %r502
    %r507 = alloca i64
	store i64 2, ptr %r507
	%r506 = load i64, ptr %r507
    %r510 = alloca i1
	store i1 0, ptr %r510
	%r509 = load i1, ptr %r510
    %r513 = alloca i64
	store i64 1, ptr %r513
	%r512 = load i64, ptr %r513
    %r632 = alloca i64
	store i64 -1, ptr %r632
	%r631 = load i64, ptr %r632
    %r180 = getelementptr inbounds %struct._mini_gameBoard, ptr %r179, i32 0, i32 0
    %r181 = load i64, ptr %r180
    %r184 = icmp eq i64 %r181, %r182
    %r187 = icmp ne i1 %r184, %r185
    br i1 %r187, label %l38, label %l46
l38:
    %r188 = getelementptr inbounds %struct._mini_gameBoard, ptr %r179, i32 0, i32 1
    %r189 = load i64, ptr %r188
    %r192 = icmp eq i64 %r189, %r190
    %r195 = icmp ne i1 %r192, %r193
    br i1 %r195, label %l40, label %l45
l40:
    %r196 = getelementptr inbounds %struct._mini_gameBoard, ptr %r179, i32 0, i32 2
    %r197 = load i64, ptr %r196
    %r200 = icmp eq i64 %r197, %r198
    %r203 = icmp ne i1 %r200, %r201
    br i1 %r203, label %l42, label %l45
l42:
    br label %l36
l45:
    %r206 = phi ptr [%r179, %l40], [%r179, %l38]
    br label %l46
l46:
    %r207 = phi ptr [%r206, %l45], [%r179, %l37]
    %r208 = getelementptr inbounds %struct._mini_gameBoard, ptr %r207, i32 0, i32 0
    %r209 = load i64, ptr %r208
    %r212 = icmp eq i64 %r209, %r210
    %r215 = icmp ne i1 %r212, %r213
    br i1 %r215, label %l47, label %l55
l47:
    %r216 = getelementptr inbounds %struct._mini_gameBoard, ptr %r207, i32 0, i32 1
    %r217 = load i64, ptr %r216
    %r220 = icmp eq i64 %r217, %r218
    %r223 = icmp ne i1 %r220, %r221
    br i1 %r223, label %l49, label %l54
l49:
    %r224 = getelementptr inbounds %struct._mini_gameBoard, ptr %r207, i32 0, i32 2
    %r225 = load i64, ptr %r224
    %r228 = icmp eq i64 %r225, %r226
    %r231 = icmp ne i1 %r228, %r229
    br i1 %r231, label %l51, label %l54
l51:
    br label %l36
l54:
    %r234 = phi ptr [%r207, %l47], [%r207, %l49]
    br label %l55
l55:
    %r235 = phi ptr [%r234, %l54], [%r207, %l46]
    %r236 = getelementptr inbounds %struct._mini_gameBoard, ptr %r235, i32 0, i32 3
    %r237 = load i64, ptr %r236
    %r240 = icmp eq i64 %r237, %r238
    %r243 = icmp ne i1 %r240, %r241
    br i1 %r243, label %l56, label %l64
l56:
    %r244 = getelementptr inbounds %struct._mini_gameBoard, ptr %r235, i32 0, i32 4
    %r245 = load i64, ptr %r244
    %r248 = icmp eq i64 %r245, %r246
    %r251 = icmp ne i1 %r248, %r249
    br i1 %r251, label %l58, label %l63
l58:
    %r252 = getelementptr inbounds %struct._mini_gameBoard, ptr %r235, i32 0, i32 5
    %r253 = load i64, ptr %r252
    %r256 = icmp eq i64 %r253, %r254
    %r259 = icmp ne i1 %r256, %r257
    br i1 %r259, label %l60, label %l63
l60:
    br label %l36
l63:
    %r262 = phi ptr [%r235, %l58], [%r235, %l56]
    br label %l64
l64:
    %r263 = phi ptr [%r235, %l55], [%r262, %l63]
    %r264 = getelementptr inbounds %struct._mini_gameBoard, ptr %r263, i32 0, i32 3
    %r265 = load i64, ptr %r264
    %r268 = icmp eq i64 %r265, %r266
    %r271 = icmp ne i1 %r268, %r269
    br i1 %r271, label %l65, label %l73
l65:
    %r272 = getelementptr inbounds %struct._mini_gameBoard, ptr %r263, i32 0, i32 4
    %r273 = load i64, ptr %r272
    %r276 = icmp eq i64 %r273, %r274
    %r279 = icmp ne i1 %r276, %r277
    br i1 %r279, label %l67, label %l72
l67:
    %r280 = getelementptr inbounds %struct._mini_gameBoard, ptr %r263, i32 0, i32 5
    %r281 = load i64, ptr %r280
    %r284 = icmp eq i64 %r281, %r282
    %r287 = icmp ne i1 %r284, %r285
    br i1 %r287, label %l69, label %l72
l69:
    br label %l36
l72:
    %r290 = phi ptr [%r263, %l65], [%r263, %l67]
    br label %l73
l73:
    %r291 = phi ptr [%r263, %l64], [%r290, %l72]
    %r292 = getelementptr inbounds %struct._mini_gameBoard, ptr %r291, i32 0, i32 6
    %r293 = load i64, ptr %r292
    %r296 = icmp eq i64 %r293, %r294
    %r299 = icmp ne i1 %r296, %r297
    br i1 %r299, label %l74, label %l82
l74:
    %r300 = getelementptr inbounds %struct._mini_gameBoard, ptr %r291, i32 0, i32 7
    %r301 = load i64, ptr %r300
    %r304 = icmp eq i64 %r301, %r302
    %r307 = icmp ne i1 %r304, %r305
    br i1 %r307, label %l76, label %l81
l76:
    %r308 = getelementptr inbounds %struct._mini_gameBoard, ptr %r291, i32 0, i32 8
    %r309 = load i64, ptr %r308
    %r312 = icmp eq i64 %r309, %r310
    %r315 = icmp ne i1 %r312, %r313
    br i1 %r315, label %l78, label %l81
l78:
    br label %l36
l81:
    %r318 = phi ptr [%r291, %l76], [%r291, %l74]
    br label %l82
l82:
    %r319 = phi ptr [%r291, %l73], [%r318, %l81]
    %r320 = getelementptr inbounds %struct._mini_gameBoard, ptr %r319, i32 0, i32 6
    %r321 = load i64, ptr %r320
    %r324 = icmp eq i64 %r321, %r322
    %r327 = icmp ne i1 %r324, %r325
    br i1 %r327, label %l83, label %l91
l83:
    %r328 = getelementptr inbounds %struct._mini_gameBoard, ptr %r319, i32 0, i32 7
    %r329 = load i64, ptr %r328
    %r332 = icmp eq i64 %r329, %r330
    %r335 = icmp ne i1 %r332, %r333
    br i1 %r335, label %l85, label %l90
l85:
    %r336 = getelementptr inbounds %struct._mini_gameBoard, ptr %r319, i32 0, i32 8
    %r337 = load i64, ptr %r336
    %r340 = icmp eq i64 %r337, %r338
    %r343 = icmp ne i1 %r340, %r341
    br i1 %r343, label %l87, label %l90
l87:
    br label %l36
l90:
    %r346 = phi ptr [%r319, %l83], [%r319, %l85]
    br label %l91
l91:
    %r347 = phi ptr [%r319, %l82], [%r346, %l90]
    %r348 = getelementptr inbounds %struct._mini_gameBoard, ptr %r347, i32 0, i32 0
    %r349 = load i64, ptr %r348
    %r352 = icmp eq i64 %r349, %r350
    %r355 = icmp ne i1 %r352, %r353
    br i1 %r355, label %l92, label %l100
l92:
    %r356 = getelementptr inbounds %struct._mini_gameBoard, ptr %r347, i32 0, i32 3
    %r357 = load i64, ptr %r356
    %r360 = icmp eq i64 %r357, %r358
    %r363 = icmp ne i1 %r360, %r361
    br i1 %r363, label %l94, label %l99
l94:
    %r364 = getelementptr inbounds %struct._mini_gameBoard, ptr %r347, i32 0, i32 6
    %r365 = load i64, ptr %r364
    %r368 = icmp eq i64 %r365, %r366
    %r371 = icmp ne i1 %r368, %r369
    br i1 %r371, label %l96, label %l99
l96:
    br label %l36
l99:
    %r374 = phi ptr [%r347, %l92], [%r347, %l94]
    br label %l100
l100:
    %r375 = phi ptr [%r374, %l99], [%r347, %l91]
    %r376 = getelementptr inbounds %struct._mini_gameBoard, ptr %r375, i32 0, i32 0
    %r377 = load i64, ptr %r376
    %r380 = icmp eq i64 %r377, %r378
    %r383 = icmp ne i1 %r380, %r381
    br i1 %r383, label %l101, label %l109
l101:
    %r384 = getelementptr inbounds %struct._mini_gameBoard, ptr %r375, i32 0, i32 3
    %r385 = load i64, ptr %r384
    %r388 = icmp eq i64 %r385, %r386
    %r391 = icmp ne i1 %r388, %r389
    br i1 %r391, label %l103, label %l108
l103:
    %r392 = getelementptr inbounds %struct._mini_gameBoard, ptr %r375, i32 0, i32 6
    %r393 = load i64, ptr %r392
    %r396 = icmp eq i64 %r393, %r394
    %r399 = icmp ne i1 %r396, %r397
    br i1 %r399, label %l105, label %l108
l105:
    br label %l36
l108:
    %r402 = phi ptr [%r375, %l103], [%r375, %l101]
    br label %l109
l109:
    %r403 = phi ptr [%r375, %l100], [%r402, %l108]
    %r404 = getelementptr inbounds %struct._mini_gameBoard, ptr %r403, i32 0, i32 1
    %r405 = load i64, ptr %r404
    %r408 = icmp eq i64 %r405, %r406
    %r411 = icmp ne i1 %r408, %r409
    br i1 %r411, label %l110, label %l118
l110:
    %r412 = getelementptr inbounds %struct._mini_gameBoard, ptr %r403, i32 0, i32 4
    %r413 = load i64, ptr %r412
    %r416 = icmp eq i64 %r413, %r414
    %r419 = icmp ne i1 %r416, %r417
    br i1 %r419, label %l112, label %l117
l112:
    %r420 = getelementptr inbounds %struct._mini_gameBoard, ptr %r403, i32 0, i32 7
    %r421 = load i64, ptr %r420
    %r424 = icmp eq i64 %r421, %r422
    %r427 = icmp ne i1 %r424, %r425
    br i1 %r427, label %l114, label %l117
l114:
    br label %l36
l117:
    %r430 = phi ptr [%r403, %l110], [%r403, %l112]
    br label %l118
l118:
    %r431 = phi ptr [%r430, %l117], [%r403, %l109]
    %r432 = getelementptr inbounds %struct._mini_gameBoard, ptr %r431, i32 0, i32 1
    %r433 = load i64, ptr %r432
    %r436 = icmp eq i64 %r433, %r434
    %r439 = icmp ne i1 %r436, %r437
    br i1 %r439, label %l119, label %l127
l119:
    %r440 = getelementptr inbounds %struct._mini_gameBoard, ptr %r431, i32 0, i32 4
    %r441 = load i64, ptr %r440
    %r444 = icmp eq i64 %r441, %r442
    %r447 = icmp ne i1 %r444, %r445
    br i1 %r447, label %l121, label %l126
l121:
    %r448 = getelementptr inbounds %struct._mini_gameBoard, ptr %r431, i32 0, i32 7
    %r449 = load i64, ptr %r448
    %r452 = icmp eq i64 %r449, %r450
    %r455 = icmp ne i1 %r452, %r453
    br i1 %r455, label %l123, label %l126
l123:
    br label %l36
l126:
    %r458 = phi ptr [%r431, %l121], [%r431, %l119]
    br label %l127
l127:
    %r459 = phi ptr [%r431, %l118], [%r458, %l126]
    %r460 = getelementptr inbounds %struct._mini_gameBoard, ptr %r459, i32 0, i32 2
    %r461 = load i64, ptr %r460
    %r464 = icmp eq i64 %r461, %r462
    %r467 = icmp ne i1 %r464, %r465
    br i1 %r467, label %l128, label %l136
l128:
    %r468 = getelementptr inbounds %struct._mini_gameBoard, ptr %r459, i32 0, i32 5
    %r469 = load i64, ptr %r468
    %r472 = icmp eq i64 %r469, %r470
    %r475 = icmp ne i1 %r472, %r473
    br i1 %r475, label %l130, label %l135
l130:
    %r476 = getelementptr inbounds %struct._mini_gameBoard, ptr %r459, i32 0, i32 8
    %r477 = load i64, ptr %r476
    %r480 = icmp eq i64 %r477, %r478
    %r483 = icmp ne i1 %r480, %r481
    br i1 %r483, label %l132, label %l135
l132:
    br label %l36
l135:
    %r486 = phi ptr [%r459, %l130], [%r459, %l128]
    br label %l136
l136:
    %r487 = phi ptr [%r459, %l127], [%r486, %l135]
    %r488 = getelementptr inbounds %struct._mini_gameBoard, ptr %r487, i32 0, i32 2
    %r489 = load i64, ptr %r488
    %r492 = icmp eq i64 %r489, %r490
    %r495 = icmp ne i1 %r492, %r493
    br i1 %r495, label %l137, label %l145
l137:
    %r496 = getelementptr inbounds %struct._mini_gameBoard, ptr %r487, i32 0, i32 5
    %r497 = load i64, ptr %r496
    %r500 = icmp eq i64 %r497, %r498
    %r503 = icmp ne i1 %r500, %r501
    br i1 %r503, label %l139, label %l145
l139:
    %r504 = getelementptr inbounds %struct._mini_gameBoard, ptr %r487, i32 0, i32 8
    %r505 = load i64, ptr %r504
    %r508 = icmp eq i64 %r505, %r506
    %r511 = icmp ne i1 %r508, %r509
    br i1 %r511, label %l141, label %l145
l141:
    br label %l36
l145:
    br label %l36
l36:
    %r521 = phi i64 [%r204, %l42], [%r232, %l51], [%r260, %l60], [%r288, %l69], [%r316, %l78], [%r344, %l87], [%r372, %l96], [%r400, %l105], [%r428, %l114], [%r456, %l123], [%r484, %l132], [%r512, %l141], [%r631, %l145]
    ret i64 %r521
}
define i64 @_mini_main() {
l147:
    %r525 = alloca i64
    %r526 = alloca i64
    %r535 = alloca i64
	store i64 0, ptr %r535
	%r534 = load i64, ptr %r535
    %r537 = alloca i64
	store i64 0, ptr %r537
	%r536 = load i64, ptr %r537
    %r539 = alloca i64
	store i64 0, ptr %r539
	%r538 = load i64, ptr %r539
    %r541 = alloca i64
	store i64 0, ptr %r541
	%r540 = load i64, ptr %r541
    %r634 = alloca i64
	store i64 -1, ptr %r634
	%r633 = load i64, ptr %r634
    %r548 = alloca i64
	store i64 72, ptr %r548
	%r547 = load i64, ptr %r548
    %r552 = alloca i64
	store i64 0, ptr %r552
	%r551 = load i64, ptr %r552
    %r555 = alloca i64
	store i64 8, ptr %r555
	%r554 = load i64, ptr %r555
    %r560 = alloca i1
	store i1 0, ptr %r560
	%r559 = load i1, ptr %r560
    %r563 = alloca i1
	store i1 0, ptr %r563
	%r562 = load i1, ptr %r563
    %r569 = alloca i64
	store i64 0, ptr %r569
	%r568 = load i64, ptr %r569
    %r572 = alloca i1
	store i1 0, ptr %r572
	%r571 = load i1, ptr %r572
    %r575 = alloca i64
	store i64 1, ptr %r575
	%r574 = load i64, ptr %r575
    %r580 = alloca i64
	store i64 1, ptr %r580
	%r579 = load i64, ptr %r580
    %r583 = alloca i64
	store i64 1, ptr %r583
	%r582 = load i64, ptr %r583
    %r588 = alloca i64
	store i64 2, ptr %r588
	%r587 = load i64, ptr %r588
    %r596 = alloca i64
	store i64 1, ptr %r596
	%r595 = load i64, ptr %r596
    %r603 = alloca i64
	store i64 0, ptr %r603
	%r602 = load i64, ptr %r603
    %r606 = alloca i64
	store i64 8, ptr %r606
	%r605 = load i64, ptr %r606
    %r611 = alloca i1
	store i1 0, ptr %r611
	%r610 = load i1, ptr %r611
    %r614 = alloca i1
	store i1 0, ptr %r614
	%r613 = load i1, ptr %r614
    %r621 = alloca i64
	store i64 1, ptr %r621
	%r620 = load i64, ptr %r621
    %r625 = alloca i64
	store i64 0, ptr %r625
	%r624 = load i64, ptr %r625
    store i64 %r538, ptr %r525
    store i64 %r540, ptr %r526
    %r549 = call ptr @malloc(i64 %r547)
    %r550 = bitcast ptr %r549 to %struct._mini_gameBoard*
    call void @_mini_cleanBoard(ptr %r550)
    %r553 = icmp slt i64 %r633, %r551
    %r556 = icmp ne i64 %r534, %r554
    %r557 = and i1 %r553, %r556
    %r558 = icmp ne i1 %r557, %r559
    %r561 = icmp ne i1 %r558, %r562
    br i1 %r561, label %l148, label %l150
l148:
    %r565 = phi ptr [%r550, %l147], [%r591, %l153]
    %r566 = phi i64 [%r534, %l147], [%r597, %l153]
    %r567 = phi i64 [%r536, %l147], [%r593, %l153]
    call void @_mini_printBoard(ptr %r565)
    %r570 = icmp eq i64 %r567, %r568
    %r573 = icmp ne i1 %r570, %r571
    br i1 %r573, label %l151, label %l152
l151:
    %r576 = add i64 %r567, %r574
    %r578 = call i32 @scanf(ptr @.r577, ptr %r525)
    %r581 = load i64, ptr %r525
    call void @_mini_placePiece(ptr %r565, i64 %r579, i64 %r581)
    br label %l153
l152:
    %r584 = sub i64 %r567, %r582
    %r586 = call i32 @scanf(ptr @.r585, ptr %r526)
    %r589 = load i64, ptr %r526
    call void @_mini_placePiece(ptr %r565, i64 %r587, i64 %r589)
    br label %l153
l153:
    %r591 = phi ptr [%r565, %l151], [%r565, %l152]
    %r592 = phi i64 [%r566, %l151], [%r566, %l152]
    %r593 = phi i64 [%r576, %l151], [%r584, %l152]
    %r594 = call i64 @_mini_checkWinner(ptr %r591)
    %r597 = add i64 %r592, %r595
    %r604 = icmp slt i64 %r594, %r602
    %r607 = icmp ne i64 %r597, %r605
    %r608 = and i1 %r604, %r607
    %r609 = icmp ne i1 %r608, %r610
    %r612 = icmp ne i1 %r609, %r613
    br i1 %r612, label %l148, label %l150
l150:
    %r615 = phi i64 [%r633, %l147], [%r594, %l153]
    %r622 = add i64 %r615, %r620
    %r623 = call i32 @printf(ptr @.r619, i64 %r622)
    ret i64 %r624
}
define i32 @main() {
l155:
    %r628 = call i64 @_mini_main()
    %r629 = trunc i64 %r628 to i32
    ret i32 %r629
}
