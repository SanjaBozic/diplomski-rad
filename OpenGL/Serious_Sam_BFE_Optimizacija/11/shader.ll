; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_ps <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, float addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %3, i32 inreg %4, i32 inreg %5, <2 x i32> %6, <2 x i32> %7, <2 x i32> %8, <3 x i32> %9, <2 x i32> %10, <2 x i32> %11, <2 x i32> %12, <3 x float> %13, float %14, float %15, float %16, float %17, i32 %18, i32 %19, float %20, i32 %21) #0 {
main_body:
  %22 = call nsz arcp contract float @llvm.amdgcn.interp.mov(i32 2, i32 0, i32 0, i32 %5) #2
  %23 = bitcast float %22 to i32
  %24 = ptrtoint float addrspace(6)* %2 to i32
  %25 = insertelement <4 x i32> <i32 undef, i32 32768, i32 64, i32 822177708>, i32 %24, i32 0
  %26 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %25, i32 0, i32 0) #2
  %27 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %25, i32 4, i32 0) #2
  %28 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %25, i32 8, i32 0) #2
  %29 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %25, i32 12, i32 0) #2
  %30 = fptosi float %14 to i32
  %31 = fptosi float %15 to i32
  %32 = bitcast float %26 to i32
  %33 = add i32 %32, %30
  %34 = bitcast float %27 to i32
  %35 = add i32 %34, %31
  %36 = bitcast float %28 to i32
  %37 = mul i32 %35, %36
  %38 = add i32 %33, %37
  %39 = bitcast float %29 to i32
  %40 = mul i32 %23, %39
  %41 = add i32 %38, %40
  %42 = bitcast <8 x i32> addrspace(6)* %3 to <4 x i32> addrspace(6)*
  %43 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %42, i32 65, !amdgpu.uniform !0
  %44 = load <4 x i32>, <4 x i32> addrspace(6)* %43, align 16, !invariant.load !0
  %45 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %44, i32 %41, i32 0, i32 0, i32 0) #2
  %46 = extractelement <4 x float> %45, i32 0
  %47 = extractelement <4 x float> %45, i32 1
  %48 = extractelement <4 x float> %45, i32 2
  %49 = extractelement <4 x float> %45, i32 3
  %50 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> undef, i32 %4, 4
  %51 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %50, float %46, 5
  %52 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %51, float %47, 6
  %53 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %52, float %48, 7
  %54 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %53, float %49, 8
  %55 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %54, float %20, 19
  ret <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %55
}

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.interp.mov(i32, i32 immarg, i32 immarg, i32) #1

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #2

; Function Attrs: nounwind readnone speculatable
declare float @llvm.amdgcn.rcp.f32(float) #1

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32>, i32, i32, i32, i32 immarg) #3

attributes #0 = { "InitialPSInputAddr"="0xb077" "amdgpu-32bit-address-high-bits"="0xffff8000" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind readonly }

!0 = !{}
