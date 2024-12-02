%struct._mini_myCopy = type {
    i64
}

%struct._mini_tnode = type {
    i64,
    ptr,
    ptr
}

%struct._mini_node = type {
    i64,
    ptr
}

%struct._mini_i = type {
    i64
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global i64 zeroinitializer
@.r5 = global i64 zeroinitializer
@.r6 = global ptr zeroinitializer






@.r114 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r132 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"






@.r349 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r356 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r363 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r377 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"


@.r464 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"


@.r550 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r558 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r566 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r573 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r578 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r585 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r590 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r597 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r605 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r612 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r617 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r624 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r629 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r636 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r641 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r648 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r653 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r660 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r665 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r672 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r677 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r684 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r692 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r699 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r704 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r711 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r716 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r723 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r728 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r735 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r740 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"


@.r808 = private unnamed_addr constant [4 x i8] c"%ld\00"

define ptr @_mini_concatLists(ptr %r8, ptr %r9) {
l2:
    %r14 = alloca ptr
	store ptr null, ptr %r14
	%r13 = load ptr, ptr %r14
    %r18 = alloca i1
	store i1 0, ptr %r18
	%r17 = load i1, ptr %r18
    %r23 = alloca ptr
	store ptr null, ptr %r23
	%r22 = load ptr, ptr %r23
    %r28 = alloca i1
	store i1 0, ptr %r28
	%r27 = load i1, ptr %r28
    %r40 = alloca ptr
	store ptr null, ptr %r40
	%r39 = load ptr, ptr %r40
    %r45 = alloca i1
	store i1 0, ptr %r45
	%r44 = load i1, ptr %r45
    %r15 = bitcast ptr %r13 to %struct._mini_node*
    %r16 = icmp eq ptr %r8, %r15
    %r19 = icmp ne i1 %r16, %r17
    br i1 %r19, label %l1, label %l5
l5:
    %r20 = getelementptr inbounds %struct._mini_node, ptr %r8, i32 0, i32 1
    %r21 = load ptr, ptr %r20
    %r24 = bitcast ptr %r22 to %struct._mini_node*
    %r25 = icmp ne ptr %r21, %r24
    %r26 = icmp ne i1 %r25, %r27
    br i1 %r26, label %l6, label %l8
l6:
    %r29 = phi ptr [%r29, %l6], [%r9, %l5]
    %r30 = phi ptr [%r33, %l6], [%r8, %l5]
    %r31 = phi ptr [%r31, %l6], [%r8, %l5]
    %r32 = getelementptr inbounds %struct._mini_node, ptr %r30, i32 0, i32 1
    %r33 = load ptr, ptr %r32
    %r37 = getelementptr inbounds %struct._mini_node, ptr %r33, i32 0, i32 1
    %r38 = load ptr, ptr %r37
    %r41 = bitcast ptr %r39 to %struct._mini_node*
    %r42 = icmp ne ptr %r38, %r41
    %r43 = icmp ne i1 %r42, %r44
    br i1 %r43, label %l6, label %l8
l8:
    %r46 = phi ptr [%r29, %l6], [%r9, %l5]
    %r47 = phi ptr [%r33, %l6], [%r8, %l5]
    %r48 = phi ptr [%r31, %l6], [%r8, %l5]
    %r49 = getelementptr inbounds %struct._mini_node, ptr %r47, i32 0, i32 1
    store ptr %r46, ptr %r49
    br label %l1
l1:
    %r50 = phi ptr [%r9, %l2], [%r48, %l8]
    ret ptr %r50
}
define ptr @_mini_add(ptr %r52, i64 %r53) {
l10:
    %r58 = alloca i64
	store i64 16, ptr %r58
	%r57 = load i64, ptr %r58
    %r59 = call ptr @malloc(i64 %r57)
    %r60 = bitcast ptr %r59 to %struct._mini_node*
    %r61 = getelementptr inbounds %struct._mini_node, ptr %r60, i32 0, i32 0
    store i64 %r53, ptr %r61
    %r62 = getelementptr inbounds %struct._mini_node, ptr %r60, i32 0, i32 1
    store ptr %r52, ptr %r62
    ret ptr %r60
}
define i64 @_mini_size(ptr %r65) {
l12:
    %r67 = alloca ptr
	store ptr null, ptr %r67
	%r66 = load ptr, ptr %r67
    %r71 = alloca i1
	store i1 0, ptr %r71
	%r70 = load i1, ptr %r71
    %r74 = alloca i64
	store i64 0, ptr %r74
	%r73 = load i64, ptr %r74
    %r76 = alloca i64
	store i64 1, ptr %r76
	%r75 = load i64, ptr %r76
    %r68 = bitcast ptr %r66 to %struct._mini_node*
    %r69 = icmp eq ptr %r65, %r68
    %r72 = icmp ne i1 %r69, %r70
    br i1 %r72, label %l13, label %l15
l13:
    br label %l11
l15:
    %r77 = getelementptr inbounds %struct._mini_node, ptr %r65, i32 0, i32 1
    %r78 = load ptr, ptr %r77
    %r79 = call i64 @_mini_size(ptr %r78)
    %r80 = add i64 %r75, %r79
    br label %l11
l11:
    %r81 = phi i64 [%r73, %l13], [%r80, %l15]
    ret i64 %r81
}
define i64 @_mini_get(ptr %r83, i64 %r84) {
l17:
    %r86 = alloca i64
	store i64 0, ptr %r86
	%r85 = load i64, ptr %r86
    %r89 = alloca i1
	store i1 0, ptr %r89
	%r88 = load i1, ptr %r89
    %r96 = alloca i64
	store i64 1, ptr %r96
	%r95 = load i64, ptr %r96
    %r87 = icmp eq i64 %r84, %r85
    %r90 = icmp ne i1 %r87, %r88
    br i1 %r90, label %l18, label %l20
l18:
    %r91 = getelementptr inbounds %struct._mini_node, ptr %r83, i32 0, i32 0
    %r92 = load i64, ptr %r91
    br label %l16
l20:
    %r93 = getelementptr inbounds %struct._mini_node, ptr %r83, i32 0, i32 1
    %r94 = load ptr, ptr %r93
    %r97 = sub i64 %r84, %r95
    %r98 = call i64 @_mini_get(ptr %r94, i64 %r97)
    br label %l16
l16:
    %r99 = phi i64 [%r92, %l18], [%r98, %l20]
    ret i64 %r99
}
define ptr @_mini_pop(ptr %r101) {
l22:
    %r102 = getelementptr inbounds %struct._mini_node, ptr %r101, i32 0, i32 1
    %r103 = load ptr, ptr %r102
    ret ptr %r103
}
define void @_mini_printList(ptr %r106) {
l24:
    %r108 = alloca ptr
	store ptr null, ptr %r108
	%r107 = load ptr, ptr %r108
    %r112 = alloca i1
	store i1 0, ptr %r112
	%r111 = load i1, ptr %r112
    %r109 = bitcast ptr %r107 to %struct._mini_node*
    %r110 = icmp ne ptr %r106, %r109
    %r113 = icmp ne i1 %r110, %r111
    br i1 %r113, label %l25, label %l23
l25:
    %r115 = getelementptr inbounds %struct._mini_node, ptr %r106, i32 0, i32 0
    %r116 = load i64, ptr %r115
    %r117 = call i32 @printf(ptr @.r114, i64 %r116)
    %r118 = getelementptr inbounds %struct._mini_node, ptr %r106, i32 0, i32 1
    %r119 = load ptr, ptr %r118
    call void @_mini_printList(ptr %r119)
    br label %l23
l23:
    ret void
}
define void @_mini_treeprint(ptr %r122) {
l29:
    %r124 = alloca ptr
	store ptr null, ptr %r124
	%r123 = load ptr, ptr %r124
    %r128 = alloca i1
	store i1 0, ptr %r128
	%r127 = load i1, ptr %r128
    %r125 = bitcast ptr %r123 to %struct._mini_tnode*
    %r126 = icmp ne ptr %r122, %r125
    %r129 = icmp ne i1 %r126, %r127
    br i1 %r129, label %l30, label %l28
l30:
    %r130 = getelementptr inbounds %struct._mini_tnode, ptr %r122, i32 0, i32 1
    %r131 = load ptr, ptr %r130
    call void @_mini_treeprint(ptr %r131)
    %r133 = getelementptr inbounds %struct._mini_tnode, ptr %r122, i32 0, i32 0
    %r134 = load i64, ptr %r133
    %r135 = call i32 @printf(ptr @.r132, i64 %r134)
    %r136 = getelementptr inbounds %struct._mini_tnode, ptr %r122, i32 0, i32 2
    %r137 = load ptr, ptr %r136
    call void @_mini_treeprint(ptr %r137)
    br label %l28
l28:
    ret void
}
define void @_mini_freeList(ptr %r140) {
l34:
    %r142 = alloca ptr
	store ptr null, ptr %r142
	%r141 = load ptr, ptr %r142
    %r146 = alloca i1
	store i1 0, ptr %r146
	%r145 = load i1, ptr %r146
    %r143 = bitcast ptr %r141 to %struct._mini_node*
    %r144 = icmp ne ptr %r140, %r143
    %r147 = icmp ne i1 %r144, %r145
    br i1 %r147, label %l35, label %l33
l35:
    %r148 = getelementptr inbounds %struct._mini_node, ptr %r140, i32 0, i32 1
    %r149 = load ptr, ptr %r148
    call void @_mini_freeList(ptr %r149)
    %r150 = bitcast ptr %r140 to i8*
    call void @free(ptr %r150)
    br label %l33
l33:
    ret void
}
define void @_mini_freeTree(ptr %r153) {
l39:
    %r155 = alloca ptr
	store ptr null, ptr %r155
	%r154 = load ptr, ptr %r155
    %r159 = alloca i1
	store i1 0, ptr %r159
	%r158 = load i1, ptr %r159
    %r162 = alloca i1
	store i1 0, ptr %r162
	%r161 = load i1, ptr %r162
    %r156 = bitcast ptr %r154 to %struct._mini_tnode*
    %r157 = icmp eq ptr %r153, %r156
    %r160 = icmp eq i1 %r157, %r158
    %r163 = icmp ne i1 %r160, %r161
    br i1 %r163, label %l40, label %l38
l40:
    %r164 = getelementptr inbounds %struct._mini_tnode, ptr %r153, i32 0, i32 1
    %r165 = load ptr, ptr %r164
    call void @_mini_freeTree(ptr %r165)
    %r166 = getelementptr inbounds %struct._mini_tnode, ptr %r153, i32 0, i32 2
    %r167 = load ptr, ptr %r166
    call void @_mini_freeTree(ptr %r167)
    %r168 = bitcast ptr %r153 to i8*
    call void @free(ptr %r168)
    br label %l38
l38:
    ret void
}
define ptr @_mini_postOrder(ptr %r171) {
l44:
    %r176 = alloca ptr
	store ptr null, ptr %r176
	%r175 = load ptr, ptr %r176
    %r180 = alloca i1
	store i1 0, ptr %r180
	%r179 = load i1, ptr %r180
    %r183 = alloca i64
	store i64 16, ptr %r183
	%r182 = load i64, ptr %r183
    %r190 = alloca ptr
	store ptr null, ptr %r190
	%r189 = load ptr, ptr %r190
    %r202 = alloca ptr
	store ptr null, ptr %r202
	%r201 = load ptr, ptr %r202
    %r177 = bitcast ptr %r175 to %struct._mini_tnode*
    %r178 = icmp ne ptr %r171, %r177
    %r181 = icmp ne i1 %r178, %r179
    br i1 %r181, label %l45, label %l47
l45:
    %r184 = call ptr @malloc(i64 %r182)
    %r185 = bitcast ptr %r184 to %struct._mini_node*
    %r186 = getelementptr inbounds %struct._mini_tnode, ptr %r171, i32 0, i32 0
    %r187 = load i64, ptr %r186
    %r188 = getelementptr inbounds %struct._mini_node, ptr %r185, i32 0, i32 0
    store i64 %r187, ptr %r188
    %r191 = getelementptr inbounds %struct._mini_node, ptr %r185, i32 0, i32 1
    %r192 = bitcast ptr %r189 to %struct._mini_node*
    store ptr %r192, ptr %r191
    %r193 = getelementptr inbounds %struct._mini_tnode, ptr %r171, i32 0, i32 1
    %r194 = load ptr, ptr %r193
    %r195 = call ptr @_mini_postOrder(ptr %r194)
    %r196 = getelementptr inbounds %struct._mini_tnode, ptr %r171, i32 0, i32 2
    %r197 = load ptr, ptr %r196
    %r198 = call ptr @_mini_postOrder(ptr %r197)
    %r199 = call ptr @_mini_concatLists(ptr %r195, ptr %r198)
    %r200 = call ptr @_mini_concatLists(ptr %r199, ptr %r185)
    br label %l43
l47:
    %r203 = bitcast ptr %r201 to %struct._mini_node*
    br label %l43
l43:
    %r204 = phi ptr [%r200, %l45], [%r203, %l47]
    ret ptr %r204
}
define ptr @_mini_treeadd(ptr %r206, i64 %r207) {
l49:
    %r212 = alloca ptr
	store ptr null, ptr %r212
	%r211 = load ptr, ptr %r212
    %r216 = alloca i1
	store i1 0, ptr %r216
	%r215 = load i1, ptr %r216
    %r219 = alloca i64
	store i64 24, ptr %r219
	%r218 = load i64, ptr %r219
    %r224 = alloca ptr
	store ptr null, ptr %r224
	%r223 = load ptr, ptr %r224
    %r228 = alloca ptr
	store ptr null, ptr %r228
	%r227 = load ptr, ptr %r228
    %r235 = alloca i1
	store i1 0, ptr %r235
	%r234 = load i1, ptr %r235
    %r213 = bitcast ptr %r211 to %struct._mini_tnode*
    %r214 = icmp eq ptr %r206, %r213
    %r217 = icmp ne i1 %r214, %r215
    br i1 %r217, label %l50, label %l52
l50:
    %r220 = call ptr @malloc(i64 %r218)
    %r221 = bitcast ptr %r220 to %struct._mini_tnode*
    %r222 = getelementptr inbounds %struct._mini_tnode, ptr %r221, i32 0, i32 0
    store i64 %r207, ptr %r222
    %r225 = getelementptr inbounds %struct._mini_tnode, ptr %r221, i32 0, i32 1
    %r226 = bitcast ptr %r223 to %struct._mini_tnode*
    store ptr %r226, ptr %r225
    %r229 = getelementptr inbounds %struct._mini_tnode, ptr %r221, i32 0, i32 2
    %r230 = bitcast ptr %r227 to %struct._mini_tnode*
    store ptr %r230, ptr %r229
    br label %l48
l52:
    %r231 = getelementptr inbounds %struct._mini_tnode, ptr %r206, i32 0, i32 0
    %r232 = load i64, ptr %r231
    %r233 = icmp slt i64 %r207, %r232
    %r236 = icmp ne i1 %r233, %r234
    br i1 %r236, label %l53, label %l54
l53:
    %r237 = getelementptr inbounds %struct._mini_tnode, ptr %r206, i32 0, i32 1
    %r238 = load ptr, ptr %r237
    %r239 = call ptr @_mini_treeadd(ptr %r238, i64 %r207)
    %r240 = getelementptr inbounds %struct._mini_tnode, ptr %r206, i32 0, i32 1
    store ptr %r239, ptr %r240
    br label %l55
l54:
    %r241 = getelementptr inbounds %struct._mini_tnode, ptr %r206, i32 0, i32 2
    %r242 = load ptr, ptr %r241
    %r243 = call ptr @_mini_treeadd(ptr %r242, i64 %r207)
    %r244 = getelementptr inbounds %struct._mini_tnode, ptr %r206, i32 0, i32 2
    store ptr %r243, ptr %r244
    br label %l55
l55:
    %r245 = phi ptr [%r206, %l53], [%r206, %l54]
    br label %l48
l48:
    %r248 = phi ptr [%r221, %l50], [%r245, %l55]
    ret ptr %r248
}
define ptr @_mini_quickSort(ptr %r250) {
l57:
    %r265 = alloca ptr
	store ptr null, ptr %r265
	%r264 = load ptr, ptr %r265
    %r268 = alloca ptr
	store ptr null, ptr %r268
	%r267 = load ptr, ptr %r268
    %r272 = alloca i64
	store i64 1, ptr %r272
	%r271 = load i64, ptr %r272
    %r275 = alloca i1
	store i1 0, ptr %r275
	%r274 = load i1, ptr %r275
    %r278 = alloca i64
	store i64 0, ptr %r278
	%r277 = load i64, ptr %r278
    %r282 = alloca i64
	store i64 1, ptr %r282
	%r281 = load i64, ptr %r282
    %r287 = alloca i64
	store i64 2, ptr %r287
	%r286 = load i64, ptr %r287
    %r290 = alloca i64
	store i64 0, ptr %r290
	%r289 = load i64, ptr %r290
    %r292 = alloca ptr
	store ptr null, ptr %r292
	%r291 = load ptr, ptr %r292
    %r297 = alloca i1
	store i1 0, ptr %r297
	%r296 = load i1, ptr %r297
    %r307 = alloca i1
	store i1 0, ptr %r307
	%r306 = load i1, ptr %r307
    %r322 = alloca i64
	store i64 1, ptr %r322
	%r321 = load i64, ptr %r322
    %r331 = alloca ptr
	store ptr null, ptr %r331
	%r330 = load ptr, ptr %r331
    %r336 = alloca i1
	store i1 0, ptr %r336
	%r335 = load i1, ptr %r336
    %r266 = bitcast ptr %r264 to %struct._mini_node*
    %r269 = bitcast ptr %r267 to %struct._mini_node*
    %r270 = call i64 @_mini_size(ptr %r250)
    %r273 = icmp sle i64 %r270, %r271
    %r276 = icmp ne i1 %r273, %r274
    br i1 %r276, label %l56, label %l60
l60:
    %r279 = call i64 @_mini_get(ptr %r250, i64 %r277)
    %r280 = call i64 @_mini_size(ptr %r250)
    %r283 = sub i64 %r280, %r281
    %r284 = call i64 @_mini_get(ptr %r250, i64 %r283)
    %r285 = add i64 %r279, %r284
    %r288 = sdiv i64 %r285, %r286
    %r293 = bitcast ptr %r291 to %struct._mini_node*
    %r294 = icmp ne ptr %r250, %r293
    %r295 = icmp ne i1 %r294, %r296
    br i1 %r295, label %l61, label %l63
l61:
    %r298 = phi ptr [%r313, %l66], [%r250, %l60]
    %r299 = phi i64 [%r314, %l66], [%r288, %l60]
    %r300 = phi ptr [%r315, %l66], [%r266, %l60]
    %r301 = phi ptr [%r316, %l66], [%r269, %l60]
    %r302 = phi ptr [%r320, %l66], [%r250, %l60]
    %r303 = phi i64 [%r323, %l66], [%r289, %l60]
    %r304 = call i64 @_mini_get(ptr %r298, i64 %r303)
    %r305 = icmp sgt i64 %r304, %r299
    %r308 = icmp ne i1 %r305, %r306
    br i1 %r308, label %l64, label %l65
l64:
    %r309 = call i64 @_mini_get(ptr %r298, i64 %r303)
    %r310 = call ptr @_mini_add(ptr %r301, i64 %r309)
    br label %l66
l65:
    %r311 = call i64 @_mini_get(ptr %r298, i64 %r303)
    %r312 = call ptr @_mini_add(ptr %r300, i64 %r311)
    br label %l66
l66:
    %r313 = phi ptr [%r298, %l64], [%r298, %l65]
    %r314 = phi i64 [%r299, %l64], [%r299, %l65]
    %r315 = phi ptr [%r300, %l64], [%r312, %l65]
    %r316 = phi ptr [%r310, %l64], [%r301, %l65]
    %r317 = phi ptr [%r302, %l64], [%r302, %l65]
    %r318 = phi i64 [%r303, %l64], [%r303, %l65]
    %r319 = getelementptr inbounds %struct._mini_node, ptr %r317, i32 0, i32 1
    %r320 = load ptr, ptr %r319
    %r323 = add i64 %r318, %r321
    %r332 = bitcast ptr %r330 to %struct._mini_node*
    %r333 = icmp ne ptr %r320, %r332
    %r334 = icmp ne i1 %r333, %r335
    br i1 %r334, label %l61, label %l63
l63:
    %r337 = phi ptr [%r313, %l66], [%r250, %l60]
    %r339 = phi ptr [%r315, %l66], [%r266, %l60]
    %r340 = phi ptr [%r316, %l66], [%r269, %l60]
    call void @_mini_freeList(ptr %r337)
    %r343 = call ptr @_mini_quickSort(ptr %r339)
    %r344 = call ptr @_mini_quickSort(ptr %r340)
    %r345 = call ptr @_mini_concatLists(ptr %r343, ptr %r344)
    br label %l56
l56:
    %r346 = phi ptr [%r250, %l57], [%r345, %l63]
    ret ptr %r346
}
define ptr @_mini_quickSortMain(ptr %r348) {
l68:
    %r842 = alloca i64
	store i64 -999, ptr %r842
	%r841 = load i64, ptr %r842
    %r844 = alloca i64
	store i64 -999, ptr %r844
	%r843 = load i64, ptr %r844
    %r846 = alloca i64
	store i64 -999, ptr %r846
	%r845 = load i64, ptr %r846
    %r371 = alloca ptr
	store ptr null, ptr %r371
	%r370 = load ptr, ptr %r371
    call void @_mini_printList(ptr %r348)
    %r355 = call i32 @printf(ptr @.r349, i64 %r841)
    call void @_mini_printList(ptr %r348)
    %r362 = call i32 @printf(ptr @.r356, i64 %r843)
    call void @_mini_printList(ptr %r348)
    %r369 = call i32 @printf(ptr @.r363, i64 %r845)
    %r372 = bitcast ptr %r370 to %struct._mini_node*
    ret ptr %r372
}
define i64 @_mini_treesearch(ptr %r375, i64 %r376) {
l70:
    %r848 = alloca i64
	store i64 -1, ptr %r848
	%r847 = load i64, ptr %r848
    %r385 = alloca ptr
	store ptr null, ptr %r385
	%r384 = load ptr, ptr %r385
    %r389 = alloca i1
	store i1 0, ptr %r389
	%r388 = load i1, ptr %r389
    %r395 = alloca i1
	store i1 0, ptr %r395
	%r394 = load i1, ptr %r395
    %r398 = alloca i64
	store i64 1, ptr %r398
	%r397 = load i64, ptr %r398
    %r403 = alloca i64
	store i64 1, ptr %r403
	%r402 = load i64, ptr %r403
    %r406 = alloca i1
	store i1 0, ptr %r406
	%r405 = load i1, ptr %r406
    %r409 = alloca i64
	store i64 1, ptr %r409
	%r408 = load i64, ptr %r409
    %r414 = alloca i64
	store i64 1, ptr %r414
	%r413 = load i64, ptr %r414
    %r417 = alloca i1
	store i1 0, ptr %r417
	%r416 = load i1, ptr %r417
    %r420 = alloca i64
	store i64 1, ptr %r420
	%r419 = load i64, ptr %r420
    %r422 = alloca i64
	store i64 0, ptr %r422
	%r421 = load i64, ptr %r422
    %r424 = alloca i64
	store i64 0, ptr %r424
	%r423 = load i64, ptr %r424
    %r383 = call i32 @printf(ptr @.r377, i64 %r847)
    %r386 = bitcast ptr %r384 to %struct._mini_tnode*
    %r387 = icmp ne ptr %r375, %r386
    %r390 = icmp ne i1 %r387, %r388
    br i1 %r390, label %l71, label %l81
l71:
    %r391 = getelementptr inbounds %struct._mini_tnode, ptr %r375, i32 0, i32 0
    %r392 = load i64, ptr %r391
    %r393 = icmp eq i64 %r392, %r376
    %r396 = icmp ne i1 %r393, %r394
    br i1 %r396, label %l73, label %l75
l73:
    br label %l69
l75:
    %r399 = getelementptr inbounds %struct._mini_tnode, ptr %r375, i32 0, i32 1
    %r400 = load ptr, ptr %r399
    %r401 = call i64 @_mini_treesearch(ptr %r400, i64 %r376)
    %r404 = icmp eq i64 %r401, %r402
    %r407 = icmp ne i1 %r404, %r405
    br i1 %r407, label %l76, label %l78
l76:
    br label %l69
l78:
    %r410 = getelementptr inbounds %struct._mini_tnode, ptr %r375, i32 0, i32 2
    %r411 = load ptr, ptr %r410
    %r412 = call i64 @_mini_treesearch(ptr %r411, i64 %r376)
    %r415 = icmp eq i64 %r412, %r413
    %r418 = icmp ne i1 %r415, %r416
    br i1 %r418, label %l79, label %l80
l79:
    br label %l69
l80:
    br label %l69
l81:
    br label %l69
l69:
    %r425 = phi i64 [%r397, %l73], [%r408, %l76], [%r419, %l79], [%r421, %l80], [%r423, %l81]
    ret i64 %r425
}
define ptr @_mini_inOrder(ptr %r427) {
l83:
    %r432 = alloca ptr
	store ptr null, ptr %r432
	%r431 = load ptr, ptr %r432
    %r436 = alloca i1
	store i1 0, ptr %r436
	%r435 = load i1, ptr %r436
    %r439 = alloca i64
	store i64 16, ptr %r439
	%r438 = load i64, ptr %r439
    %r446 = alloca i64
	store i64 0, ptr %r446
	%r445 = load i64, ptr %r446
    %r458 = alloca ptr
	store ptr null, ptr %r458
	%r457 = load ptr, ptr %r458
    %r433 = bitcast ptr %r431 to %struct._mini_tnode*
    %r434 = icmp ne ptr %r427, %r433
    %r437 = icmp ne i1 %r434, %r435
    br i1 %r437, label %l84, label %l85
l84:
    %r440 = call ptr @malloc(i64 %r438)
    %r441 = bitcast ptr %r440 to %struct._mini_node*
    %r442 = getelementptr inbounds %struct._mini_tnode, ptr %r427, i32 0, i32 0
    %r443 = load i64, ptr %r442
    %r444 = getelementptr inbounds %struct._mini_node, ptr %r441, i32 0, i32 0
    store i64 %r443, ptr %r444
    %r447 = getelementptr inbounds %struct._mini_node, ptr %r441, i32 0, i32 1
    %r448 = inttoptr i64 %r445 to %struct._mini_node*
    store ptr %r448, ptr %r447
    %r449 = getelementptr inbounds %struct._mini_tnode, ptr %r427, i32 0, i32 1
    %r450 = load ptr, ptr %r449
    %r451 = call ptr @_mini_inOrder(ptr %r450)
    %r452 = getelementptr inbounds %struct._mini_tnode, ptr %r427, i32 0, i32 2
    %r453 = load ptr, ptr %r452
    %r454 = call ptr @_mini_inOrder(ptr %r453)
    %r455 = call ptr @_mini_concatLists(ptr %r441, ptr %r454)
    %r456 = call ptr @_mini_concatLists(ptr %r451, ptr %r455)
    br label %l82
l85:
    %r459 = bitcast ptr %r457 to %struct._mini_node*
    br label %l82
l82:
    %r460 = phi ptr [%r456, %l84], [%r459, %l85]
    ret ptr %r460
}
define i64 @_mini_bintreesearch(ptr %r462, i64 %r463) {
l87:
    %r850 = alloca i64
	store i64 -1, ptr %r850
	%r849 = load i64, ptr %r850
    %r472 = alloca ptr
	store ptr null, ptr %r472
	%r471 = load ptr, ptr %r472
    %r476 = alloca i1
	store i1 0, ptr %r476
	%r475 = load i1, ptr %r476
    %r482 = alloca i1
	store i1 0, ptr %r482
	%r481 = load i1, ptr %r482
    %r485 = alloca i64
	store i64 1, ptr %r485
	%r484 = load i64, ptr %r485
    %r490 = alloca i1
	store i1 0, ptr %r490
	%r489 = load i1, ptr %r490
    %r499 = alloca i64
	store i64 0, ptr %r499
	%r498 = load i64, ptr %r499
    %r470 = call i32 @printf(ptr @.r464, i64 %r849)
    %r473 = bitcast ptr %r471 to %struct._mini_tnode*
    %r474 = icmp ne ptr %r462, %r473
    %r477 = icmp ne i1 %r474, %r475
    br i1 %r477, label %l88, label %l95
l88:
    %r478 = getelementptr inbounds %struct._mini_tnode, ptr %r462, i32 0, i32 0
    %r479 = load i64, ptr %r478
    %r480 = icmp eq i64 %r479, %r463
    %r483 = icmp ne i1 %r480, %r481
    br i1 %r483, label %l90, label %l92
l90:
    br label %l86
l92:
    %r486 = getelementptr inbounds %struct._mini_tnode, ptr %r462, i32 0, i32 0
    %r487 = load i64, ptr %r486
    %r488 = icmp slt i64 %r463, %r487
    %r491 = icmp ne i1 %r488, %r489
    br i1 %r491, label %l93, label %l94
l93:
    %r492 = getelementptr inbounds %struct._mini_tnode, ptr %r462, i32 0, i32 1
    %r493 = load ptr, ptr %r492
    %r494 = call i64 @_mini_bintreesearch(ptr %r493, i64 %r463)
    br label %l86
l94:
    %r495 = getelementptr inbounds %struct._mini_tnode, ptr %r462, i32 0, i32 2
    %r496 = load ptr, ptr %r495
    %r497 = call i64 @_mini_bintreesearch(ptr %r496, i64 %r463)
    br label %l86
l95:
    br label %l86
l86:
    %r500 = phi i64 [%r484, %l90], [%r494, %l93], [%r497, %l94], [%r498, %l95]
    ret i64 %r500
}
define ptr @_mini_buildTree(ptr %r502) {
l97:
    %r509 = alloca ptr
	store ptr null, ptr %r509
	%r508 = load ptr, ptr %r509
    %r512 = alloca i64
	store i64 0, ptr %r512
	%r511 = load i64, ptr %r512
    %r517 = alloca i1
	store i1 0, ptr %r517
	%r516 = load i1, ptr %r517
    %r524 = alloca i64
	store i64 1, ptr %r524
	%r523 = load i64, ptr %r524
    %r533 = alloca i1
	store i1 0, ptr %r533
	%r532 = load i1, ptr %r533
    %r510 = bitcast ptr %r508 to %struct._mini_tnode*
    %r513 = call i64 @_mini_size(ptr %r502)
    %r514 = icmp slt i64 %r511, %r513
    %r515 = icmp ne i1 %r514, %r516
    br i1 %r515, label %l98, label %l100
l98:
    %r518 = phi ptr [%r502, %l97], [%r518, %l98]
    %r519 = phi ptr [%r510, %l97], [%r522, %l98]
    %r520 = phi i64 [%r511, %l97], [%r525, %l98]
    %r521 = call i64 @_mini_get(ptr %r518, i64 %r520)
    %r522 = call ptr @_mini_treeadd(ptr %r519, i64 %r521)
    %r525 = add i64 %r520, %r523
    %r529 = call i64 @_mini_size(ptr %r518)
    %r530 = icmp slt i64 %r525, %r529
    %r531 = icmp ne i1 %r530, %r532
    br i1 %r531, label %l98, label %l100
l100:
    %r535 = phi ptr [%r510, %l97], [%r522, %l98]
    ret ptr %r535
}
define void @_mini_treeMain(ptr %r539) {
l102:
    %r852 = alloca i64
	store i64 -999, ptr %r852
	%r851 = load i64, ptr %r852
    %r854 = alloca i64
	store i64 -999, ptr %r854
	%r853 = load i64, ptr %r854
    %r856 = alloca i64
	store i64 -999, ptr %r856
	%r855 = load i64, ptr %r856
    %r575 = alloca i64
	store i64 0, ptr %r575
	%r574 = load i64, ptr %r575
    %r858 = alloca i64
	store i64 -999, ptr %r858
	%r857 = load i64, ptr %r858
    %r587 = alloca i64
	store i64 10, ptr %r587
	%r586 = load i64, ptr %r587
    %r860 = alloca i64
	store i64 -999, ptr %r860
	%r859 = load i64, ptr %r860
    %r862 = alloca i64
	store i64 -2, ptr %r862
	%r861 = load i64, ptr %r862
    %r864 = alloca i64
	store i64 -999, ptr %r864
	%r863 = load i64, ptr %r864
    %r614 = alloca i64
	store i64 2, ptr %r614
	%r613 = load i64, ptr %r614
    %r866 = alloca i64
	store i64 -999, ptr %r866
	%r865 = load i64, ptr %r866
    %r626 = alloca i64
	store i64 3, ptr %r626
	%r625 = load i64, ptr %r626
    %r868 = alloca i64
	store i64 -999, ptr %r868
	%r867 = load i64, ptr %r868
    %r638 = alloca i64
	store i64 9, ptr %r638
	%r637 = load i64, ptr %r638
    %r870 = alloca i64
	store i64 -999, ptr %r870
	%r869 = load i64, ptr %r870
    %r650 = alloca i64
	store i64 1, ptr %r650
	%r649 = load i64, ptr %r650
    %r872 = alloca i64
	store i64 -999, ptr %r872
	%r871 = load i64, ptr %r872
    %r662 = alloca i64
	store i64 0, ptr %r662
	%r661 = load i64, ptr %r662
    %r874 = alloca i64
	store i64 -999, ptr %r874
	%r873 = load i64, ptr %r874
    %r674 = alloca i64
	store i64 10, ptr %r674
	%r673 = load i64, ptr %r674
    %r876 = alloca i64
	store i64 -999, ptr %r876
	%r875 = load i64, ptr %r876
    %r878 = alloca i64
	store i64 -2, ptr %r878
	%r877 = load i64, ptr %r878
    %r880 = alloca i64
	store i64 -999, ptr %r880
	%r879 = load i64, ptr %r880
    %r701 = alloca i64
	store i64 2, ptr %r701
	%r700 = load i64, ptr %r701
    %r882 = alloca i64
	store i64 -999, ptr %r882
	%r881 = load i64, ptr %r882
    %r713 = alloca i64
	store i64 3, ptr %r713
	%r712 = load i64, ptr %r713
    %r884 = alloca i64
	store i64 -999, ptr %r884
	%r883 = load i64, ptr %r884
    %r725 = alloca i64
	store i64 9, ptr %r725
	%r724 = load i64, ptr %r725
    %r886 = alloca i64
	store i64 -999, ptr %r886
	%r885 = load i64, ptr %r886
    %r737 = alloca i64
	store i64 1, ptr %r737
	%r736 = load i64, ptr %r737
    %r888 = alloca i64
	store i64 -999, ptr %r888
	%r887 = load i64, ptr %r888
    %r549 = call ptr @_mini_buildTree(ptr %r539)
    call void @_mini_treeprint(ptr %r549)
    %r556 = call i32 @printf(ptr @.r550, i64 %r851)
    %r557 = call ptr @_mini_inOrder(ptr %r549)
    call void @_mini_printList(ptr %r557)
    %r564 = call i32 @printf(ptr @.r558, i64 %r853)
    call void @_mini_freeList(ptr %r557)
    %r565 = call ptr @_mini_postOrder(ptr %r549)
    call void @_mini_printList(ptr %r565)
    %r572 = call i32 @printf(ptr @.r566, i64 %r855)
    call void @_mini_freeList(ptr %r565)
    %r576 = call i64 @_mini_treesearch(ptr %r549, i64 %r574)
    %r577 = call i32 @printf(ptr @.r573, i64 %r576)
    %r584 = call i32 @printf(ptr @.r578, i64 %r857)
    %r588 = call i64 @_mini_treesearch(ptr %r549, i64 %r586)
    %r589 = call i32 @printf(ptr @.r585, i64 %r588)
    %r596 = call i32 @printf(ptr @.r590, i64 %r859)
    %r603 = call i64 @_mini_treesearch(ptr %r549, i64 %r861)
    %r604 = call i32 @printf(ptr @.r597, i64 %r603)
    %r611 = call i32 @printf(ptr @.r605, i64 %r863)
    %r615 = call i64 @_mini_treesearch(ptr %r549, i64 %r613)
    %r616 = call i32 @printf(ptr @.r612, i64 %r615)
    %r623 = call i32 @printf(ptr @.r617, i64 %r865)
    %r627 = call i64 @_mini_treesearch(ptr %r549, i64 %r625)
    %r628 = call i32 @printf(ptr @.r624, i64 %r627)
    %r635 = call i32 @printf(ptr @.r629, i64 %r867)
    %r639 = call i64 @_mini_treesearch(ptr %r549, i64 %r637)
    %r640 = call i32 @printf(ptr @.r636, i64 %r639)
    %r647 = call i32 @printf(ptr @.r641, i64 %r869)
    %r651 = call i64 @_mini_treesearch(ptr %r549, i64 %r649)
    %r652 = call i32 @printf(ptr @.r648, i64 %r651)
    %r659 = call i32 @printf(ptr @.r653, i64 %r871)
    %r663 = call i64 @_mini_bintreesearch(ptr %r549, i64 %r661)
    %r664 = call i32 @printf(ptr @.r660, i64 %r663)
    %r671 = call i32 @printf(ptr @.r665, i64 %r873)
    %r675 = call i64 @_mini_bintreesearch(ptr %r549, i64 %r673)
    %r676 = call i32 @printf(ptr @.r672, i64 %r675)
    %r683 = call i32 @printf(ptr @.r677, i64 %r875)
    %r690 = call i64 @_mini_bintreesearch(ptr %r549, i64 %r877)
    %r691 = call i32 @printf(ptr @.r684, i64 %r690)
    %r698 = call i32 @printf(ptr @.r692, i64 %r879)
    %r702 = call i64 @_mini_bintreesearch(ptr %r549, i64 %r700)
    %r703 = call i32 @printf(ptr @.r699, i64 %r702)
    %r710 = call i32 @printf(ptr @.r704, i64 %r881)
    %r714 = call i64 @_mini_bintreesearch(ptr %r549, i64 %r712)
    %r715 = call i32 @printf(ptr @.r711, i64 %r714)
    %r722 = call i32 @printf(ptr @.r716, i64 %r883)
    %r726 = call i64 @_mini_bintreesearch(ptr %r549, i64 %r724)
    %r727 = call i32 @printf(ptr @.r723, i64 %r726)
    %r734 = call i32 @printf(ptr @.r728, i64 %r885)
    %r738 = call i64 @_mini_bintreesearch(ptr %r549, i64 %r736)
    %r739 = call i32 @printf(ptr @.r735, i64 %r738)
    %r746 = call i32 @printf(ptr @.r740, i64 %r887)
    call void @_mini_freeTree(ptr %r549)
    ret void
}
define ptr @_mini_myCopy(ptr %r748) {
l104:
    %r750 = alloca ptr
	store ptr null, ptr %r750
	%r749 = load ptr, ptr %r750
    %r754 = alloca i1
	store i1 0, ptr %r754
	%r753 = load i1, ptr %r754
    %r757 = alloca ptr
	store ptr null, ptr %r757
	%r756 = load ptr, ptr %r757
    %r760 = alloca ptr
	store ptr null, ptr %r760
	%r759 = load ptr, ptr %r760
    %r751 = bitcast ptr %r749 to %struct._mini_node*
    %r752 = icmp eq ptr %r748, %r751
    %r755 = icmp ne i1 %r752, %r753
    br i1 %r755, label %l105, label %l107
l105:
    %r758 = bitcast ptr %r756 to %struct._mini_node*
    br label %l103
l107:
    %r761 = getelementptr inbounds %struct._mini_node, ptr %r748, i32 0, i32 0
    %r762 = load i64, ptr %r761
    %r763 = bitcast ptr %r759 to %struct._mini_node*
    %r764 = call ptr @_mini_add(ptr %r763, i64 %r762)
    %r765 = getelementptr inbounds %struct._mini_node, ptr %r748, i32 0, i32 1
    %r766 = load ptr, ptr %r765
    %r767 = call ptr @_mini_myCopy(ptr %r766)
    %r768 = call ptr @_mini_concatLists(ptr %r764, ptr %r767)
    br label %l103
l103:
    %r769 = phi ptr [%r758, %l105], [%r768, %l107]
    ret ptr %r769
}
define i64 @_mini_main() {
l109:
    %r773 = alloca i64
    %r787 = alloca ptr
	store ptr null, ptr %r787
	%r786 = load ptr, ptr %r787
    %r790 = alloca ptr
	store ptr null, ptr %r790
	%r789 = load ptr, ptr %r790
    %r793 = alloca ptr
	store ptr null, ptr %r793
	%r792 = load ptr, ptr %r793
    %r796 = alloca i64
	store i64 0, ptr %r796
	%r795 = load i64, ptr %r796
    %r798 = alloca i64
	store i64 10, ptr %r798
	%r797 = load i64, ptr %r798
    %r802 = alloca i1
	store i1 0, ptr %r802
	%r801 = load i1, ptr %r802
    %r816 = alloca i64
	store i64 1, ptr %r816
	%r815 = load i64, ptr %r816
    %r824 = alloca i64
	store i64 10, ptr %r824
	%r823 = load i64, ptr %r824
    %r828 = alloca i1
	store i1 0, ptr %r828
	%r827 = load i1, ptr %r828
    %r835 = alloca i64
	store i64 0, ptr %r835
	%r834 = load i64, ptr %r835
    %r788 = bitcast ptr %r786 to %struct._mini_node*
    %r791 = bitcast ptr %r789 to %struct._mini_node*
    %r794 = bitcast ptr %r792 to %struct._mini_node*
    %r799 = icmp slt i64 %r795, %r797
    %r800 = icmp ne i1 %r799, %r801
    br i1 %r800, label %l110, label %l112
l110:
    %r804 = phi i64 [%r795, %l109], [%r817, %l110]
    %r806 = phi ptr [%r788, %l109], [%r811, %l110]
    %r809 = call i32 @scanf(ptr @.r808, ptr %r773)
    %r810 = load i64, ptr %r773
    %r811 = call ptr @_mini_add(ptr %r806, i64 %r810)
    %r812 = call ptr @_mini_myCopy(ptr %r811)
    %r813 = call ptr @_mini_myCopy(ptr %r811)
    %r814 = call ptr @_mini_quickSortMain(ptr %r812)
    call void @_mini_freeList(ptr %r814)
    call void @_mini_treeMain(ptr %r813)
    %r817 = add i64 %r804, %r815
    %r825 = icmp slt i64 %r817, %r823
    %r826 = icmp ne i1 %r825, %r827
    br i1 %r826, label %l110, label %l112
l112:
    %r831 = phi ptr [%r794, %l109], [%r813, %l110]
    %r832 = phi ptr [%r788, %l109], [%r811, %l110]
    %r833 = phi ptr [%r791, %l109], [%r812, %l110]
    call void @_mini_freeList(ptr %r832)
    call void @_mini_freeList(ptr %r833)
    call void @_mini_freeList(ptr %r831)
    ret i64 %r834
}
define i32 @main() {
l114:
    %r838 = call i64 @_mini_main()
    %r839 = trunc i64 %r838 to i32
    ret i32 %r839
}
