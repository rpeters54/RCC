%struct.anon.0 = type {
    i32,
    ptr
}

%struct.Node = type {
    ptr,
    ptr
}

declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)




@.r32 = private unnamed_addr constant [24 x i8] c"Value in the stack: %d\0A\00"
@.r69 = private unnamed_addr constant [24 x i8] c"Value in the stack: %d\0A\00"
define i32 @main() {
l2:
    %r16 = alloca i64
	store i64 0, ptr %r16
	%r15 = load i64, ptr %r16
    %r19 = alloca i64
	store i64 100, ptr %r19
	%r18 = load i64, ptr %r19
    %r24 = alloca i1
	store i1 0, ptr %r24
	%r23 = load i1, ptr %r24
    %r29 = alloca i64
	store i64 4, ptr %r29
	%r28 = load i64, ptr %r29
    %r40 = alloca i64
	store i64 1, ptr %r40
	%r39 = load i64, ptr %r40
    %r45 = alloca i64
	store i64 100, ptr %r45
	%r44 = load i64, ptr %r45
    %r50 = alloca i1
	store i1 0, ptr %r50
	%r49 = load i1, ptr %r50
    %r55 = alloca i64
	store i64 0, ptr %r55
	%r54 = load i64, ptr %r55
    %r58 = alloca i64
	store i64 100, ptr %r58
	%r57 = load i64, ptr %r58
    %r63 = alloca i1
	store i1 0, ptr %r63
	%r62 = load i1, ptr %r63
    %r76 = alloca i64
	store i64 1, ptr %r76
	%r75 = load i64, ptr %r76
    %r81 = alloca i64
	store i64 100, ptr %r81
	%r80 = load i64, ptr %r81
    %r86 = alloca i1
	store i1 0, ptr %r86
	%r85 = load i1, ptr %r86
    %r91 = alloca i64
	store i64 0, ptr %r91
	%r90 = load i64, ptr %r91
    %r14 = call ptr @make()
    %r17 = trunc i64 %r15 to i32
    %r20 = sext i32 %r17 to i64
    %r21 = icmp slt i64 %r20, %r18
    %r22 = icmp ne i1 %r21, %r23
    br i1 %r22, label %l3, label %l5
l3:
    %r25 = phi ptr [%r25, %l3], [%r14, %l2]
    %r26 = phi i32 [%r43, %l3], [%r17, %l2]
    %r30 = call ptr @malloc(i64 %r28)
    %r31 = bitcast ptr %r30 to i32*
    store i32 %r26, ptr %r31
    %r33 = load i32, ptr %r31
    %r34 = call i32 @printf(ptr @.r32, i32 %r33)
    %r35 = bitcast ptr %r31 to i8*
    call void @push(ptr %r25, ptr %r35)
    %r41 = sext i32 %r26 to i64
    %r42 = add i64 %r41, %r39
    %r43 = trunc i64 %r42 to i32
    %r46 = sext i32 %r43 to i64
    %r47 = icmp slt i64 %r46, %r44
    %r48 = icmp ne i1 %r47, %r49
    br i1 %r48, label %l3, label %l5
l5:
    %r51 = phi ptr [%r25, %l3], [%r14, %l2]
    %r56 = trunc i64 %r54 to i32
    %r59 = sext i32 %r56 to i64
    %r60 = icmp slt i64 %r59, %r57
    %r61 = icmp ne i1 %r60, %r62
    br i1 %r61, label %l6, label %l8
l6:
    %r64 = phi ptr [%r64, %l6], [%r51, %l5]
    %r65 = phi i32 [%r79, %l6], [%r56, %l5]
    %r67 = call ptr @pop(ptr %r64)
    %r68 = bitcast ptr %r67 to i32*
    %r70 = load i32, ptr %r68
    %r71 = call i32 @printf(ptr @.r69, i32 %r70)
    %r77 = sext i32 %r65 to i64
    %r78 = add i64 %r77, %r75
    %r79 = trunc i64 %r78 to i32
    %r82 = sext i32 %r79 to i64
    %r83 = icmp slt i64 %r82, %r80
    %r84 = icmp ne i1 %r83, %r85
    br i1 %r84, label %l6, label %l8
l8:
    %r92 = trunc i64 %r90 to i32
    ret i32 %r92
}
define ptr @pop(ptr %r94) {
l10:
    %r100 = alloca i64
	store i64 0, ptr %r100
	%r99 = load i64, ptr %r100
    %r104 = alloca i1
	store i1 0, ptr %r104
	%r103 = load i1, ptr %r104
    %r107 = alloca ptr
	store ptr null, ptr %r107
	%r106 = load ptr, ptr %r107
    %r120 = alloca i64
	store i64 1, ptr %r120
	%r119 = load i64, ptr %r120
    %r97 = getelementptr inbounds %struct.anon.0, ptr %r94, i32 0, i32 0
    %r98 = load i32, ptr %r97
    %r101 = sext i32 %r98 to i64
    %r102 = icmp eq i64 %r101, %r99
    %r105 = icmp ne i1 %r102, %r103
    br i1 %r105, label %l11, label %l13
l11:
    br label %l9
l13:
    %r108 = getelementptr inbounds %struct.anon.0, ptr %r94, i32 0, i32 1
    %r109 = load ptr, ptr %r108
    %r110 = getelementptr inbounds %struct.Node, ptr %r109, i32 0, i32 0
    %r111 = load ptr, ptr %r110
    %r112 = getelementptr inbounds %struct.anon.0, ptr %r94, i32 0, i32 1
    %r113 = load ptr, ptr %r112
    %r114 = getelementptr inbounds %struct.Node, ptr %r113, i32 0, i32 1
    %r115 = load ptr, ptr %r114
    %r116 = getelementptr inbounds %struct.anon.0, ptr %r94, i32 0, i32 1
    store ptr %r115, ptr %r116
    %r117 = getelementptr inbounds %struct.anon.0, ptr %r94, i32 0, i32 0
    %r118 = load i32, ptr %r117
    %r121 = sext i32 %r118 to i64
    %r122 = sub i64 %r121, %r119
    %r123 = getelementptr inbounds %struct.anon.0, ptr %r94, i32 0, i32 0
    %r124 = trunc i64 %r122 to i32
    store i32 %r124, ptr %r123
    br label %l9
l9:
    %r125 = phi ptr [%r106, %l11], [%r111, %l13]
    ret ptr %r125
}
define void @push(ptr %r126, ptr %r127) {
l15:
    %r129 = alloca i64
	store i64 16, ptr %r129
	%r128 = load i64, ptr %r129
    %r133 = alloca ptr
	store ptr null, ptr %r133
	%r132 = load ptr, ptr %r133
    %r137 = alloca i1
	store i1 0, ptr %r137
	%r136 = load i1, ptr %r137
    %r147 = alloca i64
	store i64 1, ptr %r147
	%r146 = load i64, ptr %r147
    %r130 = call ptr @malloc(i64 %r128)
    %r131 = bitcast ptr %r130 to %struct.Node*
    %r134 = bitcast ptr %r132 to %struct.Node*
    %r135 = icmp eq ptr %r131, %r134
    %r138 = icmp ne i1 %r135, %r136
    br i1 %r138, label %l14, label %l18
l18:
    %r139 = getelementptr inbounds %struct.Node, ptr %r131, i32 0, i32 0
    store ptr %r127, ptr %r139
    %r140 = getelementptr inbounds %struct.anon.0, ptr %r126, i32 0, i32 1
    %r141 = load ptr, ptr %r140
    %r142 = getelementptr inbounds %struct.Node, ptr %r131, i32 0, i32 1
    store ptr %r141, ptr %r142
    %r143 = getelementptr inbounds %struct.anon.0, ptr %r126, i32 0, i32 1
    store ptr %r131, ptr %r143
    %r144 = getelementptr inbounds %struct.anon.0, ptr %r126, i32 0, i32 0
    %r145 = load i32, ptr %r144
    %r148 = sext i32 %r145 to i64
    %r149 = add i64 %r148, %r146
    %r150 = getelementptr inbounds %struct.anon.0, ptr %r126, i32 0, i32 0
    %r151 = trunc i64 %r149 to i32
    store i32 %r151, ptr %r150
    br label %l14
l14:
    ret void
}
define ptr @make() {
l20:
    %r153 = alloca i64
	store i64 12, ptr %r153
	%r152 = load i64, ptr %r153
    %r157 = alloca ptr
	store ptr null, ptr %r157
	%r156 = load ptr, ptr %r157
    %r161 = alloca i1
	store i1 0, ptr %r161
	%r160 = load i1, ptr %r161
    %r164 = alloca ptr
	store ptr null, ptr %r164
	%r163 = load ptr, ptr %r164
    %r167 = alloca i64
	store i64 0, ptr %r167
	%r166 = load i64, ptr %r167
    %r171 = alloca ptr
	store ptr null, ptr %r171
	%r170 = load ptr, ptr %r171
    %r154 = call ptr @malloc(i64 %r152)
    %r155 = bitcast ptr %r154 to %struct.anon.0*
    %r158 = bitcast ptr %r156 to %struct.anon.0*
    %r159 = icmp eq ptr %r155, %r158
    %r162 = icmp ne i1 %r159, %r160
    br i1 %r162, label %l21, label %l23
l21:
    %r165 = bitcast ptr %r163 to %struct.anon.0*
    br label %l19
l23:
    %r168 = getelementptr inbounds %struct.anon.0, ptr %r155, i32 0, i32 0
    %r169 = trunc i64 %r166 to i32
    store i32 %r169, ptr %r168
    %r172 = getelementptr inbounds %struct.anon.0, ptr %r155, i32 0, i32 1
    %r173 = bitcast ptr %r170 to %struct.Node*
    store ptr %r173, ptr %r172
    br label %l19
l19:
    %r174 = phi ptr [%r165, %l21], [%r155, %l23]
    ret ptr %r174
}
