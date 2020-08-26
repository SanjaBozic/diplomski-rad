; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %9, float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %10, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %11, i32 inreg %12, i32 inreg %13, i32 inreg %14, i32 inreg %15, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %16, i32 %17, i32 %18, i32 %19, i32 %20, i32 %21, i32 %22, i32 %23, i32 %24, i32 %25) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %26 = and i32 %3, 251658240
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %28 = lshr i32 %2, 12
  %29 = and i32 %28, 511
  %30 = lshr i32 %2, 10
  %31 = and i32 %30, 2093056
  %32 = or i32 %31, %29
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %32) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %33 = lshr i32 %3, 8
  %34 = and i32 %33, 255
  %35 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3
  %36 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %35) #3, !range !0
  %37 = icmp ult i32 %36, %34
  br i1 %37, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %38 = bitcast i32 %17 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %38, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %39 = and i32 %3, 255
  %40 = icmp ult i32 %36, %39
  br i1 %40, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %41 = ptrtoint float addrspace(6)* %10 to i32
  %42 = insertelement <4 x i32> <i32 undef, i32 32768, i32 80, i32 822177708>, i32 %41, i32 0
  %43 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 0, i32 0) #3
  %44 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 4, i32 0) #3
  %45 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 8, i32 0) #3
  %46 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 12, i32 0) #3
  %47 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 16, i32 0) #3
  %48 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 20, i32 0) #3
  %49 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 24, i32 0) #3
  %50 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 28, i32 0) #3
  %51 = fmul nsz arcp contract float %43, %47
  %52 = fmul nsz arcp contract float %43, %48
  %53 = fmul nsz arcp contract float %43, %49
  %54 = fmul nsz arcp contract float %43, %50
  %55 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 32, i32 0) #3
  %56 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 36, i32 0) #3
  %57 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 40, i32 0) #3
  %58 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 44, i32 0) #3
  %59 = call nsz arcp contract float @llvm.fma.f32(float %44, float %55, float %51) #3
  %60 = call nsz arcp contract float @llvm.fma.f32(float %44, float %56, float %52) #3
  %61 = call nsz arcp contract float @llvm.fma.f32(float %44, float %57, float %53) #3
  %62 = call nsz arcp contract float @llvm.fma.f32(float %44, float %58, float %54) #3
  %63 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 48, i32 0) #3
  %64 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 52, i32 0) #3
  %65 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 56, i32 0) #3
  %66 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 60, i32 0) #3
  %67 = call nsz arcp contract float @llvm.fma.f32(float %45, float %63, float %59) #3
  %68 = call nsz arcp contract float @llvm.fma.f32(float %45, float %64, float %60) #3
  %69 = call nsz arcp contract float @llvm.fma.f32(float %45, float %65, float %61) #3
  %70 = call nsz arcp contract float @llvm.fma.f32(float %45, float %66, float %62) #3
  %71 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 64, i32 0) #3
  %72 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 68, i32 0) #3
  %73 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 72, i32 0) #3
  %74 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %42, i32 76, i32 0) #3
  %75 = call nsz arcp contract float @llvm.fma.f32(float %46, float %71, float %67) #3
  %76 = call nsz arcp contract float @llvm.fma.f32(float %46, float %72, float %68) #3
  %77 = call nsz arcp contract float @llvm.fma.f32(float %46, float %73, float %69) #3
  %78 = call nsz arcp contract float @llvm.fma.f32(float %46, float %74, float %70) #3
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %75, float %76, float %77, float %78, i1 true, i1 true) #2
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

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #3

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.amdgcn.exp.f32(i32 immarg, i32 immarg, float, float, float, float, i1 immarg, i1 immarg) #4

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #5

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="128,128" "no-signed-zeros-fp-math"="true" }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inaccessiblememonly nounwind }
attributes #5 = { nounwind readnone speculatable willreturn }

!0 = !{i32 0, i32 64}
