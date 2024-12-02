declare i32 @scanf(ptr, ...)
declare i32 @printf(ptr, ...)
declare ptr @malloc(i64)
declare void @free(ptr)
@.r4 = global i64 zeroinitializer
@.r5 = global i64 zeroinitializer
@.r6 = global i64 zeroinitializer


















@.r933 = private unnamed_addr constant [4 x i8] c"%ld\00"
@.r945 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r948 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r951 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r954 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r957 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r960 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r963 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r966 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r969 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r976 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r979 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r983 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r990 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r997 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"
@.r1011 = private unnamed_addr constant [5 x i8] c"%ld\0A\00"

define i64 @_mini_constantFolding() {
l2:
    %r1049 = alloca i64
	store i64 226, ptr %r1049
	%r1048 = load i64, ptr %r1049
    ret i64 %r1048
}
define i64 @_mini_constantPropagation() {
l4:
    %r1151 = alloca i64
	store i64 -25457889, ptr %r1151
	%r1150 = load i64, ptr %r1151
    ret i64 %r1150
}
define i64 @_mini_deadCodeElimination() {
l6:
    %r220 = alloca i64
	store i64 11, ptr %r220
	%r219 = load i64, ptr %r220
    %r222 = alloca i64
	store i64 5, ptr %r222
	%r221 = load i64, ptr %r222
    %r224 = alloca i64
	store i64 9, ptr %r224
	%r223 = load i64, ptr %r224
    %r1159 = alloca i64
	store i64 38, ptr %r1159
	%r1158 = load i64, ptr %r1159
    store i64 %r219, ptr @.r4
    store i64 %r221, ptr @.r4
    store i64 %r223, ptr @.r4
    ret i64 %r1158
}
define i64 @_mini_sum(i64 %r231) {
l8:
    %r235 = alloca i64
	store i64 0, ptr %r235
	%r234 = load i64, ptr %r235
    %r237 = alloca i64
	store i64 0, ptr %r237
	%r236 = load i64, ptr %r237
    %r241 = alloca i1
	store i1 0, ptr %r241
	%r240 = load i1, ptr %r241
    %r246 = alloca i64
	store i64 1, ptr %r246
	%r245 = load i64, ptr %r246
    %r251 = alloca i64
	store i64 0, ptr %r251
	%r250 = load i64, ptr %r251
    %r255 = alloca i1
	store i1 0, ptr %r255
	%r254 = load i1, ptr %r255
    %r238 = icmp sgt i64 %r231, %r236
    %r239 = icmp ne i1 %r238, %r240
    br i1 %r239, label %l9, label %l11
l9:
    %r242 = phi i64 [%r231, %l8], [%r247, %l9]
    %r243 = phi i64 [%r234, %l8], [%r244, %l9]
    %r244 = add i64 %r243, %r242
    %r247 = sub i64 %r242, %r245
    %r252 = icmp sgt i64 %r247, %r250
    %r253 = icmp ne i1 %r252, %r254
    br i1 %r253, label %l9, label %l11
l11:
    %r257 = phi i64 [%r234, %l8], [%r244, %l9]
    ret i64 %r257
}
define i64 @_mini_doesntModifyGlobals() {
l13:
    %r1161 = alloca i64
	store i64 3, ptr %r1161
	%r1160 = load i64, ptr %r1161
    ret i64 %r1160
}
define i64 @_mini_interProceduralOptimization() {
l15:
    %r274 = alloca i64
	store i64 1, ptr %r274
	%r273 = load i64, ptr %r274
    %r276 = alloca i64
	store i64 0, ptr %r276
	%r275 = load i64, ptr %r276
    %r278 = alloca i64
	store i64 0, ptr %r278
	%r277 = load i64, ptr %r278
    %r280 = alloca i64
	store i64 100, ptr %r280
	%r279 = load i64, ptr %r280
    %r284 = alloca i64
	store i64 1, ptr %r284
	%r283 = load i64, ptr %r284
    %r287 = alloca i1
	store i1 0, ptr %r287
	%r286 = load i1, ptr %r287
    %r290 = alloca i64
	store i64 10000, ptr %r290
	%r289 = load i64, ptr %r290
    %r294 = alloca i64
	store i64 2, ptr %r294
	%r293 = load i64, ptr %r294
    %r297 = alloca i1
	store i1 0, ptr %r297
	%r296 = load i1, ptr %r297
    %r300 = alloca i64
	store i64 20000, ptr %r300
	%r299 = load i64, ptr %r300
    %r305 = alloca i64
	store i64 3, ptr %r305
	%r304 = load i64, ptr %r305
    %r308 = alloca i1
	store i1 0, ptr %r308
	%r307 = load i1, ptr %r308
    %r311 = alloca i64
	store i64 30000, ptr %r311
	%r310 = load i64, ptr %r311
    store i64 %r273, ptr @.r4
    store i64 %r275, ptr @.r5
    store i64 %r277, ptr @.r6
    %r281 = call i64 @_mini_sum(i64 %r279)
    %r282 = load i64, ptr @.r4
    %r285 = icmp eq i64 %r282, %r283
    %r288 = icmp ne i1 %r285, %r286
    br i1 %r288, label %l16, label %l17
l16:
    %r291 = call i64 @_mini_sum(i64 %r289)
    br label %l24
l17:
    %r292 = load i64, ptr @.r5
    %r295 = icmp eq i64 %r292, %r293
    %r298 = icmp ne i1 %r295, %r296
    br i1 %r298, label %l18, label %l20
l18:
    %r301 = call i64 @_mini_sum(i64 %r299)
    br label %l20
l20:
    %r302 = phi i64 [%r301, %l18], [%r281, %l17]
    %r303 = load i64, ptr @.r6
    %r306 = icmp eq i64 %r303, %r304
    %r309 = icmp ne i1 %r306, %r307
    br i1 %r309, label %l21, label %l23
l21:
    %r312 = call i64 @_mini_sum(i64 %r310)
    br label %l23
l23:
    %r313 = phi i64 [%r312, %l21], [%r302, %l20]
    br label %l24
l24:
    %r314 = phi i64 [%r291, %l16], [%r313, %l23]
    ret i64 %r314
}
define i64 @_mini_commonSubexpressionElimination() {
l26:
    %r1409 = alloca i64
	store i64 -48796, ptr %r1409
	%r1408 = load i64, ptr %r1409
    ret i64 %r1408
}
define i64 @_mini_hoisting() {
l28:
    %r530 = alloca i64
	store i64 2, ptr %r530
	%r529 = load i64, ptr %r530
    %r536 = alloca i64
	store i64 0, ptr %r536
	%r535 = load i64, ptr %r536
    %r538 = alloca i64
	store i64 1000000, ptr %r538
	%r537 = load i64, ptr %r538
    %r542 = alloca i1
	store i1 0, ptr %r542
	%r541 = load i1, ptr %r542
    %r559 = alloca i64
	store i64 1, ptr %r559
	%r558 = load i64, ptr %r559
    %r571 = alloca i64
	store i64 1000000, ptr %r571
	%r570 = load i64, ptr %r571
    %r575 = alloca i1
	store i1 0, ptr %r575
	%r574 = load i1, ptr %r575
    %r539 = icmp slt i64 %r535, %r537
    %r540 = icmp ne i1 %r539, %r541
    br i1 %r540, label %l29, label %l31
l29:
    %r545 = phi i64 [%r545, %l29], [%r529, %l28]
    %r551 = phi i64 [%r560, %l29], [%r535, %l28]
    %r560 = add i64 %r551, %r558
    %r572 = icmp slt i64 %r560, %r570
    %r573 = icmp ne i1 %r572, %r574
    br i1 %r573, label %l29, label %l31
l31:
    %r578 = phi i64 [%r545, %l29], [%r529, %l28]
    ret i64 %r578
}
define i64 @_mini_doubleIf() {
l33:
    %r596 = alloca i64
	store i64 1, ptr %r596
	%r595 = load i64, ptr %r596
    %r602 = alloca i64
	store i64 0, ptr %r602
	%r601 = load i64, ptr %r602
    %r604 = alloca i64
	store i64 1, ptr %r604
	%r603 = load i64, ptr %r604
    %r607 = alloca i1
	store i1 0, ptr %r607
	%r606 = load i1, ptr %r607
    %r632 = alloca i64
	store i64 50, ptr %r632
	%r631 = load i64, ptr %r632
    %r605 = icmp eq i64 %r595, %r603
    %r608 = icmp ne i1 %r605, %r606
    br i1 %r608, label %l38, label %l39
l38:
    br label %l39
l39:
    %r633 = phi i64 [%r601, %l33], [%r631, %l38]
    ret i64 %r633
}
define i64 @_mini_integerDivide() {
l41:
    %r1425 = alloca i64
	store i64 736, ptr %r1425
	%r1424 = load i64, ptr %r1425
    ret i64 %r1424
}
define i64 @_mini_association() {
l43:
    %r1445 = alloca i64
	store i64 10, ptr %r1445
	%r1444 = load i64, ptr %r1445
    ret i64 %r1444
}
define i64 @_mini_tailRecursionHelper(i64 %r705, i64 %r706) {
l45:
    %r708 = alloca i64
	store i64 0, ptr %r708
	%r707 = load i64, ptr %r708
    %r711 = alloca i1
	store i1 0, ptr %r711
	%r710 = load i1, ptr %r711
    %r714 = alloca i64
	store i64 1, ptr %r714
	%r713 = load i64, ptr %r714
    %r709 = icmp eq i64 %r705, %r707
    %r712 = icmp ne i1 %r709, %r710
    br i1 %r712, label %l44, label %l47
l47:
    %r715 = sub i64 %r705, %r713
    %r716 = add i64 %r706, %r705
    %r717 = call i64 @_mini_tailRecursionHelper(i64 %r715, i64 %r716)
    br label %l44
l44:
    %r718 = phi i64 [%r706, %l45], [%r717, %l47]
    ret i64 %r718
}
define i64 @_mini_tailRecursion(i64 %r720) {
l49:
    %r722 = alloca i64
	store i64 0, ptr %r722
	%r721 = load i64, ptr %r722
    %r723 = call i64 @_mini_tailRecursionHelper(i64 %r720, i64 %r721)
    ret i64 %r723
}
define i64 @_mini_unswitching() {
l51:
    %r731 = alloca i64
	store i64 1, ptr %r731
	%r730 = load i64, ptr %r731
    %r733 = alloca i64
	store i64 2, ptr %r733
	%r732 = load i64, ptr %r733
    %r735 = alloca i64
	store i64 1000000, ptr %r735
	%r734 = load i64, ptr %r735
    %r739 = alloca i1
	store i1 0, ptr %r739
	%r738 = load i1, ptr %r739
    %r743 = alloca i64
	store i64 2, ptr %r743
	%r742 = load i64, ptr %r743
    %r746 = alloca i1
	store i1 0, ptr %r746
	%r745 = load i1, ptr %r746
    %r749 = alloca i64
	store i64 1, ptr %r749
	%r748 = load i64, ptr %r749
    %r752 = alloca i64
	store i64 2, ptr %r752
	%r751 = load i64, ptr %r752
    %r759 = alloca i64
	store i64 1000000, ptr %r759
	%r758 = load i64, ptr %r759
    %r763 = alloca i1
	store i1 0, ptr %r763
	%r762 = load i1, ptr %r763
    %r736 = icmp slt i64 %r730, %r734
    %r737 = icmp ne i1 %r736, %r738
    br i1 %r737, label %l52, label %l54
l52:
    %r740 = phi i64 [%r754, %l57], [%r732, %l51]
    %r741 = phi i64 [%r755, %l57], [%r730, %l51]
    %r744 = icmp eq i64 %r740, %r742
    %r747 = icmp ne i1 %r744, %r745
    br i1 %r747, label %l55, label %l56
l55:
    %r750 = add i64 %r741, %r748
    br label %l57
l56:
    %r753 = add i64 %r741, %r751
    br label %l57
l57:
    %r754 = phi i64 [%r740, %l56], [%r740, %l55]
    %r755 = phi i64 [%r753, %l56], [%r750, %l55]
    %r760 = icmp slt i64 %r755, %r758
    %r761 = icmp ne i1 %r760, %r762
    br i1 %r761, label %l52, label %l54
l54:
    %r765 = phi i64 [%r755, %l57], [%r730, %l51]
    ret i64 %r765
}
define i64 @_mini_randomCalculation(i64 %r768) {
l59:
    %r784 = alloca i64
	store i64 0, ptr %r784
	%r783 = load i64, ptr %r784
    %r786 = alloca i64
	store i64 0, ptr %r786
	%r785 = load i64, ptr %r786
    %r790 = alloca i1
	store i1 0, ptr %r790
	%r789 = load i1, ptr %r790
    %r1449 = alloca i64
	store i64 19, ptr %r1449
	%r1448 = load i64, ptr %r1449
    %r809 = alloca i64
	store i64 2, ptr %r809
	%r808 = load i64, ptr %r809
    %r812 = alloca i64
	store i64 2, ptr %r812
	%r811 = load i64, ptr %r812
    %r815 = alloca i64
	store i64 3, ptr %r815
	%r814 = load i64, ptr %r815
    %r818 = alloca i64
	store i64 3, ptr %r818
	%r817 = load i64, ptr %r818
    %r821 = alloca i64
	store i64 4, ptr %r821
	%r820 = load i64, ptr %r821
    %r824 = alloca i64
	store i64 4, ptr %r824
	%r823 = load i64, ptr %r824
    %r827 = alloca i64
	store i64 1, ptr %r827
	%r826 = load i64, ptr %r827
    %r840 = alloca i1
	store i1 0, ptr %r840
	%r839 = load i1, ptr %r840
    %r787 = icmp slt i64 %r783, %r768
    %r788 = icmp ne i1 %r787, %r789
    br i1 %r788, label %l60, label %l62
l60:
    %r795 = phi i64 [%r768, %l59], [%r795, %l60]
    %r797 = phi i64 [%r783, %l59], [%r828, %l60]
    %r798 = phi i64 [%r785, %l59], [%r807, %l60]
    %r807 = add i64 %r798, %r1448
    %r810 = mul i64 %r797, %r808
    %r813 = sdiv i64 %r810, %r811
    %r816 = mul i64 %r814, %r813
    %r819 = sdiv i64 %r816, %r817
    %r822 = mul i64 %r819, %r820
    %r825 = sdiv i64 %r822, %r823
    %r828 = add i64 %r825, %r826
    %r837 = icmp slt i64 %r828, %r795
    %r838 = icmp ne i1 %r837, %r839
    br i1 %r838, label %l60, label %l62
l62:
    %r848 = phi i64 [%r785, %l59], [%r807, %l60]
    ret i64 %r848
}
define i64 @_mini_iterativeFibonacci(i64 %r851) {
l64:
    %r1451 = alloca i64
	store i64 -1, ptr %r1451
	%r1450 = load i64, ptr %r1451
    %r868 = alloca i64
	store i64 1, ptr %r868
	%r867 = load i64, ptr %r868
    %r870 = alloca i64
	store i64 0, ptr %r870
	%r869 = load i64, ptr %r870
    %r874 = alloca i1
	store i1 0, ptr %r874
	%r873 = load i1, ptr %r874
    %r883 = alloca i64
	store i64 1, ptr %r883
	%r882 = load i64, ptr %r883
    %r894 = alloca i1
	store i1 0, ptr %r894
	%r893 = load i1, ptr %r894
    %r871 = icmp slt i64 %r869, %r851
    %r872 = icmp ne i1 %r871, %r873
    br i1 %r872, label %l65, label %l67
l65:
    %r875 = phi i64 [%r1450, %l64], [%r877, %l65]
    %r876 = phi i64 [%r851, %l64], [%r876, %l65]
    %r877 = phi i64 [%r867, %l64], [%r881, %l65]
    %r878 = phi i64 [%r869, %l64], [%r884, %l65]
    %r881 = add i64 %r877, %r875
    %r884 = add i64 %r878, %r882
    %r891 = icmp slt i64 %r884, %r876
    %r892 = icmp ne i1 %r891, %r893
    br i1 %r892, label %l65, label %l67
l67:
    %r897 = phi i64 [%r867, %l64], [%r881, %l65]
    ret i64 %r897
}
define i64 @_mini_recursiveFibonacci(i64 %r903) {
l69:
    %r905 = alloca i64
	store i64 0, ptr %r905
	%r904 = load i64, ptr %r905
    %r908 = alloca i64
	store i64 1, ptr %r908
	%r907 = load i64, ptr %r908
    %r913 = alloca i1
	store i1 0, ptr %r913
	%r912 = load i1, ptr %r913
    %r915 = alloca i1
	store i1 0, ptr %r915
	%r914 = load i1, ptr %r915
    %r918 = alloca i64
	store i64 1, ptr %r918
	%r917 = load i64, ptr %r918
    %r922 = alloca i64
	store i64 2, ptr %r922
	%r921 = load i64, ptr %r922
    %r906 = icmp sle i64 %r903, %r904
    %r909 = icmp eq i64 %r903, %r907
    %r910 = or i1 %r906, %r909
    %r911 = icmp ne i1 %r910, %r912
    %r916 = icmp ne i1 %r911, %r914
    br i1 %r916, label %l68, label %l71
l71:
    %r919 = sub i64 %r903, %r917
    %r920 = call i64 @_mini_recursiveFibonacci(i64 %r919)
    %r923 = sub i64 %r903, %r921
    %r924 = call i64 @_mini_recursiveFibonacci(i64 %r923)
    %r925 = add i64 %r920, %r924
    br label %l68
l68:
    %r926 = phi i64 [%r903, %l69], [%r925, %l71]
    ret i64 %r926
}
define i64 @_mini_main() {
l73:
    %r928 = alloca i64
    %r936 = alloca i64
	store i64 1, ptr %r936
	%r935 = load i64, ptr %r936
    %r941 = alloca i1
	store i1 0, ptr %r941
	%r940 = load i1, ptr %r941
    %r973 = alloca i64
	store i64 1000, ptr %r973
	%r972 = load i64, ptr %r973
    %r987 = alloca i64
	store i64 5, ptr %r987
	%r986 = load i64, ptr %r987
    %r994 = alloca i64
	store i64 1000, ptr %r994
	%r993 = load i64, ptr %r994
    %r1000 = alloca i64
	store i64 1, ptr %r1000
	%r999 = load i64, ptr %r1000
    %r1008 = alloca i1
	store i1 0, ptr %r1008
	%r1007 = load i1, ptr %r1008
    %r1013 = alloca i64
	store i64 9999, ptr %r1013
	%r1012 = load i64, ptr %r1013
    %r1016 = alloca i64
	store i64 0, ptr %r1016
	%r1015 = load i64, ptr %r1016
    %r934 = call i32 @scanf(ptr @.r933, ptr %r928)
    %r937 = load i64, ptr %r928
    %r938 = icmp slt i64 %r935, %r937
    %r939 = icmp ne i1 %r938, %r940
    br i1 %r939, label %l74, label %l76
l74:
    %r943 = phi i64 [%r1001, %l74], [%r935, %l73]
    %r944 = call i64 @_mini_constantFolding()
    %r946 = call i32 @printf(ptr @.r945, i64 %r944)
    %r947 = call i64 @_mini_constantPropagation()
    %r949 = call i32 @printf(ptr @.r948, i64 %r947)
    %r950 = call i64 @_mini_deadCodeElimination()
    %r952 = call i32 @printf(ptr @.r951, i64 %r950)
    %r953 = call i64 @_mini_interProceduralOptimization()
    %r955 = call i32 @printf(ptr @.r954, i64 %r953)
    %r956 = call i64 @_mini_commonSubexpressionElimination()
    %r958 = call i32 @printf(ptr @.r957, i64 %r956)
    %r959 = call i64 @_mini_hoisting()
    %r961 = call i32 @printf(ptr @.r960, i64 %r959)
    %r962 = call i64 @_mini_doubleIf()
    %r964 = call i32 @printf(ptr @.r963, i64 %r962)
    %r965 = call i64 @_mini_integerDivide()
    %r967 = call i32 @printf(ptr @.r966, i64 %r965)
    %r968 = call i64 @_mini_association()
    %r970 = call i32 @printf(ptr @.r969, i64 %r968)
    %r971 = load i64, ptr %r928
    %r974 = sdiv i64 %r971, %r972
    %r975 = call i64 @_mini_tailRecursion(i64 %r974)
    %r977 = call i32 @printf(ptr @.r976, i64 %r975)
    %r978 = call i64 @_mini_unswitching()
    %r980 = call i32 @printf(ptr @.r979, i64 %r978)
    %r981 = load i64, ptr %r928
    %r982 = call i64 @_mini_randomCalculation(i64 %r981)
    %r984 = call i32 @printf(ptr @.r983, i64 %r982)
    %r985 = load i64, ptr %r928
    %r988 = sdiv i64 %r985, %r986
    %r989 = call i64 @_mini_iterativeFibonacci(i64 %r988)
    %r991 = call i32 @printf(ptr @.r990, i64 %r989)
    %r992 = load i64, ptr %r928
    %r995 = sdiv i64 %r992, %r993
    %r996 = call i64 @_mini_recursiveFibonacci(i64 %r995)
    %r998 = call i32 @printf(ptr @.r997, i64 %r996)
    %r1001 = add i64 %r943, %r999
    %r1004 = load i64, ptr %r928
    %r1005 = icmp slt i64 %r1001, %r1004
    %r1006 = icmp ne i1 %r1005, %r1007
    br i1 %r1006, label %l74, label %l76
l76:
    %r1014 = call i32 @printf(ptr @.r1011, i64 %r1012)
    ret i64 %r1015
}
define i32 @main() {
l78:
    %r1019 = call i64 @_mini_main()
    %r1020 = trunc i64 %r1019 to i32
    ret i32 %r1020
}
