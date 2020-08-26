; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

@compute_lds = external addrspace(3) global [0 x i8], align 65536

define amdgpu_cs void @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %3, <4 x i32> inreg %4, i32 inreg %5, <3 x i32> %6) #0 {
main_body:
  %7 = shl i32 %5, 6
  %8 = extractelement <3 x i32> %6, i32 0
  %9 = add i32 %7, %8
  %10 = shl i32 %9, 4
  %11 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %2, i32 15, !amdgpu.uniform !0
  %12 = load <4 x i32>, <4 x i32> addrspace(6)* %11, align 16, !invariant.load !0
  %13 = bitcast <4 x i32> %4 to <4 x float>
  call void @llvm.amdgcn.raw.buffer.store.v4f32(<4 x float> %13, <4 x i32> %12, i32 %10, i32 0, i32 3) #2
  ret void
}

; Function Attrs: nounwind writeonly
declare void @llvm.amdgcn.raw.buffer.store.v4f32(<4 x float>, <4 x i32>, i32, i32, i32 immarg) #1

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="64,64" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind writeonly }
attributes #2 = { inaccessiblememonly nounwind }

!0 = !{}
