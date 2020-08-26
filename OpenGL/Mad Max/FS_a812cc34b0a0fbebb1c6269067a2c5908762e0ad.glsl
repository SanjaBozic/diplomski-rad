#version 460 core
// ps_5_0
// Checksum: de562a4c_d4718fa2_1ddb0f18_b8ce4b36
// Name: guiroad

bool discarded = false;
layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


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
	r0.x = intBitsToFloat(v1.v.y < idx_uniforms1_ps.cb1[1].x ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0.x = intBitsToFloat(idx_uniforms1_ps.cb1[1].y < v1.v.y ? int(0xffffffff) : int(0x00000000));
	discarded = discarded || floatBitsToUint(r0.x) != uint(0);
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r0 = r0 * idx_uniforms1_ps.cb1[0];
	r0.xyz = log2(r0.xyz);
	o0.w = r0.w;
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	PixelEpilog();
	return;
}

