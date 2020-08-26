#version 460 core
// ps_5_0
// Checksum: f1947476_5293c37d_472c57aa_93f8d424
// Name: dofmaskcopy

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = (textureLod(resourceSamplerPair_0_ps, v1.v.xy, idx_uniforms2_ps.cb2[0].x));
	o0 = r0 + r0;
	return;
}

