#version 460 core
// ps_5_0
// Checksum: ac6d9093_9911562a_6a45992b_880f7005
// Name: fastter_noplxlod1cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res10, s10

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res4, s4

uniform sampler2D resourceSamplerPair_4_ps; // res6, s6

uniform sampler2D resourceSamplerPair_5_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_6_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_7_ps; // res9, s9

uniform sampler2D resourceSamplerPair_8_ps; // res12, s12

uniform sampler2D resourceSamplerPair_9_ps; // res11, s11

uniform sampler2D resourceSamplerPair_10_ps; // res13, s13


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = v2.v.xzxz * vec4(0.00390625000f, 0.00390625000f, 0.00150000001f, 0.00150000001f);
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r0.zw)).xywz).xyz;
	r0.zw = fma(r1.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.x = r1.z * float(0.200000003f);
	r1.yz = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).yxwz).yz;
	r1.yz = fma(r1.yz, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xy = r0.zw * v3.v.zz;
	r2.xy = fma(r2.xy, vec2(0.0199999996f, 0.0199999996f), v1.v.xy);
	r1.w = dot(-r1.yz, -r1.yz);
	r1.w = min(r1.w, float(1.00000000f));
	r1.w = sqrt(r1.w);
	r2.z = fma(r1.w, float(0.600000024f), float(0.400000006f));
	r1.w = r1.w * r2.z;
	r1.x = r1.w * r1.x;
	r0.zw = r0.zw * r1.ww;
	r0.zw = fma(-r0.zw, v3.v.zz, -r1.yz);
	r3.xyz = ((texture(resourceSamplerPair_2_ps, r2.xy))).xyz;
	r2 = (texture(resourceSamplerPair_3_ps, r2.xy));
	r2 = r2 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r2 = roundEven(r2);
	r1.y = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r1.y + float(1.00000000f);
	r2 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r2.xzwy);
	r1.y = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r3 = r3 / r1.yyyy;
	r4 = r2.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r5.yw = r4.xz;
	r1.yz = ((texture(resourceSamplerPair_4_ps, r5.xy)).xzwy).yz;
	r5.xy = ((texture(resourceSamplerPair_4_ps, r5.zw)).zwxy).xy;
	r4.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r4.xy = ((texture(resourceSamplerPair_4_ps, r4.xy)).zwxy).xy;
	r6.zw = ((texture(resourceSamplerPair_4_ps, r4.zw)).xywz).zw;
	r1.w = r3.y * r5.y;
	r1.z = fma(r1.z, r3.x, r1.w);
	r1.z = fma(r4.y, r3.z, r1.z);
	r1.z = fma(r6.z, r3.w, r1.z);
	r0.xy = ((texture(resourceSamplerPair_5_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r1.z = r1.z * float(1.50000000f);
	r0.xy = fma(r1.zz, r0.xy, r0.zw);
	r7.x = uintBitsToFloat(uint(0x3c800000));
	r7.yz = r2.xw;
	r4.yzw = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r7.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r2.x = uintBitsToFloat(uint(0x3c800000));
	r2.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r2.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r7.x = ((texture(resourceSamplerPair_4_ps, r4.yz)).yxzw).x;
	r7.y = ((texture(resourceSamplerPair_4_ps, r4.yw))).y;
	r7.z = ((texture(resourceSamplerPair_4_ps, r2.xy)).xzyw).z;
	r7.w = ((texture(resourceSamplerPair_4_ps, r2.xz)).xzwy).w;
	r2 = r7 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r2 = roundEven(r2);
	r6.x = r1.y;
	r6.y = r5.x;
	r6.z = r4.x;
	r4 = r3 * r6;
	r4 = r4 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r5.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.z = r2.x;
	r0.zw = ((texture(resourceSamplerPair_6_ps, r5.xyz)).xzyw).zw;
	r0.zw = fma(r0.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.y = ((texture(resourceSamplerPair_7_ps, r5.xyz)).xwyz).y;
	r5.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.z = r2.y;
	r1.zw = ((texture(resourceSamplerPair_6_ps, r5.xyz)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.zw = r1.zw * r4.yy;
	r0.zw = fma(r4.xx, r0.zw, r1.zw);
	r1.z = ((texture(resourceSamplerPair_7_ps, r5.xyz)).xywz).z;
	r1.z = r1.z * r3.y;
	r1.y = fma(r3.x, r1.y, r1.z);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r1.zw = ((texture(resourceSamplerPair_6_ps, r2.xyz)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r4.zz, r1.zw, r0.zw);
	r1.z = ((texture(resourceSamplerPair_7_ps, r2.xyz)).xywz).z;
	r1.y = fma(r3.z, r1.z, r1.y);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r1.zw = ((texture(resourceSamplerPair_6_ps, r2.xyw)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.zw = fma(r4.ww, r1.zw, r0.zw);
	r1.z = ((texture(resourceSamplerPair_7_ps, r2.xyw)).xywz).z;
	r1.y = saturate(fma(r3.w, r1.z, r1.y));
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r1.z = dot(r0.xy, r0.xy);
	r1.z = r1.z + float(1.00000000f);
	r2.x = inversesqrt(r1.z);
	r3.xz = r0.xy * r2.xx;
	r0.x = dot(r0.zw, r0.zw);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = sqrt(abs(r0.x));
	r2.y = -1.f * r3.x;
	r2.z = uintBitsToFloat(uint(0x00000000));
	r3.y = r2.x;
	r4.xyz = fma(r0.zzz, r2.xyz, r3.xyz);
	r0.xyz = fma(r0.xxx, r3.xyz, r4.xyz);
	r4.xz = r2.zx * vec2(1.00000000f, -1.00000000f);
	r4.y = r3.z;
	r0.xyz = fma(r0.www, r4.xyz, r0.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = inversesqrt(r0.w);
	r5.xyz = r0.www * r0.xyz;
	r1.y = fma(r1.x, v3.v.z, r1.y);
	r6.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r6.x = v2.v.x;
	r7 = r6.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r8.xyz = ((texture(resourceSamplerPair_8_ps, r7.xy))).xyz;
	r0.x = saturate(r5.z * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r0.y, r0.w, r0.x);
	r0.y = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r9 = (texture(resourceSamplerPair_9_ps, r7.xy));
	r0.z = ((texture(resourceSamplerPair_9_ps, r7.zw)).xywz).z;
	r6.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r6.xy = fma(r6.xy, vec2(0.0206250008f, 0.00562500022f), r6.zw);
	r0.w = ((texture(resourceSamplerPair_9_ps, r6.xy))).w;
	if (floatBitsToUint(r0.y) != uint(0))
	{
		r6.xyz = fma(r8.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r6.w = r6.y * float(2.00000000f);
		r2.xyz = fma(r6.wwy, r2.xyz, r3.xyz);
		r2.xyz = fma(r6.xxx, r3.xyz, r2.xyz);
		r3.xyz = r6.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r2.xyz = fma(r3.xyz, r4.xyz, r2.xyz);
		r0.y = dot(r2.xyz, r2.xyz);
		r0.y = inversesqrt(r0.y);
		r3 = (texture(resourceSamplerPair_10_ps, v1.v.zw));
		r1.w = min(r3.w, idx_uniforms1_ps.cb1[14].x);
		r1.w = saturate(r1.w * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r9.xyz;
		r2.w = fma(r9.w, r2.w, float(0.750000000f));
		r3.w = r0.z * r2.w;
		r4.x = r1.w * float(0.699999988f);
		r0.z = fma(-r0.z, r2.w, float(0.100000001f));
		r0.z = fma(r4.x, r0.z, r3.w);
		r0.w = -r0.w + float(1.00000000f);
		r0.z = saturate(fma(-r0.w, idx_uniforms1_ps.cb1[15].x, r0.z));
		r0.z = r0.z * r1.w;
		r0.w = r0.z * float(3.00000000f);
		r0.z = fma(r0.z, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.w = -r0.z + float(1.00000000f);
		r0.w = r0.w / r1.w;
		r0.x = -r0.z + r0.x;
		r0.x = saturate(r0.w * r0.x);
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r3.xyz = fma(r0.xxx, r3.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r1.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r1.xyz = fma(r0.xxx, r4.xyz, r1.xyz);
		r0.yzw = fma(r2.xyz, r0.yyy, -r5.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r5.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r5.xyz = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r1.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r5.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r1.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

