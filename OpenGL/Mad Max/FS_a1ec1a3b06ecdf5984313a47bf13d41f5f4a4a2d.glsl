#version 460 core
// ps_5_0
// Checksum: 2f161252_9a3dac4a_0ea7bb7e_22920cfd
// Name: sunbeam

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
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	o0 = r0 * vec4(0.250000000f, 0.250000000f, 0.250000000f, 0.250000000f);
	return;
}

