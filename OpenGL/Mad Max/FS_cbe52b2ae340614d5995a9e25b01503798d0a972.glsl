#version 460 core
// ps_5_0
// Checksum: 9cd0c552_2224bd81_be7c4fa3_88cc70bc
// Name: fastter_noplxlod12cgc

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
	r0.xy = v2.v.xz * vec2(0.00390625000f, 0.00390625000f);
	r0.z = saturate(v3.v.y);
	r1.xy = v2.v.xz * vec2(0.00150000001f, 0.00150000001f);
	r1.xyz = ((texture(resourceSamplerPair_0_ps, r1.xy)).xywz).xyz;
	r1.xy = fma(r1.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = r1.z * float(0.200000003f);
	r1.zw = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).yzxw).zw;
	r1.zw = fma(r1.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xy = r1.xy * v3.v.zz;
	r2.xy = fma(r2.xy, vec2(0.0199999996f, 0.0199999996f), v1.v.xy);
	r2.z = dot(-r1.zw, -r1.zw);
	r2.z = min(r2.z, float(1.00000000f));
	r2.z = sqrt(r2.z);
	r2.w = fma(r2.z, float(0.600000024f), float(0.400000006f));
	r2.z = r2.w * r2.z;
	r0.w = r0.w * r2.z;
	r1.xy = r1.xy * r2.zz;
	r1.xy = fma(-r1.xy, v3.v.zz, -r1.zw);
	r3.xyz = ((texture(resourceSamplerPair_2_ps, r2.xy))).xyz;
	r2 = (texture(resourceSamplerPair_3_ps, r2.xy));
	r2 = r2 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r2 = roundEven(r2);
	r1.z = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r1.z + float(1.00000000f);
	r2 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r2.xzwy);
	r1.z = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r3 = r3 / r1.zzzz;
	r4 = r2.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r5.yw = r4.xz;
	r1.zw = ((texture(resourceSamplerPair_4_ps, r5.xy))).zw;
	r5.xy = ((texture(resourceSamplerPair_4_ps, r5.zw)).zwxy).xy;
	r4.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r4.xy = ((texture(resourceSamplerPair_4_ps, r4.xy)).zwxy).xy;
	r6.zw = ((texture(resourceSamplerPair_4_ps, r4.zw)).xywz).zw;
	r4.z = r3.y * r5.y;
	r1.w = fma(r1.w, r3.x, r4.z);
	r1.w = fma(r4.y, r3.z, r1.w);
	r1.w = fma(r6.z, r3.w, r1.w);
	r0.xy = ((texture(resourceSamplerPair_5_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r1.w = r1.w * float(1.50000000f);
	r0.xy = fma(r1.ww, r0.xy, r1.xy);
	r7.x = uintBitsToFloat(uint(0x3c800000));
	r7.yz = r2.xw;
	r1.xyw = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r7.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r2.x = uintBitsToFloat(uint(0x3c800000));
	r2.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r2.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r7.x = ((texture(resourceSamplerPair_4_ps, r1.xy)).yxzw).x;
	r7.y = ((texture(resourceSamplerPair_4_ps, r1.xw))).y;
	r7.z = ((texture(resourceSamplerPair_4_ps, r2.xy)).xzyw).z;
	r7.w = ((texture(resourceSamplerPair_4_ps, r2.xz)).xzwy).w;
	r2 = r7 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r2 = roundEven(r2);
	r6.x = r1.z;
	r6.y = r5.x;
	r6.z = r4.x;
	r1 = r3 * r6;
	r1 = r1 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r4.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.z = r2.x;
	r5.xy = ((texture(resourceSamplerPair_6_ps, r4.xyz)).ywxz).xy;
	r5.xy = fma(r5.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.x = ((texture(resourceSamplerPair_7_ps, r4.xyz)).wxyz).x;
	r6.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r6.z = r2.y;
	r4.yz = ((texture(resourceSamplerPair_6_ps, r6.xyz)).xywz).yz;
	r4.yz = fma(r4.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.yz = r1.yy * r4.yz;
	r1.xy = fma(r1.xx, r5.xy, r4.yz);
	r4.y = ((texture(resourceSamplerPair_7_ps, r6.xyz)).xwyz).y;
	r3.y = r3.y * r4.y;
	r3.x = fma(r3.x, r4.x, r3.y);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.xy = ((texture(resourceSamplerPair_6_ps, r2.xyz)).ywxz).xy;
	r4.xy = fma(r4.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r1.zz, r4.xy, r1.xy);
	r1.z = ((texture(resourceSamplerPair_7_ps, r2.xyz)).xywz).z;
	r1.z = fma(r3.z, r1.z, r3.x);
	r2.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r3.xy = ((texture(resourceSamplerPair_6_ps, r2.xyw)).ywxz).xy;
	r3.xy = fma(r3.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r1.ww, r3.xy, r1.xy);
	r1.w = ((texture(resourceSamplerPair_7_ps, r2.xyw))).w;
	r1.z = fma(r3.w, r1.w, r1.z);
	r1.xy = r0.zz * r1.xy;
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r1.w = dot(r0.xy, r0.xy);
	r1.w = r1.w + float(1.00000000f);
	r2.x = inversesqrt(r1.w);
	r3.xz = r0.xy * r2.xx;
	r0.x = dot(r1.xy, r1.xy);
	r0.x = -r0.x + float(1.00000000f);
	r0.x = sqrt(abs(r0.x));
	r2.y = -1.f * r3.x;
	r2.z = uintBitsToFloat(uint(0x00000000));
	r3.y = r2.x;
	r4.xyz = fma(r1.xxx, r2.xyz, r3.xyz);
	r4.xyz = fma(r0.xxx, r3.xyz, r4.xyz);
	r5.xz = r2.zx * vec2(1.00000000f, -1.00000000f);
	r5.y = r3.z;
	r1.xyw = fma(r1.yyy, r5.xyz, r4.xyz);
	r0.x = dot(r1.xyw, r1.xyw);
	r0.x = inversesqrt(r0.x);
	r4.xyz = r0.xxx * r1.xyw;
	r0.y = saturate(r0.z * r1.z);
	r6.y = fma(r0.w, v3.v.z, r0.y);
	r7.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r7.x = v2.v.x;
	r8 = r7.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r0.yzw = ((texture(resourceSamplerPair_8_ps, r8.xy)).wxyz).yzw;
	r1.x = saturate(r4.z * idx_uniforms1_ps.cb1[14].z);
	r0.x = fma(r1.y, r0.x, r1.x);
	r1.x = intBitsToFloat(r0.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r9 = (texture(resourceSamplerPair_9_ps, r8.xy));
	r1.y = ((texture(resourceSamplerPair_9_ps, r8.zw)).xwyz).y;
	r1.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r1.zw = fma(r7.xy, vec2(0.0206250008f, 0.00562500022f), r1.zw);
	r1.z = ((texture(resourceSamplerPair_9_ps, r1.zw)).xywz).z;
	if (floatBitsToUint(r1.x) != uint(0))
	{
		r7.xyz = fma(r0.wyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7.w = r7.y * float(2.00000000f);
		r0.yzw = fma(r7.wwy, r2.xyz, r3.xyz);
		r0.yzw = fma(r7.xxx, r3.xyz, r0.yzw);
		r2.xyz = r7.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r0.yzw = fma(r2.xyz, r5.xyz, r0.yzw);
		r1.x = dot(r0.yzw, r0.yzw);
		r1.x = inversesqrt(r1.x);
		r2 = (texture(resourceSamplerPair_10_ps, v1.v.zw));
		r1.w = min(r2.w, idx_uniforms1_ps.cb1[14].x);
		r1.w = saturate(r1.w * idx_uniforms1_ps.cb1[14].y);
		r2.w = uintBitsToFloat(uint(0x3f800000));
		r2.xyz = r2.xyz * r9.xyz;
		r2.w = fma(r9.w, r2.w, float(0.750000000f));
		r3.x = r1.y * r2.w;
		r3.y = r1.w * float(0.699999988f);
		r1.y = fma(-r1.y, r2.w, float(0.100000001f));
		r1.y = fma(r3.y, r1.y, r3.x);
		r1.z = -r1.z + float(1.00000000f);
		r1.y = saturate(fma(-r1.z, idx_uniforms1_ps.cb1[15].x, r1.y));
		r1.y = r1.y * r1.w;
		r1.z = r1.y * float(3.00000000f);
		r1.y = fma(r1.y, float(-0.300000012f), float(0.800000012f));
		r1.z = min(r1.z, float(1.00000000f));
		r1.w = -r1.y + float(1.00000000f);
		r1.z = r1.z / r1.w;
		r0.x = r0.x + -r1.y;
		r0.x = saturate(r1.z * r0.x);
		r1.yzw = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r1.yzw = fma(r0.xxx, r1.yzw, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r2.xyz = -r6.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r6.xyz = fma(r0.xxx, r2.xyz, r6.xyz);
		r0.yzw = fma(r0.yzw, r1.xxx, -r4.xyz);
		r0.xyz = fma(r0.xxx, r0.yzw, r4.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r4.xyz = r0.www * r0.xyz;
	}
	else
	{
		r1.yzw = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r6.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r4.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r1.yzw;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r6.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

