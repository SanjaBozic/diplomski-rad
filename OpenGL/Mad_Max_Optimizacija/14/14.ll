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
  %51 = extractelement <4 x float> %50, i32 2
  %52 = extractelement <4 x float> %50, i32 3
  %53 = call nsz arcp contract <2 x float> @llvm.amdgcn.struct.buffer.load.format.v2f32(<4 x i32> %21, i32 %33, i32 0, i32 0, i32 0) #3
  %54 = extractelement <2 x float> %53, i32 0
  %55 = extractelement <2 x float> %53, i32 1
  %56 = call nsz arcp contract float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %22, i32 %34, i32 0, i32 0, i32 0) #3
  %57 = call nsz arcp contract float @llvm.trunc.f32(float %56) #3
  %58 = call nsz arcp contract float @llvm.maxnum.f32(float %57, float 0.000000e+00) #3
  %59 = call nsz arcp contract float @llvm.minnum.f32(float %58, float 3.000000e+00) #3
  %60 = fptosi float %59 to i32
  %61 = shl i32 %60, 3
  %62 = add i32 %61, 64
  %63 = ptrtoint float addrspace(6)* %10 to i32
  %64 = insertelement <4 x i32> <i32 undef, i32 32768, i32 112, i32 822177708>, i32 %63, i32 0
  %65 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 %62, i32 0) #3
  %66 = add i32 %61, 68
  %67 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 %66, i32 0) #3
  %68 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 0, i32 0) #3
  %69 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 4, i32 0) #3
  %70 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 8, i32 0) #3
  %71 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 12, i32 0) #3
  %72 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 16, i32 0) #3
  %73 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 20, i32 0) #3
  %74 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 24, i32 0) #3
  %75 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 28, i32 0) #3
  %76 = fmul nsz arcp contract float %72, %67
  %77 = fmul nsz arcp contract float %73, %67
  %78 = fmul nsz arcp contract float %74, %67
  %79 = fmul nsz arcp contract float %75, %67
  %80 = call nsz arcp contract float @llvm.fma.f32(float %68, float %65, float %76) #3
  %81 = call nsz arcp contract float @llvm.fma.f32(float %69, float %65, float %77) #3
  %82 = call nsz arcp contract float @llvm.fma.f32(float %70, float %65, float %78) #3
  %83 = call nsz arcp contract float @llvm.fma.f32(float %71, float %65, float %79) #3
  %84 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 32, i32 0) #3
  %85 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 36, i32 0) #3
  %86 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 40, i32 0) #3
  %87 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 44, i32 0) #3
  %88 = call nsz arcp contract float @llvm.fma.f32(float %84, float %51, float %80) #3
  %89 = call nsz arcp contract float @llvm.fma.f32(float %85, float %51, float %81) #3
  %90 = call nsz arcp contract float @llvm.fma.f32(float %86, float %51, float %82) #3
  %91 = call nsz arcp contract float @llvm.fma.f32(float %87, float %51, float %83) #3
  %92 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 48, i32 0) #3
  %93 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 52, i32 0) #3
  %94 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 56, i32 0) #3
  %95 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 60, i32 0) #3
  %96 = call nsz arcp contract float @llvm.fma.f32(float %92, float %52, float %88) #3
  %97 = call nsz arcp contract float @llvm.fma.f32(float %93, float %52, float %89) #3
  %98 = call nsz arcp contract float @llvm.fma.f32(float %94, float %52, float %90) #3
  %99 = call nsz arcp contract float @llvm.fma.f32(float %95, float %52, float %91) #3
  %100 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 96, i32 0) #3
  %101 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 100, i32 0) #3
  %102 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 104, i32 0) #3
  %103 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %64, i32 108, i32 0) #3
  %104 = call nsz arcp contract float @llvm.fma.f32(float %54, float %102, float %100) #3
  %105 = call nsz arcp contract float @llvm.fma.f32(float %55, float %103, float %101) #3
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %96, float %97, float %98, float %99, i1 true, i1 true) #2
  call void @llvm.amdgcn.exp.f32(i32 32, i32 15, float %104, float %105, float undef, float undef, i1 false, i1 false) #2
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

; Function Attrs: nounwind readonly
declare float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32>, i32, i32, i32, i32 immarg) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #6

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #6

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #6

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
