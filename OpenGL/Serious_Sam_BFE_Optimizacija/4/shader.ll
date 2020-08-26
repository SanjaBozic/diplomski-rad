; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %9, i32 inreg %10, i32 inreg %11, float inreg %12, float inreg %13, float inreg %14, float inreg %15, float inreg %16, float inreg %17, float inreg %18, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %19, i32 %20, i32 %21, i32 %22, i32 %23, i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %31 = and i32 %3, 251658240
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %if5020, label %endif5020
; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %9, i32 inreg %10, i32 inreg %11, float inreg %12, float inreg %13, float inreg %14, float inreg %15, float inreg %16, float inreg %17, float inreg %18, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %19, i32 %20, i32 %21, i32 %22, i32 %23, i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %31 = and i32 %3, 251658240
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %33 = lshr i32 %2, 12
  %34 = and i32 %33, 511
  %35 = lshr i32 %2, 10
  %36 = and i32 %35, 2093056
  %37 = or i32 %36, %34
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %37) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %38 = lshr i32 %3, 8
  %39 = and i32 %38, 255
  %40 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3, !range !0
  %41 = icmp ult i32 %40, %39
  br i1 %41, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %42 = bitcast i32 %20 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %42, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %43 = and i32 %3, 255
  %44 = icmp ult i32 %40, %43
  br i1 %44, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %45 = icmp ult i32 %25, 2
  %46 = icmp ne i32 %25, 1
  %.v.v = select i1 %45, i32 %10, i32 %11
  %.v = shl i32 %.v.v, 16
  %47 = ashr exact i32 %.v, 16
  %.v2 = select i1 %46, i32 %10, i32 %11
  %48 = ashr i32 %.v2, 16
  %49 = sitofp i32 %47 to float
  %50 = sitofp i32 %48 to float
  %51 = select nsz arcp contract i1 %45, float %13, float %15
  %52 = select nsz arcp contract i1 %46, float %14, float %16
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %49, float %50, float %12, float 1.000000e+00, i1 true, i1 true) #2
  call void @llvm.amdgcn.exp.f32(i32 32, i32 15, float %51, float %52, float %17, float %18, i1 false, i1 false) #2
  br label %endif6002

endif6002:                                        ; preds = %if11500, %endif6001
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.amdgcn.init.exec(i64 immarg) #1

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #3

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.amdgcn.exp.f32(i32 immarg, i32 immarg, float, float, float, float, i1 immarg, i1 immarg) #4

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="128,128" "no-signed-zeros-fp-math"="true" }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inaccessiblememonly nounwind }

!0 = !{i32 0, i32 32}
if5020:                                           ; preds = %main_body
  %33 = lshr i32 %2, 12
  %34 = and i32 %33, 511
  %35 = lshr i32 %2, 10
  %36 = and i32 %35, 2093056
  %37 = or i32 %36, %34
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %37) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %38 = lshr i32 %3, 8
  %39 = and i32 %38, 255
  %40 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3, !range !0
  %41 = icmp ult i32 %40, %39
  br i1 %41, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %42 = bitcast i32 %20 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %42, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %43 = and i32 %3, 255
  %44 = icmp ult i32 %40, %43
  br i1 %44, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %45 = icmp ult i32 %25, 2
  %46 = icmp ne i32 %25, 1
  %.v.v = select i1 %45, i32 %10, i32 %11
  %.v = shl i32 %.v.v, 16
  %47 = ashr exact i32 %.v, 16
  %.v2 = select i1 %46, i32 %10, i32 %11
  %48 = ashr i32 %.v2, 16
  %49 = sitofp i32 %47 to float
  %50 = sitofp i32 %48 to float
  %51 = select nsz arcp contract i1 %45, float %13, float %15
  %52 = select nsz arcp contract i1 %46, float %14, float %16
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %49, float %50, float %12, float 1.000000e+00, i1 true, i1 true) #2
  call void @llvm.amdgcn.exp.f32(i32 32, i32 15, float %51, float %52, float %17, float %18, i1 false, i1 false) #2
  br label %endif6002

endif6002:                                        ; preds = %if11500, %endif6001
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.amdgcn.init.exec(i64 immarg) #1

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #3

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.amdgcn.exp.f32(i32 immarg, i32 immarg, float, float, float, float, i1 immarg, i1 immarg) #4

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="128,128" "no-signed-zeros-fp-math"="true" }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inaccessiblememonly nounwind }

!0 = !{i32 0, i32 32}
