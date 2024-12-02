%struct._mini_thing = type {
    i64,
    i64,
    ptr
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global i64 zeroinitializer
@.r5 = global i64 zeroinitializer
@.r6 = global ptr zeroinitializer
@.r7 = global i64 zeroinitializer

@.r10 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r14 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r18 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r22 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r26 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r30 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r34 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"


@.r51 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r55 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r65 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r69 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r81 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r85 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r107 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r111 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r115 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r131 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r135 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r139 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r155 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r159 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r163 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r179 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r183 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r187 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"




@.r238 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r242 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r264 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r268 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r290 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r294 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r316 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r320 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r346 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r350 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r372 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r376 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r398 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r402 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r424 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r428 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r449 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r453 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r472 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r476 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r495 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r499 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r518 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r522 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r541 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r545 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r564 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r568 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r584 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r588 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r607 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r611 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r627 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r631 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r650 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r654 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r673 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r677 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r701 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r705 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r709 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r734 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r738 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r742 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r767 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r771 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r775 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r800 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r804 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r808 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r833 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r837 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r858 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r862 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r884 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r888 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r904 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r908 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r925 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r929 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r945 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r949 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r966 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r970 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r984 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r988 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1022 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1062 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1066 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r1070 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1099 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1103 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r1107 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1123 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1127 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1163 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1167 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r1171 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1194 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1198 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1213 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1217 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1234 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1238 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1264 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1268 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r1272 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1288 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1292 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1324 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1328 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r1332 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1353 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1357 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1397 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1401 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r1405 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1427 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1431 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1461 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1481 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1494 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1498 = private unnamed_addr constant [5 x i8] c"%ld \00"
@.r1502 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1517 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1521 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1541 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1545 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define void @_mini_printgroup(i64 %r9) {
l2:
    %r12 = alloca i64
	store i64 1, ptr %r12
	%r11 = load i64, ptr %r12
    %r16 = alloca i64
	store i64 0, ptr %r16
	%r15 = load i64, ptr %r16
    %r20 = alloca i64
	store i64 1, ptr %r20
	%r19 = load i64, ptr %r20
    %r24 = alloca i64
	store i64 0, ptr %r24
	%r23 = load i64, ptr %r24
    %r28 = alloca i64
	store i64 1, ptr %r28
	%r27 = load i64, ptr %r28
    %r32 = alloca i64
	store i64 0, ptr %r32
	%r31 = load i64, ptr %r32
    %r13 = call i32 @printf(ptr @.r10, i64 %r11)
    %r17 = call i32 @printf(ptr @.r14, i64 %r15)
    %r21 = call i32 @printf(ptr @.r18, i64 %r19)
    %r25 = call i32 @printf(ptr @.r22, i64 %r23)
    %r29 = call i32 @printf(ptr @.r26, i64 %r27)
    %r33 = call i32 @printf(ptr @.r30, i64 %r31)
    %r35 = call i32 @printf(ptr @.r34, i64 %r9)
    ret void
}
define i64 @_mini_setcounter(i64 %r37) {
l4:
    %r39 = alloca i64
	store i64 1, ptr %r39
	%r38 = load i64, ptr %r39
    store i64 %r37, ptr @.r7
    ret i64 %r38
}
define void @_mini_takealltypes(i64 %r42, i64 %r43, ptr %r44) {
l6:
    %r46 = alloca i64
	store i64 3, ptr %r46
	%r45 = load i64, ptr %r46
    %r49 = alloca i1
	store i1 0, ptr %r49
	%r48 = load i1, ptr %r49
    %r53 = alloca i64
	store i64 1, ptr %r53
	%r52 = load i64, ptr %r53
    %r57 = alloca i64
	store i64 0, ptr %r57
	%r56 = load i64, ptr %r57
    %r63 = alloca i64
	store i64 0, ptr %r63
	%r62 = load i64, ptr %r63
    %r67 = alloca i64
	store i64 1, ptr %r67
	%r66 = load i64, ptr %r67
    %r71 = alloca i64
	store i64 0, ptr %r71
	%r70 = load i64, ptr %r71
    %r79 = alloca i64
	store i64 0, ptr %r79
	%r78 = load i64, ptr %r79
    %r83 = alloca i64
	store i64 1, ptr %r83
	%r82 = load i64, ptr %r83
    %r87 = alloca i64
	store i64 0, ptr %r87
	%r86 = load i64, ptr %r87
    %r47 = icmp eq i64 %r42, %r45
    %r50 = icmp ne i1 %r47, %r48
    br i1 %r50, label %l7, label %l8
l7:
    %r54 = call i32 @printf(ptr @.r51, i64 %r52)
    br label %l9
l8:
    %r58 = call i32 @printf(ptr @.r55, i64 %r56)
    br label %l9
l9:
    %r59 = phi ptr [%r44, %l7], [%r44, %l8]
    %r60 = phi i64 [%r43, %l7], [%r43, %l8]
    %r64 = icmp ne i64 %r60, %r62
    br i1 %r64, label %l10, label %l11
l10:
    %r68 = call i32 @printf(ptr @.r65, i64 %r66)
    br label %l12
l11:
    %r72 = call i32 @printf(ptr @.r69, i64 %r70)
    br label %l12
l12:
    %r73 = phi ptr [%r59, %l11], [%r59, %l10]
    %r76 = getelementptr inbounds %struct._mini_thing, ptr %r73, i32 0, i32 1
    %r77 = load i64, ptr %r76
    %r80 = icmp ne i64 %r77, %r78
    br i1 %r80, label %l13, label %l14
l13:
    %r84 = call i32 @printf(ptr @.r81, i64 %r82)
    br label %l5
l14:
    %r88 = call i32 @printf(ptr @.r85, i64 %r86)
    br label %l5
l5:
    ret void
}
define void @_mini_tonofargs(i64 %r93, i64 %r94, i64 %r95, i64 %r96, i64 %r97, i64 %r98, i64 %r99, i64 %r100) {
l17:
    %r102 = alloca i64
	store i64 5, ptr %r102
	%r101 = load i64, ptr %r102
    %r105 = alloca i1
	store i1 0, ptr %r105
	%r104 = load i1, ptr %r105
    %r109 = alloca i64
	store i64 1, ptr %r109
	%r108 = load i64, ptr %r109
    %r113 = alloca i64
	store i64 0, ptr %r113
	%r112 = load i64, ptr %r113
    %r126 = alloca i64
	store i64 6, ptr %r126
	%r125 = load i64, ptr %r126
    %r129 = alloca i1
	store i1 0, ptr %r129
	%r128 = load i1, ptr %r129
    %r133 = alloca i64
	store i64 1, ptr %r133
	%r132 = load i64, ptr %r133
    %r137 = alloca i64
	store i64 0, ptr %r137
	%r136 = load i64, ptr %r137
    %r150 = alloca i64
	store i64 7, ptr %r150
	%r149 = load i64, ptr %r150
    %r153 = alloca i1
	store i1 0, ptr %r153
	%r152 = load i1, ptr %r153
    %r157 = alloca i64
	store i64 1, ptr %r157
	%r156 = load i64, ptr %r157
    %r161 = alloca i64
	store i64 0, ptr %r161
	%r160 = load i64, ptr %r161
    %r174 = alloca i64
	store i64 8, ptr %r174
	%r173 = load i64, ptr %r174
    %r177 = alloca i1
	store i1 0, ptr %r177
	%r176 = load i1, ptr %r177
    %r181 = alloca i64
	store i64 1, ptr %r181
	%r180 = load i64, ptr %r181
    %r185 = alloca i64
	store i64 0, ptr %r185
	%r184 = load i64, ptr %r185
    %r103 = icmp eq i64 %r97, %r101
    %r106 = icmp ne i1 %r103, %r104
    br i1 %r106, label %l18, label %l19
l18:
    %r110 = call i32 @printf(ptr @.r107, i64 %r108)
    br label %l20
l19:
    %r114 = call i32 @printf(ptr @.r111, i64 %r112)
    %r116 = call i32 @printf(ptr @.r115, i64 %r97)
    br label %l20
l20:
    %r117 = phi i64 [%r100, %l19], [%r100, %l18]
    %r121 = phi i64 [%r98, %l19], [%r98, %l18]
    %r122 = phi i64 [%r99, %l19], [%r99, %l18]
    %r127 = icmp eq i64 %r121, %r125
    %r130 = icmp ne i1 %r127, %r128
    br i1 %r130, label %l21, label %l22
l21:
    %r134 = call i32 @printf(ptr @.r131, i64 %r132)
    br label %l23
l22:
    %r138 = call i32 @printf(ptr @.r135, i64 %r136)
    %r140 = call i32 @printf(ptr @.r139, i64 %r121)
    br label %l23
l23:
    %r141 = phi i64 [%r117, %l21], [%r117, %l22]
    %r146 = phi i64 [%r122, %l21], [%r122, %l22]
    %r151 = icmp eq i64 %r146, %r149
    %r154 = icmp ne i1 %r151, %r152
    br i1 %r154, label %l24, label %l25
l24:
    %r158 = call i32 @printf(ptr @.r155, i64 %r156)
    br label %l26
l25:
    %r162 = call i32 @printf(ptr @.r159, i64 %r160)
    %r164 = call i32 @printf(ptr @.r163, i64 %r146)
    br label %l26
l26:
    %r165 = phi i64 [%r141, %l25], [%r141, %l24]
    %r175 = icmp eq i64 %r165, %r173
    %r178 = icmp ne i1 %r175, %r176
    br i1 %r178, label %l27, label %l28
l27:
    %r182 = call i32 @printf(ptr @.r179, i64 %r180)
    br label %l16
l28:
    %r186 = call i32 @printf(ptr @.r183, i64 %r184)
    %r188 = call i32 @printf(ptr @.r187, i64 %r165)
    br label %l16
l16:
    ret void
}
define i64 @_mini_returnint(i64 %r198) {
l30:
    ret i64 %r198
}
define i64 @_mini_returnbool(i64 %r201) {
l32:
    ret i64 %r201
}
define ptr @_mini_returnstruct(ptr %r204) {
l34:
    ret ptr %r204
}
define i64 @_mini_main() {
l37:
    %r224 = alloca i64
	store i64 0, ptr %r224
	%r223 = load i64, ptr %r224
    %r226 = alloca i64
	store i64 1, ptr %r226
	%r225 = load i64, ptr %r226
    %r1566 = alloca i64
	store i64 0, ptr %r1566
	%r1565 = load i64, ptr %r1566
    %r234 = alloca i64
	store i64 0, ptr %r234
	%r233 = load i64, ptr %r234
    %r236 = alloca i1
	store i1 0, ptr %r236
	%r235 = load i1, ptr %r236
    %r240 = alloca i64
	store i64 0, ptr %r240
	%r239 = load i64, ptr %r240
    %r244 = alloca i64
	store i64 1, ptr %r244
	%r243 = load i64, ptr %r244
    %r1568 = alloca i64
	store i64 0, ptr %r1568
	%r1567 = load i64, ptr %r1568
    %r260 = alloca i64
	store i64 0, ptr %r260
	%r259 = load i64, ptr %r260
    %r262 = alloca i1
	store i1 0, ptr %r262
	%r261 = load i1, ptr %r262
    %r266 = alloca i64
	store i64 0, ptr %r266
	%r265 = load i64, ptr %r266
    %r270 = alloca i64
	store i64 1, ptr %r270
	%r269 = load i64, ptr %r270
    %r1570 = alloca i64
	store i64 0, ptr %r1570
	%r1569 = load i64, ptr %r1570
    %r286 = alloca i64
	store i64 0, ptr %r286
	%r285 = load i64, ptr %r286
    %r288 = alloca i1
	store i1 0, ptr %r288
	%r287 = load i1, ptr %r288
    %r292 = alloca i64
	store i64 0, ptr %r292
	%r291 = load i64, ptr %r292
    %r296 = alloca i64
	store i64 1, ptr %r296
	%r295 = load i64, ptr %r296
    %r1572 = alloca i64
	store i64 1, ptr %r1572
	%r1571 = load i64, ptr %r1572
    %r312 = alloca i64
	store i64 0, ptr %r312
	%r311 = load i64, ptr %r312
    %r314 = alloca i1
	store i1 0, ptr %r314
	%r313 = load i1, ptr %r314
    %r318 = alloca i64
	store i64 1, ptr %r318
	%r317 = load i64, ptr %r318
    %r322 = alloca i64
	store i64 0, ptr %r322
	%r321 = load i64, ptr %r322
    %r332 = alloca i64
	store i64 0, ptr %r332
	%r331 = load i64, ptr %r332
    %r334 = alloca i64
	store i64 2, ptr %r334
	%r333 = load i64, ptr %r334
    %r1574 = alloca i64
	store i64 1, ptr %r1574
	%r1573 = load i64, ptr %r1574
    %r342 = alloca i64
	store i64 0, ptr %r342
	%r341 = load i64, ptr %r342
    %r344 = alloca i1
	store i1 0, ptr %r344
	%r343 = load i1, ptr %r344
    %r348 = alloca i64
	store i64 1, ptr %r348
	%r347 = load i64, ptr %r348
    %r352 = alloca i64
	store i64 0, ptr %r352
	%r351 = load i64, ptr %r352
    %r1576 = alloca i64
	store i64 1, ptr %r1576
	%r1575 = load i64, ptr %r1576
    %r368 = alloca i64
	store i64 0, ptr %r368
	%r367 = load i64, ptr %r368
    %r370 = alloca i1
	store i1 0, ptr %r370
	%r369 = load i1, ptr %r370
    %r374 = alloca i64
	store i64 1, ptr %r374
	%r373 = load i64, ptr %r374
    %r378 = alloca i64
	store i64 0, ptr %r378
	%r377 = load i64, ptr %r378
    %r1578 = alloca i64
	store i64 1, ptr %r1578
	%r1577 = load i64, ptr %r1578
    %r394 = alloca i64
	store i64 0, ptr %r394
	%r393 = load i64, ptr %r394
    %r396 = alloca i1
	store i1 0, ptr %r396
	%r395 = load i1, ptr %r396
    %r400 = alloca i64
	store i64 1, ptr %r400
	%r399 = load i64, ptr %r400
    %r404 = alloca i64
	store i64 0, ptr %r404
	%r403 = load i64, ptr %r404
    %r1580 = alloca i64
	store i64 0, ptr %r1580
	%r1579 = load i64, ptr %r1580
    %r420 = alloca i64
	store i64 0, ptr %r420
	%r419 = load i64, ptr %r420
    %r422 = alloca i1
	store i1 0, ptr %r422
	%r421 = load i1, ptr %r422
    %r426 = alloca i64
	store i64 0, ptr %r426
	%r425 = load i64, ptr %r426
    %r430 = alloca i64
	store i64 1, ptr %r430
	%r429 = load i64, ptr %r430
    %r440 = alloca i64
	store i64 3, ptr %r440
	%r439 = load i64, ptr %r440
    %r442 = alloca i64
	store i64 42, ptr %r442
	%r441 = load i64, ptr %r442
    %r444 = alloca i64
	store i64 1, ptr %r444
	%r443 = load i64, ptr %r444
    %r447 = alloca i1
	store i1 0, ptr %r447
	%r446 = load i1, ptr %r447
    %r451 = alloca i64
	store i64 1, ptr %r451
	%r450 = load i64, ptr %r451
    %r455 = alloca i64
	store i64 0, ptr %r455
	%r454 = load i64, ptr %r455
    %r465 = alloca i64
	store i64 42, ptr %r465
	%r464 = load i64, ptr %r465
    %r467 = alloca i64
	store i64 1, ptr %r467
	%r466 = load i64, ptr %r467
    %r470 = alloca i1
	store i1 0, ptr %r470
	%r469 = load i1, ptr %r470
    %r474 = alloca i64
	store i64 1, ptr %r474
	%r473 = load i64, ptr %r474
    %r478 = alloca i64
	store i64 0, ptr %r478
	%r477 = load i64, ptr %r478
    %r488 = alloca i64
	store i64 42, ptr %r488
	%r487 = load i64, ptr %r488
    %r490 = alloca i64
	store i64 1, ptr %r490
	%r489 = load i64, ptr %r490
    %r493 = alloca i1
	store i1 0, ptr %r493
	%r492 = load i1, ptr %r493
    %r497 = alloca i64
	store i64 0, ptr %r497
	%r496 = load i64, ptr %r497
    %r501 = alloca i64
	store i64 1, ptr %r501
	%r500 = load i64, ptr %r501
    %r511 = alloca i64
	store i64 42, ptr %r511
	%r510 = load i64, ptr %r511
    %r513 = alloca i64
	store i64 1, ptr %r513
	%r512 = load i64, ptr %r513
    %r516 = alloca i1
	store i1 0, ptr %r516
	%r515 = load i1, ptr %r516
    %r520 = alloca i64
	store i64 0, ptr %r520
	%r519 = load i64, ptr %r520
    %r524 = alloca i64
	store i64 1, ptr %r524
	%r523 = load i64, ptr %r524
    %r534 = alloca i64
	store i64 42, ptr %r534
	%r533 = load i64, ptr %r534
    %r536 = alloca i64
	store i64 1, ptr %r536
	%r535 = load i64, ptr %r536
    %r539 = alloca i1
	store i1 0, ptr %r539
	%r538 = load i1, ptr %r539
    %r543 = alloca i64
	store i64 0, ptr %r543
	%r542 = load i64, ptr %r543
    %r547 = alloca i64
	store i64 1, ptr %r547
	%r546 = load i64, ptr %r547
    %r557 = alloca i64
	store i64 42, ptr %r557
	%r556 = load i64, ptr %r557
    %r559 = alloca i64
	store i64 1, ptr %r559
	%r558 = load i64, ptr %r559
    %r562 = alloca i1
	store i1 0, ptr %r562
	%r561 = load i1, ptr %r562
    %r566 = alloca i64
	store i64 1, ptr %r566
	%r565 = load i64, ptr %r566
    %r570 = alloca i64
	store i64 0, ptr %r570
	%r569 = load i64, ptr %r570
    %r580 = alloca i64
	store i64 1, ptr %r580
	%r579 = load i64, ptr %r580
    %r582 = alloca i64
	store i64 0, ptr %r582
	%r581 = load i64, ptr %r582
    %r586 = alloca i64
	store i64 1, ptr %r586
	%r585 = load i64, ptr %r586
    %r590 = alloca i64
	store i64 0, ptr %r590
	%r589 = load i64, ptr %r590
    %r600 = alloca i64
	store i64 1, ptr %r600
	%r599 = load i64, ptr %r600
    %r602 = alloca i64
	store i64 0, ptr %r602
	%r601 = load i64, ptr %r602
    %r605 = alloca i1
	store i1 0, ptr %r605
	%r604 = load i1, ptr %r605
    %r609 = alloca i64
	store i64 0, ptr %r609
	%r608 = load i64, ptr %r609
    %r613 = alloca i64
	store i64 1, ptr %r613
	%r612 = load i64, ptr %r613
    %r623 = alloca i64
	store i64 0, ptr %r623
	%r622 = load i64, ptr %r623
    %r625 = alloca i64
	store i64 0, ptr %r625
	%r624 = load i64, ptr %r625
    %r629 = alloca i64
	store i64 0, ptr %r629
	%r628 = load i64, ptr %r629
    %r633 = alloca i64
	store i64 1, ptr %r633
	%r632 = load i64, ptr %r633
    %r643 = alloca i64
	store i64 0, ptr %r643
	%r642 = load i64, ptr %r643
    %r645 = alloca i64
	store i64 0, ptr %r645
	%r644 = load i64, ptr %r645
    %r648 = alloca i1
	store i1 0, ptr %r648
	%r647 = load i1, ptr %r648
    %r652 = alloca i64
	store i64 1, ptr %r652
	%r651 = load i64, ptr %r652
    %r656 = alloca i64
	store i64 0, ptr %r656
	%r655 = load i64, ptr %r656
    %r666 = alloca i64
	store i64 0, ptr %r666
	%r665 = load i64, ptr %r666
    %r668 = alloca i64
	store i64 0, ptr %r668
	%r667 = load i64, ptr %r668
    %r671 = alloca i1
	store i1 0, ptr %r671
	%r670 = load i1, ptr %r671
    %r675 = alloca i64
	store i64 1, ptr %r675
	%r674 = load i64, ptr %r675
    %r679 = alloca i64
	store i64 0, ptr %r679
	%r678 = load i64, ptr %r679
    %r689 = alloca i64
	store i64 4, ptr %r689
	%r688 = load i64, ptr %r689
    %r1582 = alloca i64
	store i64 5, ptr %r1582
	%r1581 = load i64, ptr %r1582
    %r696 = alloca i64
	store i64 5, ptr %r696
	%r695 = load i64, ptr %r696
    %r699 = alloca i1
	store i1 0, ptr %r699
	%r698 = load i1, ptr %r699
    %r703 = alloca i64
	store i64 1, ptr %r703
	%r702 = load i64, ptr %r703
    %r707 = alloca i64
	store i64 0, ptr %r707
	%r706 = load i64, ptr %r707
    %r1584 = alloca i64
	store i64 5, ptr %r1584
	%r1583 = load i64, ptr %r1584
    %r1586 = alloca i64
	store i64 6, ptr %r1586
	%r1585 = load i64, ptr %r1586
    %r729 = alloca i64
	store i64 6, ptr %r729
	%r728 = load i64, ptr %r729
    %r732 = alloca i1
	store i1 0, ptr %r732
	%r731 = load i1, ptr %r732
    %r736 = alloca i64
	store i64 1, ptr %r736
	%r735 = load i64, ptr %r736
    %r740 = alloca i64
	store i64 0, ptr %r740
	%r739 = load i64, ptr %r740
    %r1588 = alloca i64
	store i64 6, ptr %r1588
	%r1587 = load i64, ptr %r1588
    %r1590 = alloca i64
	store i64 1, ptr %r1590
	%r1589 = load i64, ptr %r1590
    %r762 = alloca i64
	store i64 1, ptr %r762
	%r761 = load i64, ptr %r762
    %r765 = alloca i1
	store i1 0, ptr %r765
	%r764 = load i1, ptr %r765
    %r769 = alloca i64
	store i64 1, ptr %r769
	%r768 = load i64, ptr %r769
    %r773 = alloca i64
	store i64 0, ptr %r773
	%r772 = load i64, ptr %r773
    %r1592 = alloca i64
	store i64 1, ptr %r1592
	%r1591 = load i64, ptr %r1592
    %r1594 = alloca i64
	store i64 2, ptr %r1594
	%r1593 = load i64, ptr %r1594
    %r795 = alloca i64
	store i64 2, ptr %r795
	%r794 = load i64, ptr %r795
    %r798 = alloca i1
	store i1 0, ptr %r798
	%r797 = load i1, ptr %r798
    %r802 = alloca i64
	store i64 1, ptr %r802
	%r801 = load i64, ptr %r802
    %r806 = alloca i64
	store i64 0, ptr %r806
	%r805 = load i64, ptr %r806
    %r1596 = alloca i64
	store i64 2, ptr %r1596
	%r1595 = load i64, ptr %r1596
    %r1598 = alloca i64
	store i64 -6, ptr %r1598
	%r1597 = load i64, ptr %r1598
    %r828 = alloca i64
	store i64 0, ptr %r828
	%r827 = load i64, ptr %r828
    %r831 = alloca i1
	store i1 0, ptr %r831
	%r830 = load i1, ptr %r831
    %r835 = alloca i64
	store i64 1, ptr %r835
	%r834 = load i64, ptr %r835
    %r839 = alloca i64
	store i64 0, ptr %r839
	%r838 = load i64, ptr %r839
    %r849 = alloca i64
	store i64 5, ptr %r849
	%r848 = load i64, ptr %r849
    %r851 = alloca i64
	store i64 42, ptr %r851
	%r850 = load i64, ptr %r851
    %r853 = alloca i64
	store i64 42, ptr %r853
	%r852 = load i64, ptr %r853
    %r856 = alloca i1
	store i1 0, ptr %r856
	%r855 = load i1, ptr %r856
    %r860 = alloca i64
	store i64 1, ptr %r860
	%r859 = load i64, ptr %r860
    %r864 = alloca i64
	store i64 0, ptr %r864
	%r863 = load i64, ptr %r864
    %r1600 = alloca i64
	store i64 5, ptr %r1600
	%r1599 = load i64, ptr %r1600
    %r879 = alloca i64
	store i64 5, ptr %r879
	%r878 = load i64, ptr %r879
    %r882 = alloca i1
	store i1 0, ptr %r882
	%r881 = load i1, ptr %r882
    %r886 = alloca i64
	store i64 1, ptr %r886
	%r885 = load i64, ptr %r886
    %r890 = alloca i64
	store i64 0, ptr %r890
	%r889 = load i64, ptr %r890
    %r900 = alloca i64
	store i64 1, ptr %r900
	%r899 = load i64, ptr %r900
    %r902 = alloca i64
	store i64 0, ptr %r902
	%r901 = load i64, ptr %r902
    %r906 = alloca i64
	store i64 1, ptr %r906
	%r905 = load i64, ptr %r906
    %r910 = alloca i64
	store i64 0, ptr %r910
	%r909 = load i64, ptr %r910
    %r920 = alloca i64
	store i64 0, ptr %r920
	%r919 = load i64, ptr %r920
    %r923 = alloca i1
	store i1 0, ptr %r923
	%r922 = load i1, ptr %r923
    %r927 = alloca i64
	store i64 0, ptr %r927
	%r926 = load i64, ptr %r927
    %r931 = alloca i64
	store i64 1, ptr %r931
	%r930 = load i64, ptr %r931
    %r941 = alloca i64
	store i64 0, ptr %r941
	%r940 = load i64, ptr %r941
    %r943 = alloca i64
	store i64 0, ptr %r943
	%r942 = load i64, ptr %r943
    %r947 = alloca i64
	store i64 0, ptr %r947
	%r946 = load i64, ptr %r947
    %r951 = alloca i64
	store i64 1, ptr %r951
	%r950 = load i64, ptr %r951
    %r961 = alloca i64
	store i64 0, ptr %r961
	%r960 = load i64, ptr %r961
    %r964 = alloca i1
	store i1 0, ptr %r964
	%r963 = load i1, ptr %r964
    %r968 = alloca i64
	store i64 1, ptr %r968
	%r967 = load i64, ptr %r968
    %r972 = alloca i64
	store i64 0, ptr %r972
	%r971 = load i64, ptr %r972
    %r982 = alloca i64
	store i64 0, ptr %r982
	%r981 = load i64, ptr %r982
    %r986 = alloca i64
	store i64 0, ptr %r986
	%r985 = load i64, ptr %r986
    %r990 = alloca i64
	store i64 1, ptr %r990
	%r989 = load i64, ptr %r990
    %r1000 = alloca i64
	store i64 6, ptr %r1000
	%r999 = load i64, ptr %r1000
    %r1002 = alloca i64
	store i64 0, ptr %r1002
	%r1001 = load i64, ptr %r1002
    %r1004 = alloca i64
	store i64 5, ptr %r1004
	%r1003 = load i64, ptr %r1004
    %r1008 = alloca i1
	store i1 0, ptr %r1008
	%r1007 = load i1, ptr %r1008
    %r1017 = alloca i64
	store i64 5, ptr %r1017
	%r1016 = load i64, ptr %r1017
    %r1020 = alloca i1
	store i1 0, ptr %r1020
	%r1019 = load i1, ptr %r1020
    %r1024 = alloca i64
	store i64 0, ptr %r1024
	%r1023 = load i64, ptr %r1024
    %r1034 = alloca i64
	store i64 5, ptr %r1034
	%r1033 = load i64, ptr %r1034
    %r1044 = alloca i64
	store i64 5, ptr %r1044
	%r1043 = load i64, ptr %r1044
    %r1048 = alloca i1
	store i1 0, ptr %r1048
	%r1047 = load i1, ptr %r1048
    %r1057 = alloca i64
	store i64 5, ptr %r1057
	%r1056 = load i64, ptr %r1057
    %r1060 = alloca i1
	store i1 0, ptr %r1060
	%r1059 = load i1, ptr %r1060
    %r1064 = alloca i64
	store i64 1, ptr %r1064
	%r1063 = load i64, ptr %r1064
    %r1068 = alloca i64
	store i64 0, ptr %r1068
	%r1067 = load i64, ptr %r1068
    %r1080 = alloca i64
	store i64 7, ptr %r1080
	%r1079 = load i64, ptr %r1080
    %r1082 = alloca i64
	store i64 24, ptr %r1082
	%r1081 = load i64, ptr %r1082
    %r1086 = alloca i64
	store i64 42, ptr %r1086
	%r1085 = load i64, ptr %r1086
    %r1089 = alloca i64
	store i64 1, ptr %r1089
	%r1088 = load i64, ptr %r1089
    %r1094 = alloca i64
	store i64 42, ptr %r1094
	%r1093 = load i64, ptr %r1094
    %r1097 = alloca i1
	store i1 0, ptr %r1097
	%r1096 = load i1, ptr %r1097
    %r1101 = alloca i64
	store i64 1, ptr %r1101
	%r1100 = load i64, ptr %r1101
    %r1105 = alloca i64
	store i64 0, ptr %r1105
	%r1104 = load i64, ptr %r1105
    %r1121 = alloca i64
	store i64 0, ptr %r1121
	%r1120 = load i64, ptr %r1121
    %r1125 = alloca i64
	store i64 1, ptr %r1125
	%r1124 = load i64, ptr %r1125
    %r1129 = alloca i64
	store i64 0, ptr %r1129
	%r1128 = load i64, ptr %r1129
    %r1139 = alloca i64
	store i64 24, ptr %r1139
	%r1138 = load i64, ptr %r1139
    %r1144 = alloca i64
	store i64 13, ptr %r1144
	%r1143 = load i64, ptr %r1144
    %r1149 = alloca i64
	store i64 0, ptr %r1149
	%r1148 = load i64, ptr %r1149
    %r1158 = alloca i64
	store i64 13, ptr %r1158
	%r1157 = load i64, ptr %r1158
    %r1161 = alloca i1
	store i1 0, ptr %r1161
	%r1160 = load i1, ptr %r1161
    %r1165 = alloca i64
	store i64 1, ptr %r1165
	%r1164 = load i64, ptr %r1165
    %r1169 = alloca i64
	store i64 0, ptr %r1169
	%r1168 = load i64, ptr %r1169
    %r1189 = alloca i64
	store i64 0, ptr %r1189
	%r1188 = load i64, ptr %r1189
    %r1192 = alloca i1
	store i1 0, ptr %r1192
	%r1191 = load i1, ptr %r1192
    %r1196 = alloca i64
	store i64 1, ptr %r1196
	%r1195 = load i64, ptr %r1196
    %r1200 = alloca i64
	store i64 0, ptr %r1200
	%r1199 = load i64, ptr %r1200
    %r1211 = alloca i1
	store i1 0, ptr %r1211
	%r1210 = load i1, ptr %r1211
    %r1215 = alloca i64
	store i64 1, ptr %r1215
	%r1214 = load i64, ptr %r1215
    %r1219 = alloca i64
	store i64 0, ptr %r1219
	%r1218 = load i64, ptr %r1219
    %r1232 = alloca i1
	store i1 0, ptr %r1232
	%r1231 = load i1, ptr %r1232
    %r1236 = alloca i64
	store i64 1, ptr %r1236
	%r1235 = load i64, ptr %r1236
    %r1240 = alloca i64
	store i64 0, ptr %r1240
	%r1239 = load i64, ptr %r1240
    %r1254 = alloca i64
	store i64 8, ptr %r1254
	%r1253 = load i64, ptr %r1254
    %r1256 = alloca i64
	store i64 7, ptr %r1256
	%r1255 = load i64, ptr %r1256
    %r1259 = alloca i64
	store i64 7, ptr %r1259
	%r1258 = load i64, ptr %r1259
    %r1262 = alloca i1
	store i1 0, ptr %r1262
	%r1261 = load i1, ptr %r1262
    %r1266 = alloca i64
	store i64 1, ptr %r1266
	%r1265 = load i64, ptr %r1266
    %r1270 = alloca i64
	store i64 0, ptr %r1270
	%r1269 = load i64, ptr %r1270
    %r1283 = alloca i64
	store i64 1, ptr %r1283
	%r1282 = load i64, ptr %r1283
    %r1286 = alloca i64
	store i64 0, ptr %r1286
	%r1285 = load i64, ptr %r1286
    %r1290 = alloca i64
	store i64 1, ptr %r1290
	%r1289 = load i64, ptr %r1290
    %r1294 = alloca i64
	store i64 0, ptr %r1294
	%r1293 = load i64, ptr %r1294
    %r1304 = alloca i64
	store i64 24, ptr %r1304
	%r1303 = load i64, ptr %r1304
    %r1308 = alloca i64
	store i64 34, ptr %r1308
	%r1307 = load i64, ptr %r1308
    %r1312 = alloca i64
	store i64 0, ptr %r1312
	%r1311 = load i64, ptr %r1312
    %r1319 = alloca i64
	store i64 34, ptr %r1319
	%r1318 = load i64, ptr %r1319
    %r1322 = alloca i1
	store i1 0, ptr %r1322
	%r1321 = load i1, ptr %r1322
    %r1326 = alloca i64
	store i64 1, ptr %r1326
	%r1325 = load i64, ptr %r1326
    %r1330 = alloca i64
	store i64 0, ptr %r1330
	%r1329 = load i64, ptr %r1330
    %r1348 = alloca i64
	store i64 0, ptr %r1348
	%r1347 = load i64, ptr %r1348
    %r1351 = alloca i1
	store i1 0, ptr %r1351
	%r1350 = load i1, ptr %r1351
    %r1355 = alloca i64
	store i64 1, ptr %r1355
	%r1354 = load i64, ptr %r1355
    %r1359 = alloca i64
	store i64 0, ptr %r1359
	%r1358 = load i64, ptr %r1359
    %r1369 = alloca i64
	store i64 24, ptr %r1369
	%r1368 = load i64, ptr %r1369
    %r1375 = alloca i64
	store i64 16, ptr %r1375
	%r1374 = load i64, ptr %r1375
    %r1381 = alloca i64
	store i64 1, ptr %r1381
	%r1380 = load i64, ptr %r1381
    %r1392 = alloca i64
	store i64 16, ptr %r1392
	%r1391 = load i64, ptr %r1392
    %r1395 = alloca i1
	store i1 0, ptr %r1395
	%r1394 = load i1, ptr %r1395
    %r1399 = alloca i64
	store i64 1, ptr %r1399
	%r1398 = load i64, ptr %r1399
    %r1403 = alloca i64
	store i64 0, ptr %r1403
	%r1402 = load i64, ptr %r1403
    %r1425 = alloca i64
	store i64 0, ptr %r1425
	%r1424 = load i64, ptr %r1425
    %r1429 = alloca i64
	store i64 1, ptr %r1429
	%r1428 = load i64, ptr %r1429
    %r1433 = alloca i64
	store i64 0, ptr %r1433
	%r1432 = load i64, ptr %r1433
    %r1449 = alloca i64
	store i64 9, ptr %r1449
	%r1448 = load i64, ptr %r1449
    %r1451 = alloca i64
	store i64 24, ptr %r1451
	%r1450 = load i64, ptr %r1451
    %r1455 = alloca i64
	store i64 1, ptr %r1455
	%r1454 = load i64, ptr %r1455
    %r1458 = alloca i64
	store i64 3, ptr %r1458
	%r1457 = load i64, ptr %r1458
    %r1460 = alloca i64
	store i64 1, ptr %r1460
	%r1459 = load i64, ptr %r1460
    %r1463 = alloca i64
	store i64 2, ptr %r1463
	%r1462 = load i64, ptr %r1463
    %r1466 = alloca i64
	store i64 1, ptr %r1466
	%r1465 = load i64, ptr %r1466
    %r1468 = alloca i64
	store i64 2, ptr %r1468
	%r1467 = load i64, ptr %r1468
    %r1470 = alloca i64
	store i64 3, ptr %r1470
	%r1469 = load i64, ptr %r1470
    %r1472 = alloca i64
	store i64 4, ptr %r1472
	%r1471 = load i64, ptr %r1472
    %r1474 = alloca i64
	store i64 5, ptr %r1474
	%r1473 = load i64, ptr %r1474
    %r1476 = alloca i64
	store i64 6, ptr %r1476
	%r1475 = load i64, ptr %r1476
    %r1478 = alloca i64
	store i64 7, ptr %r1478
	%r1477 = load i64, ptr %r1478
    %r1480 = alloca i64
	store i64 8, ptr %r1480
	%r1479 = load i64, ptr %r1480
    %r1483 = alloca i64
	store i64 3, ptr %r1483
	%r1482 = load i64, ptr %r1483
    %r1486 = alloca i64
	store i64 3, ptr %r1486
	%r1485 = load i64, ptr %r1486
    %r1489 = alloca i64
	store i64 3, ptr %r1489
	%r1488 = load i64, ptr %r1489
    %r1492 = alloca i1
	store i1 0, ptr %r1492
	%r1491 = load i1, ptr %r1492
    %r1496 = alloca i64
	store i64 1, ptr %r1496
	%r1495 = load i64, ptr %r1496
    %r1500 = alloca i64
	store i64 0, ptr %r1500
	%r1499 = load i64, ptr %r1500
    %r1512 = alloca i64
	store i64 1, ptr %r1512
	%r1511 = load i64, ptr %r1512
    %r1515 = alloca i64
	store i64 0, ptr %r1515
	%r1514 = load i64, ptr %r1515
    %r1519 = alloca i64
	store i64 1, ptr %r1519
	%r1518 = load i64, ptr %r1519
    %r1523 = alloca i64
	store i64 0, ptr %r1523
	%r1522 = load i64, ptr %r1523
    %r1533 = alloca i64
	store i64 24, ptr %r1533
	%r1532 = load i64, ptr %r1533
    %r1539 = alloca i1
	store i1 0, ptr %r1539
	%r1538 = load i1, ptr %r1539
    %r1543 = alloca i64
	store i64 1, ptr %r1543
	%r1542 = load i64, ptr %r1543
    %r1547 = alloca i64
	store i64 0, ptr %r1547
	%r1546 = load i64, ptr %r1547
    %r1557 = alloca i64
	store i64 10, ptr %r1557
	%r1556 = load i64, ptr %r1557
    %r1559 = alloca i64
	store i64 0, ptr %r1559
	%r1558 = load i64, ptr %r1559
    store i64 %r223, ptr @.r7
    call void @_mini_printgroup(i64 %r225)
    %r232 = icmp ne i64 %r1565, %r233
    %r237 = icmp ne i1 %r232, %r235
    br i1 %r237, label %l38, label %l39
l38:
    %r241 = call i32 @printf(ptr @.r238, i64 %r239)
    br label %l40
l39:
    %r245 = call i32 @printf(ptr @.r242, i64 %r243)
    br label %l40
l40:
    %r258 = icmp ne i64 %r1567, %r259
    %r263 = icmp ne i1 %r258, %r261
    br i1 %r263, label %l41, label %l42
l41:
    %r267 = call i32 @printf(ptr @.r264, i64 %r265)
    br label %l43
l42:
    %r271 = call i32 @printf(ptr @.r268, i64 %r269)
    br label %l43
l43:
    %r284 = icmp ne i64 %r1569, %r285
    %r289 = icmp ne i1 %r284, %r287
    br i1 %r289, label %l44, label %l45
l44:
    %r293 = call i32 @printf(ptr @.r290, i64 %r291)
    br label %l46
l45:
    %r297 = call i32 @printf(ptr @.r294, i64 %r295)
    br label %l46
l46:
    %r310 = icmp ne i64 %r1571, %r311
    %r315 = icmp ne i1 %r310, %r313
    br i1 %r315, label %l47, label %l48
l47:
    %r319 = call i32 @printf(ptr @.r316, i64 %r317)
    br label %l49
l48:
    %r323 = call i32 @printf(ptr @.r320, i64 %r321)
    br label %l49
l49:
    store i64 %r331, ptr @.r7
    call void @_mini_printgroup(i64 %r333)
    %r340 = icmp ne i64 %r1573, %r341
    %r345 = icmp ne i1 %r340, %r343
    br i1 %r345, label %l50, label %l51
l50:
    %r349 = call i32 @printf(ptr @.r346, i64 %r347)
    br label %l52
l51:
    %r353 = call i32 @printf(ptr @.r350, i64 %r351)
    br label %l52
l52:
    %r366 = icmp ne i64 %r1575, %r367
    %r371 = icmp ne i1 %r366, %r369
    br i1 %r371, label %l53, label %l54
l53:
    %r375 = call i32 @printf(ptr @.r372, i64 %r373)
    br label %l55
l54:
    %r379 = call i32 @printf(ptr @.r376, i64 %r377)
    br label %l55
l55:
    %r392 = icmp ne i64 %r1577, %r393
    %r397 = icmp ne i1 %r392, %r395
    br i1 %r397, label %l56, label %l57
l56:
    %r401 = call i32 @printf(ptr @.r398, i64 %r399)
    br label %l58
l57:
    %r405 = call i32 @printf(ptr @.r402, i64 %r403)
    br label %l58
l58:
    %r418 = icmp ne i64 %r1579, %r419
    %r423 = icmp ne i1 %r418, %r421
    br i1 %r423, label %l59, label %l60
l59:
    %r427 = call i32 @printf(ptr @.r424, i64 %r425)
    br label %l61
l60:
    %r431 = call i32 @printf(ptr @.r428, i64 %r429)
    br label %l61
l61:
    call void @_mini_printgroup(i64 %r439)
    %r445 = icmp sgt i64 %r441, %r443
    %r448 = icmp ne i1 %r445, %r446
    br i1 %r448, label %l62, label %l63
l62:
    %r452 = call i32 @printf(ptr @.r449, i64 %r450)
    br label %l64
l63:
    %r456 = call i32 @printf(ptr @.r453, i64 %r454)
    br label %l64
l64:
    %r468 = icmp sge i64 %r464, %r466
    %r471 = icmp ne i1 %r468, %r469
    br i1 %r471, label %l65, label %l66
l65:
    %r475 = call i32 @printf(ptr @.r472, i64 %r473)
    br label %l67
l66:
    %r479 = call i32 @printf(ptr @.r476, i64 %r477)
    br label %l67
l67:
    %r491 = icmp slt i64 %r487, %r489
    %r494 = icmp ne i1 %r491, %r492
    br i1 %r494, label %l68, label %l69
l68:
    %r498 = call i32 @printf(ptr @.r495, i64 %r496)
    br label %l70
l69:
    %r502 = call i32 @printf(ptr @.r499, i64 %r500)
    br label %l70
l70:
    %r514 = icmp sle i64 %r510, %r512
    %r517 = icmp ne i1 %r514, %r515
    br i1 %r517, label %l71, label %l72
l71:
    %r521 = call i32 @printf(ptr @.r518, i64 %r519)
    br label %l73
l72:
    %r525 = call i32 @printf(ptr @.r522, i64 %r523)
    br label %l73
l73:
    %r537 = icmp eq i64 %r533, %r535
    %r540 = icmp ne i1 %r537, %r538
    br i1 %r540, label %l74, label %l75
l74:
    %r544 = call i32 @printf(ptr @.r541, i64 %r542)
    br label %l76
l75:
    %r548 = call i32 @printf(ptr @.r545, i64 %r546)
    br label %l76
l76:
    %r560 = icmp ne i64 %r556, %r558
    %r563 = icmp ne i1 %r560, %r561
    br i1 %r563, label %l77, label %l78
l77:
    %r567 = call i32 @printf(ptr @.r564, i64 %r565)
    br label %l79
l78:
    %r571 = call i32 @printf(ptr @.r568, i64 %r569)
    br label %l79
l79:
    %r583 = icmp ne i64 %r579, %r581
    br i1 %r583, label %l80, label %l81
l80:
    %r587 = call i32 @printf(ptr @.r584, i64 %r585)
    br label %l82
l81:
    %r591 = call i32 @printf(ptr @.r588, i64 %r589)
    br label %l82
l82:
    %r603 = icmp eq i64 %r599, %r601
    %r606 = icmp ne i1 %r603, %r604
    br i1 %r606, label %l83, label %l84
l83:
    %r610 = call i32 @printf(ptr @.r607, i64 %r608)
    br label %l85
l84:
    %r614 = call i32 @printf(ptr @.r611, i64 %r612)
    br label %l85
l85:
    %r626 = icmp ne i64 %r622, %r624
    br i1 %r626, label %l86, label %l87
l86:
    %r630 = call i32 @printf(ptr @.r627, i64 %r628)
    br label %l88
l87:
    %r634 = call i32 @printf(ptr @.r631, i64 %r632)
    br label %l88
l88:
    %r646 = icmp eq i64 %r642, %r644
    %r649 = icmp ne i1 %r646, %r647
    br i1 %r649, label %l89, label %l90
l89:
    %r653 = call i32 @printf(ptr @.r650, i64 %r651)
    br label %l91
l90:
    %r657 = call i32 @printf(ptr @.r654, i64 %r655)
    br label %l91
l91:
    %r669 = icmp eq i64 %r665, %r667
    %r672 = icmp ne i1 %r669, %r670
    br i1 %r672, label %l92, label %l93
l92:
    %r676 = call i32 @printf(ptr @.r673, i64 %r674)
    br label %l94
l93:
    %r680 = call i32 @printf(ptr @.r677, i64 %r678)
    br label %l94
l94:
    call void @_mini_printgroup(i64 %r688)
    %r697 = icmp eq i64 %r1581, %r695
    %r700 = icmp ne i1 %r697, %r698
    br i1 %r700, label %l95, label %l96
l95:
    %r704 = call i32 @printf(ptr @.r701, i64 %r702)
    br label %l97
l96:
    %r708 = call i32 @printf(ptr @.r705, i64 %r706)
    %r715 = call i32 @printf(ptr @.r709, i64 %r1583)
    br label %l97
l97:
    %r730 = icmp eq i64 %r1585, %r728
    %r733 = icmp ne i1 %r730, %r731
    br i1 %r733, label %l98, label %l99
l98:
    %r737 = call i32 @printf(ptr @.r734, i64 %r735)
    br label %l100
l99:
    %r741 = call i32 @printf(ptr @.r738, i64 %r739)
    %r748 = call i32 @printf(ptr @.r742, i64 %r1587)
    br label %l100
l100:
    %r763 = icmp eq i64 %r1589, %r761
    %r766 = icmp ne i1 %r763, %r764
    br i1 %r766, label %l101, label %l102
l101:
    %r770 = call i32 @printf(ptr @.r767, i64 %r768)
    br label %l103
l102:
    %r774 = call i32 @printf(ptr @.r771, i64 %r772)
    %r781 = call i32 @printf(ptr @.r775, i64 %r1591)
    br label %l103
l103:
    %r796 = icmp eq i64 %r1593, %r794
    %r799 = icmp ne i1 %r796, %r797
    br i1 %r799, label %l104, label %l105
l104:
    %r803 = call i32 @printf(ptr @.r800, i64 %r801)
    br label %l106
l105:
    %r807 = call i32 @printf(ptr @.r804, i64 %r805)
    %r814 = call i32 @printf(ptr @.r808, i64 %r1595)
    br label %l106
l106:
    %r829 = icmp slt i64 %r1597, %r827
    %r832 = icmp ne i1 %r829, %r830
    br i1 %r832, label %l107, label %l108
l107:
    %r836 = call i32 @printf(ptr @.r833, i64 %r834)
    br label %l109
l108:
    %r840 = call i32 @printf(ptr @.r837, i64 %r838)
    br label %l109
l109:
    call void @_mini_printgroup(i64 %r848)
    %r854 = icmp eq i64 %r850, %r852
    %r857 = icmp ne i1 %r854, %r855
    br i1 %r857, label %l110, label %l111
l110:
    %r861 = call i32 @printf(ptr @.r858, i64 %r859)
    br label %l112
l111:
    %r865 = call i32 @printf(ptr @.r862, i64 %r863)
    br label %l112
l112:
    %r880 = icmp eq i64 %r1599, %r878
    %r883 = icmp ne i1 %r880, %r881
    br i1 %r883, label %l113, label %l114
l113:
    %r887 = call i32 @printf(ptr @.r884, i64 %r885)
    br label %l115
l114:
    %r891 = call i32 @printf(ptr @.r888, i64 %r889)
    br label %l115
l115:
    %r903 = icmp ne i64 %r899, %r901
    br i1 %r903, label %l116, label %l117
l116:
    %r907 = call i32 @printf(ptr @.r904, i64 %r905)
    br label %l118
l117:
    %r911 = call i32 @printf(ptr @.r908, i64 %r909)
    br label %l118
l118:
    %r916 = phi i64 [%r899, %l116], [%r899, %l117]
    %r921 = icmp eq i64 %r916, %r919
    %r924 = icmp ne i1 %r921, %r922
    br i1 %r924, label %l119, label %l120
l119:
    %r928 = call i32 @printf(ptr @.r925, i64 %r926)
    br label %l121
l120:
    %r932 = call i32 @printf(ptr @.r929, i64 %r930)
    br label %l121
l121:
    %r944 = icmp ne i64 %r940, %r942
    br i1 %r944, label %l122, label %l123
l122:
    %r948 = call i32 @printf(ptr @.r945, i64 %r946)
    br label %l124
l123:
    %r952 = call i32 @printf(ptr @.r949, i64 %r950)
    br label %l124
l124:
    %r957 = phi i64 [%r940, %l122], [%r940, %l123]
    %r962 = icmp eq i64 %r957, %r960
    %r965 = icmp ne i1 %r962, %r963
    br i1 %r965, label %l125, label %l126
l125:
    %r969 = call i32 @printf(ptr @.r966, i64 %r967)
    br label %l127
l126:
    %r973 = call i32 @printf(ptr @.r970, i64 %r971)
    br label %l127
l127:
    %r978 = phi i64 [%r957, %l125], [%r957, %l126]
    %r983 = icmp ne i64 %r978, %r981
    br i1 %r983, label %l128, label %l129
l128:
    %r987 = call i32 @printf(ptr @.r984, i64 %r985)
    br label %l130
l129:
    %r991 = call i32 @printf(ptr @.r988, i64 %r989)
    br label %l130
l130:
    call void @_mini_printgroup(i64 %r999)
    %r1005 = icmp slt i64 %r1001, %r1003
    %r1006 = icmp ne i1 %r1005, %r1007
    br i1 %r1006, label %l131, label %l133
l131:
    %r1011 = phi i64 [%r1035, %l136], [%r1001, %l130]
    %r1018 = icmp sge i64 %r1011, %r1016
    %r1021 = icmp ne i1 %r1018, %r1019
    br i1 %r1021, label %l134, label %l136
l134:
    %r1025 = call i32 @printf(ptr @.r1022, i64 %r1023)
    br label %l136
l136:
    %r1028 = phi i64 [%r1011, %l134], [%r1011, %l131]
    %r1035 = add i64 %r1028, %r1033
    %r1045 = icmp slt i64 %r1035, %r1043
    %r1046 = icmp ne i1 %r1045, %r1047
    br i1 %r1046, label %l131, label %l133
l133:
    %r1051 = phi i64 [%r1035, %l136], [%r1001, %l130]
    %r1058 = icmp eq i64 %r1051, %r1056
    %r1061 = icmp ne i1 %r1058, %r1059
    br i1 %r1061, label %l137, label %l138
l137:
    %r1065 = call i32 @printf(ptr @.r1062, i64 %r1063)
    br label %l139
l138:
    %r1069 = call i32 @printf(ptr @.r1066, i64 %r1067)
    %r1071 = call i32 @printf(ptr @.r1070, i64 %r1051)
    br label %l139
l139:
    call void @_mini_printgroup(i64 %r1079)
    %r1083 = call ptr @malloc(i64 %r1081)
    %r1084 = bitcast ptr %r1083 to %struct._mini_thing*
    %r1087 = getelementptr inbounds %struct._mini_thing, ptr %r1084, i32 0, i32 0
    store i64 %r1085, ptr %r1087
    %r1090 = getelementptr inbounds %struct._mini_thing, ptr %r1084, i32 0, i32 1
    store i64 %r1088, ptr %r1090
    %r1091 = getelementptr inbounds %struct._mini_thing, ptr %r1084, i32 0, i32 0
    %r1092 = load i64, ptr %r1091
    %r1095 = icmp eq i64 %r1092, %r1093
    %r1098 = icmp ne i1 %r1095, %r1096
    br i1 %r1098, label %l140, label %l141
l140:
    %r1102 = call i32 @printf(ptr @.r1099, i64 %r1100)
    br label %l142
l141:
    %r1106 = call i32 @printf(ptr @.r1103, i64 %r1104)
    %r1108 = getelementptr inbounds %struct._mini_thing, ptr %r1084, i32 0, i32 0
    %r1109 = load i64, ptr %r1108
    %r1110 = call i32 @printf(ptr @.r1107, i64 %r1109)
    br label %l142
l142:
    %r1114 = phi ptr [%r1084, %l141], [%r1084, %l140]
    %r1118 = getelementptr inbounds %struct._mini_thing, ptr %r1114, i32 0, i32 1
    %r1119 = load i64, ptr %r1118
    %r1122 = icmp ne i64 %r1119, %r1120
    br i1 %r1122, label %l143, label %l144
l143:
    %r1126 = call i32 @printf(ptr @.r1123, i64 %r1124)
    br label %l145
l144:
    %r1130 = call i32 @printf(ptr @.r1127, i64 %r1128)
    br label %l145
l145:
    %r1134 = phi ptr [%r1114, %l144], [%r1114, %l143]
    %r1140 = call ptr @malloc(i64 %r1138)
    %r1141 = getelementptr inbounds %struct._mini_thing, ptr %r1134, i32 0, i32 2
    %r1142 = bitcast ptr %r1140 to %struct._mini_thing*
    store ptr %r1142, ptr %r1141
    %r1145 = getelementptr inbounds %struct._mini_thing, ptr %r1134, i32 0, i32 2
    %r1146 = load ptr, ptr %r1145
    %r1147 = getelementptr inbounds %struct._mini_thing, ptr %r1146, i32 0, i32 0
    store i64 %r1143, ptr %r1147
    %r1150 = getelementptr inbounds %struct._mini_thing, ptr %r1134, i32 0, i32 2
    %r1151 = load ptr, ptr %r1150
    %r1152 = getelementptr inbounds %struct._mini_thing, ptr %r1151, i32 0, i32 1
    store i64 %r1148, ptr %r1152
    %r1153 = getelementptr inbounds %struct._mini_thing, ptr %r1134, i32 0, i32 2
    %r1154 = load ptr, ptr %r1153
    %r1155 = getelementptr inbounds %struct._mini_thing, ptr %r1154, i32 0, i32 0
    %r1156 = load i64, ptr %r1155
    %r1159 = icmp eq i64 %r1156, %r1157
    %r1162 = icmp ne i1 %r1159, %r1160
    br i1 %r1162, label %l146, label %l147
l146:
    %r1166 = call i32 @printf(ptr @.r1163, i64 %r1164)
    br label %l148
l147:
    %r1170 = call i32 @printf(ptr @.r1167, i64 %r1168)
    %r1172 = getelementptr inbounds %struct._mini_thing, ptr %r1134, i32 0, i32 2
    %r1173 = load ptr, ptr %r1172
    %r1174 = getelementptr inbounds %struct._mini_thing, ptr %r1173, i32 0, i32 0
    %r1175 = load i64, ptr %r1174
    %r1176 = call i32 @printf(ptr @.r1171, i64 %r1175)
    br label %l148
l148:
    %r1180 = phi ptr [%r1134, %l146], [%r1134, %l147]
    %r1184 = getelementptr inbounds %struct._mini_thing, ptr %r1180, i32 0, i32 2
    %r1185 = load ptr, ptr %r1184
    %r1186 = getelementptr inbounds %struct._mini_thing, ptr %r1185, i32 0, i32 1
    %r1187 = load i64, ptr %r1186
    %r1190 = icmp eq i64 %r1187, %r1188
    %r1193 = icmp ne i1 %r1190, %r1191
    br i1 %r1193, label %l149, label %l150
l149:
    %r1197 = call i32 @printf(ptr @.r1194, i64 %r1195)
    br label %l151
l150:
    %r1201 = call i32 @printf(ptr @.r1198, i64 %r1199)
    br label %l151
l151:
    %r1205 = phi ptr [%r1180, %l149], [%r1180, %l150]
    %r1209 = icmp eq ptr %r1205, %r1205
    %r1212 = icmp ne i1 %r1209, %r1210
    br i1 %r1212, label %l152, label %l153
l152:
    %r1216 = call i32 @printf(ptr @.r1213, i64 %r1214)
    br label %l154
l153:
    %r1220 = call i32 @printf(ptr @.r1217, i64 %r1218)
    br label %l154
l154:
    %r1224 = phi ptr [%r1205, %l152], [%r1205, %l153]
    %r1228 = getelementptr inbounds %struct._mini_thing, ptr %r1224, i32 0, i32 2
    %r1229 = load ptr, ptr %r1228
    %r1230 = icmp ne ptr %r1224, %r1229
    %r1233 = icmp ne i1 %r1230, %r1231
    br i1 %r1233, label %l155, label %l156
l155:
    %r1237 = call i32 @printf(ptr @.r1234, i64 %r1235)
    br label %l157
l156:
    %r1241 = call i32 @printf(ptr @.r1238, i64 %r1239)
    br label %l157
l157:
    %r1245 = phi ptr [%r1224, %l155], [%r1224, %l156]
    %r1249 = getelementptr inbounds %struct._mini_thing, ptr %r1245, i32 0, i32 2
    %r1250 = load ptr, ptr %r1249
    %r1251 = bitcast ptr %r1250 to i8*
    call void @free(ptr %r1251)
    %r1252 = bitcast ptr %r1245 to i8*
    call void @free(ptr %r1252)
    call void @_mini_printgroup(i64 %r1253)
    store i64 %r1255, ptr @.r4
    %r1257 = load i64, ptr @.r4
    %r1260 = icmp eq i64 %r1257, %r1258
    %r1263 = icmp ne i1 %r1260, %r1261
    br i1 %r1263, label %l158, label %l159
l158:
    %r1267 = call i32 @printf(ptr @.r1264, i64 %r1265)
    br label %l160
l159:
    %r1271 = call i32 @printf(ptr @.r1268, i64 %r1269)
    %r1273 = load i64, ptr @.r4
    %r1274 = call i32 @printf(ptr @.r1272, i64 %r1273)
    br label %l160
l160:
    store i64 %r1282, ptr @.r5
    %r1284 = load i64, ptr @.r5
    %r1287 = icmp ne i64 %r1284, %r1285
    br i1 %r1287, label %l161, label %l162
l161:
    %r1291 = call i32 @printf(ptr @.r1288, i64 %r1289)
    br label %l163
l162:
    %r1295 = call i32 @printf(ptr @.r1292, i64 %r1293)
    br label %l163
l163:
    %r1305 = call ptr @malloc(i64 %r1303)
    %r1306 = bitcast ptr %r1305 to %struct._mini_thing*
    store ptr %r1306, ptr @.r6
    %r1309 = load ptr, ptr @.r6
    %r1310 = getelementptr inbounds %struct._mini_thing, ptr %r1309, i32 0, i32 0
    store i64 %r1307, ptr %r1310
    %r1313 = load ptr, ptr @.r6
    %r1314 = getelementptr inbounds %struct._mini_thing, ptr %r1313, i32 0, i32 1
    store i64 %r1311, ptr %r1314
    %r1315 = load ptr, ptr @.r6
    %r1316 = getelementptr inbounds %struct._mini_thing, ptr %r1315, i32 0, i32 0
    %r1317 = load i64, ptr %r1316
    %r1320 = icmp eq i64 %r1317, %r1318
    %r1323 = icmp ne i1 %r1320, %r1321
    br i1 %r1323, label %l164, label %l165
l164:
    %r1327 = call i32 @printf(ptr @.r1324, i64 %r1325)
    br label %l166
l165:
    %r1331 = call i32 @printf(ptr @.r1328, i64 %r1329)
    %r1333 = load ptr, ptr @.r6
    %r1334 = getelementptr inbounds %struct._mini_thing, ptr %r1333, i32 0, i32 0
    %r1335 = load i64, ptr %r1334
    %r1336 = call i32 @printf(ptr @.r1332, i64 %r1335)
    br label %l166
l166:
    %r1344 = load ptr, ptr @.r6
    %r1345 = getelementptr inbounds %struct._mini_thing, ptr %r1344, i32 0, i32 1
    %r1346 = load i64, ptr %r1345
    %r1349 = icmp eq i64 %r1346, %r1347
    %r1352 = icmp ne i1 %r1349, %r1350
    br i1 %r1352, label %l167, label %l168
l167:
    %r1356 = call i32 @printf(ptr @.r1353, i64 %r1354)
    br label %l169
l168:
    %r1360 = call i32 @printf(ptr @.r1357, i64 %r1358)
    br label %l169
l169:
    %r1370 = call ptr @malloc(i64 %r1368)
    %r1371 = load ptr, ptr @.r6
    %r1372 = getelementptr inbounds %struct._mini_thing, ptr %r1371, i32 0, i32 2
    %r1373 = bitcast ptr %r1370 to %struct._mini_thing*
    store ptr %r1373, ptr %r1372
    %r1376 = load ptr, ptr @.r6
    %r1377 = getelementptr inbounds %struct._mini_thing, ptr %r1376, i32 0, i32 2
    %r1378 = load ptr, ptr %r1377
    %r1379 = getelementptr inbounds %struct._mini_thing, ptr %r1378, i32 0, i32 0
    store i64 %r1374, ptr %r1379
    %r1382 = load ptr, ptr @.r6
    %r1383 = getelementptr inbounds %struct._mini_thing, ptr %r1382, i32 0, i32 2
    %r1384 = load ptr, ptr %r1383
    %r1385 = getelementptr inbounds %struct._mini_thing, ptr %r1384, i32 0, i32 1
    store i64 %r1380, ptr %r1385
    %r1386 = load ptr, ptr @.r6
    %r1387 = getelementptr inbounds %struct._mini_thing, ptr %r1386, i32 0, i32 2
    %r1388 = load ptr, ptr %r1387
    %r1389 = getelementptr inbounds %struct._mini_thing, ptr %r1388, i32 0, i32 0
    %r1390 = load i64, ptr %r1389
    %r1393 = icmp eq i64 %r1390, %r1391
    %r1396 = icmp ne i1 %r1393, %r1394
    br i1 %r1396, label %l170, label %l171
l170:
    %r1400 = call i32 @printf(ptr @.r1397, i64 %r1398)
    br label %l172
l171:
    %r1404 = call i32 @printf(ptr @.r1401, i64 %r1402)
    %r1406 = load ptr, ptr @.r6
    %r1407 = getelementptr inbounds %struct._mini_thing, ptr %r1406, i32 0, i32 2
    %r1408 = load ptr, ptr %r1407
    %r1409 = getelementptr inbounds %struct._mini_thing, ptr %r1408, i32 0, i32 0
    %r1410 = load i64, ptr %r1409
    %r1411 = call i32 @printf(ptr @.r1405, i64 %r1410)
    br label %l172
l172:
    %r1419 = load ptr, ptr @.r6
    %r1420 = getelementptr inbounds %struct._mini_thing, ptr %r1419, i32 0, i32 2
    %r1421 = load ptr, ptr %r1420
    %r1422 = getelementptr inbounds %struct._mini_thing, ptr %r1421, i32 0, i32 1
    %r1423 = load i64, ptr %r1422
    %r1426 = icmp ne i64 %r1423, %r1424
    br i1 %r1426, label %l173, label %l174
l173:
    %r1430 = call i32 @printf(ptr @.r1427, i64 %r1428)
    br label %l175
l174:
    %r1434 = call i32 @printf(ptr @.r1431, i64 %r1432)
    br label %l175
l175:
    %r1442 = load ptr, ptr @.r6
    %r1443 = getelementptr inbounds %struct._mini_thing, ptr %r1442, i32 0, i32 2
    %r1444 = load ptr, ptr %r1443
    %r1445 = bitcast ptr %r1444 to i8*
    call void @free(ptr %r1445)
    %r1446 = load ptr, ptr @.r6
    %r1447 = bitcast ptr %r1446 to i8*
    call void @free(ptr %r1447)
    call void @_mini_printgroup(i64 %r1448)
    %r1452 = call ptr @malloc(i64 %r1450)
    %r1453 = bitcast ptr %r1452 to %struct._mini_thing*
    %r1456 = getelementptr inbounds %struct._mini_thing, ptr %r1453, i32 0, i32 1
    store i64 %r1454, ptr %r1456
    call void @_mini_takealltypes(i64 %r1457, i64 %r1459, ptr %r1453)
    %r1464 = call i32 @printf(ptr @.r1461, i64 %r1462)
    call void @_mini_tonofargs(i64 %r1465, i64 %r1467, i64 %r1469, i64 %r1471, i64 %r1473, i64 %r1475, i64 %r1477, i64 %r1479)
    %r1484 = call i32 @printf(ptr @.r1481, i64 %r1482)
    %r1487 = call i64 @_mini_returnint(i64 %r1485)
    %r1490 = icmp eq i64 %r1487, %r1488
    %r1493 = icmp ne i1 %r1490, %r1491
    br i1 %r1493, label %l176, label %l177
l176:
    %r1497 = call i32 @printf(ptr @.r1494, i64 %r1495)
    br label %l178
l177:
    %r1501 = call i32 @printf(ptr @.r1498, i64 %r1499)
    %r1503 = call i32 @printf(ptr @.r1502, i64 %r1487)
    br label %l178
l178:
    %r1513 = call i64 @_mini_returnbool(i64 %r1511)
    %r1516 = icmp ne i64 %r1513, %r1514
    br i1 %r1516, label %l179, label %l180
l179:
    %r1520 = call i32 @printf(ptr @.r1517, i64 %r1518)
    br label %l181
l180:
    %r1524 = call i32 @printf(ptr @.r1521, i64 %r1522)
    br label %l181
l181:
    %r1534 = call ptr @malloc(i64 %r1532)
    %r1535 = bitcast ptr %r1534 to %struct._mini_thing*
    %r1536 = call ptr @_mini_returnstruct(ptr %r1535)
    %r1537 = icmp eq ptr %r1535, %r1536
    %r1540 = icmp ne i1 %r1537, %r1538
    br i1 %r1540, label %l182, label %l183
l182:
    %r1544 = call i32 @printf(ptr @.r1541, i64 %r1542)
    br label %l184
l183:
    %r1548 = call i32 @printf(ptr @.r1545, i64 %r1546)
    br label %l184
l184:
    call void @_mini_printgroup(i64 %r1556)
    ret i64 %r1558
}
define i32 @main() {
l186:
    %r1562 = call i64 @_mini_main()
    %r1563 = trunc i64 %r1562 to i32
    ret i32 %r1563
}
