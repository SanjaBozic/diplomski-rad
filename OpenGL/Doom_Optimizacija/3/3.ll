; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

@compute_lds = external addrspace(3) global [0 x i8], align 65536

define amdgpu_cs void @main(<4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %2, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %3, <4 x i32> inreg %4, <4 x i32> inreg %5, i32 inreg %6, <3 x i32> %7) #0 {
main_body:
  %8 = shl i32 %6, 6
  %9 = extractelement <3 x i32> %7, i32 0
  %10 = add i32 %8, %9
  %11 = shl i32 %10, 4
  %12 = bitcast <4 x i32> %4 to <4 x float>
  call void @llvm.amdgcn.raw.buffer.store.v4f32(<4 x float> %12, <4 x i32> %5, i32 %11, i32 0, i32 3) #2
  ret void
}

; Function Attrs: nounwind writeonly
declare void @llvm.amdgcn.raw.buffer.store.v4f32(<4 x float>, <4 x i32>, i32, i32, i32 immarg) #1

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="64,64" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind writeonly }
attributes #2 = { inaccessiblememonly nounwind }
