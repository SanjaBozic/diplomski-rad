#version 460 core
// ps_5_0
// Checksum: fbc77138_d3ba78d6_000eea7d_2a857d71
// Name: 3dtextsdfshadow

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[3]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
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
	r0.x = idx_uniforms1_ps.cb1[2].x + float(0.500000000f);
	r0.y = -idx_uniforms1_ps.cb1[2].x + float(0.500000000f);
	r0.x = -r0.y + r0.x;
	r0.x = float(1.00000000f) / r0.x;
	r1.y = uintBitsToFloat(uint(0x80000000));
	r1.xz = -1.f * idx_uniforms1_ps.cb1[1].xw;
	r0.zw = r1.yz + v1.v.xy;
	r1.x = r1.x + float(0.500000000f);
	r0.z = ((texture(resourceSamplerPair_0_ps, r0.zw)).yzxw).z;
	r0.y = -r0.y + r0.z;
	r0.x = saturate(r0.x * r0.y);
	r0.y = fma(r0.x, float(-2.00000000f), float(3.00000000f));
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = idx_uniforms1_ps.cb1[1].x + float(0.500000000f);
	r0.y = -r1.x + r0.y;
	r0.y = float(1.00000000f) / r0.y;
	r0.z = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzxw).z;
	r0.z = -r1.x + r0.z;
	r0.y = saturate(r0.y * r0.z);
	r0.z = fma(r0.y, float(-2.00000000f), float(3.00000000f));
	r0.y = r0.y * r0.y;
	r0.w = r0.y * r0.z;
	r0.y = fma(-r0.z, r0.y, float(1.00000000f));
	r0.z = ((texture(resourceSamplerPair_1_ps, v1.v.zw)).xzyw).z;
	r1.x = fma(r0.z, r0.w, r0.y);
	r0.w = r0.w * idx_uniforms1_ps.cb1[0].w;
	r1.x = r1.x * idx_uniforms1_ps.cb1[1].z;
	r0.x = r0.x * r1.x;
	r0.x = fma(-r0.x, r0.y, float(1.00000000f));
	r0.y = fma(-r0.w, r0.z, float(1.00000000f));
	r0.z = r0.z * r0.w;
	r1.xyz = r0.zzz * idx_uniforms1_ps.cb1[0].xyz;
	r0.z = fma(-r0.x, r0.y, float(1.00000000f));
	r1.w = r0.y * r0.x;
	o0 = r1;
	r0.x = dot(r1.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.x = r0.x + r0.z;
	r0.x = fma(idx_uniforms4_ps.cb4[4].x, r0.x, idx_uniforms4_ps.cb4[4].y);
	r0.x = intBitsToFloat(r0.x < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	PixelEpilog();
	return;
}

