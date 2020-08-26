#version 460 core
// ps_5_0
// Checksum: c68e24ce_5ff71178_916c9e84_450e1755
// Name: fastter_lod01

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res4, s4

uniform sampler2D resourceSamplerPair_4_ps; // res6, s6

uniform sampler2D resourceSamplerPair_5_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_6_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_7_ps; // res9, s9

uniform sampler2DArray resourceSamplerPair_8_ps; // res7, s7

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
	r0.zw = v2.v.xz * idx_uniforms1_ps.cb1[4].zz;
	r1.xy = dFdxCoarse(v2.v.xz);
	r1.zw = dFdyCoarse(v2.v.xz);
	r1.x = dot(r1, r1);
	r1.x = log2(r1.x);
	r1.x = fma(r1.x, float(0.500000000f), float(6.50000000f));
	r1.x = min(r1.x, float(6.00000000f));
	r1.y = saturate(v3.v.x);
	r1.zw = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).zw;
	r1.zw = fma(r1.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r3.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r4 = (texture(resourceSamplerPair_3_ps, v1.v.xy));
	r4 = r4 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r4 = roundEven(r4);
	r5.x = saturate(dot(r3.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r3.w = -r5.x + float(1.00000000f);
	r4 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r4.xzwy);
	r5.x = dot(r3, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r3 = r3 / r5.xxxx;
	r5 = r4.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r6.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r6.yw = r5.xz;
	r7.xyz = ((texture(resourceSamplerPair_4_ps, r6.xy)).xzwy).xyz;
	r6.xyz = ((texture(resourceSamplerPair_4_ps, r6.zw)).xzwy).xyz;
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r8.xyz = ((texture(resourceSamplerPair_4_ps, r5.xy)).xzwy).xyz;
	r5.xyz = ((texture(resourceSamplerPair_4_ps, r5.zw)).xzwy).xyz;
	r5.w = r3.y * r6.z;
	r5.w = fma(r7.z, r3.x, r5.w);
	r5.w = fma(r8.z, r3.z, r5.w);
	r5.z = fma(r5.z, r3.w, r5.w);
	r0.xy = ((texture(resourceSamplerPair_5_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r5.z = r5.z * float(1.50000000f);
	r0.xy = fma(r5.zz, r0.xy, -r1.zw);
	r9.x = uintBitsToFloat(uint(0x3c800000));
	r9.yz = r4.xw;
	r9.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r9.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r4.x = uintBitsToFloat(uint(0x3c800000));
	r4.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r4.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r10.x = ((texture(resourceSamplerPair_4_ps, r9.xy)).yxzw).x;
	r10.y = ((texture(resourceSamplerPair_4_ps, r9.xz))).y;
	r10.z = ((texture(resourceSamplerPair_4_ps, r4.xy)).xzyw).z;
	r10.w = ((texture(resourceSamplerPair_4_ps, r4.xz)).xzwy).w;
	r4 = r10 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r4 = roundEven(r4);
	r9.x = r7.y;
	r9.y = r6.y;
	r9.z = r8.y;
	r9.w = r5.y;
	r9 = r3 * r9;
	r9 = r9 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r10.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r10.zw = r4.xy;
	r1.zw = ((texture(resourceSamplerPair_6_ps, r10.xyz)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r11 = (texture(resourceSamplerPair_7_ps, r10.xyz));
	r10.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.yz = ((texture(resourceSamplerPair_6_ps, r10.xyw)).xywz).yz;
	r5.yz = fma(r5.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r5.yz = r5.yz * r9.yy;
	r1.zw = fma(r9.xx, r1.zw, r5.yz);
	r12 = (texture(resourceSamplerPair_7_ps, r10.xyw));
	r12 = r3.yyyy * r12;
	r11 = fma(r3.xxxx, r11, r12);
	r4.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.yz = ((texture(resourceSamplerPair_6_ps, r4.xyz)).xywz).yz;
	r5.yz = fma(r5.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.zw = fma(r9.zz, r5.yz, r1.zw);
	r12 = (texture(resourceSamplerPair_7_ps, r4.xyz));
	r11 = fma(r3.zzzz, r12, r11);
	r4.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r5.yz = ((texture(resourceSamplerPair_6_ps, r4.xyw)).xywz).yz;
	r5.yz = fma(r5.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.zw = fma(r9.ww, r5.yz, r1.zw);
	r12 = (texture(resourceSamplerPair_7_ps, r4.xyw));
	r11 = fma(r3.wwww, r12, r11);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r5.y = dot(r0.xy, r0.xy);
	r5.y = r5.y + float(1.00000000f);
	r12.y = inversesqrt(r5.y);
	r12.xz = r0.xy * r12.yy;
	r5.yzw = -r12.xyz + v4.v.xyz;
	r5.yzw = fma(r1.yyy, r5.yzw, r12.xyz);
	r0.x = dot(r5.yzw, r5.yzw);
	r0.x = inversesqrt(r0.x);
	r6.yzw = r0.xxx * r5.yzw;
	r0.y = dot(v4.v.xyz, v4.v.xyz);
	r0.y = inversesqrt(r0.y);
	r7.yzw = r0.yyy * v4.v.xyz;
	r8.yzw = r7.wyz * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r8.yzw = fma(r7.zwy, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r8.yzw);
	r0.y = dot(r8.yz, r8.yz);
	r0.y = inversesqrt(r0.y);
	r8.yzw = r0.yyy * r8.yzw;
	r0.y = dot(r8.yz, r7.yz);
	r8.yzw = fma(-r7.yzw, r0.yyy, r8.yzw);
	r0.y = dot(r8.yzw, r8.yzw);
	r0.y = inversesqrt(r0.y);
	r8.yzw = r0.yyy * r8.yzw;
	r12.xyz = r7.wyz * r8.zwy;
	r12.xyz = fma(r7.zwy, r8.wyz, -r12.xyz);
	r13.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.y = dot(r13.xyz, r13.xyz);
	r0.y = inversesqrt(r0.y);
	r13.xyz = r0.yyy * r13.xyz;
	r14.x = dot(-r8.yzw, r13.xyz);
	r14.y = dot(r12.xyz, r13.xyz);
	r0.y = dot(-r7.yzw, r13.xyz);
	r7.y = max(-r0.y, float(0.500000000f));
	r7.z = -r1.y + float(1.00000000f);
	r7.z = fma(r7.z, float(3.00000000f), float(1.00000000f));
	r7.y = r7.z * r7.y;
	r7.y = float(8.00000000f) / r7.y;
	r7.y = max(r7.y, float(1.00000000f));
	r7.z = float(1.00000000f) / r7.y;
	r0.y = min(r0.y, float(-0.200000003f));
	r0.y = r0.y * r7.y;
	r8.yz = r14.xy / r0.yy;
	r12 = r3 + vec4(-0.400000006f, -0.400000006f, -0.400000006f, -0.400000006f);
	r12 = saturate(r12 * vec4(6.00000000f, 6.00000000f, 6.00000000f, 6.00000000f));
	r13 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(vec4(0.400000006f, 0.400000006f, 0.400000006f, 0.400000006f), r3))));
	if (floatBitsToUint(r13.x) != uint(0))
	{
		r0.y = r7.x * r12.x;
		r0.y = r0.y * float(0.0799999982f);
		r7.xw = r0.yy * r8.yz;
		r7.xw = r7.yy * r7.xw;
		r14.xy = fma(-r7.xw, vec2(0.500000000f, 0.500000000f), r0.zw);
		r15.z = r10.z;
		r15.xy = r14.xy;
		r8.w = uintBitsToFloat(uint(0x3f800000));
		r12.x = uintBitsToFloat(uint(0x00000000));
		r13.x = uintBitsToFloat(uint(0x00000000));
		r14.z = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r14.w = intBitsToFloat(r14.z < r7.y ? int(0xffffffff) : int(0x00000000));
			r15.w = intBitsToFloat(r12.x < r8.w ? int(0xffffffff) : int(0x00000000));
			r14.w = uintBitsToFloat(floatBitsToUint(r14.w) & floatBitsToUint(r15.w));
			if (floatBitsToUint(r14.w) == uint(0))
				break;
			r8.w = -r7.z + r8.w;
			r15.xy = fma(r8.yz, r0.yy, r15.xy);
			r14.w = ((textureLod(resourceSamplerPair_8_ps, r15.xyz, r1.x))).w;
			r14.z = r14.z + float(1.00000000f);
			r13.x = r12.x;
			r12.x = r14.w;
		}
		r0.y = r7.z + r8.w;
		r12.x = r8.w + -r12.x;
		r13.x = -r13.x + r0.y;
		r0.y = r0.y * r12.x;
		r0.y = fma(r8.w, r13.x, -r0.y);
		r8.w = -r12.x + r13.x;
		r0.y = r0.y / r8.w;
		r0.y = -r0.y + float(1.00000000f);
		r10.xy = fma(r0.yy, r7.xw, r14.xy);
	}
	else
	{
		r10.xy = r0.zw;
	}
	if (floatBitsToUint(r13.y) != uint(0))
	{
		r0.y = r6.x * r12.y;
		r0.y = r0.y * float(0.0799999982f);
		r0.zw = r0.yy * r8.yz;
		r0.zw = r7.yy * r0.zw;
		r7.xw = fma(-r0.zw, vec2(0.500000000f, 0.500000000f), r10.xy);
		r14.z = r10.w;
		r14.xy = r7.xw;
		r6.x = uintBitsToFloat(uint(0x3f800000));
		r8.w = uintBitsToFloat(uint(0x00000000));
		r12.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r13.x = intBitsToFloat(r12.y < r7.y ? int(0xffffffff) : int(0x00000000));
			r13.y = intBitsToFloat(r8.w < r6.x ? int(0xffffffff) : int(0x00000000));
			r13.x = uintBitsToFloat(floatBitsToUint(r13.y) & floatBitsToUint(r13.x));
			if (floatBitsToUint(r13.x) == uint(0))
				break;
			r6.x = -r7.z + r6.x;
			r14.xy = fma(r8.yz, r0.yy, r14.xy);
			r13.x = ((textureLod(resourceSamplerPair_8_ps, r14.xyz, r1.x)).wxyz).x;
			r12.y = r12.y + float(1.00000000f);
			r12.x = r8.w;
			r8.w = r13.x;
		}
		r0.y = r7.z + r6.x;
		r8.w = r6.x + -r8.w;
		r12.x = -r12.x + r0.y;
		r0.y = r0.y * r8.w;
		r0.y = fma(r6.x, r12.x, -r0.y);
		r6.x = -r8.w + r12.x;
		r0.y = r0.y / r6.x;
		r0.y = -r0.y + float(1.00000000f);
		r10.xy = fma(r0.yy, r0.zw, r7.xw);
	}
	if (floatBitsToUint(r13.z) != uint(0))
	{
		r0.y = r8.x * r12.z;
		r0.y = r0.y * float(0.0799999982f);
		r0.zw = r0.yy * r8.yz;
		r0.zw = r7.yy * r0.zw;
		r7.xw = fma(-r0.zw, vec2(0.500000000f, 0.500000000f), r10.xy);
		r12.z = r4.z;
		r12.xy = r7.xw;
		r6.x = uintBitsToFloat(uint(0x3f800000));
		r8.xw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		r13.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r13.y = intBitsToFloat(r13.x < r7.y ? int(0xffffffff) : int(0x00000000));
			r13.z = intBitsToFloat(r8.x < r6.x ? int(0xffffffff) : int(0x00000000));
			r13.y = uintBitsToFloat(floatBitsToUint(r13.z) & floatBitsToUint(r13.y));
			if (floatBitsToUint(r13.y) == uint(0))
				break;
			r6.x = -r7.z + r6.x;
			r12.xy = fma(r8.yz, r0.yy, r12.xy);
			r13.y = ((textureLod(resourceSamplerPair_8_ps, r12.xyz, r1.x)).xwyz).y;
			r13.x = r13.x + float(1.00000000f);
			r8.w = r8.x;
			r8.x = r13.y;
		}
		r0.y = r7.z + r6.x;
		r8.x = r6.x + -r8.x;
		r8.w = -r8.w + r0.y;
		r0.y = r0.y * r8.x;
		r0.y = fma(r6.x, r8.w, -r0.y);
		r6.x = -r8.x + r8.w;
		r0.y = r0.y / r6.x;
		r0.y = -r0.y + float(1.00000000f);
		r10.xy = fma(r0.yy, r0.zw, r7.xw);
	}
	if (floatBitsToUint(r13.w) != uint(0))
	{
		r0.y = r5.x * r12.w;
		r0.y = r0.y * float(0.0799999982f);
		r0.zw = r0.yy * r8.yz;
		r0.zw = r7.yy * r0.zw;
		r7.xw = fma(-r0.zw, vec2(0.500000000f, 0.500000000f), r10.xy);
		r12.z = r4.w;
		r12.xy = r7.xw;
		r5.x = uintBitsToFloat(uint(0x3f800000));
		r6.x = uintBitsToFloat(uint(0x00000000));
		r8.xw = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r12.w = intBitsToFloat(r8.w < r7.y ? int(0xffffffff) : int(0x00000000));
			r13.x = intBitsToFloat(r6.x < r5.x ? int(0xffffffff) : int(0x00000000));
			r12.w = uintBitsToFloat(floatBitsToUint(r12.w) & floatBitsToUint(r13.x));
			if (floatBitsToUint(r12.w) == uint(0))
				break;
			r5.x = -r7.z + r5.x;
			r12.xy = fma(r8.yz, r0.yy, r12.xy);
			r12.w = ((textureLod(resourceSamplerPair_8_ps, r12.xyz, r1.x))).w;
			r8.w = r8.w + float(1.00000000f);
			r8.x = r6.x;
			r6.x = r12.w;
		}
		r0.y = r7.z + r5.x;
		r1.x = r5.x + -r6.x;
		r6.x = -r8.x + r0.y;
		r0.y = r0.y * r1.x;
		r0.y = fma(r5.x, r6.x, -r0.y);
		r1.x = -r1.x + r6.x;
		r0.y = r0.y / r1.x;
		r0.y = -r0.y + float(1.00000000f);
		r10.xy = fma(r0.yy, r0.zw, r7.xw);
	}
	r0.yz = ((texture(resourceSamplerPair_6_ps, r10.xyz)).xywz).yz;
	r0.yz = fma(r0.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r7 = (texture(resourceSamplerPair_7_ps, r10.xyz));
	r8.xy = ((texture(resourceSamplerPair_6_ps, r10.xyw)).ywxz).xy;
	r8.xy = fma(r8.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r8.xy = r8.xy * r9.yy;
	r0.yz = fma(r9.xx, r0.yz, r8.xy);
	r8 = (texture(resourceSamplerPair_7_ps, r10.xyw));
	r8 = r3.yyyy * r8;
	r7 = fma(r3.xxxx, r7, r8);
	r4.xy = r10.xy;
	r3.xy = ((texture(resourceSamplerPair_6_ps, r4.xyz)).ywxz).xy;
	r3.xy = fma(r3.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.yz = fma(r9.zz, r3.xy, r0.yz);
	r8 = (texture(resourceSamplerPair_7_ps, r4.xyz));
	r7 = fma(r3.zzzz, r8, r7);
	r3.xy = ((texture(resourceSamplerPair_6_ps, r4.xyw)).ywxz).xy;
	r3.xy = fma(r3.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.yz = fma(r9.ww, r3.xy, r0.yz);
	r4 = (texture(resourceSamplerPair_7_ps, r4.xyw));
	r3 = fma(r3.wwww, r4, r7);
	r0.yz = fma(r0.yz, r1.yy, -r1.zw);
	r0.yz = fma(r1.yy, r0.yz, r1.zw);
	r0.w = dot(r0.yz, r0.yz);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = sqrt(abs(r0.w));
	r4.x = r6.z * r0.y;
	r4.y = -r6.y * r0.y;
	r4.z = uintBitsToFloat(uint(0x00000000));
	r1.xzw = fma(r5.yzw, r0.xxx, r4.xyz);
	r1.xzw = fma(r0.www, r6.yzw, r1.xzw);
	r4.x = uintBitsToFloat(uint(0x00000000));
	r4.yz = r6.wz * vec2(1.00000000f, -1.00000000f);
	r0.yzw = fma(r0.zzz, r4.xyz, r1.xzw);
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = inversesqrt(r1.x);
	r7.xyz = r0.yzw * r1.xxx;
	r3 = -r11 + r3;
	r3 = fma(r1.yyyy, r3, r11);
	r2.w = uintBitsToFloat(uint(0x3f800000));
	r2 = r2 * r3;
	r2 = saturate(r2.xwyz * vec4(4.69999981f, 1.00000000f, 4.69999981f, 4.69999981f));
	r0.yw = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r10.xy);
	r3.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r3.x = v2.v.x;
	r0.yw = fma(-r0.yw, vec2(9.00000000f, 9.00000000f), r3.xy);
	r3 = r0.ywyw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r1.yzw = ((texture(resourceSamplerPair_9_ps, r3.xy)).wxyz).yzw;
	r4.w = saturate(r7.z * idx_uniforms1_ps.cb1[14].z);
	r0.z = fma(r0.z, r1.x, r4.w);
	r1.x = intBitsToFloat(r0.z >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_10_ps, r3.xy));
	r3.x = ((texture(resourceSamplerPair_10_ps, r3.zw)).wxyz).x;
	r3.yz = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.yw = fma(r0.yw, vec2(0.0206250008f, 0.00562500022f), r3.yz);
	r0.y = ((texture(resourceSamplerPair_10_ps, r0.yw)).xwyz).y;
	if (floatBitsToUint(r1.x) != uint(0))
	{
		r1.xyz = fma(r1.wyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r9 = r1.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r10.x = r6.z * r9.x;
		r10.y = -r6.y * r9.x;
		r10.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(r5.yzw, r0.xxx, r10.xyz);
		r1.xyz = fma(r1.xxx, r6.yzw, r1.yzw);
		r1.xyz = fma(r9.yzw, r4.xyz, r1.xyz);
		r0.x = dot(r1.xyz, r1.xyz);
		r0.x = inversesqrt(r0.x);
		r4 = (texture(resourceSamplerPair_11_ps, v1.v.zw));
		r0.w = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r3.yzw = r4.xyz * r8.xyz;
		r1.w = fma(r8.w, r1.w, float(0.750000000f));
		r4.x = r1.w * r3.x;
		r4.y = r0.w * float(0.699999988f);
		r1.w = fma(-r3.x, r1.w, float(0.100000001f));
		r1.w = fma(r4.y, r1.w, r4.x);
		r0.y = -r0.y + float(1.00000000f);
		r0.y = saturate(fma(-r0.y, idx_uniforms1_ps.cb1[15].x, r1.w));
		r0.y = r0.y * r0.w;
		r0.w = r0.y * float(3.00000000f);
		r0.y = fma(r0.y, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.w = -r0.y + float(1.00000000f);
		r0.w = r0.w / r1.w;
		r0.y = -r0.y + r0.z;
		r0.y = saturate(r0.w * r0.y);
		r3.xyz = fma(r3.yzw, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r2.xzw);
		r3.xyz = fma(r0.yyy, r3.xyz, r2.xzw);
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r2.xyz = fma(r0.yyy, r4.xyz, r2.xyz);
		r0.xzw = fma(r1.xyz, r0.xxx, -r7.xyz);
		r0.xyz = fma(r0.yyy, r0.xzw, r7.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r7.xyz = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = r2.xzw;
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r7.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

