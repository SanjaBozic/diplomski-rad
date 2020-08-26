#version 460 core
// ps_5_0
// Checksum: fa785339_4885fda5_3fd31ee3_9bf0331b
// Name: fastter_noplxlod0cgc

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res5, s5

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3

uniform sampler2D resourceSamplerPair_2_ps; // res4, s4

uniform sampler2D resourceSamplerPair_3_ps; // res6, s6

uniform sampler2D resourceSamplerPair_4_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_5_ps; // res8, s8

uniform sampler2DArray resourceSamplerPair_6_ps; // res9, s9

uniform sampler2D resourceSamplerPair_7_ps; // res12, s12

uniform sampler2D resourceSamplerPair_8_ps; // res11, s11

uniform sampler2D resourceSamplerPair_9_ps; // res13, s13


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v2.v.xz * vec2(0.00390625000f, 0.00390625000f);
	r1.xy = v2.v.xz * idx_uniforms1_ps.cb1[4].zz;
	r0.zw = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).zw;
	r0.zw = fma(r0.zw, vec2(2.00787401f, 2.00787401f), vec2(-1.00000000f, -1.00000000f));
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
	r5.xy = ((texture(resourceSamplerPair_3_ps, r5.xy)).zwxy).xy;
	r5.zw = ((texture(resourceSamplerPair_3_ps, r5.zw))).zw;
	r4.xz = uintBitsToFloat(uvec2(0x3c000000, 0x3c000000));
	r4.xy = ((texture(resourceSamplerPair_3_ps, r4.xy)).zwxy).xy;
	r6.zw = ((texture(resourceSamplerPair_3_ps, r4.zw)).xywz).zw;
	r4.z = r2.y * r5.w;
	r4.z = fma(r5.y, r2.x, r4.z);
	r4.y = fma(r4.y, r2.z, r4.z);
	r4.y = fma(r6.z, r2.w, r4.y);
	r0.xy = ((texture(resourceSamplerPair_4_ps, r0.xy))).xy;
	r0.xy = fma(r0.xy, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.xy = r0.xy * vec2(1.00000000f, -1.00000000f);
	r4.y = r4.y * float(1.50000000f);
	r0.xy = fma(r4.yy, r0.xy, -r0.zw);
	r7.x = uintBitsToFloat(uint(0x3c800000));
	r7.yz = r3.xw;
	r4.yzw = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r7.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r3.x = uintBitsToFloat(uint(0x3c800000));
	r3.xyz = fma(vec3(0.00000000f, 0.00784313772f, 0.00784313772f), r3.xyz, vec3(0.00781250000f, 0.00000000f, 0.00000000f));
	r7.x = ((texture(resourceSamplerPair_3_ps, r4.yz)).yxzw).x;
	r7.y = ((texture(resourceSamplerPair_3_ps, r4.yw))).y;
	r7.z = ((texture(resourceSamplerPair_3_ps, r3.xy)).xzyw).z;
	r7.w = ((texture(resourceSamplerPair_3_ps, r3.xz)).xzwy).w;
	r3 = r7 * vec4(255.000000f, 255.000000f, 255.000000f, 255.000000f);
	r3 = roundEven(r3);
	r6.xy = r5.xz;
	r6.z = r4.x;
	r4 = r2 * r6;
	r4 = r4 * vec4(8.00000000f, 8.00000000f, 8.00000000f, 8.00000000f);
	r0.xy = r0.xy * vec2(4.26337051f, 4.26337051f);
	r0.z = dot(r0.xy, r0.xy);
	r0.z = r0.z + float(1.00000000f);
	r5.x = inversesqrt(r0.z);
	r0.xz = r0.xy * r5.xx;
	r1.zw = r3.xy;
	r6.xy = ((texture(resourceSamplerPair_5_ps, r1.xyz)).ywxz).xy;
	r6.xy = fma(r6.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r0.w = ((texture(resourceSamplerPair_6_ps, r1.xyz))).w;
	r6.zw = ((texture(resourceSamplerPair_5_ps, r1.xyw)).xzyw).zw;
	r6.zw = fma(r6.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r6.zw = r4.yy * r6.zw;
	r4.xy = fma(r4.xx, r6.xy, r6.zw);
	r1.z = ((texture(resourceSamplerPair_6_ps, r1.xyw)).xywz).z;
	r1.z = r1.z * r2.y;
	r0.w = fma(r2.x, r0.w, r1.z);
	r3.xy = r1.xy;
	r1.xy = ((texture(resourceSamplerPair_5_ps, r3.xyz)).ywxz).xy;
	r1.xy = fma(r1.yx, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r4.zz, r1.xy, r4.xy);
	r1.z = ((texture(resourceSamplerPair_6_ps, r3.xyz)).xywz).z;
	r0.w = fma(r2.z, r1.z, r0.w);
	r1.zw = ((texture(resourceSamplerPair_5_ps, r3.xyw)).xzyw).zw;
	r1.zw = fma(r1.wz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	r1.xy = fma(r4.ww, r1.zw, r1.xy);
	r1.z = ((texture(resourceSamplerPair_6_ps, r3.xyw)).xywz).z;
	r2.y = saturate(fma(r2.w, r1.z, r0.w));
	r0.w = dot(r1.xy, r1.xy);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = sqrt(abs(r0.w));
	r5.y = -1.f * r0.x;
	r5.z = uintBitsToFloat(uint(0x00000000));
	r0.y = r5.x;
	r1.xzw = fma(r1.xxx, r5.xyz, r0.xyz);
	r1.xzw = fma(r0.www, r0.xyz, r1.xzw);
	r3.xz = r5.zx * vec2(1.00000000f, -1.00000000f);
	r3.y = r0.z;
	r1.xyz = fma(r1.yyy, r3.xyz, r1.xzw);
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xzw = r0.www * r1.xyz;
	r4.y = fma(-v2.v.y, float(0.400000006f), v2.v.z);
	r4.x = v2.v.x;
	r6 = r4.xyxy * vec4(0.250000000f, 0.150000006f, 0.0187500007f, 0.0187500007f);
	r7.xyz = ((texture(resourceSamplerPair_7_ps, r6.xy))).xyz;
	r2.w = saturate(r1.w * idx_uniforms1_ps.cb1[14].z);
	r0.w = fma(r1.y, r0.w, r2.w);
	r1.y = intBitsToFloat(r0.w >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r8 = (texture(resourceSamplerPair_8_ps, r6.xy));
	r2.w = ((texture(resourceSamplerPair_8_ps, r6.zw))).w;
	r4.zw = idx_uniforms1_ps.cb1[14].ww * vec2(0.00200000009f, 0.0399999991f);
	r4.xy = fma(r4.xy, vec2(0.0206250008f, 0.00562500022f), r4.zw);
	r3.w = ((texture(resourceSamplerPair_8_ps, r4.xy))).w;
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r4.xyz = fma(r7.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r4.w = r4.y * float(2.00000000f);
		r5.xyz = fma(r4.wwy, r5.xyz, r0.xyz);
		r0.xyz = fma(r4.xxx, r0.xyz, r5.xyz);
		r4.xyz = r4.zzz * vec3(1.00000000f, 2.00000000f, 2.00000000f);
		r0.xyz = fma(r4.xyz, r3.xyz, r0.xyz);
		r1.y = dot(r0.xyz, r0.xyz);
		r1.y = inversesqrt(r1.y);
		r4 = (texture(resourceSamplerPair_9_ps, v1.v.zw));
		r3.x = min(r4.w, idx_uniforms1_ps.cb1[14].x);
		r3.x = saturate(r3.x * idx_uniforms1_ps.cb1[14].y);
		r3.y = uintBitsToFloat(uint(0x3f800000));
		r4.xyz = r4.xyz * r8.xyz;
		r3.y = fma(r8.w, r3.y, float(0.750000000f));
		r3.z = r2.w * r3.y;
		r4.w = r3.x * float(0.699999988f);
		r2.w = fma(-r2.w, r3.y, float(0.100000001f));
		r2.w = fma(r4.w, r2.w, r3.z);
		r3.y = -r3.w + float(1.00000000f);
		r2.w = saturate(fma(-r3.y, idx_uniforms1_ps.cb1[15].x, r2.w));
		r2.w = r2.w * r3.x;
		r3.x = r2.w * float(3.00000000f);
		r2.w = fma(r2.w, float(-0.300000012f), float(0.800000012f));
		r3.x = min(r3.x, float(1.00000000f));
		r3.y = -r2.w + float(1.00000000f);
		r3.x = r3.x / r3.y;
		r0.w = r0.w + -r2.w;
		r0.w = saturate(r3.x * r0.w);
		r3.xyz = fma(r4.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), vec3(-0.214000002f, -0.214000002f, -0.214000002f));
		r3.xyz = fma(r0.www, r3.xyz, vec3(0.214000002f, 0.214000002f, 0.214000002f));
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
		r4.xyz = -r2.xyz + vec3(0.00000000f, 0.00999999978f, 0.500000000f);
		r2.xyz = fma(r0.www, r4.xyz, r2.xyz);
		r0.xyz = fma(r0.xyz, r1.yyy, -r1.xzw);
		r0.xyz = fma(r0.www, r0.xyz, r1.xzw);
		r0.w = dot(r0.xyz, r0.xyz);
		r0.w = inversesqrt(r0.w);
		r1.xzw = r0.www * r0.xyz;
	}
	else
	{
		r3.xyz = uintBitsToFloat(uvec3(0x3e5b22d1, 0x3e5b22d1, 0x3e5b22d1));
		r2.xz = uintBitsToFloat(uvec2(0x00000000, 0x3f000000));
	}
	o1.xyz = fma(r1.xzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r3.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	o2.xyz = r2.xyz;
	o2.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

