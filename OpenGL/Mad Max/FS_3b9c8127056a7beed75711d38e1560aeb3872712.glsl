#version 460 core
// ps_5_0
// Checksum: 6b6d6e64_d95dc20f_acfa2d7a_4c353dcc
// Name: fastter_lod01cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[5]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res6, s6

uniform sampler2D resourceSamplerPair_4_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_5_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_6_ps; // res9, s9

uniform sampler2DArray resourceSamplerPair_7_ps; // res7, s7

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
	r3 = (texture(resourceSamplerPair_2_ps, v1.v.xy));
	r3 = r3 * vec4(15.0000000f, 15.0000000f, 15.0000000f, 15.0000000f);
	r3 = roundEven(r3);
	r4.x = saturate(dot(r2.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f)));
	r2.w = -r4.x + float(1.00000000f);
	r3 = fma(idx_uniforms1_ps.cb1[1].xxxx, vec4(16.0000000f, 16.0000000f, 16.0000000f, 16.0000000f), r3.xzwy);
	r4.x = dot(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r2 = r2 / r4.xxxx;
	r4 = r3.xywz * vec4(0.00784313772f, 0.00784313772f, 0.00784313772f, 0.00784313772f);
	r5.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r5.yw = r4.xz;
	r6.xyz = ((texture(resourceSamplerPair_3_ps, r5.xy)).xzwy).xyz;
	r5.xyz = ((texture(resourceSamplerPair_3_ps, r5.zw)).xzwy).xyz;
	r4.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r7.xyz = ((texture(resourceSamplerPair_3_ps, r4.xy)).xzwy).xyz;
	r4.xyz = ((texture(resourceSamplerPair_3_ps, r4.zw)).xzwy).xyz;
	r4.w = r2.y * r5.z;
	r4.w = fma(r6.z, r2.x, r4.w);
	r4.w = fma(r7.z, r2.z, r4.w);
	r4.z = fma(r4.z, r2.w, r4.w);
	r0.xy = ((texture(resourceSamplerPair_4_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r4.z = r4.z * float(1.50000000f);
	r0.xy = fma(r4.zz, r0.xy, -r1.zw);
	r8.x = uintBitsToFloat(uint(0x3c800000));
	r8.yz = r3.xw;
	r8.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r8.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r3.x = uintBitsToFloat(uint(0x3c800000));
	r3.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r3.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r9.x = ((texture(resourceSamplerPair_3_ps, r8.xy)).yxzw).x;
	r9.y = ((texture(resourceSamplerPair_3_ps, r8.xz))).y;
	r9.z = ((texture(resourceSamplerPair_3_ps, r3.xy)).xzyw).z;
	r9.w = ((texture(resourceSamplerPair_3_ps, r3.xz)).xzwy).w;
	r3 = r9 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r3 = roundEven(r3);
	r8.x = r6.y;
	r8.y = r5.y;
	r8.z = r7.y;
	r8.w = r4.y;
	r8 = r2 * r8;
	r8 = r8 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r9.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r9.zw = r3.xy;
	r1.zw = ((texture(resourceSamplerPair_5_ps, r9.xyz)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.y = ((texture(resourceSamplerPair_6_ps, r9.xyz)).xwyz).y;
	r9.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.zw = ((texture(resourceSamplerPair_5_ps, r9.xyw)).xzyw).zw;
	r4.zw = fma(r4.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.zw = r4.zw * r8.yy;
	r1.zw = fma(r8.xx, r1.zw, r4.zw);
	r4.z = ((texture(resourceSamplerPair_6_ps, r9.xyw)).xywz).z;
	r4.z = r2.y * r4.z;
	r4.y = fma(r2.x, r4.y, r4.z);
	r3.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.zw = ((texture(resourceSamplerPair_5_ps, r3.xyz)).xzyw).zw;
	r4.zw = fma(r4.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.zw = fma(r8.zz, r4.zw, r1.zw);
	r4.z = ((texture(resourceSamplerPair_6_ps, r3.xyz)).xywz).z;
	r4.y = fma(r2.z, r4.z, r4.y);
	r3.xy = v2.v.xz * vec2(0.0273437500f, 0.0273437500f);
	r4.zw = ((texture(resourceSamplerPair_5_ps, r3.xyw)).xzyw).zw;
	r4.zw = fma(r4.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.zw = fma(r8.ww, r4.zw, r1.zw);
	r4.z = ((texture(resourceSamplerPair_6_ps, r3.xyw)).xywz).z;
	r4.y = fma(r2.w, r4.z, r4.y);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r4.z = dot(r0.xy, r0.xy);
	r4.z = r4.z + float(1.00000000f);
	r10.y = inversesqrt(r4.z);
	r10.xz = r0.xy * r10.yy;
	r5.yzw = -r10.xyz + v4.v.xyz;
	r5.yzw = fma(r1.yyy, r5.yzw, r10.xyz);
	r0.x = dot(r5.yzw, r5.yzw);
	r0.x = inversesqrt(r0.x);
	r6.yzw = r0.xxx * r5.yzw;
	r0.y = dot(v4.v.xyz, v4.v.xyz);
	r0.y = inversesqrt(r0.y);
	r7.yzw = r0.yyy * v4.v.xyz;
	r10.xyz = r7.wyz * vec3(0.00000000f, -1.00000000f, 0.00000000f);
	r10.xyz = fma(r7.zwy, vec3(-1.00000000f, 0.00000000f, 0.00000000f), -r10.xyz);
	r0.y = dot(r10.xy, r10.xy);
	r0.y = inversesqrt(r0.y);
	r10.xyz = r0.yyy * r10.xyz;
	r0.y = dot(r10.xy, r7.yz);
	r10.xyz = fma(-r7.yzw, r0.yyy, r10.xyz);
	r0.y = dot(r10.xyz, r10.xyz);
	r0.y = inversesqrt(r0.y);
	r10.xyz = r0.yyy * r10.xyz;
	r11.xyz = r7.wyz * r10.yzx;
	r11.xyz = fma(r7.zwy, r10.zxy, -r11.xyz);
	r12.xyz = -v2.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r0.y = dot(r12.xyz, r12.xyz);
	r0.y = inversesqrt(r0.y);
	r12.xyz = r0.yyy * r12.xyz;
	r10.x = dot(-r10.xyz, r12.xyz);
	r10.y = dot(r11.xyz, r12.xyz);
	r0.y = dot(-r7.yzw, r12.xyz);
	r4.z = max(-r0.y, float(0.500000000f));
	r4.w = -r1.y + float(1.00000000f);
	r4.w = fma(r4.w, float(3.00000000f), float(1.00000000f));
	r4.z = r4.w * r4.z;
	r4.z = float(8.00000000f) / r4.z;
	r4.z = max(r4.z, float(1.00000000f));
	r4.w = float(1.00000000f) / r4.z;
	r0.y = min(r0.y, float(-0.200000003f));
	r0.y = r0.y * r4.z;
	r7.yz = r10.xy / r0.yy;
	r10 = r2 + vec4(-0.400000006f, -0.400000006f, -0.400000006f, -0.400000006f);
	r10 = saturate(r10 * vec4(6.00000000f, 6.00000000f, 6.00000000f, 6.00000000f));
	r11 = intBitsToFloat(mix ( ivec4(0x00000000),ivec4(0xffffffff),bvec4(lessThan(vec4(0.400000006f, 0.400000006f, 0.400000006f, 0.400000006f), r2))));
	if (floatBitsToUint(r11.x) != uint(0))
	{
		r0.y = r6.x * r10.x;
		r0.y = r0.y * float(0.0799999982f);
		r12.xy = r0.yy * r7.yz;
		r12.xy = r4.zz * r12.xy;
		r12.zw = fma(-r12.xy, vec2(0.500000000f, 0.500000000f), r0.zw);
		r13.z = r9.z;
		r13.xy = r12.zw;
		r6.x = uintBitsToFloat(uint(0x3f800000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r10.x = uintBitsToFloat(uint(0x00000000));
		r11.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r13.w = intBitsToFloat(r11.x < r4.z ? int(0xffffffff) : int(0x00000000));
			r14.x = intBitsToFloat(r7.w < r6.x ? int(0xffffffff) : int(0x00000000));
			r13.w = uintBitsToFloat(floatBitsToUint(r13.w) & floatBitsToUint(r14.x));
			if (floatBitsToUint(r13.w) == uint(0))
				break;
			r6.x = -r4.w + r6.x;
			r13.xy = fma(r7.yz, r0.yy, r13.xy);
			r13.w = ((textureLod(resourceSamplerPair_7_ps, r13.xyz, r1.x))).w;
			r11.x = r11.x + float(1.00000000f);
			r10.x = r7.w;
			r7.w = r13.w;
		}
		r0.y = r4.w + r6.x;
		r7.w = r6.x + -r7.w;
		r10.x = -r10.x + r0.y;
		r0.y = r0.y * r7.w;
		r0.y = fma(r6.x, r10.x, -r0.y);
		r6.x = -r7.w + r10.x;
		r0.y = r0.y / r6.x;
		r0.y = -r0.y + float(1.00000000f);
		r9.xy = fma(r0.yy, r12.xy, r12.zw);
	}
	else
	{
		r9.xy = r0.zw;
	}
	if (floatBitsToUint(r11.y) != uint(0))
	{
		r0.y = r5.x * r10.y;
		r0.y = r0.y * float(0.0799999982f);
		r0.zw = r0.yy * r7.yz;
		r0.zw = r4.zz * r0.zw;
		r10.xy = fma(-r0.zw, vec2(0.500000000f, 0.500000000f), r9.xy);
		r12.z = r9.w;
		r12.xy = r10.xy;
		r5.x = uintBitsToFloat(uint(0x3f800000));
		r6.x = uintBitsToFloat(uint(0x00000000));
		r7.w = uintBitsToFloat(uint(0x00000000));
		r11.x = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r11.y = intBitsToFloat(r11.x < r4.z ? int(0xffffffff) : int(0x00000000));
			r12.w = intBitsToFloat(r6.x < r5.x ? int(0xffffffff) : int(0x00000000));
			r11.y = uintBitsToFloat(floatBitsToUint(r11.y) & floatBitsToUint(r12.w));
			if (floatBitsToUint(r11.y) == uint(0))
				break;
			r5.x = -r4.w + r5.x;
			r12.xy = fma(r7.yz, r0.yy, r12.xy);
			r11.y = ((textureLod(resourceSamplerPair_7_ps, r12.xyz, r1.x)).xwyz).y;
			r11.x = r11.x + float(1.00000000f);
			r7.w = r6.x;
			r6.x = r11.y;
		}
		r0.y = r4.w + r5.x;
		r6.x = r5.x + -r6.x;
		r7.w = -r7.w + r0.y;
		r0.y = r0.y * r6.x;
		r0.y = fma(r5.x, r7.w, -r0.y);
		r5.x = -r6.x + r7.w;
		r0.y = r0.y / r5.x;
		r0.y = -r0.y + float(1.00000000f);
		r9.xy = fma(r0.yy, r0.zw, r10.xy);
	}
	if (floatBitsToUint(r11.z) != uint(0))
	{
		r0.y = r7.x * r10.z;
		r0.y = r0.y * float(0.0799999982f);
		r0.zw = r0.yy * r7.yz;
		r0.zw = r4.zz * r0.zw;
		r7.xw = fma(-r0.zw, vec2(0.500000000f, 0.500000000f), r9.xy);
		r10.z = r3.z;
		r10.xy = r7.xw;
		r5.x = uintBitsToFloat(uint(0x3f800000));
		r6.x = uintBitsToFloat(uint(0x00000000));
		r11.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
		while (true)
		{
			r11.z = intBitsToFloat(r11.y < r4.z ? int(0xffffffff) : int(0x00000000));
			r12.x = intBitsToFloat(r6.x < r5.x ? int(0xffffffff) : int(0x00000000));
			r11.z = uintBitsToFloat(floatBitsToUint(r11.z) & floatBitsToUint(r12.x));
			if (floatBitsToUint(r11.z) == uint(0))
				break;
			r5.x = -r4.w + r5.x;
			r10.xy = fma(r7.yz, r0.yy, r10.xy);
			r11.z = ((textureLod(resourceSamplerPair_7_ps, r10.xyz, r1.x)).xywz).z;
			r11.y = r11.y + float(1.00000000f);
			r11.x = r6.x;
			r6.x = r11.z;
		}
		r0.y = r4.w + r5.x;
		r6.x = r5.x + -r6.x;
		r10.x = -r11.x + r0.y;
		r0.y = r0.y * r6.x;
		r0.y = fma(r5.x, r10.x, -r0.y);
		r5.x = -r6.x + r10.x;
		r0.y = r0.y / r5.x;
		r0.y = -r0.y + float(1.00000000f);
		r9.xy = fma(r0.yy, r0.zw, r7.xw);
	}
	if (floatBitsToUint(r11.w) != uint(0))
	{
		r0.y = r4.x * r10.w;
		r0.y = r0.y * float(0.0799999982f);
		r0.zw = r0.yy * r7.yz;
		r0.zw = r4.zz * r0.zw;
		r7.xw = fma(-r0.zw, vec2(0.500000000f, 0.500000000f), r9.xy);
		r10.z = r3.w;
		r10.xy = r7.xw;
		r4.x = uintBitsToFloat(uint(0x3f800000));
		r5.x = uintBitsToFloat(uint(0x00000000));
		r6.x = uintBitsToFloat(uint(0x00000000));
		r10.w = uintBitsToFloat(uint(0x00000000));
		while (true)
		{
			r11.x = intBitsToFloat(r10.w < r4.z ? int(0xffffffff) : int(0x00000000));
			r11.y = intBitsToFloat(r5.x < r4.x ? int(0xffffffff) : int(0x00000000));
			r11.x = uintBitsToFloat(floatBitsToUint(r11.y) & floatBitsToUint(r11.x));
			if (floatBitsToUint(r11.x) == uint(0))
				break;
			r4.x = -r4.w + r4.x;
			r10.xy = fma(r7.yz, r0.yy, r10.xy);
			r11.x = ((textureLod(resourceSamplerPair_7_ps, r10.xyz, r1.x)).wxyz).x;
			r10.w = r10.w + float(1.00000000f);
			r6.x = r5.x;
			r5.x = r11.x;
		}
		r0.y = r4.w + r4.x;
		r1.x = r4.x + -r5.x;
		r4.z = -r6.x + r0.y;
		r0.y = r0.y * r1.x;
		r0.y = fma(r4.x, r4.z, -r0.y);
		r1.x = -r1.x + r4.z;
		r0.y = r0.y / r1.x;
		r0.y = -r0.y + float(1.00000000f);
		r9.xy = fma(r0.yy, r0.zw, r7.xw);
	}
	r0.yz = ((texture(resourceSamplerPair_5_ps, r9.xyz)).xywz).yz;
	r0.yz = fma(r0.zy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = ((texture(resourceSamplerPair_6_ps, r9.xyz))).w;
	r4.xz = ((texture(resourceSamplerPair_5_ps, r9.xyw)).yxwz).xz;
	r4.xz = fma(r4.zx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r4.xz = r4.xz * r8.yy;
	r0.yz = fma(r8.xx, r0.yz, r4.xz);
	r1.x = ((texture(resourceSamplerPair_6_ps, r9.xyw)).wxyz).x;
	r1.x = r1.x * r2.y;
	r0.w = fma(r2.x, r0.w, r1.x);
	r3.xy = r9.xy;
	r2.xy = ((texture(resourceSamplerPair_5_ps, r3.xyz)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.yz = fma(r8.zz, r2.xy, r0.yz);
	r1.x = ((texture(resourceSamplerPair_6_ps, r3.xyz)).wxyz).x;
	r0.w = fma(r2.z, r1.x, r0.w);
	r2.xy = ((texture(resourceSamplerPair_5_ps, r3.xyw)).ywxz).xy;
	r2.xy = fma(r2.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.yz = fma(r8.ww, r2.xy, r0.yz);
	r1.x = ((texture(resourceSamplerPair_6_ps, r3.xyw)).wxyz).x;
	r0.w = fma(r2.w, r1.x, r0.w);
	r0.yz = fma(r0.yz, r1.yy, -r1.zw);
	r0.yz = fma(r1.yy, r0.yz, r1.zw);
	r1.x = dot(r0.yz, r0.yz);
	r1.x = -r1.x + float(1.00000000f);
	r1.x = sqrt(abs(r1.x));
	r2.x = r6.z * r0.y;
	r2.y = -r6.y * r0.y;
	r2.z = uintBitsToFloat(uint(0x00000000));
	r2.xyz = fma(r5.yzw, r0.xxx, r2.xyz);
	r1.xzw = fma(r1.xxx, r6.yzw, r2.xyz);
	r2.x = uintBitsToFloat(uint(0x00000000));
	r2.yz = r6.wz * vec2(1.00000000f, -1.00000000f);
	r1.xzw = fma(r0.zzz, r2.xyz, r1.xzw);
	r0.y = dot(r1.xzw, r1.xzw);
	r0.y = inversesqrt(r0.y);
	r3.xyz = r0.yyy * r1.xzw;
	r0.z = -r4.y + r0.w;
	r4.y = saturate(fma(r1.y, r0.z, r4.y));
	r0.zw = fma(v2.v.xz, idx_uniforms1_ps.cb1[4].zz, -r9.xy);
	r1.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r1.x = v2.v.x;
	r0.zw = fma(-r0.zw, vec2(9.00000000f, 9.00000000f), r1.xy);
	r7 = r0.zwzw * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r1.xyw = ((texture(resourceSamplerPair_8_ps, r7.xy)).xywz).xyw;
	r2.w = saturate(r3.z * idx_uniforms1_ps.cb1[14].z);
	r0.y = fma(r1.z, r0.y, r2.w);
	r1.z = intBitsToFloat(r0.y >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_9_ps, r7.xy));
	r2.w = ((texture(resourceSamplerPair_9_ps, r7.zw))).w;
	r7.xy = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r0.zw = fma(r0.zw, vec2(0.0206250008f, 0.00562500022f), r7.xy);
	r0.z = ((texture(resourceSamplerPair_9_ps, r0.zw)).xywz).z;
	if (floatBitsToUint(r1.z) != uint(0))
	{
		r1.xyz = fma(r1.wxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r7 = r1.yzzz * vec4(2.00000000f, 1.00000000f, 2.00000000f, 2.00000000f);
		r9.x = r6.z * r7.x;
		r9.y = -r6.y * r7.x;
		r9.z = uintBitsToFloat(uint(0x00000000));
		r1.yzw = fma(r5.yzw, r0.xxx, r9.xyz);
		r1.xyz = fma(r1.xxx, r6.yzw, r1.yzw);
		r1.xyz = fma(r7.yzw, r2.xyz, r1.xyz);
		r0.x = dot(r1.xyz, r1.xyz);
		r0.x = inversesqrt(r0.x);
		r5 = (texture(resourceSamplerPair_10_ps, v1.v.zw));
		r0.w = min(r5.w, idx_uniforms1_ps.cb1[14].x);
		r0.w = saturate(r0.w * idx_uniforms1_ps.cb1[14].y);
		r1.w = uintBitsToFloat(uint(0x3f800000));
		r2.xyz = r5.xyz * r8.xyz;
		r1.w = fma(r8.w, r1.w, float(0.750000000f));
		r3.w = r1.w * r2.w;
		r4.w = r0.w * float(0.699999988f);
		r1.w = fma(-r2.w, r1.w, float(0.100000001f));
		r1.w = fma(r4.w, r1.w, r3.w);
		r0.z = -r0.z + float(1.00000000f);
		r0.z = saturate(fma(-r0.z, idx_uniforms1_ps.cb1[15].x, r1.w));
		r0.z = r0.z * r0.w;
		r0.w = r0.z * float(3.00000000f);
		r0.z = fma(r0.z, float(-0.300000012f), float(0.800000012f));
		r0.w = min(r0.w, float(1.00000000f));
		r1.w = -r0.z + float(1.00000000f);
		r0.w = r0.w / r1.w;
		r0.y = -r0.z + r0.y;
		r0.y = saturate(r0.w * r0.y);
		r2.xyz = fma(r2.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r2.xyz = fma(r0.yyy, r2.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r4.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r5.xyz = -r4.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r4.xyz = fma(r0.yyy, r5.xyz, r4.xyz);
		r0.xzw = fma(r1.xyz, r0.xxx, -r3.xyz);
		r0.xyz = fma(r0.yyy, r0.xzw, r3.xyz);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r3.xyz = r0.www * r0.xyz;
	}
	else
	{
		r2.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r4.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r3.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r2.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r4.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

