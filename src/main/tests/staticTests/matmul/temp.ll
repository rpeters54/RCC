declare ptr @memset(ptr, i32, i64)
declare i32 @printf(ptr, ...)

@.r242 = private unnamed_addr constant [34 x i8] c"Value at (row: %d, col: %d) = %d\0A\00"
define i32 @main() {
l2:
    %r11 = alloca [4 x [4 x i64]]
    %r13 = alloca i64
	store i64 1, ptr %r13
	%r12 = load i64, ptr %r13
    %r15 = alloca i64
	store i64 2, ptr %r15
	%r14 = load i64, ptr %r15
    %r17 = alloca i64
	store i64 3, ptr %r17
	%r16 = load i64, ptr %r17
    %r19 = alloca i64
	store i64 4, ptr %r19
	%r18 = load i64, ptr %r19
    %r21 = alloca i64
	store i64 5, ptr %r21
	%r20 = load i64, ptr %r21
    %r23 = alloca i64
	store i64 6, ptr %r23
	%r22 = load i64, ptr %r23
    %r25 = alloca i64
	store i64 7, ptr %r25
	%r24 = load i64, ptr %r25
    %r27 = alloca i64
	store i64 8, ptr %r27
	%r26 = load i64, ptr %r27
    %r29 = alloca i64
	store i64 9, ptr %r29
	%r28 = load i64, ptr %r29
    %r31 = alloca i64
	store i64 10, ptr %r31
	%r30 = load i64, ptr %r31
    %r33 = alloca i64
	store i64 11, ptr %r33
	%r32 = load i64, ptr %r33
    %r35 = alloca i64
	store i64 12, ptr %r35
	%r34 = load i64, ptr %r35
    %r36 = alloca [4 x [3 x i64]]
    %r50 = alloca i64
	store i64 1, ptr %r50
	%r49 = load i64, ptr %r50
    %r52 = alloca i64
	store i64 4, ptr %r52
	%r51 = load i64, ptr %r52
    %r54 = alloca i64
	store i64 7, ptr %r54
	%r53 = load i64, ptr %r54
    %r56 = alloca i64
	store i64 10, ptr %r56
	%r55 = load i64, ptr %r56
    %r58 = alloca i64
	store i64 2, ptr %r58
	%r57 = load i64, ptr %r58
    %r60 = alloca i64
	store i64 5, ptr %r60
	%r59 = load i64, ptr %r60
    %r62 = alloca i64
	store i64 8, ptr %r62
	%r61 = load i64, ptr %r62
    %r64 = alloca i64
	store i64 11, ptr %r64
	%r63 = load i64, ptr %r64
    %r66 = alloca i64
	store i64 3, ptr %r66
	%r65 = load i64, ptr %r66
    %r68 = alloca i64
	store i64 6, ptr %r68
	%r67 = load i64, ptr %r68
    %r70 = alloca i64
	store i64 9, ptr %r70
	%r69 = load i64, ptr %r70
    %r72 = alloca i64
	store i64 12, ptr %r72
	%r71 = load i64, ptr %r72
    %r73 = alloca [3 x [4 x i64]]
    %r87 = alloca i64
	store i64 0, ptr %r87
	%r86 = load i64, ptr %r87
    %r294 = alloca i64
	store i64 128, ptr %r294
	%r293 = load i64, ptr %r294
    %r100 = alloca i64
	store i64 0, ptr %r100
	%r99 = load i64, ptr %r100
    %r103 = alloca i64
	store i64 4, ptr %r103
	%r102 = load i64, ptr %r103
    %r108 = alloca i1
	store i1 0, ptr %r108
	%r107 = load i1, ptr %r108
    %r114 = alloca i64
	store i64 0, ptr %r114
	%r113 = load i64, ptr %r114
    %r117 = alloca i64
	store i64 4, ptr %r117
	%r116 = load i64, ptr %r117
    %r122 = alloca i1
	store i1 0, ptr %r122
	%r121 = load i1, ptr %r122
    %r128 = alloca i64
	store i64 0, ptr %r128
	%r127 = load i64, ptr %r128
    %r131 = alloca i64
	store i64 3, ptr %r131
	%r130 = load i64, ptr %r131
    %r136 = alloca i1
	store i1 0, ptr %r136
	%r135 = load i1, ptr %r136
    %r159 = alloca i64
	store i64 1, ptr %r159
	%r158 = load i64, ptr %r159
    %r164 = alloca i64
	store i64 3, ptr %r164
	%r163 = load i64, ptr %r164
    %r169 = alloca i1
	store i1 0, ptr %r169
	%r168 = load i1, ptr %r169
    %r179 = alloca i64
	store i64 1, ptr %r179
	%r178 = load i64, ptr %r179
    %r184 = alloca i64
	store i64 4, ptr %r184
	%r183 = load i64, ptr %r184
    %r189 = alloca i1
	store i1 0, ptr %r189
	%r188 = load i1, ptr %r189
    %r199 = alloca i64
	store i64 1, ptr %r199
	%r198 = load i64, ptr %r199
    %r204 = alloca i64
	store i64 4, ptr %r204
	%r203 = load i64, ptr %r204
    %r209 = alloca i1
	store i1 0, ptr %r209
	%r208 = load i1, ptr %r209
    %r215 = alloca i64
	store i64 0, ptr %r215
	%r214 = load i64, ptr %r215
    %r218 = alloca i64
	store i64 4, ptr %r218
	%r217 = load i64, ptr %r218
    %r223 = alloca i1
	store i1 0, ptr %r223
	%r222 = load i1, ptr %r223
    %r229 = alloca i64
	store i64 0, ptr %r229
	%r228 = load i64, ptr %r229
    %r232 = alloca i64
	store i64 4, ptr %r232
	%r231 = load i64, ptr %r232
    %r237 = alloca i1
	store i1 0, ptr %r237
	%r236 = load i1, ptr %r237
    %r252 = alloca i64
	store i64 1, ptr %r252
	%r251 = load i64, ptr %r252
    %r257 = alloca i64
	store i64 4, ptr %r257
	%r256 = load i64, ptr %r257
    %r262 = alloca i1
	store i1 0, ptr %r262
	%r261 = load i1, ptr %r262
    %r272 = alloca i64
	store i64 1, ptr %r272
	%r271 = load i64, ptr %r272
    %r277 = alloca i64
	store i64 4, ptr %r277
	%r276 = load i64, ptr %r277
    %r282 = alloca i1
	store i1 0, ptr %r282
	%r281 = load i1, ptr %r282
    %r288 = alloca i64
	store i64 0, ptr %r288
	%r287 = load i64, ptr %r288
    %r37 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 0, i64 0
    store i64 %r12, ptr %r37
    %r38 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 0, i64 1
    store i64 %r14, ptr %r38
    %r39 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 0, i64 2
    store i64 %r16, ptr %r39
    %r40 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 1, i64 0
    store i64 %r18, ptr %r40
    %r41 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 1, i64 1
    store i64 %r20, ptr %r41
    %r42 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 1, i64 2
    store i64 %r22, ptr %r42
    %r43 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 2, i64 0
    store i64 %r24, ptr %r43
    %r44 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 2, i64 1
    store i64 %r26, ptr %r44
    %r45 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 2, i64 2
    store i64 %r28, ptr %r45
    %r46 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 3, i64 0
    store i64 %r30, ptr %r46
    %r47 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 3, i64 1
    store i64 %r32, ptr %r47
    %r48 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i64 0, i64 3, i64 2
    store i64 %r34, ptr %r48
    %r74 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 0, i64 0
    store i64 %r49, ptr %r74
    %r75 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 0, i64 1
    store i64 %r51, ptr %r75
    %r76 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 0, i64 2
    store i64 %r53, ptr %r76
    %r77 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 0, i64 3
    store i64 %r55, ptr %r77
    %r78 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 1, i64 0
    store i64 %r57, ptr %r78
    %r79 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 1, i64 1
    store i64 %r59, ptr %r79
    %r80 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 1, i64 2
    store i64 %r61, ptr %r80
    %r81 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 1, i64 3
    store i64 %r63, ptr %r81
    %r82 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 2, i64 0
    store i64 %r65, ptr %r82
    %r83 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 2, i64 1
    store i64 %r67, ptr %r83
    %r84 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 2, i64 2
    store i64 %r69, ptr %r84
    %r85 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i64 0, i64 2, i64 3
    store i64 %r71, ptr %r85
    %r96 = bitcast ptr %r11 to i8*
    %r97 = trunc i64 %r86 to i32
    %r98 = call ptr @memset(ptr %r96, i32 %r97, i64 %r293)
    %r101 = trunc i64 %r99 to i32
    %r104 = sext i32 %r101 to i64
    %r105 = icmp slt i64 %r104, %r102
    %r106 = icmp ne i1 %r105, %r107
    br i1 %r106, label %l3, label %l5
l3:
    %r110 = phi i32 [%r101, %l2], [%r202, %l8]
    %r115 = trunc i64 %r113 to i32
    %r118 = sext i32 %r115 to i64
    %r119 = icmp slt i64 %r118, %r116
    %r120 = icmp ne i1 %r119, %r121
    br i1 %r120, label %l6, label %l8
l6:
    %r124 = phi i32 [%r171, %l11], [%r110, %l3]
    %r125 = phi i32 [%r182, %l11], [%r115, %l3]
    %r129 = trunc i64 %r127 to i32
    %r132 = sext i32 %r129 to i64
    %r133 = icmp slt i64 %r132, %r130
    %r134 = icmp ne i1 %r133, %r135
    br i1 %r134, label %l9, label %l11
l9:
    %r137 = phi i32 [%r162, %l9], [%r129, %l6]
    %r138 = phi i32 [%r138, %l9], [%r124, %l6]
    %r139 = phi i32 [%r139, %l9], [%r125, %l6]
    %r141 = getelementptr inbounds [4 x [4 x i64]], ptr %r11, i32 0, i32 %r138
    %r142 = getelementptr inbounds [4 x i64], ptr %r141, i32 0, i32 %r139
    %r143 = load i64, ptr %r142
    %r144 = getelementptr inbounds [4 x [3 x i64]], ptr %r36, i32 0, i32 %r138
    %r145 = getelementptr inbounds [3 x i64], ptr %r144, i32 0, i32 %r137
    %r146 = load i64, ptr %r145
    %r147 = getelementptr inbounds [3 x [4 x i64]], ptr %r73, i32 0, i32 %r137
    %r148 = getelementptr inbounds [4 x i64], ptr %r147, i32 0, i32 %r139
    %r149 = load i64, ptr %r148
    %r150 = mul i64 %r146, %r149
    %r151 = add i64 %r143, %r150
    %r152 = getelementptr inbounds [4 x [4 x i64]], ptr %r11, i32 0, i32 %r138
    %r153 = getelementptr inbounds [4 x i64], ptr %r152, i32 0, i32 %r139
    store i64 %r151, ptr %r153
    %r160 = sext i32 %r137 to i64
    %r161 = add i64 %r160, %r158
    %r162 = trunc i64 %r161 to i32
    %r165 = sext i32 %r162 to i64
    %r166 = icmp slt i64 %r165, %r163
    %r167 = icmp ne i1 %r166, %r168
    br i1 %r167, label %l9, label %l11
l11:
    %r171 = phi i32 [%r138, %l9], [%r124, %l6]
    %r172 = phi i32 [%r139, %l9], [%r125, %l6]
    %r180 = sext i32 %r172 to i64
    %r181 = add i64 %r180, %r178
    %r182 = trunc i64 %r181 to i32
    %r185 = sext i32 %r182 to i64
    %r186 = icmp slt i64 %r185, %r183
    %r187 = icmp ne i1 %r186, %r188
    br i1 %r187, label %l6, label %l8
l8:
    %r191 = phi i32 [%r171, %l11], [%r110, %l3]
    %r200 = sext i32 %r191 to i64
    %r201 = add i64 %r200, %r198
    %r202 = trunc i64 %r201 to i32
    %r205 = sext i32 %r202 to i64
    %r206 = icmp slt i64 %r205, %r203
    %r207 = icmp ne i1 %r206, %r208
    br i1 %r207, label %l3, label %l5
l5:
    %r216 = trunc i64 %r214 to i32
    %r219 = sext i32 %r216 to i64
    %r220 = icmp slt i64 %r219, %r217
    %r221 = icmp ne i1 %r220, %r222
    br i1 %r221, label %l12, label %l14
l12:
    %r227 = phi i32 [%r216, %l5], [%r275, %l17]
    %r230 = trunc i64 %r228 to i32
    %r233 = sext i32 %r230 to i64
    %r234 = icmp slt i64 %r233, %r231
    %r235 = icmp ne i1 %r234, %r236
    br i1 %r235, label %l15, label %l17
l15:
    %r238 = phi i32 [%r230, %l12], [%r255, %l15]
    %r241 = phi i32 [%r227, %l12], [%r241, %l15]
    %r243 = getelementptr inbounds [4 x [4 x i64]], ptr %r11, i32 0, i32 %r241
    %r244 = getelementptr inbounds [4 x i64], ptr %r243, i32 0, i32 %r238
    %r245 = load i64, ptr %r244
    %r246 = call i32 @printf(ptr @.r242, i32 %r241, i32 %r238, i64 %r245)
    %r253 = sext i32 %r238 to i64
    %r254 = add i64 %r253, %r251
    %r255 = trunc i64 %r254 to i32
    %r258 = sext i32 %r255 to i64
    %r259 = icmp slt i64 %r258, %r256
    %r260 = icmp ne i1 %r259, %r261
    br i1 %r260, label %l15, label %l17
l17:
    %r266 = phi i32 [%r227, %l12], [%r241, %l15]
    %r273 = sext i32 %r266 to i64
    %r274 = add i64 %r273, %r271
    %r275 = trunc i64 %r274 to i32
    %r278 = sext i32 %r275 to i64
    %r279 = icmp slt i64 %r278, %r276
    %r280 = icmp ne i1 %r279, %r281
    br i1 %r280, label %l12, label %l14
l14:
    %r289 = trunc i64 %r287 to i32
    ret i32 %r289
}
