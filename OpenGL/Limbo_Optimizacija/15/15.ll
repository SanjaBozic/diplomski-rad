; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_ps <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, float addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %3, i32 inreg %4, i32 inreg %5, <2 x i32> %6, <2 x i32> %7, <2 x i32> %8, <3 x i32> %9, <2 x i32> %10, <2 x i32> %11, <2 x i32> %12, <3 x float> %13, float %14, float %15, float %16, float %17, i32 %18, i32 %19, float %20, i32 %21) #0 {
main_body:
  %22 = bitcast <2 x i32> %7 to <2 x float>
  %23 = extractelement <2 x float> %22, i32 0
  %24 = extractelement <2 x float> %22, i32 1
  %25 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 0, i32 0, i32 %5) #3
  %26 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %25, float %24, i32 0, i32 0, i32 %5) #3
  %27 = call nsz arcp contract float @llvm.amdgcn.interp.p1(float %23, i32 1, i32 0, i32 %5) #3
  %28 = call nsz arcp contract float @llvm.amdgcn.interp.p2(float %27, float %24, i32 1, i32 0, i32 %5) #3
  %29 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 34, !amdgpu.uniform !0
  %30 = load <8 x i32>, <8 x i32> addrspace(6)* %29, align 32, !invariant.load !0
  %31 = bitcast <8 x i32> addrspace(6)* %3 to <4 x i32> addrspace(6)*
  %32 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %31, i32 71, !amdgpu.uniform !0
  %33 = load <4 x i32>, <4 x i32> addrspace(6)* %32, align 16, !invariant.load !0
  %34 = call nsz arcp contract <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 15, float %26, float %28, <8 x i32> %30, <4 x i32> %33, i1 false, i32 0, i32 0) #5
  %35 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 32, !amdgpu.uniform !0
  %36 = load <8 x i32>, <8 x i32> addrspace(6)* %35, align 32, !invariant.load !0
  %37 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %31, i32 67, !amdgpu.uniform !0
  %38 = load <4 x i32>, <4 x i32> addrspace(6)* %37, align 16, !invariant.load !0
  %39 = call nsz arcp contract <4 x float> @llvm.amdgcn.image.sample.2d.v4f32.f32(i32 15, float %26, float %28, <8 x i32> %36, <4 x i32> %38, i1 false, i32 0, i32 0) #5
  %40 = ptrtoint float addrspace(6)* %2 to i32
  %41 = insertelement <4 x i32> <i32 undef, i32 32768, i32 32, i32 822177708>, i32 %40, i32 0
  %42 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 16, i32 0) #3
  %43 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 20, i32 0) #3
  %44 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 24, i32 0) #3
  %45 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 28, i32 0) #3
  %46 = extractelement <4 x float> %34, i32 1
  %47 = fmul nsz arcp contract float %46, %43
  %48 = extractelement <4 x float> %34, i32 0
  %49 = call nsz arcp contract float @llvm.fma.f32(float %48, float %42, float %47) #3
  %50 = extractelement <4 x float> %34, i32 2
  %51 = call nsz arcp contract float @llvm.fma.f32(float %50, float %44, float %49) #3
  %52 = extractelement <4 x float> %34, i32 3
  %53 = call nsz arcp contract float @llvm.fma.f32(float %52, float %45, float %51) #3
  %54 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 0, i32 0) #3
  %55 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 4, i32 0) #3
  %56 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 8, i32 0) #3
  %57 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %41, i32 12, i32 0) #3
  %58 = fmul nsz arcp contract float %46, %55
  %59 = call nsz arcp contract float @llvm.fma.f32(float %48, float %54, float %58) #3
  %60 = call nsz arcp contract float @llvm.fma.f32(float %50, float %56, float %59) #3
  %61 = call nsz arcp contract float @llvm.fma.f32(float %52, float %57, float %60) #3
  %62 = fsub nsz arcp contract float %53, %61
  %63 = call nsz arcp contract float @llvm.fabs.f32(float %62) #3
  %64 = call nsz arcp contract float @llvm.minnum.f32(float %63, float 1.000000e+00) #3
  %65 = fsub nsz arcp contract float 1.000000e+00, %64
  %66 = extractelement <4 x float> %39, i32 1
  %67 = fmul nsz arcp contract float %66, %43
  %68 = extractelement <4 x float> %39, i32 0
  %69 = call nsz arcp contract float @llvm.fma.f32(float %68, float %42, float %67) #3
  %70 = extractelement <4 x float> %39, i32 2
  %71 = call nsz arcp contract float @llvm.fma.f32(float %70, float %44, float %69) #3
  %72 = extractelement <4 x float> %39, i32 3
  %73 = call nsz arcp contract float @llvm.fma.f32(float %72, float %45, float %71) #3
  %74 = fmul nsz arcp contract float %66, %55
  %75 = call nsz arcp contract float @llvm.fma.f32(float %68, float %54, float %74) #3
  %76 = call nsz arcp contract float @llvm.fma.f32(float %70, float %56, float %75) #3
  %77 = call nsz arcp contract float @llvm.fma.f32(float %72, float %57, float %76) #3
  %78 = fsub nsz arcp contract float %73, %77
  %79 = call nsz arcp contract float @llvm.fabs.f32(float %78) #3
  %80 = call nsz arcp contract float @llvm.minnum.f32(float %79, float 1.000000e+00) #3
  %81 = fsub nsz arcp contract float 1.000000e+00, %80
  %82 = call nsz arcp contract float @llvm.maxnum.f32(float %48, float %46) #3
  %83 = call nsz arcp contract float @llvm.maxnum.f32(float %82, float %50) #3
  %84 = fmul nsz arcp contract float %64, %83
  %85 = call nsz arcp contract float @llvm.fma.f32(float %65, float %48, float %84) #3
  %86 = call nsz arcp contract float @llvm.fma.f32(float %65, float %46, float %84) #3
  %87 = call nsz arcp contract float @llvm.fma.f32(float %65, float %50, float %84) #3
  %88 = call nsz arcp contract float @llvm.fma.f32(float %65, float %52, float %84) #3
  %89 = call nsz arcp contract float @llvm.maxnum.f32(float %68, float %66) #3
  %90 = call nsz arcp contract float @llvm.maxnum.f32(float %89, float %70) #3
  %91 = fmul nsz arcp contract float %80, %90
  %92 = call nsz arcp contract float @llvm.fma.f32(float %81, float %68, float %91) #3
  %93 = call nsz arcp contract float @llvm.fma.f32(float %81, float %66, float %91) #3
  %94 = call nsz arcp contract float @llvm.fma.f32(float %81, float %70, float %91) #3
  %95 = call nsz arcp contract float @llvm.fma.f32(float %81, float %72, float %91) #3
  %96 = fmul nsz arcp contract float %92, %54
  %97 = fmul nsz arcp contract float %93, %55
  %98 = fmul nsz arcp contract float %94, %56
  %99 = fmul nsz arcp contract float %95, %57
  %100 = call nsz arcp contract float @llvm.fma.f32(float %85, float %42, float %96) #3
  %101 = call nsz arcp contract float @llvm.fma.f32(float %86, float %43, float %97) #3
  %102 = call nsz arcp contract float @llvm.fma.f32(float %87, float %44, float %98) #3
  %103 = call nsz arcp contract float @llvm.fma.f32(float %88, float %45, float %99) #3
  %104 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> undef, i32 %4, 4
  %105 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %104, float %100, 5
  %106 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %105, float %101, 6
  %107 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %106, float %102, 7
  %108 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %107, float %103, 8
  %109 = insertvalue <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %108, float %20, 19
  ret <{ i32, i32, i32, i32, i32, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float }> %109
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

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #4

attributes #0 = { "InitialPSInputAddr"="0xb077" "amdgpu-32bit-address-high-bits"="0xffff8000" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { convergent nounwind readnone }

!0 = !{}
