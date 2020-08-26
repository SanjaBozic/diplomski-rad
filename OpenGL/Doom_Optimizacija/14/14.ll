; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

@compute_lds = external addrspace(3) global [0 x i8], align 65536

define amdgpu_cs void @main(<4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %3, <3 x i32> inreg %4, i32 inreg %5, <8 x i32> inreg %6, i32 inreg %7, i32 inreg %8, i32 inreg %9, <3 x i32> %10) #0 {
main_body:
  %11 = extractelement <3 x i32> %4, i32 0
  %12 = mul i32 %11, %7
  %13 = extractelement <3 x i32> %4, i32 1
  %14 = mul i32 %13, %8
  %15 = extractelement <3 x i32> %4, i32 2
  %16 = mul i32 %15, %9
  %17 = extractelement <3 x i32> %10, i32 0
  %18 = add i32 %12, %17
  %19 = extractelement <3 x i32> %10, i32 1
  %20 = add i32 %14, %19
  %21 = extractelement <3 x i32> %10, i32 2
  %22 = add i32 %16, %21
  %23 = call nsz arcp contract <4 x float> @llvm.amdgcn.image.load.2darray.v4f32.i32(i32 15, i32 %18, i32 %20, i32 %22, <8 x i32> %6, i32 0, i32 0) #1
  call void @llvm.amdgcn.s.barrier() #2
  %24 = getelementptr inbounds <8 x i32>, <8 x i32> addrspace(6)* %3, i32 30, !amdgpu.uniform !0
  %25 = load <8 x i32>, <8 x i32> addrspace(6)* %24, align 32, !invariant.load !0
  %26 = extractelement <8 x i32> %25, i32 6
  %27 = and i32 %26, -2097153
  %28 = insertelement <8 x i32> %25, i32 %27, i32 6
  call void @llvm.amdgcn.image.store.2darray.v4f32.i32(<4 x float> %23, i32 15, i32 %18, i32 %20, i32 %22, <8 x i32> %28, i32 0, i32 0) #4
  ret void
}

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.image.load.2darray.v4f32.i32(i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #1

; Function Attrs: convergent nounwind
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: nounwind writeonly
declare void @llvm.amdgcn.image.store.2darray.v4f32.i32(<4 x float>, i32 immarg, i32, i32, i32, <8 x i32>, i32 immarg, i32 immarg) #3

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="1024,1024" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readonly }
attributes #2 = { convergent nounwind }
attributes #3 = { nounwind writeonly }
attributes #4 = { nounwind }

!0 = !{}
