#version 460 core
// ps_5_0
// Checksum: c303cc69_235280d3_d9a2832f_87160b96
// Name: particleeffectdebugvertexcolor

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
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
	r0.x = ((texture(resourceSamplerPair_0_ps, v2.v.xy)).wxyz).x;
	r0.x = min(r0.x, float(0.875000000f));
	r0.x = max(r0.x, float(0.125000000f));
	o0.w = r0.x * v1.v.w;
	o0.xyz = v1.v.xyz;
	return;
}

