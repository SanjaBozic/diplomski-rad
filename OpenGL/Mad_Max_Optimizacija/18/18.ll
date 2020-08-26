; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %9, float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %10, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %11, i32 inreg %12, i32 inreg %13, i32 inreg %14, i32 inreg %15, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %16, i32 inreg %17, i32 inreg %18, i32 inreg %19, <4 x i32> inreg %20, <4 x i32> inreg %21, i32 %22, i32 %23, i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30, i32 %31, i32 %32) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %33 = and i32 %3, 251658240
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %35 = lshr i32 %2, 12
  %36 = and i32 %35, 511
  %37 = lshr i32 %2, 10
  %38 = and i32 %37, 2093056
  %39 = or i32 %38, %36
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %39) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %40 = lshr i32 %3, 8
  %41 = and i32 %40, 255
  %42 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3
  %43 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %42) #3, !range !0
  %44 = icmp ult i32 %43, %41
  br i1 %44, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %45 = bitcast i32 %22 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %45, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %46 = and i32 %3, 255
  %47 = icmp ult i32 %43, %46
  br i1 %47, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %48 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %20, i32 %31, i32 0, i32 0, i32 0) #3
  %49 = extractelement <4 x float> %48, i32 0
  %50 = extractelement <4 x float> %48, i32 1
  %51 = extractelement <4 x float> %48, i32 2
  %52 = extractelement <4 x float> %48, i32 3
  %53 = call nsz arcp contract <2 x float> @llvm.amdgcn.struct.buffer.load.format.v2f32(<4 x i32> %21, i32 %32, i32 0, i32 0, i32 0) #3
  %54 = extractelement <2 x float> %53, i32 0
  %55 = extractelement <2 x float> %53, i32 1
  %56 = ptrtoint float addrspace(6)* %10 to i32
  %57 = insertelement <4 x i32> <i32 undef, i32 32768, i32 80, i32 822177708>, i32 %56, i32 0
  %58 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 0, i32 0) #3
  %59 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 4, i32 0) #3
  %60 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 8, i32 0) #3
  %61 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 12, i32 0) #3
  %62 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 16, i32 0) #3
  %63 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 20, i32 0) #3
  %64 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 24, i32 0) #3
  %65 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 28, i32 0) #3
  %66 = fmul nsz arcp contract float %62, %50
  %67 = fmul nsz arcp contract float %63, %50
  %68 = fmul nsz arcp contract float %64, %50
  %69 = fmul nsz arcp contract float %65, %50
  %70 = call nsz arcp contract float @llvm.fma.f32(float %58, float %49, float %66) #3
  %71 = call nsz arcp contract float @llvm.fma.f32(float %59, float %49, float %67) #3
  %72 = call nsz arcp contract float @llvm.fma.f32(float %60, float %49, float %68) #3
  %73 = call nsz arcp contract float @llvm.fma.f32(float %61, float %49, float %69) #3
  %74 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 32, i32 0) #3
  %75 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 36, i32 0) #3
  %76 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 40, i32 0) #3
  %77 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 44, i32 0) #3
  %78 = call nsz arcp contract float @llvm.fma.f32(float %74, float %51, float %70) #3
  %79 = call nsz arcp contract float @llvm.fma.f32(float %75, float %51, float %71) #3
  %80 = call nsz arcp contract float @llvm.fma.f32(float %76, float %51, float %72) #3
  %81 = call nsz arcp contract float @llvm.fma.f32(float %77, float %51, float %73) #3
  %82 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 48, i32 0) #3
  %83 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 52, i32 0) #3
  %84 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 56, i32 0) #3
  %85 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 60, i32 0) #3
  %86 = call nsz arcp contract float @llvm.fma.f32(float %82, float %52, float %78) #3
  %87 = call nsz arcp contract float @llvm.fma.f32(float %83, float %52, float %79) #3
  %88 = call nsz arcp contract float @llvm.fma.f32(float %84, float %52, float %80) #3
  %89 = call nsz arcp contract float @llvm.fma.f32(float %85, float %52, float %81) #3
  %90 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 64, i32 0) #3
  %91 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 68, i32 0) #3
  %92 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 72, i32 0) #3
  %93 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %57, i32 76, i32 0) #3
  %94 = call nsz arcp contract float @llvm.fma.f32(float %54, float %90, float %92) #3
  %95 = call nsz arcp contract float @llvm.fma.f32(float %55, float %91, float %93) #3
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %86, float %87, float %88, float %89, i1 true, i1 true) #2
  call void @llvm.amdgcn.exp.f32(i32 32, i32 15, float %94, float %95, float undef, float undef, i1 false, i1 false) #2
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
