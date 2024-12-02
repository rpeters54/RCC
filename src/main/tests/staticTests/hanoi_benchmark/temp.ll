%struct._mini_plate = type {
    i64,
    ptr
}

declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global ptr zeroinitializer
@.r5 = global ptr zeroinitializer
@.r6 = global ptr zeroinitializer
@.r7 = global i64 zeroinitializer



@.r107 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

@.r142 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r180 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r185 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r190 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r202 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r207 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r212 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r217 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define void @_mini_move(i64 %r9, i64 %r10) {
l2:
    %r15 = alloca i64
	store i64 1, ptr %r15
	%r14 = load i64, ptr %r15
    %r18 = alloca i1
	store i1 0, ptr %r18
	%r17 = load i1, ptr %r18
    %r25 = alloca i64
	store i64 2, ptr %r25
	%r24 = load i64, ptr %r25
    %r28 = alloca i1
	store i1 0, ptr %r28
	%r27 = load i1, ptr %r28
    %r45 = alloca i64
	store i64 1, ptr %r45
	%r44 = load i64, ptr %r45
    %r48 = alloca i1
	store i1 0, ptr %r48
	%r47 = load i1, ptr %r48
    %r53 = alloca i64
	store i64 2, ptr %r53
	%r52 = load i64, ptr %r53
    %r56 = alloca i1
	store i1 0, ptr %r56
	%r55 = load i1, ptr %r56
    %r70 = alloca i64
	store i64 1, ptr %r70
	%r69 = load i64, ptr %r70
    %r16 = icmp eq i64 %r9, %r14
    %r19 = icmp ne i1 %r16, %r17
    br i1 %r19, label %l3, label %l4
l3:
    %r20 = load ptr, ptr @.r4
    %r21 = load ptr, ptr @.r4
    %r22 = getelementptr inbounds %struct._mini_plate, ptr %r21, i32 0, i32 1
    %r23 = load ptr, ptr %r22
    store ptr %r23, ptr @.r4
    br label %l8
l4:
    %r26 = icmp eq i64 %r9, %r24
    %r29 = icmp ne i1 %r26, %r27
    br i1 %r29, label %l5, label %l6
l5:
    %r30 = load ptr, ptr @.r5
    %r31 = load ptr, ptr @.r5
    %r32 = getelementptr inbounds %struct._mini_plate, ptr %r31, i32 0, i32 1
    %r33 = load ptr, ptr %r32
    store ptr %r33, ptr @.r5
    br label %l7
l6:
    %r34 = load ptr, ptr @.r6
    %r35 = load ptr, ptr @.r6
    %r36 = getelementptr inbounds %struct._mini_plate, ptr %r35, i32 0, i32 1
    %r37 = load ptr, ptr %r36
    store ptr %r37, ptr @.r6
    br label %l7
l7:
    %r39 = phi i64 [%r10, %l6], [%r10, %l5]
    %r40 = phi ptr [%r34, %l6], [%r30, %l5]
    br label %l8
l8:
    %r42 = phi i64 [%r39, %l7], [%r10, %l3]
    %r43 = phi ptr [%r40, %l7], [%r20, %l3]
    %r46 = icmp eq i64 %r42, %r44
    %r49 = icmp ne i1 %r46, %r47
    br i1 %r49, label %l9, label %l10
l9:
    %r50 = load ptr, ptr @.r4
    %r51 = getelementptr inbounds %struct._mini_plate, ptr %r43, i32 0, i32 1
    store ptr %r50, ptr %r51
    store ptr %r43, ptr @.r4
    br label %l14
l10:
    %r54 = icmp eq i64 %r42, %r52
    %r57 = icmp ne i1 %r54, %r55
    br i1 %r57, label %l11, label %l12
l11:
    %r58 = load ptr, ptr @.r5
    %r59 = getelementptr inbounds %struct._mini_plate, ptr %r43, i32 0, i32 1
    store ptr %r58, ptr %r59
    store ptr %r43, ptr @.r5
    br label %l14
l12:
    %r60 = load ptr, ptr @.r6
    %r61 = getelementptr inbounds %struct._mini_plate, ptr %r43, i32 0, i32 1
    store ptr %r60, ptr %r61
    store ptr %r43, ptr @.r6
    br label %l14
l14:
    %r68 = load i64, ptr @.r7
    %r71 = add i64 %r68, %r69
    store i64 %r71, ptr @.r7
    ret void
}
define void @_mini_hanoi(i64 %r73, i64 %r74, i64 %r75, i64 %r76) {
l16:
    %r78 = alloca i64
	store i64 1, ptr %r78
	%r77 = load i64, ptr %r78
    %r81 = alloca i1
	store i1 0, ptr %r81
	%r80 = load i1, ptr %r81
    %r84 = alloca i64
	store i64 1, ptr %r84
	%r83 = load i64, ptr %r84
    %r87 = alloca i64
	store i64 1, ptr %r87
	%r86 = load i64, ptr %r87
    %r79 = icmp eq i64 %r73, %r77
    %r82 = icmp ne i1 %r79, %r80
    br i1 %r82, label %l17, label %l18
l17:
    call void @_mini_move(i64 %r74, i64 %r75)
    br label %l15
l18:
    %r85 = sub i64 %r73, %r83
    call void @_mini_hanoi(i64 %r85, i64 %r74, i64 %r76, i64 %r75)
    call void @_mini_move(i64 %r74, i64 %r75)
    %r88 = sub i64 %r73, %r86
    call void @_mini_hanoi(i64 %r88, i64 %r76, i64 %r75, i64 %r74)
    br label %l15
l15:
    ret void
}
define void @_mini_printPeg(ptr %r94) {
l21:
    %r99 = alloca ptr
	store ptr null, ptr %r99
	%r98 = load ptr, ptr %r99
    %r104 = alloca i1
	store i1 0, ptr %r104
	%r103 = load i1, ptr %r104
    %r116 = alloca ptr
	store ptr null, ptr %r116
	%r115 = load ptr, ptr %r116
    %r121 = alloca i1
	store i1 0, ptr %r121
	%r120 = load i1, ptr %r121
    %r100 = bitcast ptr %r98 to %struct._mini_plate*
    %r101 = icmp ne ptr %r94, %r100
    %r102 = icmp ne i1 %r101, %r103
    br i1 %r102, label %l22, label %l20
l22:
    %r105 = phi ptr [%r94, %l21], [%r112, %l22]
    %r108 = getelementptr inbounds %struct._mini_plate, ptr %r105, i32 0, i32 0
    %r109 = load i64, ptr %r108
    %r110 = call i32 @printf(ptr @.r107, i64 %r109)
    %r111 = getelementptr inbounds %struct._mini_plate, ptr %r105, i32 0, i32 1
    %r112 = load ptr, ptr %r111
    %r117 = bitcast ptr %r115 to %struct._mini_plate*
    %r118 = icmp ne ptr %r112, %r117
    %r119 = icmp ne i1 %r118, %r120
    br i1 %r119, label %l22, label %l20
l20:
    ret void
}
define i64 @_mini_main() {
l26:
    %r127 = alloca i64
    %r132 = alloca ptr
	store ptr null, ptr %r132
	%r131 = load ptr, ptr %r132
    %r135 = alloca ptr
	store ptr null, ptr %r135
	%r134 = load ptr, ptr %r135
    %r138 = alloca ptr
	store ptr null, ptr %r138
	%r137 = load ptr, ptr %r138
    %r141 = alloca i64
	store i64 0, ptr %r141
	%r140 = load i64, ptr %r141
    %r146 = alloca i64
	store i64 1, ptr %r146
	%r145 = load i64, ptr %r146
    %r149 = alloca i1
	store i1 0, ptr %r149
	%r148 = load i1, ptr %r149
    %r153 = alloca i64
	store i64 0, ptr %r153
	%r152 = load i64, ptr %r153
    %r157 = alloca i1
	store i1 0, ptr %r157
	%r156 = load i1, ptr %r157
    %r161 = alloca i64
	store i64 16, ptr %r161
	%r160 = load i64, ptr %r161
    %r168 = alloca i64
	store i64 1, ptr %r168
	%r167 = load i64, ptr %r168
    %r173 = alloca i64
	store i64 0, ptr %r173
	%r172 = load i64, ptr %r173
    %r177 = alloca i1
	store i1 0, ptr %r177
	%r176 = load i1, ptr %r177
    %r182 = alloca i64
	store i64 1, ptr %r182
	%r181 = load i64, ptr %r182
    %r187 = alloca i64
	store i64 2, ptr %r187
	%r186 = load i64, ptr %r187
    %r192 = alloca i64
	store i64 3, ptr %r192
	%r191 = load i64, ptr %r192
    %r197 = alloca i64
	store i64 1, ptr %r197
	%r196 = load i64, ptr %r197
    %r199 = alloca i64
	store i64 3, ptr %r199
	%r198 = load i64, ptr %r199
    %r201 = alloca i64
	store i64 2, ptr %r201
	%r200 = load i64, ptr %r201
    %r204 = alloca i64
	store i64 1, ptr %r204
	%r203 = load i64, ptr %r204
    %r209 = alloca i64
	store i64 2, ptr %r209
	%r208 = load i64, ptr %r209
    %r214 = alloca i64
	store i64 3, ptr %r214
	%r213 = load i64, ptr %r214
    %r222 = alloca ptr
	store ptr null, ptr %r222
	%r221 = load ptr, ptr %r222
    %r227 = alloca i1
	store i1 0, ptr %r227
	%r226 = load i1, ptr %r227
    %r239 = alloca ptr
	store ptr null, ptr %r239
	%r238 = load ptr, ptr %r239
    %r244 = alloca i1
	store i1 0, ptr %r244
	%r243 = load i1, ptr %r244
    %r250 = alloca i64
	store i64 0, ptr %r250
	%r249 = load i64, ptr %r250
    %r133 = bitcast ptr %r131 to %struct._mini_plate*
    store ptr %r133, ptr @.r4
    %r136 = bitcast ptr %r134 to %struct._mini_plate*
    store ptr %r136, ptr @.r5
    %r139 = bitcast ptr %r137 to %struct._mini_plate*
    store ptr %r139, ptr @.r6
    store i64 %r140, ptr @.r7
    %r143 = call i32 @scanf(ptr @.r142, ptr %r127)
    %r144 = load i64, ptr %r127
    %r147 = icmp sge i64 %r144, %r145
    %r150 = icmp ne i1 %r147, %r148
    br i1 %r150, label %l27, label %l35
l27:
    %r151 = load i64, ptr %r127
    %r154 = icmp ne i64 %r151, %r152
    %r155 = icmp ne i1 %r154, %r156
    br i1 %r155, label %l29, label %l31
l29:
    %r159 = phi i64 [%r151, %l27], [%r169, %l29]
    %r162 = call ptr @malloc(i64 %r160)
    %r163 = bitcast ptr %r162 to %struct._mini_plate*
    %r164 = getelementptr inbounds %struct._mini_plate, ptr %r163, i32 0, i32 0
    store i64 %r159, ptr %r164
    %r165 = load ptr, ptr @.r4
    %r166 = getelementptr inbounds %struct._mini_plate, ptr %r163, i32 0, i32 1
    store ptr %r165, ptr %r166
    store ptr %r163, ptr @.r4
    %r169 = sub i64 %r159, %r167
    %r174 = icmp ne i64 %r169, %r172
    %r175 = icmp ne i1 %r174, %r176
    br i1 %r175, label %l29, label %l31
l31:
    %r183 = call i32 @printf(ptr @.r180, i64 %r181)
    %r184 = load ptr, ptr @.r4
    call void @_mini_printPeg(ptr %r184)
    %r188 = call i32 @printf(ptr @.r185, i64 %r186)
    %r189 = load ptr, ptr @.r5
    call void @_mini_printPeg(ptr %r189)
    %r193 = call i32 @printf(ptr @.r190, i64 %r191)
    %r194 = load ptr, ptr @.r6
    call void @_mini_printPeg(ptr %r194)
    %r195 = load i64, ptr %r127
    call void @_mini_hanoi(i64 %r195, i64 %r196, i64 %r198, i64 %r200)
    %r205 = call i32 @printf(ptr @.r202, i64 %r203)
    %r206 = load ptr, ptr @.r4
    call void @_mini_printPeg(ptr %r206)
    %r210 = call i32 @printf(ptr @.r207, i64 %r208)
    %r211 = load ptr, ptr @.r5
    call void @_mini_printPeg(ptr %r211)
    %r215 = call i32 @printf(ptr @.r212, i64 %r213)
    %r216 = load ptr, ptr @.r6
    call void @_mini_printPeg(ptr %r216)
    %r218 = load i64, ptr @.r7
    %r219 = call i32 @printf(ptr @.r217, i64 %r218)
    %r220 = load ptr, ptr @.r6
    %r223 = bitcast ptr %r221 to %struct._mini_plate*
    %r224 = icmp ne ptr %r220, %r223
    %r225 = icmp ne i1 %r224, %r226
    br i1 %r225, label %l32, label %l35
l32:
    %r230 = load ptr, ptr @.r6
    %r231 = load ptr, ptr @.r6
    %r232 = getelementptr inbounds %struct._mini_plate, ptr %r231, i32 0, i32 1
    %r233 = load ptr, ptr %r232
    store ptr %r233, ptr @.r6
    %r234 = bitcast ptr %r230 to i8*
    call void @free(ptr %r234)
    %r237 = load ptr, ptr @.r6
    %r240 = bitcast ptr %r238 to %struct._mini_plate*
    %r241 = icmp ne ptr %r237, %r240
    %r242 = icmp ne i1 %r241, %r243
    br i1 %r242, label %l32, label %l35
l35:
    ret i64 %r249
}
define i32 @main() {
l37:
    %r253 = call i64 @_mini_main()
    %r254 = trunc i64 %r253 to i32
    ret i32 %r254
}
