; ModuleID = 'test_with_metadata.bc'
source_filename = "test.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"Start Testing\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"doing A\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"doing B\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 !noelle.pdg.edges !3 {
  %1 = getelementptr [15 x i8], [15 x i8]* @.str, i64 0, i64 0, !noelle.pdg.inst.id !24
  %2 = call i32 (i8*, ...) @printf(i8* %1), !noelle.pdg.inst.id !5
  br label %3, !noelle.pdg.inst.id !25

3:                                                ; preds = %14, %0
  %.01 = phi i32 [ 0, %0 ], [ %15, %14 ], !noelle.pdg.inst.id !26
  %exitcond6 = icmp ne i32 %.01, 5, !noelle.pdg.inst.id !27
  br i1 %exitcond6, label %5, label %4, !noelle.loop.id !28, !noelle.pdg.inst.id !29

4:                                                ; preds = %3
  br label %16, !noelle.pdg.inst.id !30

5:                                                ; preds = %3
  br label %6, !noelle.pdg.inst.id !31

6:                                                ; preds = %11, %5
  %.02 = phi i32 [ 0, %5 ], [ %12, %11 ], !noelle.pdg.inst.id !32
  %exitcond5 = icmp ne i32 %.02, 5, !noelle.pdg.inst.id !33
  br i1 %exitcond5, label %8, label %7, !noelle.loop.id !34, !noelle.pdg.inst.id !35

7:                                                ; preds = %6
  br label %13, !noelle.pdg.inst.id !36

8:                                                ; preds = %6
  %9 = getelementptr [9 x i8], [9 x i8]* @.str.1, i64 0, i64 0, !noelle.pdg.inst.id !37
  %10 = call i32 (i8*, ...) @printf(i8* %9), !noelle.pdg.inst.id !6
  br label %11, !noelle.pdg.inst.id !38

11:                                               ; preds = %8
  %12 = add nuw nsw i32 %.02, 1, !noelle.pdg.inst.id !39
  br label %6, !noelle.pdg.inst.id !40

13:                                               ; preds = %7
  br label %14, !noelle.pdg.inst.id !41

14:                                               ; preds = %13
  %15 = add nuw nsw i32 %.01, 1, !noelle.pdg.inst.id !42
  br label %3, !noelle.pdg.inst.id !43

16:                                               ; preds = %4
  br label %17, !noelle.pdg.inst.id !44

17:                                               ; preds = %28, %16
  %.03 = phi i32 [ 0, %16 ], [ %29, %28 ], !noelle.pdg.inst.id !45
  %exitcond4 = icmp ne i32 %.03, 5, !noelle.pdg.inst.id !46
  br i1 %exitcond4, label %19, label %18, !noelle.loop.id !47, !noelle.pdg.inst.id !48

18:                                               ; preds = %17
  br label %30, !noelle.pdg.inst.id !49

19:                                               ; preds = %17
  br label %20, !noelle.pdg.inst.id !50

20:                                               ; preds = %25, %19
  %.0 = phi i32 [ 0, %19 ], [ %26, %25 ], !noelle.pdg.inst.id !51
  %exitcond = icmp ne i32 %.0, 5, !noelle.pdg.inst.id !52
  br i1 %exitcond, label %22, label %21, !noelle.loop.id !53, !noelle.pdg.inst.id !54

21:                                               ; preds = %20
  br label %27, !noelle.pdg.inst.id !55

22:                                               ; preds = %20
  %23 = getelementptr [9 x i8], [9 x i8]* @.str.2, i64 0, i64 0, !noelle.pdg.inst.id !56
  %24 = call i32 (i8*, ...) @printf(i8* %23), !noelle.pdg.inst.id !13
  br label %25, !noelle.pdg.inst.id !57

25:                                               ; preds = %22
  %26 = add nuw nsw i32 %.0, 1, !noelle.pdg.inst.id !58
  br label %20, !noelle.pdg.inst.id !59

27:                                               ; preds = %21
  br label %28, !noelle.pdg.inst.id !60

28:                                               ; preds = %27
  %29 = add nuw nsw i32 %.03, 1, !noelle.pdg.inst.id !61
  br label %17, !noelle.pdg.inst.id !62

30:                                               ; preds = %18
  ret i32 0, !noelle.pdg.inst.id !63
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
!noelle.module.pdg = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (git@github.com:scampanoni/LLVM_installer.git 713d2f6594d9a0b77e7f9a120aaa7c917715a640)"}
!2 = !{!"true"}
!3 = !{!4, !10, !12, !14, !15, !16, !17, !19, !20, !21, !22, !23}
!4 = !{!5, !6, !2, !7, !8, !7, !7, !9}
!5 = !{i64 1}
!6 = !{i64 13}
!7 = !{!"false"}
!8 = !{!"RAW"}
!9 = !{}
!10 = !{!5, !6, !2, !7, !11, !7, !7, !9}
!11 = !{!"WAW"}
!12 = !{!5, !13, !2, !7, !8, !7, !7, !9}
!13 = !{i64 31}
!14 = !{!5, !13, !2, !7, !11, !7, !7, !9}
!15 = !{!6, !6, !2, !7, !8, !7, !7, !9}
!16 = !{!6, !6, !2, !7, !11, !7, !7, !9}
!17 = !{!6, !6, !2, !7, !18, !7, !7, !9}
!18 = !{!"WAR"}
!19 = !{!6, !13, !2, !7, !11, !7, !7, !9}
!20 = !{!6, !13, !2, !7, !8, !7, !7, !9}
!21 = !{!13, !13, !2, !7, !8, !7, !7, !9}
!22 = !{!13, !13, !2, !7, !11, !7, !7, !9}
!23 = !{!13, !13, !2, !7, !18, !7, !7, !9}
!24 = !{i64 0}
!25 = !{i64 2}
!26 = !{i64 3}
!27 = !{i64 4}
!28 = !{!"0"}
!29 = !{i64 5}
!30 = !{i64 6}
!31 = !{i64 7}
!32 = !{i64 8}
!33 = !{i64 9}
!34 = !{!"1"}
!35 = !{i64 10}
!36 = !{i64 11}
!37 = !{i64 12}
!38 = !{i64 14}
!39 = !{i64 15}
!40 = !{i64 16}
!41 = !{i64 17}
!42 = !{i64 18}
!43 = !{i64 19}
!44 = !{i64 20}
!45 = !{i64 21}
!46 = !{i64 22}
!47 = !{!"2"}
!48 = !{i64 23}
!49 = !{i64 24}
!50 = !{i64 25}
!51 = !{i64 26}
!52 = !{i64 27}
!53 = !{!"3"}
!54 = !{i64 28}
!55 = !{i64 29}
!56 = !{i64 30}
!57 = !{i64 32}
!58 = !{i64 33}
!59 = !{i64 34}
!60 = !{i64 35}
!61 = !{i64 36}
!62 = !{i64 37}
!63 = !{i64 38}
