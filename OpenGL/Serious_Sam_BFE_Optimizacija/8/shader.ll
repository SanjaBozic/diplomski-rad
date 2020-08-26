; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(<4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %9, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %10, <8 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %11, i32 inreg %12, i32 inreg %13, i32 inreg %14, i32 inreg %15, <4 x i32> addrspace(6)* inreg noalias dereferenceable(18446744073709551615) %16, i32 inreg %17, i32 inreg %18, i32 inreg %19, <4 x i32> inreg %20, <4 x i32> inreg %21, i32 %22, i32 %23, i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30, i32 %31, i32 %32) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %33 = and i32 %3, 251658240
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %35 = lshr i32 %2, 12
  %36 = and i32 %35, 511
  %37 = lshr i32 %2, 10
  %38 = and i32 %37, 2093056
  %39 = or i32 %38, %36
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %39) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %40 = lshr i32 %3, 8
  %41 = and i32 %40, 255
  %42 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3, !range !0
  %43 = icmp ult i32 %42, %41
  br i1 %43, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %44 = bitcast i32 %22 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %44, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %45 = and i32 %3, 255
  %46 = icmp ult i32 %42, %45
  br i1 %46, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %47 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %20, i32 %31, i32 0, i32 0, i32 0) #3
  %48 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %21, i32 %32, i32 0, i32 0, i32 0) #3
  %49 = extractelement <4 x float> %48, i32 0
  %50 = extractelement <4 x float> %48, i32 1
  %51 = extractelement <4 x float> %48, i32 2
  %52 = extractelement <4 x float> %48, i32 3
  %53 = extractelement <4 x float> %47, i32 0
  %54 = extractelement <4 x float> %47, i32 1
  %55 = extractelement <4 x float> %47, i32 2
  %56 = extractelement <4 x float> %47, i32 3
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %53, float %54, float %55, float %56, i1 true, i1 true) #2
  call void @llvm.amdgcn.exp.f32(i32 32, i32 15, float %49, float %50, float %51, float %52, i1 false, i1 false) #2
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

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.amdgcn.exp.f32(i32 immarg, i32 immarg, float, float, float, float, i1 immarg, i1 immarg) #4

; Function Attrs: nounwind readonly
declare <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32>, i32, i32, i32, i32 immarg) #5

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="128,128" "no-signed-zeros-fp-math"="true" }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inaccessiblememonly nounwind }
attributes #5 = { nounwind readonly }

!0 = !{i32 0, i32 32}
