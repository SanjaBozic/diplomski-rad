#version 460 core
// ps_5_0
// Checksum: ddeac69a_6f0f021f_073278b8_ae6d4fd4
// Name: ssao_mipcopy

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

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
	r0.x = ((textureLod(resourceSamplerPair_0_ps, v1.v.xy, idx_uniforms1_ps.cb1[0].x))).x;
	o0 = r0.xxxx;
	return;
}

