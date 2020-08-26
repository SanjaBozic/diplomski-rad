#version 460 core
// ps_5_0
// Checksum: 29b03360_0999b148_70ab3af7_dda74abf
// Name: fastter_lod1

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res10, s10

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res4, s4

uniform sampler2D resourceSamplerPair_5_ps; // res6, s6

uniform sampler2D resourceSamplerPair_6_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_7_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_8_ps; // res9, s9

uniform sampler2D resourceSamplerPair_9_ps; // res12, s12

uniform sampler2D resourceSamplerPair_10_ps; // res11, s11

uniform sampler2D resourceSamplerPair_11_ps; // res13, s13


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v2.v.xz * vec2(0.00390625000f, 0.00390625000f);
	r1 = v2.v.xzxz * vec4(0.00150000001f, 0.00150000001f, 0.00499999989f, 0.00499999989f);
	r2.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy)).xywz).xyz;
	r0.zw = fma(r2.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.x = ((texture(resourceSamplerPair_0_ps, r1.zw)).zxyw).x;
	r1.x = fma(r1.x, float(2.00000000f), float(-1.00000000f));
	r1.x = r1.x * v3.v.z;
	r1.y = r2.z * float(0.200000003f);
	r1.zw = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).yzxw).zw;
	r1.zw = fma(r1.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xy = r0.zw * v3.v.zz;
	r2.xy = fma(r2.xy, vec2(0.0199999996f, 0.0199999996f), v1.v.xy);
	r3.xyz = ((texture(resourceSamplerPair_2_ps, r2.xy))).xyz;
	r2.z = dot(-r1.zw, -r1.zw);
	r2.z = min(r2.z, float(1.00000000f));
	r2.z = sqrt(r2.z);
	r2.w = fma(r2.z, float(0.600000024f), float(0.400000006f));
	r2.z = r2.w * r2.z;
	r1.y = r1.y * r2.z;
	r0.zw = r0.zw * r2.zz;
	r0.zw = fma(-r0.zw, v3.v.zz, -r1.zw);
	r1.x = r1.x * r2.z;
	r1.x = fma(r1.x, float(10.0000000f), float(1.00000000f));
	r3.xyz = r1.xxx * r3.xyz;
	r4.xyz = ((texture(resourceSamplerPair_3_ps, r2.xy))).xyz;
	r2 = (texture(resourceSamplerPair_4_ps, r2.xy));
	r2 = r2 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r2 = roundEven(r2);
	r1.x = saturate(dot(r4.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r4.w = -r1.x + float(1.00000000f);
	r2 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r2.xzwy);
	r1.x = dot(r4, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r4 = r4 / r1.xxxx;
	r5 = r2.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r6.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r6.yw = r5.xz;
	r1.xz = ((texture(resourceSamplerPair_5_ps, r6.xy)).zxwy).xz;
	r6.xy = ((texture(resourceSamplerPair_5_ps, r6.zw)).zwxy).xy;
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r5.xy = ((texture(resourceSamplerPair_5_ps, r5.xy)).zwxy).xy;
	r7.zw = ((texture(resourceSamplerPair_5_ps, r5.zw)).xywz).zw;
	r1.w = r4.y * r6.y;
	r1.z = fma(r1.z, r4.x, r1.w);
	r1.z = fma(r5.y, r4.z, r1.z);
	r1.z = fma(r7.z, r4.w, r1.z);
	r0.xy = ((texture(resourceSamplerPair_6_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r1.z = r1.z * float(1.50000000f);
	r0.xy = fma(r1.zz, r0.xy, r0.zw);
	r8.x = uintBitsToFloat(uint(0x3c800000));
	r8.yz = r2.xw;
	r5.yzw = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r8.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r2.x = uintBitsToFloat(uint(0x3c800000));
	r2.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r2.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r8.x = ((texture(resourceSamplerPair_5_ps, r5.yz)).yxzw).x;
	r8.y = ((texture(resourceSamplerPair_5_ps, r5.yw))).y;
	r8.z = ((texture(resourceSamplerPair_5_ps, r2.xy)).xzyw).z;
	r8.w = ((texture(resourceSamplerPair_5_ps, r2.xz)).xzwy).w;
	r2 = r8 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r2 = roundEven(r2);
	r7.x = r1.x;
	r7.y = r6.x;
	r7.z = r5.x;
	r5 = r4 * r7;
	r5 = r5 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r6.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r6.z = r2.x;
	r0.zw = ((texture(resourceSamplerPair_7_ps, r6.xyz)).xzyw).zw;
	r0.zw = fma(r0.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6 = (texture(resourceSamplerPair_8_ps, r6.xyz));
	r7.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r7.z = r2.y;
	r1.xz = ((texture(resourceSamplerPair_7_ps, r7.xyz)).yxwz).xz;
	r1.xz = fma(r1.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xz = r1.xz * r5.yy;
	r0.zw = fma(r5.xx, r0.zw, r1.xz);
	r7 = (texture(resourceSamplerPair_8_ps, r7.xyz));
	r7 = r4.yyyy * r7;
	r6 = fma(r4.xxxx, r6, r7);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r1.xz = ((texture(resourceSamplerPair_7_ps, r2.xyz)).yxwz).xz;
	r1.xz = fma(r1.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r5.zz, r1.xz, r0.zw);
	r7 = (texture(resourceSamplerPair_8_ps, r2.xyz));
	r6 = fma(r4.zzzz, r7, r6);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r1.xz = ((texture(resourceSamplerPair_7_ps, r2.xyw)).yxwz).xz;
	r1.xz = fma(r1.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r5.ww, r1.xz, r0.zw);
	r2 = (texture(resourceSamplerPair_8_ps, r2.xyw));
	r2 = fma(r4.wwww, r2, r6);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r1.x = dot(r0.xy, r0.xy);
	r1.x = r1.x + float(1.00000000f);
	r4.x = inversesqrt(r1.x);
	r5.xz = r0.xy * r4.xx;
	r0.x = dot(r0.zw, r0.zw);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = sqrt(abs(r0.x));
	r4.y = -1.f * r5.x;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r5.y = r4.x;
	r1.xzw = fma(r0.zzz, r4.xyz, r5.xyz);
	r0.xyz = fma(r0.xxx, r5.xyz, r1.xzw);
	r6.xz = r4.zx * vec2(1.00000000f, -1.00000000f);
	r6.y = r5.z;
	r0.xyz = fma(r0.www, r6.xyz, r0.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xzw = r0.www * r0.xyz;
	r3.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r2 * r3;
	r2 = saturate(r2 * vec4(4.69999981f, 4.69999981f, 4.69999981f, 1.00000000f));
	r3.y = fma(r1.y, v3.v.z, r2.w);
	r7.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r7.x = v2.v.x;
	r8 = r7.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r9.xyz = ((texture(resourceSamplerPair_9_ps, r8.xy))).xyz;
	r0.x = saturate(r1.w * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r0.y, r0.w, r0.x);
	r0.y = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r10 = (texture(resourceSamplerPair_10_ps, r8.xy));
	r0.z = ((texture(resourceSamplerPair_10_ps, r8.zw)).xywz).z;
	r7.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r7.xy = fma(r7.xy, vec2(0.0206250008f, 0.00562500022f), r7.zw);
	r0.w = ((texture(resourceSamplerPair_10_ps, r7.xy))).w;
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r7.xyz = fma(r9.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7.w = r7.y * float(2.00000000f);
		r4.xyz = fma(r7.wwy, r4.xyz, r5.xyz);
		r4.xyz = fma(r7.xxx, r5.xyz, r4.xyz);
		r5.xyz = r7.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r4.xyz = fma(r5.xyz, r6.xyz, r4.xyz);
		r0.y = dot(r4.xyz, r4.xyz);
		r0.y = inversesqrt(r0.y);
		r5 = (texture(resourceSamplerPair_11_ps, v1.v.zw));
		r1.y = min(r5.w, idx_uniforms1_ps.cb1[14].x);
		r1.y = saturate(r1.y * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r5.xyz = r5.xyz * r10.xyz;
		r2.w = fma(r10.w, r2.w, float(0.750000000f));
		r3.w = r0.z * r2.w;
		r4.w = r1.y * float(0.699999988f);
		r0.z = fma(-r0.z, r2.w, float(0.100000001f));
		r0.z = fma(r4.w, r0.z, r3.w);
		r0.w = -r0.w + float(1.00000000f);
		r0.z = saturate(fma(-r0.w, idx_uniforms1_ps.cb1[15].x, r0.z));
		r0.z = r0.z * r1.y;
		r0.w = r0.z * float(3.00000000f);
		r0.z = fma(r0.z, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.y = -r0.z + float(1.00000000f);
		r0.w = r0.w / r1.y;
		r0.x = -r0.z + r0.x;
		r0.x = saturate(r0.w * r0.x);
		r5.xyz = fma(r5.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r2.xyz);
		r2.xyz = fma(r0.xxx, r5.xyz, r2.xyz);
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r5.xyz = -r3.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r3.xyz = fma(r0.xxx, r5.xyz, r3.xyz);
		r0.yzw = fma(r4.xyz, r0.yyy, -r1.xzw);
		r0.xyz = fma(r0.xxx, r0.yzw, r1.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r1.xzw = r0.www * r0.xyz;
	}
	else
	{
		r3.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r1.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r2.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r3.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

