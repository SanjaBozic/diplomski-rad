; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_ps void @ps_epilog(i32 inreg %0, i32 inreg %1, i32 inreg %2, i32 inreg %3, float inreg %4, float %5, float %6, float %7, float %8, float %9, float %10, float %11, float %12, float %13, float %14, float %15, float %16, float %17, float %18, float %19) #0 {
main_body:
  %20 = call nsz arcp contract <2 x half> @llvm.amdgcn.cvt.pkrtz(float %5, float %6) #3
  %21 = call nsz arcp contract <2 x half> @llvm.amdgcn.cvt.pkrtz(float %7, float %8) #3
  %22 = bitcast <2 x half> %20 to <2 x i16>
  %23 = bitcast <2 x half> %21 to <2 x i16>
  call void @llvm.amdgcn.exp.compr.v2i16(i32 0, i32 15, <2 x i16> %22, <2 x i16> %23, i1 true, i1 true) #4
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare <2 x half> @llvm.amdgcn.cvt.pkrtz(float, float) #1

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.amdgcn.exp.compr.v2i16(i32 immarg, i32 immarg, <2 x i16>, <2 x i16>, i1 immarg, i1 immarg) #2

attributes #0 = { "InitialPSInputAddr"="0xffffff" "amdgpu-32bit-address-high-bits"="0xffff8000" "no-signed-zeros-fp-math"="true" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { inaccessiblememonly nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
