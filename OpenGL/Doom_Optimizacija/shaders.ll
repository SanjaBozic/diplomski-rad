; ModuleID = 'mesa-shader'
source_filename = "mesa-shader"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-ni:7"
target triple = "amdgcn--"

define amdgpu_gs void @main(<4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %0, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %1, i32 inreg %2, i32 inreg %3, i32 inreg %4, i32 inreg %5, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %6, i32 inreg %7, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %8, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %9, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %10, <8 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %11, i32 inreg %12, i32 inreg %13, i32 inreg %14, i32 inreg %15, <4 x i32> addrspace(6)* inreg noalias align 32 dereferenceable(18446744073709551615) %16, i32 inreg %17, i32 inreg %18, i32 inreg %19, <4 x i32> inreg %20, <4 x i32> inreg %21, <4 x i32> inreg %22, <4 x i32> inreg %23, i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30, i32 %31, i32 %32, i32 %33, i32 %34, i32 %35, i32 %36) #0 {
main_body:
  call void @llvm.amdgcn.init.exec(i64 -1) #1
  %37 = and i32 %3, 251658240
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %if5020, label %endif5020

if5020:                                           ; preds = %main_body
  %39 = lshr i32 %2, 12
  %40 = and i32 %39, 511
  %41 = lshr i32 %2, 10
  %42 = and i32 %41, 2093056
  %43 = or i32 %42, %40
  call void @llvm.amdgcn.s.sendmsg(i32 9, i32 %43) #2
  br label %endif5020

endif5020:                                        ; preds = %if5020, %main_body
  %44 = lshr i32 %3, 8
  %45 = and i32 %44, 255
  %46 = call i32 @llvm.amdgcn.mbcnt.lo(i32 -1, i32 0) #3
  %47 = call i32 @llvm.amdgcn.mbcnt.hi(i32 -1, i32 %46) #3, !range !0
  %48 = icmp ult i32 %47, %45
  br i1 %48, label %if6001, label %endif6001

if6001:                                           ; preds = %endif5020
  %49 = bitcast i32 %24 to float
  call void @llvm.amdgcn.exp.f32(i32 20, i32 1, float %49, float undef, float undef, float undef, i1 true, i1 false) #2
  br label %endif6001

endif6001:                                        ; preds = %if6001, %endif5020
  %50 = and i32 %3, 255
  %51 = icmp ult i32 %47, %50
  br i1 %51, label %if11500, label %endif6002

if11500:                                          ; preds = %endif6001
  %52 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %20, i32 %33, i32 0, i32 0, i32 0) #3
  %53 = extractelement <4 x float> %52, i32 0
  %54 = extractelement <4 x float> %52, i32 1
  %55 = extractelement <4 x float> %52, i32 2
  %56 = extractelement <4 x float> %52, i32 3
  %57 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %23, i32 %36, i32 0, i32 0, i32 0) #3
  %58 = extractelement <4 x float> %57, i32 3
  %59 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %21, i32 %34, i32 0, i32 0, i32 0) #3
  %60 = extractelement <4 x float> %59, i32 3
  %61 = call nsz arcp contract <4 x float> @llvm.amdgcn.struct.buffer.load.format.v4f32(<4 x i32> %22, i32 %35, i32 0, i32 0, i32 0) #3
  %62 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %10, i32 32, !amdgpu.uniform !1
  %63 = load <4 x i32>, <4 x i32> addrspace(6)* %62, align 32, !invariant.load !1
  %64 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 80, i32 0) #3
  %65 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 84, i32 0) #3
  %66 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 88, i32 0) #3
  %67 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 92, i32 0) #3
  %68 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 96, i32 0) #3
  %69 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 100, i32 0) #3
  %70 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 104, i32 0) #3
  %71 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 108, i32 0) #3
  %72 = call nsz arcp contract float @llvm.fma.f32(float %53, float %64, float %68) #3
  %73 = call nsz arcp contract float @llvm.fma.f32(float %54, float %65, float %69) #3
  %74 = call nsz arcp contract float @llvm.fma.f32(float %55, float %66, float %70) #3
  %75 = call nsz arcp contract float @llvm.fma.f32(float %56, float %67, float %71) #3
  %76 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 0, i32 0) #3
  %77 = fcmp nsz arcp contract une float %76, 0.000000e+00
  br i1 %77, label %if1, label %endif1

