#version 460 core
// ps_5_0
// Checksum: 58af37d0_d600ddfe_4f0367c6_9c024b78
// Name: separableblurlow

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = v1.v.xy + idx_uniforms1_ps.cb1[0].xy;
	r0 = (texture(resourceSamplerPair_0_ps, r0.xy));
	r1.xy = v1.v.xy + -idx_uniforms1_ps.cb1[0].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = r0 + r1;
	o0 = r0 * vec4(0.500000000f, 0.500000000f, 0.500000000f, 0.500000000f);
	return;
}

