#version 460 core
// ps_5_0
// Checksum: 23038a4a_dc6a53f3_fc66bf02_2cf15f2b
// Name: ssao_apply

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	o0 = r0.xxxx;
	return;
}

