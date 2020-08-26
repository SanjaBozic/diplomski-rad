#version 460 core
// ps_5_0
// Checksum: c8b70cfb_f8ff2d1a_732c4bce_af3bc368
// Name: generalmmlod0_em_sand

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps4 { vec4 cb4[5]; } idx_uniforms4_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res3, s3


void Initialise()
{
}



void PixelEpilog()
{
	if (discarded)
		discard;
}

void main()
{
	Initialise();
	r0.x = intBitsToFloat(idx_uniforms4_ps.cb4[4].y < float(0.00000000f) ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.xyz = fma(v6.v.xyz, vec3(0.305306017f, 0.305306017f, 0.305306017f), vec3(0.682171106f, 0.682171106f, 0.682171106f));
	r0.xyz = fma(v6.v.xyz, r0.xyz, vec3(0.0125228781f, 0.0125228781f, 0.0125228781f));
	r0.xyz = r0.xyz * v6.v.xyz;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v2.v.zw))).xyz;
	r1.xyz = r1.xyz * idx_uniforms2_ps.cb2[0].xxx;
	r0.xyz = r0.xyz * r1.xyz;
	o0.xyz = r0.xyz * vec3(4.00000000f, 4.00000000f, 4.00000000f);
	o0.w = uintBitsToFloat(uint(0x00000000));
	PixelEpilog();
	return;
}

