; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

@compute_lds = external addrspace(3) global [0 x i8], align 65536

define amdgpu_cs void @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, float addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %3, i32 inreg %4, i32 inreg %5, i32 inreg %6, <3 x i32> %7) #0 {
main_body:
  %8 = ptrtoint float addrspace(6)* %2 to i32
  %9 = insertelement <4 x i32> <i32 undef, i32 32768, i32 32, i32 822177708>, i32 %8, i32 0
  %10 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %9, i32 0, i32 0) #1
  %11 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %9, i32 4, i32 0) #1
  %12 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %9, i32 8, i32 0) #1
  %13 = shl i32 %4, 3
  %14 = shl i32 %5, 3
  %15 = extractelement <3 x i32> %7, i32 0
  %16 = add i32 %13, %15
  %17 = extractelement <3 x i32> %7, i32 1
  %18 = add i32 %14, %17
  %19 = extractelement <3 x i32> %7, i32 2
  %20 = add i32 %19, %6
  %21 = bitcast float %10 to i32
  %22 = add i32 %16, %21
  %23 = bitcast float %11 to i32
  %24 = add i32 %18, %23
  %25 = bitcast float %12 to i32
  %26 = add i32 %20, %25
  %27 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 31, !amdgpu.uniform !0
  %28 = load <8 x i32>, <8 x i32> addrspace(6)* %27, align 32, !invariant.load !0
  %29 = call nsz arcp contract <4 x float> @llvm.amdgcn.image.load.2darray.v4f32.i32(i32 15, i32 %22, i32 %24, i32 %26, <8 x i32> %28, i32 0, i32 0) #2
  %30 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %9, i32 16, i32 0) #1
  %31 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %9, i32 20, i32 0) #1
  %32 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %9, i32 24, i32 0) #1
  %33 = bitcast float %30 to i32
  %34 = add i32 %16, %33
  %35 = bitcast float %31 to i32
  %36 = add i32 %18, %35
  %37 = bitcast float %32 to i32
  %38 = add i32 %20, %37
  %39 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 30, !amdgpu.uniform !0
  %40 = load <8 x i32>, <8 x i32> addrspace(6)* %39, align 32, !invariant.load !0
  %41 = extractelement <8 x i32> %40, i32 6
  %42 = and i32 %41, -2097153
  %43 = insertelement <8 x i32> %40, i32 %42, i32 6
  call void @llvm.amdgcn.image.store.2darray.v4f32.i32(<4 x float> %29, i32 15, i32 %34, i32 %36, i32 %38, <8 x i32> %43, i32 0, i32 0) #4
  ret void
}

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #1

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.load.2darray.v4f32.i32(i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #2

; Function Attrs: nounwind writeonly
declare void @llvm.amdgcn.image.store.2darray.v4f32.i32(<4 x float>, i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #3

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="64,64" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind writeonly }
attributes #4 = { nounwind }

!0 = !{}
