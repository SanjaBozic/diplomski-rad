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
  %29 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 2, i32 0, i32 %5) #2
  %30 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %29, float %24, i32 2, i32 0, i32 %5) #2
  %31 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 3, i32 0, i32 %5) #2
  %32 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %31, float %24, i32 3, i32 0, i32 %5) #2
  %33 = ptrtoint float addrspace(6)* %2 to i32
  %34 = insertelement <4 x i32> <i32 undef, i32 32768, i32 32, i32 822177708>, i32 %33, i32 0
  %35 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %34, i32 16, i32 0) #2
  %36 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %34, i32 0, i32 0) #2
  %37 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %34, i32 4, i32 0) #2
  %38 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %34, i32 8, i32 0) #2
  %39 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %34, i32 12, i32 0) #2
  %40 = fmul nsz arcp contract float %32, %39
  %41 = call nsz arcp contract float @llvm.fma.f32(float %26, float %36, float %35) #2
  %42 = call nsz arcp contract float @llvm.fma.f32(float %28, float %37, float %35) #2
  %43 = call nsz arcp contract float @llvm.fma.f32(float %30, float %38, float %35) #2
  %44 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> undef, i32 %4, 4
  %45 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %44, float %41, 5
  %46 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %45, float %42, 6
  %47 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %46, float %43, 7
  %48 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %47, float %40, 8
  %49 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %48, float %20, 19
  ret <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %49
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p1(float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.p2(float, float, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #3

attributes #0 = { "InitialPSInputAddr"="0xb077" "amdgpu-32bit-address-high-bits"="0xffff8000" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind readnone speculatable willreturn }
