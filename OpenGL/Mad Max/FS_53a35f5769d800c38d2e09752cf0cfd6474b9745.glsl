#version 460 core
// ps_5_0
// Checksum: 705f4422_c452d26e_12983075_17f60dda
// Name: generalmmlod0fade_sdndetail_osn_sand_inst

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 8) in idx_Varying8 { vec4 v; } v8;
layout(location = 9) in idx_Varying9 { vec4 v; } v9;
layout(location = 10) in idx_Varying10 { vec4 v; } v10;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6, r7;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[7]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[4]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2

uniform sampler2D resourceSamplerPair_3_ps; // res3, s3

uniform sampler2D resourceSamplerPair_4_ps; // res6, s6

uniform sampler2D resourceSamplerPair_5_ps; // res4, s4

uniform sampler2D resourceSamplerPair_6_ps; // res7, s7

uniform sampler2D resourceSamplerPair_7_ps; // res8, s8

uniform sampler2D resourceSamplerPair_8_ps; // res9, s9

uniform sampler2D resourceSamplerPair_9_ps; // res10, s10


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
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1.xyz = fma(v6.v.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r1.xyz = fma(v6.v.xyz, r1.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	r1.xyz = r1.xyz * v6.v.xyz;
	r1.w = v6.v.w;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v2.v.xy))).xyz;
	r1.xyz = fma(r1.zxy, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.xy))).xyz;
	r3.xy = v2.v.zw * idx_uniforms2_ps.cb2[0].yz;
	r4 = (texture(resourceSamplerPair_3_ps, r3.xy));
	r4.w = fma(idx_uniforms2_ps.cb2[3].x, r4.w, idx_uniforms2_ps.cb2[3].y);
	r5 = (texture(resourceSamplerPair_4_ps, r3.xy));
	r5.w = fma(idx_uniforms2_ps.cb2[3].z, r5.w, idx_uniforms2_ps.cb2[3].w);
	r5 = -r4 + r5;
	r4 = fma(r2.xxxx, r5, r4);
	r0.xyz = r0.xyz * r4.xyz;
	r0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r2.y = r2.y * r4.w;
	r4.xyz = ((texture(resourceSamplerPair_5_ps, r3.xy)).xywz).xyz;
	r3.xyz = ((texture(resourceSamplerPair_6_ps, r3.xy)).xywz).xyz;
	r3.xyz = -r4.xyz + r3.xyz;
	r3.xyz = fma(r2.xxx, r3.xyz, r4.xyz);
	r3.xyz = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r3.x = r3.z * r3.x;
	r3.z = dot(v4.v.xyz, v4.v.xyz);
	r3.z = inversesqrt(r3.z);
	r4.xyz = r3.zzz * v4.v.xyz;
	r5.xyz = r1.xyz * r4.yzx;
	r5.xyz = fma(r1.zxy, r4.zxy, -r5.xyz);
	r5.xyz = r5.xyz * v4.v.www;
	r6.xyz = r1.zzz * v8.v.xyz;
	r6.xyz = fma(v7.v.xyz, r1.yyy, r6.xyz);
	r1.xyz = fma(v9.v.xyz, r1.xxx, r6.xyz);
	r3.yzw = r3.yyy * r5.xyz;
	r3.xyz = fma(r4.xyz, r3.xxx, r3.yzw);
	r1.xyz = r1.xyz + r3.xyz;
	r3.x = dot(r1.xyz, r1.xyz);
	r3.x = inversesqrt(r3.x);
	r3.yzw = r1.xyz * r3.xxx;
	r1.x = saturate(r3.w * idx_uniforms1_ps.cb1[5].z);
	r1.x = fma(r1.y, r3.x, r1.x);
	r1.y = intBitsToFloat(r1.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r6.xy = idx_uniforms1_ps.cb1[5].ww * vec2(0.00200000009f, 0.0399999991f);
	r6.xy = fma(v10.v.zw, vec2(1.10000002f, 0.300000012f), r6.xy);
	r1.z = ((texture(resourceSamplerPair_7_ps, r6.xy)).xywz).z;
	if (floatBitsToUint(r1.y) != uint(0))
	{
		r1.y = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
		r6.xyz = r1.yyy * v3.v.xyz;
		r1.y = dot(r6.xyz, r6.xyz);
		r1.y = inversesqrt(r1.y);
		r6.xyz = r1.yyy * r6.xyz;
		r7.xyz = ((texture(resourceSamplerPair_8_ps, v10.v.xy))).xyz;
		r7.xyz = fma(r7.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r5.xyz = r5.xyz * r7.yyy;
		r4.xyz = fma(r4.xyz, r7.xxx, r5.xyz);
		r4.xyz = fma(r6.xyz, r7.zzz, r4.xyz);
		r1.y = dot(r4.xyz, r4.xyz);
		r1.y = inversesqrt(r1.y);
		r5 = (texture(resourceSamplerPair_9_ps, v1.v.zw));
		r3.x = min(r5.w, idx_uniforms1_ps.cb1[5].x);
		r3.x = saturate(r3.x * idx_uniforms1_ps.cb1[5].y);
		r6 = (texture(resourceSamplerPair_7_ps, v10.v.xy));
		r4.w = uintBitsToFloat(uint(0x3f800000));
		r5.xyz = r5.xyz * r6.xyz;
		r5.w = ((texture(resourceSamplerPair_7_ps, v10.v.zw))).w;
		r4.w = fma(r6.w, r4.w, float(0.750000000f));
		r6.x = r4.w * r5.w;
		r6.y = r3.x * float(0.699999988f);
		r4.w = fma(-r5.w, r4.w, float(0.100000001f));
		r4.w = fma(r6.y, r4.w, r6.x);
		r1.z = -r1.z + float(1.00000000f);
		r1.z = saturate(fma(-r1.z, idx_uniforms1_ps.cb1[6].x, r4.w));
		r1.z = r1.z * r3.x;
		r3.x = r1.z * float(3.00000000f);
		r1.z = fma(r1.z, float(-0.300000012f), float(0.800000012f));
		r3.x = min(r3.x, float(1.00000000f));
		r4.w = -r1.z + float(1.00000000f);
		r3.x = r3.x / r4.w;
		r1.x = -r1.z + r1.x;
		r1.x = saturate(r3.x * r1.x);
		r5.xyz = fma(r5.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xyz);
		r0.xyz = fma(r1.xxx, r5.xyz, r0.xyz);
		r2.xw = r2.xz;
		r5.x = r2.x;
		r5.yz = uintBitsToFloat(uvec2(0x3c23d70a, 0x3f000000));
		r5.xyz = -r2.xyw + r5.xyz;
		r2.xyz = fma(r1.xxx, r5.xyz, r2.xyw);
		r4.xyz = fma(r4.xyz, r1.yyy, -r3.yzw);
		r1.xyz = fma(r1.xxx, r4.xyz, r3.yzw);
		r3.x = dot(r1.xyz, r1.xyz);
		r3.x = inversesqrt(r3.x);
		r3.yzw = r1.xyz * r3.xxx;
	}
	r1.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r1.x = fract(r1.x);
	r0.w = fma(r0.w, r1.w, -idx_uniforms2_ps.cb2[1].x);
	r1.y = fma(-idx_uniforms1_ps.cb1[0].w, v7.v.w, float(1.00000000f));
	r1.x = -r1.y + r1.x;
	r0.w = min(r0.w, r1.x);
	r0.w = intBitsToFloat(r0.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.w) != uint(0);
	r2.x = r2.x * idx_uniforms2_ps.cb2[1].y;
	o1.xyz = fma(r3.yzw, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r0.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r2.w = uintBitsToFloat(uint(0x3f800000));
	o2 = r2;
	PixelEpilog();
	return;
}

