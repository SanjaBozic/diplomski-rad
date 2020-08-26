#version 460 core
// ps_5_0
// Checksum: e5209c8b_a7b21852_0c51a4b5_af2c03b1
// Name: generalmmblend

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 5) in idx_Varying5 { vec4 v; } v5;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[4]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[17]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[7]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2DArray resourceSamplerPair_3_ps; // res14, s15

uniform sampler2DArrayShadow resourceSamplerPair_4_ps; // res14, s14

uniform sampler2D resourceSamplerPair_5_ps; // res11, s11

uniform samplerCube resourceSamplerPair_6_ps; // res8, s8

uniform samplerCube resourceSamplerPair_7_ps; // res9, s9


void Initialise()
{
}


uvec4 movc(in uvec4 src0, in uvec4 src1, in uvec4 src2)
{
	return mix(src2, src1, bvec4(src0));
}

uvec3 movc(in uvec3 src0, in uvec3 src1, in uvec3 src2)
{
	return mix(src2, src1, bvec3(src0));
}

uvec2 movc(in uvec2 src0, in uvec2 src1, in uvec2 src2)
{
	return mix(src2, src1, bvec2(src0));
}

uint movc(in uint src0, in uint src1, in uint src2)
{
	return mix(src2, src1, bool(src0));
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1.xyz = fma(v6.v.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r1.xyz = fma(v6.v.xyz, r1.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	r1.xyz = r1.xyz * v6.v.xyz;
	r1.w = v6.v.w;
	r0 = r0 * r1;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r1.x = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r1.xyz = r1.xxx * v3.v.xyz;
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v2.v.xy)).xywz).xyz;
	r2.yzw = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.x = r2.w * r2.y;
	r1.w = dot(r2.xz, r2.xz);
	r1.w = -r1.w + float(1.00000000f);
	r1.w = max(r1.w, float(0.00000000f));
	r1.w = sqrt(r1.w);
	r2.yw = ((texture(resourceSamplerPair_2_ps, v1.v.xy)).xywz).yw;
	r3.x = dot(r1.xyz, r1.xyz);
	r3.x = inversesqrt(r3.x);
	r1.xyz = r1.xyz * r3.xxx;
	r3.x = dot(v4.v.xyz, v4.v.xyz);
	r3.x = inversesqrt(r3.x);
	r3.xyz = r3.xxx * v4.v.xyz;
	r4.xyz = r1.zxy * r3.yzx;
	r4.xyz = fma(r1.yzx, r3.zxy, -r4.xyz);
	r4.xyz = r4.xyz * v4.v.www;
	r4.xyz = r2.zzz * r4.xyz;
	r3.xyz = fma(r3.xyz, r2.xxx, r4.xyz);
	r1.xyz = fma(r1.xyz, r1.www, r3.xyz);
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = inversesqrt(r1.w);
	r1.xyz = r1.www * r1.xyz;
	r2.xz = fma(v7.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r3.xy = fma(v8.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r3.zw = fma(v9.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
	r1.w = max(abs(r2.z), abs(r2.x));
	r2.xz = max(abs(r3.yw), abs(r3.xz));
	r3.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r3.x = fract(r3.x);
	if (floatBitsToUint(idx_uniforms4_ps.cb4[3].y) != uint(0))
	{
		r3.z = fma(r3.x, float(6.28318548f), float(-3.14159274f));
		{ float src = r3.z; r4.x = sin(src); r5.x = cos(src); }
		r5.y = r4.x;
		r4.xy = r5.yx * vec2(0.00800000038f, 0.00800000038f);
		r6.xy = r5.yx * vec2(0.00200000009f, 0.00200000009f);
		r3.z = saturate(r1.w + float(-3.90000010f));
		r3.w = saturate(r2.x + float(-4.00000000f));
		r4.w = saturate(v7.v.z);
		r5.z = saturate(v8.v.z);
		r5.w = saturate(v9.v.z);
		r7.xy = v7.v.xy;
		r7.z = uintBitsToFloat(uint(0x00000000));
		r6.w = ((texture(resourceSamplerPair_3_ps, r7.xyz)).yzwx).w;
		r6.w = intBitsToFloat(r6.w >= r4.w ? int(0xffffffff) : int(0x00000000));
		r7.x = r4.w * float(70.0000000f);
		r8.xy = r5.xy * vec2(-0.00800000038f, 0.00800000038f);
		r4.z = v7.v.x;
		r9.x = dot(r4.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r8.z = v7.v.y;
		r9.y = dot(r8.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.y = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yxzw).y;
		r9.x = saturate(fma(-r7.y, float(70.0000000f), r7.x));
		r7.y = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.y) & uint(0x3f800000));
		r7.yz = r9.xy + vec2(0.00000000f, 9.99999997e-07f);
		r9.x = dot(r4.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r7.w = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzwx).w;
		r9.x = saturate(fma(-r7.w, float(70.0000000f), r7.x));
		r7.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r7.w) & uint(0x3f800000));
		r7.yz = r7.yz + r9.xy;
		r9.x = dot(r4.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r9.y = dot(r8.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r9.z = uintBitsToFloat(uint(0x00000000));
		r4.z = ((texture(resourceSamplerPair_3_ps, r9.xyz)).yzxw).z;
		r9.x = saturate(fma(-r4.z, float(70.0000000f), r7.x));
		r4.z = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
		r9.y = uintBitsToFloat(floatBitsToUint(r4.z) & uint(0x3f800000));
		r7.xy = r7.yz + r9.xy;
		r4.z = r7.x / r7.y;
		r4.z = r4.z + float(0.100000001f);
		r7.xy = r4.zz * r4.xy;
		r4.xy = r4.zz * r8.xy;
		r6.w = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3dcccccd));
		r7.z = v7.v.x;
		r8.x = dot(r7.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r4.z = v7.v.y;
		r8.y = dot(r4.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r8.x = dot(r7.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r8.y = dot(r4.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x00000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r4.w));
		r6.w = r6.w + r7.w;
		r7.x = dot(r7.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r7.y = dot(r4.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r7.z = uintBitsToFloat(uint(0x00000000));
		r4.x = texture(resourceSamplerPair_4_ps, vec4(r7.xyz, r4.w));
		r4.x = r4.x + r6.w;
		r4.x = r4.x * float(0.0826446265f);
		r7.xy = v8.v.xy;
		r7.z = uintBitsToFloat(uint(0x3f800000));
		r4.y = ((texture(resourceSamplerPair_3_ps, r7.xyz)).yxzw).y;
		r4.y = intBitsToFloat(r4.y >= r5.z ? int(0xffffffff) : int(0x00000000));
		r4.z = r5.z * float(70.0000000f);
		r7.xy = r5.xy * vec2(-0.00200000009f, 0.00200000009f);
		r6.z = v8.v.x;
		r8.x = dot(r6.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r7.z = v8.v.y;
		r8.y = dot(r7.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r5.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r5.x ? int(0xffffffff) : int(0x00000000));
		r5.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + vec2(0.00000000f, 9.99999997e-07f);
		r8.x = dot(r6.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
		r5.xy = r5.xy + r8.xy;
		r8.x = dot(r6.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.w = ((texture(resourceSamplerPair_3_ps, r8.xyz)).yzwx).w;
		r8.x = saturate(fma(-r4.w, float(70.0000000f), r4.z));
		r4.z = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
		r8.y = uintBitsToFloat(floatBitsToUint(r4.z) & uint(0x3f800000));
		r4.zw = r5.xy + r8.xy;
		r4.z = r4.z / r4.w;
		r4.z = r4.z + float(0.100000001f);
		r6.xy = r4.zz * r6.xy;
		r7.xy = r4.zz * r7.xy;
		r4.y = uintBitsToFloat(floatBitsToUint(r4.y) & uint(0x3dcccccd));
		r6.z = v8.v.x;
		r8.x = dot(r6.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r7.z = v8.v.y;
		r8.y = dot(r7.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r8.x = dot(r6.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r8.y = dot(r7.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
		r8.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r8.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r6.x = dot(r6.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r6.y = dot(r7.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
		r6.z = uintBitsToFloat(uint(0x3f800000));
		r4.z = texture(resourceSamplerPair_4_ps, vec4(r6.xyz, r5.z));
		r4.y = r4.z + r4.y;
		r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.250000000f, 0.750000000f, 0.750000000f, 0.250000000f), v9.v.xyxy);
		r5.xy = r6.zw;
		r5.z = uintBitsToFloat(uint(0x40000000));
		r7.x = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r5.w));
		r6.z = uintBitsToFloat(uint(0x40000000));
		r7.y = texture(resourceSamplerPair_4_ps, vec4(r6.xyz, r5.w));
		r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.250000000f, -0.750000000f, -0.750000000f, -0.250000000f), v9.v.xyxy);
		r5.xy = r6.zw;
		r5.z = uintBitsToFloat(uint(0x40000000));
		r7.z = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r5.w));
		r6.z = uintBitsToFloat(uint(0x40000000));
		r7.w = texture(resourceSamplerPair_4_ps, vec4(r6.xyz, r5.w));
		r4.z = dot(r7, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
		r4.y = fma(r4.y, float(0.0826446265f), -r4.x);
		r3.z = fma(r3.z, r4.y, r4.x);
		r4.x = -r3.z + r4.z;
		r3.z = fma(r3.w, r4.x, r3.z);
	}
	else
	{
		r3.w = dot(v0.xy, vec2(0.834930003f, -0.629559994f));
		r3.y = fract(r3.w);
		r1.w = r1.w + r3.x;
		r2.x = r2.x + r3.x;
		r1.w = intBitsToFloat(r1.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r2.x = intBitsToFloat(r2.x < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
		r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r2.xxx), floatBitsToUint(v8.v.xyz), floatBitsToUint(v9.v.xyz)));
		r4.xyz = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(v7.v.zxy), floatBitsToUint(r4.zxy)));
		r2.x = uintBitsToFloat(movc(floatBitsToUint(r2.x), uint(0x3f800000), uint(0x40000000)));
		r5.z = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x00000000), floatBitsToUint(r2.x)));
		r4.x = saturate(r4.x);
		r3.xy = r3.xy + vec2(-0.500000000f, -0.500000000f);
		r6.xy = r3.xy * vec2(0.00195312500f, 0.00195312500f);
		r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r4.yzyz);
		r5.xy = fma(r3.xy, vec2(0.00195312500f, 0.00195312500f), r7.xy);
		r1.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r5.xy = fma(-r3.xy, vec2(0.00195312500f, 0.00195312500f), r7.zw);
		r2.x = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r4.yzyz);
		r6.z = -1.f * r6.x;
		r5.xy = r6.yz + r7.xy;
		r3.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r5.xy = -r6.yz + r7.zw;
		r4.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r7 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(1.50000000f, 0.500000000f, -0.500000000f, 1.50000000f), r4.yzyz);
		r5.xy = -r6.yz + r7.xy;
		r5.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r8.x = r1.w + r5.w;
		r5.xy = r6.yz + r7.zw;
		r1.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r8.y = r1.w + r2.x;
		r6 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-1.50000000f, -0.500000000f, 0.500000000f, -1.50000000f), r4.yzyz);
		r5.xy = fma(r3.xy, vec2(0.00195312500f, 0.00195312500f), r6.xy);
		r1.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r8.z = r1.w + r3.w;
		r5.xy = fma(-r3.xy, vec2(0.00195312500f, 0.00195312500f), r6.zw);
		r1.w = texture(resourceSamplerPair_4_ps, vec4(r5.xyz, r4.x));
		r8.w = r1.w + r4.w;
		r3.z = dot(r8, vec4(0.125000000f, 0.125000000f, 0.125000000f, 0.125000000f));
	}
	r1.w = saturate(r2.z + float(-4.00000000f));
	r1.w = saturate(r1.w + r3.z);
	r3.xyz = v5.v.xyz + -idx_uniforms0_ps.cb0[5].xyz;
	r2.x = dot(r3.xyz, r3.xyz);
	r2.x = sqrt(r2.x);
	r2.x = r2.x * idx_uniforms2_ps.cb2[2].w;
	r2.x = r2.x * float(8.00000000f);
	r3.xy = v5.v.xz + idx_uniforms2_ps.cb2[2].yz;
	r4.x = v5.v.y * idx_uniforms0_ps.cb0[1].w;
	r4.y = v5.v.y * idx_uniforms0_ps.cb0[3].w;
	r3.xy = r3.xy + -r4.xy;
	r3.xy = r3.xy * idx_uniforms2_ps.cb2[2].ww;
	r2.x = ((textureLod(resourceSamplerPair_5_ps, r3.xy, r2.x))).x;
	r2.x = saturate(r2.x + idx_uniforms2_ps.cb2[2].x);
	r1.w = r1.w * r2.x;
	r2.x = saturate(fma(r1.y, float(0.500000000f), float(0.500000000f)));
	r3.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r3.xyz = fma(r2.xxx, r3.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r2.x = saturate(dot(r1.xyz, -idx_uniforms0_ps.cb0[3].xyz));
	r1.w = r1.w * r2.x;
	r3.xyz = fma(idx_uniforms0_ps.cb0[2].xyz, r1.www, r3.xyz);
	r0.xyz = r0.xyz * r3.xyz;
	r3.xyz = -v5.v.xyz + idx_uniforms0_ps.cb0[5].xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = inversesqrt(r1.w);
	r3.xyz = r1.www * r3.xyz;
	r1.w = dot(r3.xyz, r1.xyz);
	r2.x = r1.w + r1.w;
	r1.xyz = fma(r2.xxx, r1.xyz, -r3.xyz);
	r2.x = saturate(fma(r2.w, float(2.00000000f), float(-1.00000000f)));
	r2.x = fma(r2.x, float(0.649999976f), float(0.0500000007f));
	r2.z = -r2.x + float(1.00000000f);
	r1.w = saturate(fma(r1.w, float(0.899999976f), float(0.100000001f)));
	r1.w = -r1.w + float(1.00100005f);
	r1.w = min(r1.w, float(1.00000000f));
	r3.y = r1.w * r1.w;
	r3.y = r3.y * r3.y;
	r1.w = r1.w * r3.y;
	r1.w = fma(r2.z, r1.w, r2.x);
	r1.w = min(r1.w, float(1.00000000f));
	r2.xz = r1.zz * idx_uniforms2_ps.cb2[5].yw;
	r4.xz = fma(-r1.xx, idx_uniforms2_ps.cb2[5].xz, r2.xz);
	r2.xz = r1.zz * idx_uniforms2_ps.cb2[6].yw;
	r5.xz = fma(-r1.xx, idx_uniforms2_ps.cb2[6].xz, r2.xz);
	r1.x = -r2.y + float(1.00000000f);
	r1.z = r1.x * float(5.00000000f);
	r4.y = r1.y;
	r4.xzw = ((textureLod(resourceSamplerPair_6_ps, r4.xyz, r1.z)).xwyz).xzw;
	r5.y = r4.y;
	r5.xyz = ((textureLod(resourceSamplerPair_7_ps, r5.xyz, r1.z))).xyz;
	r5.xyz = -r4.xzw + r5.xyz;
	r4.xyz = fma(idx_uniforms2_ps.cb2[4].xxx, r5.xyz, r4.xzw);
	r4.xyz = r4.xyz * idx_uniforms2_ps.cb2[4].yyy;
	r1.y = r2.w + float(-0.500000000f);
	r1.y = saturate(r1.y + r1.y);
	r1.x = fma(r1.y, r1.x, r2.y);
	r1.x = saturate(r1.x * r1.w);
	r1.yz = -r1.yx + vec2(1.00000000f, 1.00000000f);
	r1.y = r1.y * r1.z;
	r1.xzw = r1.xxx * r4.xyz;
	r0.xyz = fma(r0.xyz, r1.yyy, r1.xzw);
	r1.x = saturate(v9.v.w * idx_uniforms0_ps.cb0[16].w);
	r1.y = fma(v5.v.y, idx_uniforms0_ps.cb0[16].z, -idx_uniforms0_ps.cb0[16].x);
	r1.y = min(r1.y, idx_uniforms0_ps.cb0[16].y);
	r1.y = -r1.y + float(1.00000000f);
	r1.x = fma(r1.x, r1.y, -idx_uniforms0_ps.cb0[14].w);
	r1.x = fma(v9.v.w, idx_uniforms0_ps.cb0[15].w, r1.x);
	r1.y = dot(idx_uniforms0_ps.cb0[3].xz, idx_uniforms0_ps.cb0[3].xz);
	r1.y = inversesqrt(r1.y);
	r1.yz = r1.yy * idx_uniforms0_ps.cb0[3].xz;
	r1.y = dot(r1.yz, r3.xz);
	r1.y = r1.y + float(1.00000000f);
	r1.y = r1.y * float(0.500000000f);
	r2.x = uintBitsToFloat(uint(0x3f800000));
	r2.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r2 = -r1.xxxx * r2;
	r2 = exp2(r2);
	r2 = min(r2, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r1.x = -r2.x + float(1.00000000f);
	r1.z = r1.y * r1.y;
	r1.y = r1.y * r1.z;
	r1.yzw = fma(r1.yyy, idx_uniforms0_ps.cb0[14].xyz, idx_uniforms0_ps.cb0[15].xyz);
	r1.xyz = r1.xxx * r1.yzw;
	o0.xyz = fma(r0.xyz, r2.yzw, r1.xyz);
	o0.w = r0.w;
	o1.xyz = v0.zzz;
	o1.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

