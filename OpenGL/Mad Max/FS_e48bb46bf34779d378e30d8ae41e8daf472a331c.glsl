#version 460 core
// ps_5_0
// Checksum: 5408e7fd_c085d98a_22f170d6_8410a5cb
// Name: characterhairgbuffer

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 3) in idx_Varying3 { vec4 v; } v3;
layout(location = 4) in idx_Varying4 { vec4 v; } v4;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2


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
	r0.w = saturate(r0.w * idx_uniforms2_ps.cb2[0].x);
	o0.xyz = r0.xyz;
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r0.w, idx_uniforms4_ps.cb4[4].y);
	o0.w = r0.w;
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.x = dot(v2.v.xyz, v2.v.xyz);
	r0.x = inversesqrt(r0.x);
	r0.xyz = r0.xxx * v2.v.xyz;
	r0.w = dot(v3.v.xyz, v3.v.xyz);
	r0.w = inversesqrt(r0.w);
	r1.xyz = r0.www * v3.v.xyz;
	r0.w = intBitsToFloat(idx_uniforms1_ps.cb1[1].z == float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	r2.xy = uintBitsToFloat(movc(floatBitsToUint(r0.ww), floatBitsToUint(v1.v.xy), floatBitsToUint(v1.v.zw)));
	r2.xyz = ((texture(resourceSamplerPair_1_ps, r2.xy)).xywz).xyz;
	r2.yzw = fma(r2.xyz, vec3(2.00000000f, 2.00000000f, 2.00000000f), vec3(-1.00000000f, -1.00000000f, -1.00000000f));
	r1.xyz = r1.xyz * r2.zzz;
	r2.x = r2.w * r2.y;
	r0.w = dot(r2.xz, r2.xz);
	r0.xyz = fma(r0.xyz, r2.xxx, r1.xyz);
	r0.w = -r0.w + float(1.00000000f);
	r0.w = max(r0.w, float(0.00000000f));
	r0.w = sqrt(r0.w);
	r1.x = dot(v4.v.xyz, v4.v.xyz);
	r1.x = inversesqrt(r1.x);
	r1.xyz = r1.xxx * v4.v.xyz;
	r0.xyz = fma(r1.xyz, r0.www, r0.xyz);
	o1.xyz = fma(r0.xyz, vec3(0.500000000f, 0.500000000f, 0.500000000f), vec3(0.500000000f, 0.500000000f, 0.500000000f));
	o1.w = uintBitsToFloat(uint(0x3f800000));
	r0.xy = ((texture(resourceSamplerPair_2_ps, v1.v.xy)).xzyw).xy;
	o2.zw = r0.yx;
	o2.xy = uintBitsToFloat(uvec2(0x00000000, 0x00000000));
	PixelEpilog();
	return;
}

