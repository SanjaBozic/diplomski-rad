#version 460 core
// ps_5_0
// Checksum: 56578cef_f2a88409_aa87d7fc_e8dac5ae
// Name: rendervelocitybuffermask

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
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).wxyz).x;
	o0.w = r0.x;
	o0.xyz = uintBitsToFloat(uvec3(0x3f000000, 0x3f000000, 0x3f800000));
	return;
}

