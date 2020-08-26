; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %9, float addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %10, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %11, i32 inreg %12, i32 inreg %13, i32 inreg %14, i32 inreg %15, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %16, i32 inreg %17, i32 inreg %18, i32 inreg %19, <4 x i32> inreg %20, <4 x i32> inreg %21, <4 x i32> inreg %22, i32 %23, i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30, i32 %31, i32 %32, i32 %33, i32 %34) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %35 = and i32 %3, 251658240
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %37 = lshr i32 %2, 12
  %38 = and i32 %37, 511
  %39 = lshr i32 %2, 10
  %40 = and i32 %39, 2093056
  %41 = or i32 %40, %38
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %41) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %42 = lshr i32 %3, 8
  %43 = and i32 %42, 255
  %44 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3
  %45 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %44) #3, !range !0
  %46 = icmp ult i32 %45, %43
  br i1 %46, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %47 = bitcast i32 %23 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %47, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %48 = and i32 %3, 255
  %49 = icmp ult i32 %45, %48
  br i1 %49, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %50 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %20, i32 %32, i32 0, i32 0, i32 0) #3
  %51 = extractelement <4 x float> %50, i32 0
  %52 = extractelement <4 x float> %50, i32 1
  %53 = extractelement <4 x float> %50, i32 2
  %54 = extractelement <4 x float> %50, i32 3
  %55 = call nsz arcp contract <2 x float> @llvm.amdgcn.struct.buffer.load.format.v2f32(<4 x i32> %21, i32 %33, i32 0, i32 0, i32 0) #3
  %56 = extractelement <2 x float> %55, i32 0
  %57 = extractelement <2 x float> %55, i32 1
  %58 = call nsz arcp contract float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32> %22, i32 %34, i32 0, i32 0, i32 0) #3
  %59 = fmul nsz arcp contract float %58, 2.500000e-01
  %60 = call nsz arcp contract float @llvm.trunc.f32(float %59) #3
  %61 = call nsz arcp contract float @llvm.maxnum.f32(float %60, float 0.000000e+00) #3
  %62 = call nsz arcp contract float @llvm.minnum.f32(float %61, float 7.000000e+00) #3
  %63 = fptosi float %62 to i32
  %64 = shl i32 %63, 4
  %65 = shl i32 %63, 6
  %66 = ptrtoint float addrspace(6)* %10 to i32
  %67 = insertelement <4 x i32> <i32 undef, i32 32768, i32 640, i32 822177708>, i32 %66, i32 0
  %68 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %65, i32 0) #3
  %69 = or i32 %65, 4
  %70 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %69, i32 0) #3
  %71 = add nuw nsw i32 %69, 4
  %72 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %71, i32 0) #3
  %73 = or i32 %65, 12
  %74 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %73, i32 0) #3
  %75 = or i32 %65, 16
  %76 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %75, i32 0) #3
  %77 = or i32 %65, 20
  %78 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %77, i32 0) #3
  %79 = add nuw nsw i32 %77, 4
  %80 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %79, i32 0) #3
  %81 = or i32 %65, 28
  %82 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %81, i32 0) #3
  %83 = fmul nsz arcp contract float %76, %52
  %84 = fmul nsz arcp contract float %78, %52
  %85 = fmul nsz arcp contract float %80, %52
  %86 = fmul nsz arcp contract float %82, %52
  %87 = call nsz arcp contract float @llvm.fma.f32(float %68, float %51, float %83) #3
  %88 = call nsz arcp contract float @llvm.fma.f32(float %70, float %51, float %84) #3
  %89 = call nsz arcp contract float @llvm.fma.f32(float %72, float %51, float %85) #3
  %90 = call nsz arcp contract float @llvm.fma.f32(float %74, float %51, float %86) #3
  %91 = or i32 %65, 32
  %92 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %91, i32 0) #3
  %93 = or i32 %65, 36
  %94 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %93, i32 0) #3
  %95 = add nuw nsw i32 %93, 4
  %96 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %95, i32 0) #3
  %97 = or i32 %65, 44
  %98 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %97, i32 0) #3
  %99 = call nsz arcp contract float @llvm.fma.f32(float %92, float %53, float %87) #3
  %100 = call nsz arcp contract float @llvm.fma.f32(float %94, float %53, float %88) #3
  %101 = call nsz arcp contract float @llvm.fma.f32(float %96, float %53, float %89) #3
  %102 = call nsz arcp contract float @llvm.fma.f32(float %98, float %53, float %90) #3
  %103 = or i32 %65, 48
  %104 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %103, i32 0) #3
  %105 = or i32 %65, 52
  %106 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %105, i32 0) #3
  %107 = add nuw nsw i32 %105, 4
  %108 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %107, i32 0) #3
  %109 = or i32 %65, 60
  %110 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %109, i32 0) #3
  %111 = call nsz arcp contract float @llvm.fma.f32(float %104, float %54, float %99) #3
  %112 = call nsz arcp contract float @llvm.fma.f32(float %106, float %54, float %100) #3
  %113 = call nsz arcp contract float @llvm.fma.f32(float %108, float %54, float %101) #3
  %114 = call nsz arcp contract float @llvm.fma.f32(float %110, float %54, float %102) #3
  %115 = add i32 %64, 512
  %116 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %115, i32 0) #3
  %117 = add i32 %64, 516
  %118 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %117, i32 0) #3
  %119 = add i32 %64, 520
  %120 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %119, i32 0) #3
  %121 = add i32 %64, 524
  %122 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %67, i32 %121, i32 0) #3
  %123 = call nsz arcp contract float @llvm.fma.f32(float %56, float %120, float %116) #3
  %124 = call nsz arcp contract float @llvm.fma.f32(float %57, float %122, float %118) #3
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %111, float %112, float %113, float %114, i1 true, i1 true) #2
  call void @llvm.amdgcn.exp.f32(i32 32, i32 15, float %123, float %124, float undef, float undef, i1 false, i1 false) #2
  br label %endif6002

endif6002:                                        ; preds = %if11500, %endif6001
  ret void
}

; Function Attrs: convergent nounwind
declare void @llvm.amdgcn.init.exec(i64 immarg) #1

; Function Attrs: nounwind
declare void @llvm.amdgcn.s.sendmsg(i32 immarg, i32) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.mbcnt.lo(i32, i32) #3

; Function Attrs: nounwind readnone
declare i32 @llvm.amdgcn.mbcnt.hi(i32, i32) #3

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.amdgcn.exp.f32(i32 immarg, i32 immarg, float, float, float, float, i1 immarg, i1 immarg) #4

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32>, i32, i32, i32, i32 immarg) #5

; Function Attrs: nounwind readonly
declare <2 x float> @llvm.amdgcn.struct.buffer.load.format.v2f32(<4 x i32>, i32, i32, i32, i32 immarg) #5

; Function Attrs: nounwind readonly
declare float @llvm.amdgcn.struct.buffer.load.format.f32(<4 x i32>, i32, i32, i32, i32 immarg) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.trunc.f32(float) #6

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #6

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #6

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #6

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="128,128" "no-signed-zeros-fp-math"="true" }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inaccessiblememonly nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind readnone speculatable willreturn }

!0 = !{i32 0, i32 64}
