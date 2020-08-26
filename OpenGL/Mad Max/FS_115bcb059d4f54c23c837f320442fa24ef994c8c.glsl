#version 460 core
// ps_5_0
// Checksum: d655acac_afd268ca_61e13664_33e5c9b2
// Name: generalmmlod0fade_matte_terraincolor_sand_inst

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
layout(location = 10) in idx_Varying10 { vec4 v; } v10;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3, r4, r5, r6;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[7]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res1, s1

uniform sampler2D resourceSamplerPair_3_ps; // res8, s8

uniform sampler2D resourceSamplerPair_4_ps; // res9, s9

uniform sampler2D resourceSamplerPair_5_ps; // res10, s10


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
	r1.x = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r1.xyz = r1.xxx * v3.v.xyz;
	r2.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.zw))).xyz;
	r2.xyz = fma(idx_uniforms2_ps.cb2[0].xxx, r2.xyz, idx_uniforms2_ps.cb2[0].www);
	r0.xyz = r0.xyz * r2.xyz;
	r2.xyz = ((texture(resourceSamplerPair_2_ps, v2.v.xy)).xywz).xyz;
	r2.yzw = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.x = r2.w * r2.y;
	r2.y = dot(r2.xz, r2.xz);
	r2.y = -r2.y + float(1.00000000f);
	r2.y = max(r2.y, float(0.00000000f));
	r2.y = sqrt(r2.y);
	r2.w = dot(r1.xyz, r1.xyz);
	r2.w = inversesqrt(r2.w);
	r1.xyz = r1.xyz * r2.www;
	r2.w = dot(v4.v.xyz, v4.v.xyz);
	r2.w = inversesqrt(r2.w);
	r3.xyz = r2.www * v4.v.xyz;
	r4.xyz = r1.zxy * r3.yzx;
	r4.xyz = fma(r1.yzx, r3.zxy, -r4.xyz);
	r4.xyz = r4.xyz * v4.v.www;
	r5.xyz = r2.zzz * r4.xyz;
	r2.xzw = fma(r3.xyz, r2.xxx, r5.xyz);
	r2.xyz = fma(r1.xyz, r2.yyy, r2.xzw);
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = inversesqrt(r2.w);
	r5.xyz = r2.www * r2.xyz;
	r2.x = saturate(r5.z * idx_uniforms1_ps.cb1[5].z);
	r2.x = fma(r2.y, r2.w, r2.x);
	r2.y = intBitsToFloat(r2.x >= float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.zw = idx_uniforms1_ps.cb1[5].ww * vec2(0.00200000009f, 0.0399999991f);
	r2.zw = fma(v10.v.zw, vec2(1.10000002f, 0.300000012f), r2.zw);
	r2.z = ((texture(resourceSamplerPair_3_ps, r2.zw)).xywz).z;
	if (floatBitsToUint(r2.y) != uint(0))
	{
		r6.xyz = ((texture(resourceSamplerPair_4_ps, v10.v.xy))).xyz;
		r6.xyz = fma(r6.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
		r4.xyz = r4.xyz * r6.yyy;
		r3.xyz = fma(r3.xyz, r6.xxx, r4.xyz);
		r1.xyz = fma(r1.xyz, r6.zzz, r3.xyz);
		r2.y = dot(r1.xyz, r1.xyz);
		r2.y = inversesqrt(r2.y);
		r3 = (texture(resourceSamplerPair_5_ps, v1.v.zw));
		r2.w = min(r3.w, idx_uniforms1_ps.cb1[5].x);
		r2.w = saturate(r2.w * idx_uniforms1_ps.cb1[5].y);
		r4 = (texture(resourceSamplerPair_3_ps, v10.v.xy));
		r3.w = uintBitsToFloat(uint(0x3f800000));
		r3.xyz = r3.xyz * r4.xyz;
		r4.x = ((texture(resourceSamplerPair_3_ps, v10.v.zw)).wxyz).x;
		r3.w = fma(r4.w, r3.w, float(0.750000000f));
		r4.y = r3.w * r4.x;
		r4.z = r2.w * float(0.699999988f);
		r3.w = fma(-r4.x, r3.w, float(0.100000001f));
		r3.w = fma(r4.z, r3.w, r4.y);
		r2.z = -r2.z + float(1.00000000f);
		r2.z = saturate(fma(-r2.z, idx_uniforms1_ps.cb1[6].x, r3.w));
		r2.z = r2.z * r2.w;
		r2.w = r2.z * float(3.00000000f);
		r2.z = fma(r2.z, float(-0.300000012f), float(0.800000012f));
		r2.w = min(r2.w, float(1.00000000f));
		r3.w = -r2.z + float(1.00000000f);
		r2.w = r2.w / r3.w;
		r2.x = -r2.z + r2.x;
		r2.x = saturate(r2.w * r2.x);
		r3.xyz = fma(r3.xyz, vec3(4.69999981f, 4.69999981f, 4.69999981f), -r0.xyz);
		r0.xyz = fma(r2.xxx, r3.xyz, r0.xyz);
		r3.xy = r2.xx * vec2(0.00999999978f, 0.500000000f);
		r1.xyz = fma(r1.xyz, r2.yyy, -r5.xyz);
		r1.xyz = fma(r2.xxx, r1.xyz, r5.xyz);
		r2.x = dot(r1.xyz, r1.xyz);
		r2.x = inversesqrt(r2.x);
		r5.xyz = r1.xyz * r2.xxx;
	}
	else
	{
		r3.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	}
	r1.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r1.x = fract(r1.x);
	r0.w = fma(r0.w, r1.w, -idx_uniforms2_ps.cb2[1].x);
	r1.y = fma(-idx_uniforms1_ps.cb1[0].w, v7.v.w, float(1.00000000f));
	r1.x = -r1.y + r1.x;
	r0.w = min(r0.w, r1.x);
	r0.w = intBitsToFloat(r0.w < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.w) != uint(0);
	r3.z = saturate(idx_uniforms2_ps.cb2[1].w + float(1.00000000f));
	o1.xyz = fma(r5.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o0.xyz = r0.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r3.w = idx_uniforms2_ps.cb2[1].y;
	o2 = r3.wxyz;
	PixelEpilog();
	return;
}

