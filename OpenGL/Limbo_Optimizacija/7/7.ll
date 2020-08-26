; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %9, i32 inreg %10, i32 inreg %11, float inreg %12, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 %19, i32 %20, i32 %21, i32 %22, i32 %23) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %24 = and i32 %3, 251658240
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %26 = lshr i32 %2, 12
  %27 = and i32 %26, 511
  %28 = lshr i32 %2, 10
  %29 = and i32 %28, 2093056
  %30 = or i32 %29, %27
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %30) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %31 = lshr i32 %3, 8
  %32 = and i32 %31, 255
  %33 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3, !range !0
  %34 = icmp ult i32 %33, %32
  br i1 %34, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %35 = bitcast i32 %14 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %35, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %36 = and i32 %3, 255
  %37 = icmp ult i32 %33, %36
  br i1 %37, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %38 = icmp ult i32 %19, 2
  %39 = icmp eq i32 %19, 1
  %.v.v = select i1 %38, i32 %10, i32 %11
  %.v = shl i32 %.v.v, 16
  %40 = ashr exact i32 %.v, 16
  %.v2 = select i1 %39, i32 %11, i32 %10
  %41 = ashr i32 %.v2, 16
  %42 = sitofp i32 %40 to float
  %43 = sitofp i32 %41 to float
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %42, float %43, float %12, float 1.000000e+00, i1 true, i1 true) #2
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
