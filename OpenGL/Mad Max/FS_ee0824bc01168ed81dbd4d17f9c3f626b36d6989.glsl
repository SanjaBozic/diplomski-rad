#version 460 core
// ps_5_0
// Checksum: 1a5c2f73_8e38d694_3389c87c_a2f8c18d
// Name: blurscale

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	o0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	return;
}

