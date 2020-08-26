; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %9, float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %10, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %11, i32 inreg %12, i32 inreg %13, i32 inreg %14, i32 inreg %15, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %16, i32 inreg %17, i32 inreg %18, i32 inreg %19, <4 x i32> inreg %20, <4 x i32> inreg %21, <4 x i32> inreg %22, i32 %23, i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30, i32 %31, i32 %32, i32 %33, i32 %34) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %35 = and i32 %3, 251658240
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %37 = lshr i32 %2, 12
  %38 = and i32 %37, 511
  %39 = lshr i32 %2, 10
  %40 = and i32 %39, 2093056
  %41 = or i32 %40, %38
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %41) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %42 = lshr i32 %3, 8
  %43 = and i32 %42, 255
  %44 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3
  %45 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %44) #3, !range !0
  %46 = icmp ult i32 %45, %43
  br i1 %46, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %47 = bitcast i32 %23 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %47, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %48 = and i32 %3, 255
  %49 = icmp ult i32 %45, %48
  br i1 %49, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %50 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %20, i32 %32, i32 0, i32 0, i32 0) #3
  %51 = extractelement <4 x float> %50, i32 0
  %52 = extractelement <4 x float> %50, i32 1
  %53 = extractelement <4 x float> %50, i32 2
  %54 = extractelement <4 x float> %50, i32 3
  %55 = call nsz arcp contract <2 x float> @llvm.amdgcn.struct.buffer.load.format.v2f32(<4 x i32> %21, i32 %33, i32 0, i32 0, i32 0) #3
  %56 = extractelement <2 x float> %55, i32 0
  %57 = extractelement <2 x float> %55, i32 1
  %58 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %22, i32 %34, i32 0, i32 0, i32 0) #3
  %59 = extractelement <4 x float> %58, i32 0
  %60 = extractelement <4 x float> %58, i32 1
  %61 = extractelement <4 x float> %58, i32 2
  %62 = extractelement <4 x float> %58, i32 3
  %63 = ptrtoint float addrspace(6)* %10 to i32
  %64 = insertelement <4 x i32> <i32 undef, i32 32768, i32 64, i32 822177708>, i32 %63, i32 0
  %65 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 0, i32 0) #3
  %66 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 4, i32 0) #3
  %67 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 8, i32 0) #3
  %68 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 12, i32 0) #3
  %69 = fmul nsz arcp contract float %52, %66
  %70 = call nsz arcp contract float @llvm.fma.f32(float %51, float %65, float %69) #3
  %71 = call nsz arcp contract float @llvm.fma.f32(float %53, float %67, float %70) #3
  %72 = call nsz arcp contract float @llvm.fma.f32(float %54, float %68, float %71) #3
  %73 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 16, i32 0) #3
  %74 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 20, i32 0) #3
  %75 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 24, i32 0) #3
  %76 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 28, i32 0) #3
  %77 = fmul nsz arcp contract float %52, %74
  %78 = call nsz arcp contract float @llvm.fma.f32(float %51, float %73, float %77) #3
  %79 = call nsz arcp contract float @llvm.fma.f32(float %53, float %75, float %78) #3
  %80 = call nsz arcp contract float @llvm.fma.f32(float %54, float %76, float %79) #3
  %81 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 32, i32 0) #3
  %82 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 36, i32 0) #3
  %83 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 40, i32 0) #3
  %84 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 44, i32 0) #3
  %85 = fmul nsz arcp contract float %52, %82
  %86 = call nsz arcp contract float @llvm.fma.f32(float %51, float %81, float %85) #3
  %87 = call nsz arcp contract float @llvm.fma.f32(float %53, float %83, float %86) #3
  %88 = call nsz arcp contract float @llvm.fma.f32(float %54, float %84, float %87) #3
  %89 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 48, i32 0) #3
  %90 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 52, i32 0) #3
  %91 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 56, i32 0) #3
  %92 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 60, i32 0) #3
  %93 = fmul nsz arcp contract float %52, %90
  %94 = call nsz arcp contract float @llvm.fma.f32(float %51, float %89, float %93) #3
  %95 = call nsz arcp contract float @llvm.fma.f32(float %53, float %91, float %94) #3
  %96 = call nsz arcp contract float @llvm.fma.f32(float %54, float %92, float %95) #3
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %72, float %80, float %88, float %96, i1 true, i1 true) #2
  call void @llvm.amdgcn.exp.f32(i32 32, i32 15, float %59, float %60, float %61, float %62, i1 false, i1 false) #2
  call void @llvm.amdgcn.exp.f32(i32 33, i32 15, float %56, float %57, float undef, float undef, i1 false, i1 false) #2
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

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32>, i32, i32, i32, i32 immarg) #5

; Function Attrs: nounwind readonly
declare <2 x float> @llvm.amdgcn.struct.buffer.load.format.v2f32(<4 x i32>, i32, i32, i32, i32 immarg) #5

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #6

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="128,128" "no-signed-zeros-fp-math"="true" }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inaccessiblememonly nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind readnone speculatable willreturn }

!0 = !{i32 0, i32 64}
