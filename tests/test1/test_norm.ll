; ModuleID = 'test_norm.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Start Testing\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"doing A\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"doing B\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = getelementptr [15 x i8], [15 x i8]* @.str, i64 0, i64 0
  %2 = call i32 (i8*, ...) @printf(i8* %1)
  br label %3

3:                                                ; preds = %14, %0
  %.01 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %exitcond6 = icmp ne i32 %.01, 5
  br i1 %exitcond6, label %5, label %4, !noelle.loop.id !2

4:                                                ; preds = %3
  br label %16

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %11, %5
  %.02 = phi i32 [ 0, %5 ], [ %12, %11 ]
  %exitcond5 = icmp ne i32 %.02, 5
  br i1 %exitcond5, label %8, label %7, !noelle.loop.id !3

7:                                                ; preds = %6
  br label %13

8:                                                ; preds = %6
  %9 = getelementptr [9 x i8], [9 x i8]* @.str.1, i64 0, i64 0
  %10 = call i32 (i8*, ...) @printf(i8* %9)
  br label %11

11:                                               ; preds = %8
  %12 = add nuw nsw i32 %.02, 1
  br label %6

13:                                               ; preds = %7
  br label %14

14:                                               ; preds = %13
  %15 = add nuw nsw i32 %.01, 1
  br label %3

16:                                               ; preds = %4
  br label %17

17:                                               ; preds = %28, %16
  %.03 = phi i32 [ 0, %16 ], [ %29, %28 ]
  %exitcond4 = icmp ne i32 %.03, 5
  br i1 %exitcond4, label %19, label %18, !noelle.loop.id !4

18:                                               ; preds = %17
  br label %30

19:                                               ; preds = %17
  br label %20

20:                                               ; preds = %25, %19
  %.0 = phi i32 [ 0, %19 ], [ %26, %25 ]
  %exitcond = icmp ne i32 %.0, 5
  br i1 %exitcond, label %22, label %21, !noelle.loop.id !5

21:                                               ; preds = %20
  br label %27

22:                                               ; preds = %20
  %23 = getelementptr [9 x i8], [9 x i8]* @.str.2, i64 0, i64 0
  %24 = call i32 (i8*, ...) @printf(i8* %23)
  br label %25

25:                                               ; preds = %22
  %26 = add nuw nsw i32 %.0, 1
  br label %20

27:                                               ; preds = %21
  br label %28

28:                                               ; preds = %27
  %29 = add nuw nsw i32 %.03, 1
  br label %17

30:                                               ; preds = %18
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

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (git@github.com:scampanoni/LLVM_installer.git 713d2f6594d9a0b77e7f9a120aaa7c917715a640)"}
!2 = !{!"0"}
!3 = !{!"1"}
!4 = !{!"2"}
!5 = !{!"3"}
