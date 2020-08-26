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
  %29 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 32, !amdgpu.uniform !0
  %30 = load <8 x i32>, <8 x i32> addrspace(6)* %29, align 32, !invariant.load !0
  %31 = bitcast <8 x i32> addrspace(6)* %3 to <4 x i32> addrspace(6)*
  %32 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %31, i32 67, !amdgpu.uniform !0
  %33 = load <4 x i32>, <4 x i32> addrspace(6)* %32, align 16, !invariant.load !0
  %34 = call float @llvm.amdgcn.image.sample.2d.f32.f32(i32 1, float %26, float %28, <8 x i32> %30, <4 x i32> %33, i1 false, i32 0, i32 0)
  %35 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 34, !amdgpu.uniform !0
  %36 = load <8 x i32>, <8 x i32> addrspace(6)* %35, align 32, !invariant.load !0
  %37 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %31, i32 71, !amdgpu.uniform !0
  %38 = load <4 x i32>, <4 x i32> addrspace(6)* %37, align 16, !invariant.load !0
  %39 = call float @llvm.amdgcn.image.sample.2d.f32.f32(i32 1, float %26, float %28, <8 x i32> %36, <4 x i32> %38, i1 false, i32 0, i32 0)
  %40 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 36, !amdgpu.uniform !0
  %41 = load <8 x i32>, <8 x i32> addrspace(6)* %40, align 32, !invariant.load !0
  %42 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %31, i32 75, !amdgpu.uniform !0
  %43 = load <4 x i32>, <4 x i32> addrspace(6)* %42, align 16, !invariant.load !0
  %44 = call float @llvm.amdgcn.image.sample.2d.f32.f32(i32 1, float %26, float %28, <8 x i32> %41, <4 x i32> %43, i1 false, i32 0, i32 0)
  %45 = ptrtoint float addrspace(6)* %2 to i32
  %46 = insertelement <4 x i32> <i32 undef, i32 32768, i32 64, i32 822177708>, i32 %45, i32 0
  %47 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 4, i32 0) #3
  %48 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 8, i32 0) #3
  %49 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 12, i32 0) #3
  %50 = fadd nsz arcp contract float %34, %47
  %51 = fadd nsz arcp contract float %39, %48
  %52 = fadd nsz arcp contract float %44, %49
  %53 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 16, i32 0) #3
  %54 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 20, i32 0) #3
  %55 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 24, i32 0) #3
  %56 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 28, i32 0) #3
  %57 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 32, i32 0) #3
  %58 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 36, i32 0) #3
  %59 = fmul nsz arcp contract float %56, %51
  %60 = fmul nsz arcp contract float %57, %51
  %61 = fmul nsz arcp contract float %58, %51
  %62 = call nsz arcp contract float @llvm.fma.f32(float %53, float %50, float %59) #3
  %63 = call nsz arcp contract float @llvm.fma.f32(float %54, float %50, float %60) #3
  %64 = call nsz arcp contract float @llvm.fma.f32(float %55, float %50, float %61) #3
  %65 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 40, i32 0) #3
  %66 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 44, i32 0) #3
  %67 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 48, i32 0) #3
  %68 = call nsz arcp contract float @llvm.fma.f32(float %65, float %52, float %62) #3
  %69 = call nsz arcp contract float @llvm.fma.f32(float %66, float %52, float %63) #3
  %70 = call nsz arcp contract float @llvm.fma.f32(float %67, float %52, float %64) #3
  %71 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %46, i32 0, i32 0) #3
  %72 = fmul nsz arcp contract float %68, %71
  %73 = fmul nsz arcp contract float %69, %71
  %74 = fmul nsz arcp contract float %70, %71
  %75 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> undef, i32 %4, 4
  %76 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %75, float %72, 5
  %77 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %76, float %73, 6
  %78 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %77, float %74, 7
  %79 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %78, float %71, 8
  %80 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %79, float %20, 19
  ret <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %80
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
