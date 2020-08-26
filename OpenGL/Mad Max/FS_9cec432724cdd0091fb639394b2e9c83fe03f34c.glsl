#version 460 core
// ps_5_0
// Checksum: 35bfc825_77f9cc3f_fa34d56e_c9e7d4bb
// Name: 2dtex1copybuffer

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	o0.xyz = r0.xyz;
	r0.x = ((texture(resourceSamplerPair_1_ps, v1.v.zw)).wxyz).x;
	o0.w = r0.x;
	return;
}
