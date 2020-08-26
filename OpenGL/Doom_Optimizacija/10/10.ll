; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

@compute_lds = external addrspace(3) global [0 x i8], align 65536

define amdgpu_cs void @main(<4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %3, <3 x i32> inreg %4, i32 inreg %5, <8 x i32> inreg %6, i32 inreg %7, i32 inreg %8, i32 inreg %9, <3 x i32> %10) #0 {
main_body:
  %11 = ptrtoint float addrspace(6)* %2 to i32
  %12 = insertelement <4 x i32> <i32 undef, i32 32768, i32 32, i32 822177708>, i32 %11, i32 0
  %13 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %12, i32 0, i32 0) #1
  %14 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %12, i32 4, i32 0) #1
  %15 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %12, i32 8, i32 0) #1
  %16 = extractelement <3 x i32> %4, i32 0
  %17 = mul i32 %16, %7
  %18 = extractelement <3 x i32> %4, i32 1
  %19 = mul i32 %18, %8
  %20 = extractelement <3 x i32> %4, i32 2
  %21 = mul i32 %20, %9
  %22 = extractelement <3 x i32> %10, i32 0
  %23 = add i32 %17, %22
  %24 = extractelement <3 x i32> %10, i32 1
  %25 = add i32 %19, %24
  %26 = extractelement <3 x i32> %10, i32 2
  %27 = add i32 %21, %26
  %28 = bitcast float %13 to i32
  %29 = add i32 %23, %28
  %30 = bitcast float %14 to i32
  %31 = add i32 %25, %30
  %32 = bitcast float %15 to i32
  %33 = add i32 %27, %32
  %34 = call nsz arcp contract <4 x float> @llvm.amdgcn.image.load.2darray.v4f32.i32(i32 15, i32 %29, i32 %31, i32 %33, <8 x i32> %6, i32 0, i32 0) #2
  %35 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %12, i32 16, i32 0) #1
  %36 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %12, i32 20, i32 0) #1
  %37 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %12, i32 24, i32 0) #1
  %38 = bitcast float %35 to i32
  %39 = add i32 %23, %38
  %40 = bitcast float %36 to i32
  %41 = add i32 %25, %40
  %42 = bitcast float %37 to i32
  %43 = add i32 %27, %42
  %44 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 30, !amdgpu.uniform !0
  %45 = load <8 x i32>, <8 x i32> addrspace(6)* %44, align 32, !invariant.load !0
  %46 = extractelement <8 x i32> %45, i32 6
  %47 = and i32 %46, -2097153
  %48 = insertelement <8 x i32> %45, i32 %47, i32 6
  call void @llvm.amdgcn.image.store.2darray.v4f32.i32(<4 x float> %34, i32 15, i32 %39, i32 %41, i32 %43, <8 x i32> %48, i32 0, i32 0) #4
  ret void
}

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #1

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.load.2darray.v4f32.i32(i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #2

; Function Attrs: nounwind writeonly
declare void @llvm.amdgcn.image.store.2darray.v4f32.i32(<4 x float>, i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #3

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="1024,1024" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind readonly }
attributes #3 = { nounwind writeonly }
attributes #4 = { nounwind }

!0 = !{}