if1:                                              ; preds = %if11500
  %78 = extractelement <4 x float> %61, i32 0
  %79 = extractelement <4 x float> %61, i32 1
  %80 = extractelement <4 x float> %61, i32 2
  %81 = extractelement <4 x float> %61, i32 3
  %82 = fmul nsz arcp contract float %58, 0x3FFFE33340000000
  %83 = call nsz arcp contract float @llvm.floor.f32(float %82) #3
  %84 = fmul nsz arcp contract float %83, -1.280000e+02
  %85 = call nsz arcp contract float @llvm.fma.f32(float %58, float 0x406FE33340000000, float %84) #3
  %86 = fmul nsz arcp contract float %60, 0x402FE33340000000
  %87 = call nsz arcp contract float @llvm.floor.f32(float %86) #3
  %88 = fmul nsz arcp contract float %87, -1.600000e+01
  %89 = call nsz arcp contract float @llvm.fma.f32(float %60, float 0x406FE33340000000, float %88) #3
  %90 = fmul nsz arcp contract float %85, 0x3F70204080000000
  %91 = fmul nsz arcp contract float %87, 0x3F96C16C20000000
  %92 = fmul nsz arcp contract float %89, 0x3F91111120000000
  %93 = call nsz arcp contract float @llvm.fma.f32(float %85, float 0x3F70204080000000, float %91) #3
  %94 = call nsz arcp contract float @llvm.fma.f32(float %89, float 0x3F91111120000000, float %93) #3
  %95 = fsub nsz arcp contract float 1.000000e+00, %94
  %96 = fmul nsz arcp contract float %78, 2.550000e+02
  %97 = fmul nsz arcp contract float %79, 2.550000e+02
  %98 = fmul nsz arcp contract float %80, 2.550000e+02
  %99 = fmul nsz arcp contract float %81, 2.550000e+02
  %100 = fptoui float %96 to i32
  %101 = fptoui float %97 to i32
  %102 = fptoui float %98 to i32
  %103 = fptoui float %99 to i32
  %104 = mul i32 %100, 48
  %105 = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(6)* %10, i32 33, !amdgpu.uniform !1
  %106 = load <4 x i32>, <4 x i32> addrspace(6)* %105, align 16, !invariant.load !1
  %107 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %104, i32 0) #3
  %108 = or i32 %104, 4
  %109 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %108, i32 0) #3
  %110 = add nuw nsw i32 %108, 4
  %111 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %110, i32 0) #3
  %112 = or i32 %104, 12
  %113 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %112, i32 0) #3
  %114 = fmul nsz arcp contract float %107, %95
  %115 = fmul nsz arcp contract float %109, %95
  %116 = fmul nsz arcp contract float %111, %95
  %117 = fmul nsz arcp contract float %113, %95
  %118 = mul i32 %101, 48
  %119 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %118, i32 0) #3
  %120 = or i32 %118, 4
  %121 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %120, i32 0) #3
  %122 = add nuw nsw i32 %120, 4
  %123 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %122, i32 0) #3
  %124 = or i32 %118, 12
  %125 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %124, i32 0) #3
  %126 = call nsz arcp contract float @llvm.fma.f32(float %119, float %90, float %114) #3
  %127 = call nsz arcp contract float @llvm.fma.f32(float %121, float %90, float %115) #3
  %128 = call nsz arcp contract float @llvm.fma.f32(float %123, float %90, float %116) #3
  %129 = call nsz arcp contract float @llvm.fma.f32(float %125, float %90, float %117) #3
  %130 = mul i32 %102, 48
  %131 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %130, i32 0) #3
  %132 = or i32 %130, 4
  %133 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %132, i32 0) #3
  %134 = add nuw nsw i32 %132, 4
  %135 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %134, i32 0) #3
  %136 = or i32 %130, 12
  %137 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %136, i32 0) #3
  %138 = call nsz arcp contract float @llvm.fma.f32(float %131, float %91, float %126) #3
  %139 = call nsz arcp contract float @llvm.fma.f32(float %133, float %91, float %127) #3
  %140 = call nsz arcp contract float @llvm.fma.f32(float %135, float %91, float %128) #3
  %141 = call nsz arcp contract float @llvm.fma.f32(float %137, float %91, float %129) #3
  %142 = mul i32 %103, 48
  %143 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %142, i32 0) #3
  %144 = or i32 %142, 4
  %145 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %144, i32 0) #3
  %146 = add nuw nsw i32 %144, 4
  %147 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %146, i32 0) #3
  %148 = or i32 %142, 12
  %149 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %148, i32 0) #3
  %150 = call nsz arcp contract float @llvm.fma.f32(float %143, float %92, float %138) #3
  %151 = call nsz arcp contract float @llvm.fma.f32(float %145, float %92, float %139) #3
  %152 = call nsz arcp contract float @llvm.fma.f32(float %147, float %92, float %140) #3
  %153 = call nsz arcp contract float @llvm.fma.f32(float %149, float %92, float %141) #3
  %154 = add i32 %104, 16
  %155 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %154, i32 0) #3
  %156 = add i32 %104, 20
  %157 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %156, i32 0) #3
  %158 = add i32 %104, 24
  %159 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %158, i32 0) #3
  %160 = add i32 %104, 28
  %161 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %160, i32 0) #3
  %162 = fmul nsz arcp contract float %155, %95
  %163 = fmul nsz arcp contract float %157, %95
  %164 = fmul nsz arcp contract float %159, %95
  %165 = fmul nsz arcp contract float %161, %95
  %166 = add i32 %118, 16
  %167 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %166, i32 0) #3
  %168 = add i32 %118, 20
  %169 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %168, i32 0) #3
  %170 = add i32 %118, 24
  %171 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %170, i32 0) #3
  %172 = add i32 %118, 28
  %173 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %172, i32 0) #3
  %174 = call nsz arcp contract float @llvm.fma.f32(float %167, float %90, float %162) #3
  %175 = call nsz arcp contract float @llvm.fma.f32(float %169, float %90, float %163) #3
  %176 = call nsz arcp contract float @llvm.fma.f32(float %171, float %90, float %164) #3
  %177 = call nsz arcp contract float @llvm.fma.f32(float %173, float %90, float %165) #3
  %178 = add i32 %130, 16
  %179 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %178, i32 0) #3
  %180 = add i32 %130, 20
  %181 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %180, i32 0) #3
  %182 = add i32 %130, 24
  %183 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %182, i32 0) #3
  %184 = add i32 %130, 28
  %185 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %184, i32 0) #3
  %186 = call nsz arcp contract float @llvm.fma.f32(float %179, float %91, float %174) #3
  %187 = call nsz arcp contract float @llvm.fma.f32(float %181, float %91, float %175) #3
  %188 = call nsz arcp contract float @llvm.fma.f32(float %183, float %91, float %176) #3
  %189 = call nsz arcp contract float @llvm.fma.f32(float %185, float %91, float %177) #3
  %190 = add i32 %142, 16
  %191 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %190, i32 0) #3
  %192 = add i32 %142, 20
  %193 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %192, i32 0) #3
  %194 = add i32 %142, 24
  %195 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %194, i32 0) #3
  %196 = add i32 %142, 28
  %197 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %196, i32 0) #3
  %198 = call nsz arcp contract float @llvm.fma.f32(float %191, float %92, float %186) #3
  %199 = call nsz arcp contract float @llvm.fma.f32(float %193, float %92, float %187) #3
  %200 = call nsz arcp contract float @llvm.fma.f32(float %195, float %92, float %188) #3
  %201 = call nsz arcp contract float @llvm.fma.f32(float %197, float %92, float %189) #3
  %202 = add i32 %104, 32
  %203 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %202, i32 0) #3
  %204 = add i32 %104, 36
  %205 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %204, i32 0) #3
  %206 = add i32 %104, 40
  %207 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %206, i32 0) #3
  %208 = add i32 %104, 44
  %209 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %208, i32 0) #3
  %210 = fmul nsz arcp contract float %203, %95
  %211 = fmul nsz arcp contract float %205, %95
  %212 = fmul nsz arcp contract float %207, %95
  %213 = fmul nsz arcp contract float %209, %95
  %214 = add i32 %118, 32
  %215 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %214, i32 0) #3
  %216 = add i32 %118, 36
  %217 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %216, i32 0) #3
  %218 = add i32 %118, 40
  %219 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %218, i32 0) #3
  %220 = add i32 %118, 44
  %221 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %220, i32 0) #3
  %222 = call nsz arcp contract float @llvm.fma.f32(float %215, float %90, float %210) #3
  %223 = call nsz arcp contract float @llvm.fma.f32(float %217, float %90, float %211) #3
  %224 = call nsz arcp contract float @llvm.fma.f32(float %219, float %90, float %212) #3
  %225 = call nsz arcp contract float @llvm.fma.f32(float %221, float %90, float %213) #3
  %226 = add i32 %130, 32
  %227 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %226, i32 0) #3
  %228 = add i32 %130, 36
  %229 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %228, i32 0) #3
  %230 = add i32 %130, 40
  %231 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %230, i32 0) #3
  %232 = add i32 %130, 44
  %233 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %232, i32 0) #3
  %234 = call nsz arcp contract float @llvm.fma.f32(float %227, float %91, float %222) #3
  %235 = call nsz arcp contract float @llvm.fma.f32(float %229, float %91, float %223) #3
  %236 = call nsz arcp contract float @llvm.fma.f32(float %231, float %91, float %224) #3
  %237 = call nsz arcp contract float @llvm.fma.f32(float %233, float %91, float %225) #3
  %238 = add i32 %142, 32
  %239 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %238, i32 0) #3
  %240 = add i32 %142, 36
  %241 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %240, i32 0) #3
  %242 = add i32 %142, 40
  %243 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %242, i32 0) #3
  %244 = add i32 %142, 44
  %245 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %106, i32 %244, i32 0) #3
  %246 = call nsz arcp contract float @llvm.fma.f32(float %239, float %92, float %234) #3
  %247 = call nsz arcp contract float @llvm.fma.f32(float %241, float %92, float %235) #3
  %248 = call nsz arcp contract float @llvm.fma.f32(float %243, float %92, float %236) #3
  %249 = call nsz arcp contract float @llvm.fma.f32(float %245, float %92, float %237) #3
  %250 = fmul nsz arcp contract float %73, %151
  %251 = call nsz arcp contract float @llvm.fma.f32(float %72, float %150, float %250) #3
  %252 = call nsz arcp contract float @llvm.fma.f32(float %74, float %152, float %251) #3
  %253 = call nsz arcp contract float @llvm.fma.f32(float %75, float %153, float %252) #3
  %254 = fmul nsz arcp contract float %73, %199
  %255 = call nsz arcp contract float @llvm.fma.f32(float %72, float %198, float %254) #3
  %256 = call nsz arcp contract float @llvm.fma.f32(float %74, float %200, float %255) #3
  %257 = call nsz arcp contract float @llvm.fma.f32(float %75, float %201, float %256) #3
  %258 = fmul nsz arcp contract float %73, %247
  %259 = call nsz arcp contract float @llvm.fma.f32(float %72, float %246, float %258) #3
  %260 = call nsz arcp contract float @llvm.fma.f32(float %74, float %248, float %259) #3
  %261 = call nsz arcp contract float @llvm.fma.f32(float %75, float %249, float %260) #3
  br label %endif1

