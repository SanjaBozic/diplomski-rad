; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_ps <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, float addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %3, i32 inreg %4, i32 inreg %5, <2 x i32> %6, <2 x i32> %7, <2 x i32> %8, <3 x i32> %9, <2 x i32> %10, <2 x i32> %11, <2 x i32> %12, <3 x float> %13, float %14, float %15, float %16, float %17, i32 %18, i32 %19, float %20, i32 %21) #0 {
main_body:
  %22 = bitcast <2 x i32> %7 to <2 x float>
  %23 = extractelement <2 x float> %22, i32 0
  %24 = extractelement <2 x float> %22, i32 1
  %25 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 0, i32 0, i32 %5) #2
  %26 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %25, float %24, i32 0, i32 0, i32 %5) #2
  %27 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 1, i32 0, i32 %5) #2
  %28 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %27, float %24, i32 1, i32 0, i32 %5) #2
  %29 = ptrtoint float addrspace(6)* %2 to i32
  %30 = insertelement <4 x i32> <i32 undef, i32 32768, i32 32, i32 822177708>, i32 %29, i32 0
  %31 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %30, i32 16, i32 0) #2
  %32 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 32, !amdgpu.uniform !0
  %33 = load <8 x i32>, <8 x i32> addrspace(6)* %32, align 32, !invariant.load !0
  %34 = bitcast <8 x i32> addrspace(6)* %3 to <4 x i32> addrspace(6)*
  %35 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %34, i32 67, !amdgpu.uniform !0
  %36 = load <4 x i32>, <4 x i32> addrspace(6)* %35, align 16, !invariant.load !0
  %37 = call nsz arcp contract <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 15, float %26, float %28, <8 x i32> %33, <4 x i32> %36, i1 false, i32 0, i32 0) #5
  %38 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %30, i32 0, i32 0) #2
  %39 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %30, i32 4, i32 0) #2
  %40 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %30, i32 8, i32 0) #2
  %41 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %30, i32 12, i32 0) #2
  %42 = extractelement <4 x float> %37, i32 3
  %43 = fmul nsz arcp contract float %42, %41
  %44 = extractelement <4 x float> %37, i32 0
  %45 = call nsz arcp contract float @llvm.fma.f32(float %44, float %38, float %31) #2
  %46 = extractelement <4 x float> %37, i32 1
  %47 = call nsz arcp contract float @llvm.fma.f32(float %46, float %39, float %31) #2
  %48 = extractelement <4 x float> %37, i32 2
  %49 = call nsz arcp contract float @llvm.fma.f32(float %48, float %40, float %31) #2
  %50 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> undef, i32 %4, 4
  %51 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %50, float %45, 5
  %52 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %51, float %47, 6
  %53 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %52, float %49, 7
  %54 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %53, float %43, 8
  %55 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %54, float %20, 19
  ret <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %55
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p1(float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p2(float, float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #2

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #4

attributes #0 = { "InitialPSInputAddr"="0xb077" "amdgpu-32bit-address-high-bits"="0xffff8000" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind readonly }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { convergent nounwind readnone }

!0 = !{}