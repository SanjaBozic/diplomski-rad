#version 460 core
// ps_5_0
// Checksum: 8f5d758d_9626a924_a7fa96af_49e0460a
// Name: fxaacopybuffer

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