endif1:                                           ; preds = %if11500, %if1
  %.in = phi float [ %253, %if1 ], [ %72, %if11500 ]
  %.in7 = phi float [ %257, %if1 ], [ %73, %if11500 ]
  %.in8 = phi float [ %261, %if1 ], [ %74, %if11500 ]
  %262 = phi float [ 1.000000e+00, %if1 ], [ %75, %if11500 ]
  %263 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 16, i32 0) #3
  %264 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 20, i32 0) #3
  %265 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 24, i32 0) #3
  %266 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 28, i32 0) #3
  %267 = fmul nsz arcp contract float %.in7, %264
  %268 = call nsz arcp contract float @llvm.fma.f32(float %.in, float %263, float %267) #3
  %269 = call nsz arcp contract float @llvm.fma.f32(float %.in8, float %265, float %268) #3
  %270 = call nsz arcp contract float @llvm.fma.f32(float %262, float %266, float %269) #3
  %271 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 32, i32 0) #3
  %272 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 36, i32 0) #3
  %273 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 40, i32 0) #3
  %274 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 44, i32 0) #3
  %275 = fmul nsz arcp contract float %.in7, %272
  %276 = call nsz arcp contract float @llvm.fma.f32(float %.in, float %271, float %275) #3
  %277 = call nsz arcp contract float @llvm.fma.f32(float %.in8, float %273, float %276) #3
  %278 = call nsz arcp contract float @llvm.fma.f32(float %262, float %274, float %277) #3
  %279 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 48, i32 0) #3
  %280 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 52, i32 0) #3
  %281 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 56, i32 0) #3
  %282 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 60, i32 0) #3
  %283 = fmul nsz arcp contract float %.in7, %280
  %284 = call nsz arcp contract float @llvm.fma.f32(float %.in, float %279, float %283) #3
  %285 = call nsz arcp contract float @llvm.fma.f32(float %.in8, float %281, float %284) #3
  %286 = call nsz arcp contract float @llvm.fma.f32(float %262, float %282, float %285) #3
  %287 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 64, i32 0) #3
  %288 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 68, i32 0) #3
  %289 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 72, i32 0) #3
  %290 = call nsz arcp contract float @llvm.amdgcn.s.buffer.load.f32(<4 x i32> %63, i32 76, i32 0) #3
  %291 = fmul nsz arcp contract float %.in7, %288
  %292 = call nsz arcp contract float @llvm.fma.f32(float %.in, float %287, float %291) #3
  %293 = call nsz arcp contract float @llvm.fma.f32(float %.in8, float %289, float %292) #3
  %294 = call nsz arcp contract float @llvm.fma.f32(float %262, float %290, float %293) #3
  call void @llvm.amdgcn.exp.f32(i32 12, i32 15, float %270, float %278, float %286, float %294, i1 true, i1 true) #2
  br label %endif6002

endif6002:                                        ; preds = %endif1, %endif6001
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

; Function Attrs: nounwind readnone
declare float @llvm.amdgcn.s.buffer.load.f32(<4 x i32>, i32, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #6

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #6

attributes #0 = { "amdgpu-32bit-address-high-bits"="0xffff8000" "amdgpu-flat-work-group-size"="128,128" "no-signed-zeros-fp-math"="true" }
attributes #1 = { convergent nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inaccessiblememonly nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { nounwind readnone speculatable willreturn }

!0 = !{i32 0, i32 64}
!1 = !{}
