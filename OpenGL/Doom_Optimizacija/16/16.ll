; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_ps <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> @main(<4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %3, i32 inreg %4, i32 inreg %5, <2 x i32> %6, <2 x i32> %7, <2 x i32> %8, <3 x i32> %9, <2 x i32> %10, <2 x i32> %11, <2 x i32> %12, <3 x float> %13, float %14, float %15, float %16, float %17, i32 %18, i32 %19, float %20, i32 %21) #0 {
main_body:
  %22 = bitcast <2 x i32> %7 to <2 x float>
  %23 = extractelement <2 x float> %22, i32 0
  %24 = extractelement <2 x float> %22, i32 1
  %25 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 0, i32 0, i32 %5) #3
  %26 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %25, float %24, i32 0, i32 0, i32 %5) #3
  %27 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 1, i32 0, i32 %5) #3
  %28 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %27, float %24, i32 1, i32 0, i32 %5) #3
  %29 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 2, i32 0, i32 %5) #3
  %30 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %29, float %24, i32 2, i32 0, i32 %5) #3
  %31 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 3, i32 0, i32 %5) #3
  %32 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %31, float %24, i32 3, i32 0, i32 %5) #3
  %33 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 0, i32 1, i32 %5) #3
  %34 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %33, float %24, i32 0, i32 1, i32 %5) #3
  %35 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 1, i32 1, i32 %5) #3
  %36 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %35, float %24, i32 1, i32 1, i32 %5) #3
  %37 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 32, !amdgpu.uniform !0
  %38 = load <8 x i32>, <8 x i32> addrspace(6)* %37, align 32, !invariant.load !0
  %39 = bitcast <8 x i32> addrspace(6)* %3 to <4 x i32> addrspace(6)*
  %40 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %39, i32 67, !amdgpu.uniform !0
  %41 = load <4 x i32>, <4 x i32> addrspace(6)* %40, align 16, !invariant.load !0
  %42 = call float @llvm.amdgcn.image.sample.2d.f32.f32(i32 1, float %34, float %36, <8 x i32> %38, <4 x i32> %41, i1 false, i32 0, i32 0)
  %43 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 34, !amdgpu.uniform !0
  %44 = load <8 x i32>, <8 x i32> addrspace(6)* %43, align 32, !invariant.load !0
  %45 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %39, i32 71, !amdgpu.uniform !0
  %46 = load <4 x i32>, <4 x i32> addrspace(6)* %45, align 16, !invariant.load !0
  %47 = call float @llvm.amdgcn.image.sample.2d.f32.f32(i32 1, float %34, float %36, <8 x i32> %44, <4 x i32> %46, i1 false, i32 0, i32 0)
  %48 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 36, !amdgpu.uniform !0
  %49 = load <8 x i32>, <8 x i32> addrspace(6)* %48, align 32, !invariant.load !0
  %50 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %39, i32 75, !amdgpu.uniform !0
  %51 = load <4 x i32>, <4 x i32> addrspace(6)* %50, align 16, !invariant.load !0
  %52 = call float @llvm.amdgcn.image.sample.2d.f32.f32(i32 1, float %34, float %36, <8 x i32> %49, <4 x i32> %51, i1 false, i32 0, i32 0)
  %53 = ptrtoint float addrspace(6)* %2 to i32
  %54 = insertelement <4 x i32> <i32 undef, i32 32768, i32 32, i32 822177708>, i32 %53, i32 0
  %55 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %54, i32 0, i32 0) #3
  %56 = fcmp nsz arcp contract ogt float %55, 0.000000e+00
  br i1 %56, label %if1, label %endif1

if1:                                              ; preds = %main_body
  %57 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 38, !amdgpu.uniform !0
  %58 = load <8 x i32>, <8 x i32> addrspace(6)* %57, align 32, !invariant.load !0
  %59 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %39, i32 79, !amdgpu.uniform !0
  %60 = load <4 x i32>, <4 x i32> addrspace(6)* %59, align 16, !invariant.load !0
  %61 = call float @llvm.amdgcn.image.sample.2d.f32.f32(i32 1, float %34, float %36, <8 x i32> %58, <4 x i32> %60, i1 false, i32 0, i32 0)
  br label %endif1

endif1:                                           ; preds = %main_body, %if1
  %62 = phi float [ %61, %if1 ], [ 1.000000e+00, %main_body ]
  %63 = call nsz arcp contract float @llvm.fma.f32(float %47, float 0x3FF9886000000000, float 0xBFEBDC6800000000) #3
  %64 = call nsz arcp contract float @llvm.fma.f32(float %47, float 0xBFEA080000000000, float 0x3FE0F35800000000) #3
  %65 = call nsz arcp contract float @llvm.fma.f32(float %52, float 0xBFD90D8000000000, float %64) #3
  %66 = call nsz arcp contract float @llvm.fma.f32(float %52, float 0x4000248000000000, float 0xBFF14E8400000000) #3
  %67 = call nsz arcp contract float @llvm.fma.f32(float %42, float 0x3FF2A04000000000, float %63) #3
  %68 = call nsz arcp contract float @llvm.fma.f32(float %42, float 0x3FF2A04000000000, float %65) #3
  %69 = call nsz arcp contract float @llvm.fma.f32(float %42, float 0x3FF2A04000000000, float %66) #3
  %70 = fmul nsz arcp contract float %67, %26
  %71 = fmul nsz arcp contract float %68, %28
  %72 = fmul nsz arcp contract float %69, %30
  %73 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %54, i32 16, i32 0) #3
  %74 = fmul nsz arcp contract float %70, %73
  %75 = fmul nsz arcp contract float %71, %73
  %76 = fmul nsz arcp contract float %72, %73
  %77 = fmul nsz arcp contract float %62, %32
  %78 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> undef, i32 %4, 4
  %79 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %78, float %74, 5
  %80 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %79, float %75, 6
  %81 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %80, float %76, 7
  %82 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %81, float %77, 8
  %83 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %82, float %20, 19
  ret <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %83
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p1(float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p2(float, float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #2

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #4

; Function Attrs: nounwind readonly
declare float @llvm.amdgcn.image.sample.2d.f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #2

attributes #0 = { "InitialPSInputAddr"="0xb077" "amdgpu-32bit-address-high-bits"="0xffff8000" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind readnone speculatable willreturn }

!0 = !{}
