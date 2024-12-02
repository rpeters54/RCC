; ModuleID = 'floats.c'
source_filename = "floats.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx15.0.0"

@.str = private unnamed_addr constant [17 x i8] c"Trying Doubles:\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"da is %f\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"db is %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Add: %f\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Sub: %f\0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"Multiply: %f\0A\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"Divide: %f\0A\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"Trying Floats:\0A\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"fa is %f\0A\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"fb is %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store i32 0, ptr %1, align 4
  call void @srand(i32 noundef 0)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %36, %0
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 1000
  br i1 %10, label %11, label %39

11:                                               ; preds = %8
  %12 = call i32 (...) @rand()
  %13 = sitofp i32 %12 to double
  store double %13, ptr %3, align 8
  %14 = call i32 (...) @rand()
  %15 = sitofp i32 %14 to double
  store double %15, ptr %4, align 8
  %16 = load double, ptr %3, align 8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %16)
  %18 = load double, ptr %4, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %18)
  %20 = load double, ptr %3, align 8
  %21 = load double, ptr %4, align 8
  %22 = fadd double %20, %21
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %22)
  %24 = load double, ptr %3, align 8
  %25 = load double, ptr %4, align 8
  %26 = fsub double %24, %25
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %26)
  %28 = load double, ptr %3, align 8
  %29 = load double, ptr %4, align 8
  %30 = fmul double %28, %29
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %30)
  %32 = load double, ptr %3, align 8
  %33 = load double, ptr %4, align 8
  %34 = fdiv double %32, %33
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %34)
  br label %36

36:                                               ; preds = %11
  %37 = load i32, ptr %2, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %2, align 4
  br label %8, !llvm.loop !6

39:                                               ; preds = %8
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 0, ptr %2, align 4
  br label %41

41:                                               ; preds = %75, %39
  %42 = load i32, ptr %2, align 4
  %43 = icmp slt i32 %42, 1000
  br i1 %43, label %44, label %78

44:                                               ; preds = %41
  %45 = call i32 (...) @rand()
  %46 = sitofp i32 %45 to float
  store float %46, ptr %5, align 4
  %47 = call i32 (...) @rand()
  %48 = sitofp i32 %47 to float
  store float %48, ptr %6, align 4
  %49 = load float, ptr %5, align 4
  %50 = fpext float %49 to double
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, double noundef %50)
  %52 = load float, ptr %6, align 4
  %53 = fpext float %52 to double
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %53)
  %55 = load float, ptr %5, align 4
  %56 = load float, ptr %6, align 4
  %57 = fadd float %55, %56
  %58 = fpext float %57 to double
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %58)
  %60 = load float, ptr %5, align 4
  %61 = load float, ptr %6, align 4
  %62 = fsub float %60, %61
  %63 = fpext float %62 to double
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %63)
  %65 = load float, ptr %5, align 4
  %66 = load float, ptr %6, align 4
  %67 = fmul float %65, %66
  %68 = fpext float %67 to double
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %68)
  %70 = load float, ptr %5, align 4
  %71 = load float, ptr %6, align 4
  %72 = fdiv float %70, %71
  %73 = fpext float %72 to double
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %73)
  br label %75

75:                                               ; preds = %44
  %76 = load i32, ptr %2, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %2, align 4
  br label %41, !llvm.loop !8

78:                                               ; preds = %41
  ret i32 0
}

declare void @srand(i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @rand(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "darwin-stkchk-strong-link" "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cmov,+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "darwin-stkchk-strong-link" "frame-pointer"="all" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cmov,+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Apple clang version 16.0.0 (clang-1600.0.26.4)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
