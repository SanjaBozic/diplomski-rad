; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_ps <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> @main(<4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %3, i32 inreg %4, i32 inreg %5, <2 x i32> %6, <2 x i32> %7, <2 x i32> %8, <3 x i32> %9, <2 x i32> %10, <2 x i32> %11, <2 x i32> %12, <3 x float> %13, float %14, float %15, float %16, float %17, i32 %18, i32 %19, float %20, i32 %21) #0 {
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
  %42 = call nsz arcp contract <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 15, float %34, float %36, <8 x i32> %38, <4 x i32> %41, i1 false, i32 0, i32 0) #4
  %43 = extractelement <4 x float> %42, i32 0
  %44 = fmul nsz arcp contract float %43, %26
  %45 = extractelement <4 x float> %42, i32 1
  %46 = fmul nsz arcp contract float %45, %28
  %47 = extractelement <4 x float> %42, i32 2
  %48 = fmul nsz arcp contract float %47, %30
  %49 = extractelement <4 x float> %42, i32 3
  %50 = fmul nsz arcp contract float %49, %32
  %51 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> undef, i32 %4, 4
  %52 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %51, float %44, 5
  %53 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %52, float %46, 6
  %54 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %53, float %48, 7
  %55 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %54, float %50, 8
  %56 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %55, float %20, 19
  ret <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %56
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p1(float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p2(float, float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 immarg, float, float, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #2

attributes #0 = { "InitialPSInputAddr"="0xb077" "amdgpu-32bit-address-high-bits"="0xffff8000" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind readnone }
attributes #4 = { convergent nounwind readnone }

!0 = !{}
