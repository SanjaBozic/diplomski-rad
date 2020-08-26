#version 460 core
// ps_5_0
// Checksum: fb51f1a7_48e199b0_e91c7c7d_677840f2
// Name: deformablewindow

bool discarded = false;
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
vec4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[4]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res4, s4

uniform sampler2D resourceSamplerPair_5_ps; // res5, s5

uniform sampler2DArray resourceSamplerPair_6_ps; // res14, s15

uniform sampler2DArrayShadow resourceSamplerPair_7_ps; // res14, s14

uniform samplerCube resourceSamplerPair_8_ps; // res7, s7


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


void PixelEpilog()
{
	if (discarded)
		discard;
}

#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r1.xyz = fma(r1.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r3.xyz = ((texture(resourceSamplerPair_3_ps, v1.v.xy))).xyz;
	r4.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.xy))).xyz;
	r4.xyz = fma(r4.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r5.xyz = ((texture(resourceSamplerPair_5_ps, v1.v.xy))).xyz;
	r6.xy = saturate(v8.v.ww * vec2(5.00000000f, 3.00000000f));
	r3.xyz = -r0.xyz + r3.xyz;
	r0.xyz = fma(r6.xxx, r3.xyz, r0.xyz);
	r3.xyz = -r1.xyz + r4.xyz;
	r1.xyz = fma(r6.xxx, r3.xyz, r1.xyz);
	r3.xyz = -r2.xyz + r5.xyz;
	r2.xyz = fma(r6.xxx, r3.xyz, r2.xyz);
	r0.w = r2.y * r2.y;
	r1.w = fma(-r6.y, r2.z, float(0.996078432f));
	r1.w = intBitsToFloat(r1.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r1.w) != uint(0);
	if (floatBitsToUint(idx_uniforms4_ps.cb4[3].x) != uint(0))
	{
		r2.yz = fma(v2.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r3.xy = fma(v3.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r3.zw = fma(v4.v.xy, vec2(10.0000000f, 10.0000000f), vec2(-5.00000000f, -5.00000000f));
		r1.w = max(abs(r2.z), abs(r2.y));
		r2.yz = max(abs(r3.yw), abs(r3.xz));
		r2.w = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
		r2.w = fract(r2.w);
		if (floatBitsToUint(idx_uniforms4_ps.cb4[3].y) != uint(0))
		{
			r3.x = fma(r2.w, float(6.28318548f), float(-3.14159274f));
			{ float src = r3.x; r3.x = sin(src); r4.x = cos(src); }
			r4.y = r3.x;
			r3.xy = r4.yx * vec2(0.00800000038f, 0.00800000038f);
			r5.xy = r4.yx * vec2(0.00200000009f, 0.00200000009f);
			r3.w = saturate(r1.w + float(-3.90000010f));
			r4.z = saturate(r2.y + float(-4.00000000f));
			r4.w = saturate(v2.v.z);
			r5.w = saturate(v3.v.z);
			r6.x = saturate(v4.v.z);
			r7.xy = v2.v.xy;
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.y = ((texture(resourceSamplerPair_6_ps, r7.xyz)).yxzw).y;
			r6.y = intBitsToFloat(r6.y >= r4.w ? int(0xffffffff) : int(0x00000000));
			r6.z = r4.w * float(70.0000000f);
			r7.xy = r4.xy * vec2(-0.00800000038f, 0.00800000038f);
			r3.z = v2.v.x;
			r8.x = dot(r3.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r7.z = v2.v.y;
			r8.y = dot(r7.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + vec2(0.00000000f, 9.99999997e-07f);
			r9.x = dot(r3.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r6.w = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzwx).w;
			r9.x = saturate(fma(-r6.w, float(70.0000000f), r6.z));
			r6.w = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r6.w) & uint(0x3f800000));
			r8.xy = r8.xy + r9.xy;
			r9.x = dot(r3.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r9.y = dot(r7.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r9.z = uintBitsToFloat(uint(0x00000000));
			r3.z = ((texture(resourceSamplerPair_6_ps, r9.xyz)).yzxw).z;
			r9.x = saturate(fma(-r3.z, float(70.0000000f), r6.z));
			r3.z = intBitsToFloat(float(0.00000000f) < r9.x ? int(0xffffffff) : int(0x00000000));
			r9.y = uintBitsToFloat(floatBitsToUint(r3.z) & uint(0x3f800000));
			r6.zw = r8.xy + r9.xy;
			r3.z = r6.z / r6.w;
			r3.z = r3.z + float(0.100000001f);
			r8.xy = r3.zz * r3.xy;
			r3.xy = r3.zz * r7.xy;
			r6.y = uintBitsToFloat(floatBitsToUint(r6.y) & uint(0x3dcccccd));
			r8.z = v2.v.x;
			r7.x = dot(r8.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r3.z = v2.v.y;
			r7.y = dot(r3.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r6.y = r6.z + r6.y;
			r7.x = dot(r8.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r7.y = dot(r3.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r7.z = uintBitsToFloat(uint(0x00000000));
			r3.x = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r4.w));
			r3.x = r3.x + r6.y;
			r3.x = r3.x * float(0.0826446265f);
			r7.xy = v3.v.xy;
			r7.z = uintBitsToFloat(uint(0x3f800000));
			r3.y = ((texture(resourceSamplerPair_6_ps, r7.xyz)).yxzw).y;
			r3.y = intBitsToFloat(r3.y >= r5.w ? int(0xffffffff) : int(0x00000000));
			r3.z = r5.w * float(70.0000000f);
			r7.xy = r4.xy * vec2(-0.00200000009f, 0.00200000009f);
			r5.z = v3.v.x;
			r8.x = dot(r5.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r7.z = v3.v.y;
			r8.y = dot(r7.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.x = ((texture(resourceSamplerPair_6_ps, r8.xyz))).x;
			r4.x = saturate(fma(-r4.x, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r4.x ? int(0xffffffff) : int(0x00000000));
			r4.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + vec2(0.00000000f, 9.99999997e-07f);
			r8.x = dot(r5.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r4.w = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r4.w) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r8.x = dot(r5.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r4.w = ((texture(resourceSamplerPair_6_ps, r8.xyz)).yzwx).w;
			r8.x = saturate(fma(-r4.w, float(70.0000000f), r3.z));
			r3.z = intBitsToFloat(float(0.00000000f) < r8.x ? int(0xffffffff) : int(0x00000000));
			r8.y = uintBitsToFloat(floatBitsToUint(r3.z) & uint(0x3f800000));
			r4.xy = r4.xy + r8.xy;
			r3.z = r4.x / r4.y;
			r3.z = r3.z + float(0.100000001f);
			r5.xy = r3.zz * r5.xy;
			r7.xy = r3.zz * r7.xy;
			r3.y = uintBitsToFloat(floatBitsToUint(r3.y) & uint(0x3dcccccd));
			r5.z = v3.v.x;
			r8.x = dot(r5.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r7.z = v3.v.y;
			r8.y = dot(r7.xyz, vec3(0.0301959999f, 0.0776700005f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.149460003f, -0.0737529993f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.240042999f, -0.0698539987f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.173096001f, 0.284866005f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.0809710026f, -0.408722997f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.402942002f, 0.296036988f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.579936981f, 0.0628560036f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.440210998f, -0.500657976f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.0152620003f, 0.749845028f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(-0.575273991f, -0.602913022f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r8.x = dot(r5.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r8.y = dot(r7.xyz, vec3(0.914593995f, 0.0616080016f, 1.00000000f));
			r8.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r5.x = dot(r5.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r5.y = dot(r7.xyz, vec3(-0.781122983f, 0.624377012f, 1.00000000f));
			r5.z = uintBitsToFloat(uint(0x3f800000));
			r3.z = texture(resourceSamplerPair_7_ps, vec4(r5.xyz, r5.w));
			r3.y = r3.z + r3.y;
			r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.250000000f, 0.750000000f, 0.750000000f, 0.250000000f), v4.v.xyxy);
			r7.xy = r5.zw;
			r7.z = uintBitsToFloat(uint(0x40000000));
			r7.x = texture(resourceSamplerPair_7_ps, vec4(r7.xyz, r6.x));
			r5.z = uintBitsToFloat(uint(0x40000000));
			r7.y = texture(resourceSamplerPair_7_ps, vec4(r5.xyz, r6.x));
			r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.250000000f, -0.750000000f, -0.750000000f, -0.250000000f), v4.v.xyxy);
			r8.xy = r5.zw;
			r8.z = uintBitsToFloat(uint(0x40000000));
			r7.z = texture(resourceSamplerPair_7_ps, vec4(r8.xyz, r6.x));
			r5.z = uintBitsToFloat(uint(0x40000000));
			r7.w = texture(resourceSamplerPair_7_ps, vec4(r5.xyz, r6.x));
			r3.z = dot(r7, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
			r3.y = fma(r3.y, float(0.0826446265f), -r3.x);
			r3.x = fma(r3.w, r3.y, r3.x);
			r3.y = -r3.x + r3.z;
			r3.x = fma(r4.z, r3.y, r3.x);
		}
		else
		{
			r1.w = r1.w + r2.w;
			r2.y = r2.w + r2.y;
			r1.w = intBitsToFloat(r1.w < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
			r2.y = intBitsToFloat(r2.y < float(4.94999981f) ? int(0xffffffff) : int(0x00000000));
			r3.yzw = uintBitsToFloat(movc(floatBitsToUint(r2.yyy), floatBitsToUint(v3.v.xyz), floatBitsToUint(v4.v.xyz)));
			r3.yzw = uintBitsToFloat(movc(floatBitsToUint(r1.www), floatBitsToUint(v2.v.zxy), floatBitsToUint(r3.wyz)));
			r2.y = uintBitsToFloat(movc(floatBitsToUint(r2.y), uint(0x3f800000), uint(0x40000000)));
			r4.z = uintBitsToFloat(movc(floatBitsToUint(r1.w), uint(0x00000000), floatBitsToUint(r2.y)));
			r3.y = saturate(r3.y);
			r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(0.750000000f, 0.250000000f, -0.250000000f, 0.750000000f), r3.zwzw);
			r4.xy = r5.xy;
			r6.x = texture(resourceSamplerPair_7_ps, vec4(r4.xyz, r3.y));
			r4.xy = r5.zw;
			r6.y = texture(resourceSamplerPair_7_ps, vec4(r4.xyz, r3.y));
			r5 = fma(idx_uniforms0_ps.cb0[12].wwww, vec4(-0.750000000f, -0.250000000f, 0.250000000f, -0.750000000f), r3.zwzw);
			r4.xy = r5.xy;
			r6.z = texture(resourceSamplerPair_7_ps, vec4(r4.xyz, r3.y));
			r4.xy = r5.zw;
			r6.w = texture(resourceSamplerPair_7_ps, vec4(r4.xyz, r3.y));
			r3.x = dot(r6, vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f));
		}
		r1.w = saturate(r2.z + float(-4.00000000f));
		r1.w = saturate(r1.w + r3.x);
	}
	else
	{
		r1.w = uintBitsToFloat(uint(0x3f800000));
	}
	r2.y = dot(r1.xyz, r1.xyz);
	r2.y = inversesqrt(r2.y);
	r1.xyz = r1.xyz * r2.yyy;
	r2.yzw = -v8.v.xyz + idx_uniforms0_ps.cb0[4].xyz;
	r3.x = dot(r2.yzw, r2.yzw);
	r3.x = inversesqrt(r3.x);
	r3.yzw = r2.yzw * r3.xxx;
	r2.yzw = fma(r2.yzw, r3.xxx, -idx_uniforms0_ps.cb0[3].xyz);
	r3.x = dot(r2.yzw, r2.yzw);
	r3.x = inversesqrt(r3.x);
	r2.yzw = r2.yzw * r3.xxx;
	r4.xyz = r1.yyy * v7.v.xyz;
	r4.xyz = fma(v6.v.xyz, r1.xxx, r4.xyz);
	r1.xyz = fma(v5.v.xyz, r1.zzz, r4.xyz);
	r3.x = saturate(dot(r1.xyz, -idx_uniforms0_ps.cb0[3].xyz));
	r4.x = saturate(dot(r1.xyz, r3.yzw));
	r4.y = saturate(fma(r1.y, float(0.500000000f), float(0.500000000f)));
	r5.xyz = idx_uniforms0_ps.cb0[10].xyz + -idx_uniforms0_ps.cb0[11].xyz;
	r4.yzw = fma(r4.yyy, r5.xyz, idx_uniforms0_ps.cb0[11].xyz);
	r3.x = r1.w * r3.x;
	r4.yzw = fma(r3.xxx, idx_uniforms0_ps.cb0[2].xyz, r4.yzw);
	r4.yzw = r0.www * r4.yzw;
	r5.xyz = r0.xyz * r4.yzw;
	r0.w = dot(-r3.yzw, r1.xyz);
	r0.w = r0.w + r0.w;
	r3.xyz = fma(r1.xyz, -r0.www, -r3.yzw);
	r3.xyz = ((texture(resourceSamplerPair_8_ps, r3.xyz))).xyz;
	r0.w = -r4.x + float(1.00000000f);
	r0.w = log2(r0.w);
	r0.w = r0.w * idx_uniforms2_ps.cb2[0].x;
	r0.w = exp2(r0.w);
	r0.w = min(r0.w, float(1.00000000f));
	r3.w = uintBitsToFloat(floatBitsToUint(r2.x) & idx_FrontFacing);
	r0.w = saturate(r0.w + idx_uniforms2_ps.cb2[0].y);
	r0.w = r3.w * r0.w;
	r0.xyz = fma(-r0.xyz, r4.yzw, r3.xyz);
	r0.xyz = fma(r0.www, r0.xyz, r5.xyz);
	r0.w = saturate(dot(r2.yzw, r1.xyz));
	r0.w = log2(r0.w);
	r0.w = r0.w * float(128.000000f);
	r0.w = exp2(r0.w);
	r0.w = r2.x * r0.w;
	r0.w = r1.w * r0.w;
	r0.w = r0.w * float(0.500000000f);
	r1.xyz = saturate(r0.www * idx_uniforms0_ps.cb0[1].xyz);
	r0.xyz = r0.xyz + r1.xyz;
	r1.x = uintBitsToFloat(uint(0x3f800000));
	r1.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r1 = r1 * -v9.v.wwww;
	r1 = exp2(r1);
	r1 = min(r1, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = -r1.x + float(1.00000000f);
	r2.xyz = r0.www * idx_uniforms0_ps.cb0[13].xyz;
	o0.xyz = fma(r0.xyz, r1.yzw, r2.xyz);
	o0.w = idx_uniforms1_ps.cb1[1].w;
	PixelEpilog();
	return;
}

