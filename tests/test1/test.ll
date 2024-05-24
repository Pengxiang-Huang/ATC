; ModuleID = 'test.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Start Testing\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"doing A\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"doing B\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0))
  %8 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3
  store i32 0, i32* %2, align 4, !tbaa !2
  br label %9

9:                                                ; preds = %27, %0
  %10 = load i32, i32* %2, align 4, !tbaa !2
  %11 = icmp slt i32 %10, 5
  br i1 %11, label %14, label %12

12:                                               ; preds = %9
  store i32 2, i32* %3, align 4
  %13 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #3
  br label %30

14:                                               ; preds = %9
  %15 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #3
  store i32 0, i32* %4, align 4, !tbaa !2
  br label %16

16:                                               ; preds = %23, %14
  %17 = load i32, i32* %4, align 4, !tbaa !2
  %18 = icmp slt i32 %17, 5
  br i1 %18, label %21, label %19

19:                                               ; preds = %16
  store i32 5, i32* %3, align 4
  %20 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #3
  br label %26

21:                                               ; preds = %16
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  br label %23

23:                                               ; preds = %21
  %24 = load i32, i32* %4, align 4, !tbaa !2
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %4, align 4, !tbaa !2
  br label %16

26:                                               ; preds = %19
  br label %27

27:                                               ; preds = %26
  %28 = load i32, i32* %2, align 4, !tbaa !2
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %2, align 4, !tbaa !2
  br label %9

30:                                               ; preds = %12
  %31 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %31) #3
  store i32 0, i32* %5, align 4, !tbaa !2
  br label %32

32:                                               ; preds = %50, %30
  %33 = load i32, i32* %5, align 4, !tbaa !2
  %34 = icmp slt i32 %33, 5
  br i1 %34, label %37, label %35

35:                                               ; preds = %32
  store i32 8, i32* %3, align 4
  %36 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #3
  br label %53

37:                                               ; preds = %32
  %38 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %38) #3
  store i32 0, i32* %6, align 4, !tbaa !2
  br label %39

39:                                               ; preds = %46, %37
  %40 = load i32, i32* %6, align 4, !tbaa !2
  %41 = icmp slt i32 %40, 5
  br i1 %41, label %44, label %42

42:                                               ; preds = %39
  store i32 11, i32* %3, align 4
  %43 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #3
  br label %49

44:                                               ; preds = %39
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0))
  br label %46

46:                                               ; preds = %44
  %47 = load i32, i32* %6, align 4, !tbaa !2
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %6, align 4, !tbaa !2
  br label %39

49:                                               ; preds = %42
  br label %50

50:                                               ; preds = %49
  %51 = load i32, i32* %5, align 4, !tbaa !2
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %5, align 4, !tbaa !2
  br label %32

53:                                               ; preds = %35
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (git@github.com:scampanoni/LLVM_installer.git 713d2f6594d9a0b77e7f9a120aaa7c917715a640)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
