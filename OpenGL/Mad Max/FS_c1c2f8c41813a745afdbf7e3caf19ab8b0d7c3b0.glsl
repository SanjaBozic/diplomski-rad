#version 460 core
// ps_5_0
// Checksum: 2f23a79a_28cd2d46_e789679a_606f806a
// Name: generalmmlod0fade_ddetail_terraincolor_inst

bool discarded = false;
vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 7) in idx_Varying7 { vec4 v; } v7;
uint idx_FrontFacing = uint(gl_FrontFacing ? 0xffffffffu : 0u);
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[4]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res5, s5

uniform sampler2D resourceSamplerPair_2_ps; // res3, s3

uniform sampler2D resourceSamplerPair_3_ps; // res1, s1

uniform sampler2D resourceSamplerPair_4_ps; // res2, s2


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
	r0.x = dot(v0.xy, vec2(0.467943996f, -0.703647971f));
	r0.x = fract(r0.x);
	r0.y = fma(-idx_uniforms1_ps.cb1[0].w, v7.v.w, float(1.00000000f));
	r0.x = -r0.y + r0.x;
	r0.y = v6.v.w;
	r1 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0.y = fma(r1.w, r0.y, -idx_uniforms2_ps.cb2[1].x);
	r0.x = min(r0.x, r0.y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.xyz = fma(v6.v.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r0.xyz = fma(v6.v.xyz, r0.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	r0.xyz = r0.xyz * v6.v.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.zw))).xyz;
	r1.xyz = fma(idx_uniforms2_ps.cb2[0].xxx, r1.xyz, idx_uniforms2_ps.cb2[0].www);
	r0.xyz = r0.xyz * r1.xyz;
	r1.xy = v2.v.zw * idx_uniforms2_ps.cb2[0].yz;
	r1 = (texture(resourceSamplerPair_2_ps, r1.xy));
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = fma(idx_uniforms2_ps.cb2[3].x, r1.w, idx_uniforms2_ps.cb2[3].y);
	o0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	r0.x = uintBitsToFloat(movc(idx_FrontFacing, uint(0x3f800000), uint(0xbf800000)));
	r0.xyz = r0.xxx * v3.v.xyz;
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	r1.x = dot(v4.v.xyz, v4.v.xyz);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r1.xxx * v4.v.xyz;
	r2.xyz = r0.zxy * r1.yzx;
	r2.xyz = fma(r0.yzx, r1.zxy, -r2.xyz);
	r2.xyz = r2.xyz * v4.v.www;
	r3.xyz = ((texture(resourceSamplerPair_3_ps, v2.v.xy)).xywz).xyz;
	r3.yzw = fma(r3.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r2.xyz = r2.xyz * r3.zzz;
	r3.x = r3.w * r3.y;
	r1.w = dot(r3.xz, r3.xz);
	r1.xyz = fma(r1.xyz, r3.xxx, r2.xyz);
	r1.w = -r1.w + float(1.00000000f);
	r1.w = max(r1.w, float(0.00000000f));
	r1.w = sqrt(r1.w);
	r0.xyz = fma(r0.xyz, r1.www, r1.xyz);
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = inversesqrt(r1.x);
	r0.xyz = r0.xyz * r1.xxx;
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r0.xyz = ((texture(resourceSamplerPair_4_ps, v1.v.xy))).xyz;
	o2.y = r0.w * r0.y;
	o2.x = r0.x * idx_uniforms2_ps.cb2[1].y;
	o2.w = saturate(r0.x + idx_uniforms2_ps.cb2[1].w);
	o2.z = r0.z;
	PixelEpilog();
	return;
}

