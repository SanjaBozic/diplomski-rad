#version 460 core
// ps_5_0
// Checksum: c4273d38_4e361e46_9125e74d_d597b1a1
// Name: terrainoverlay

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
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.zw))).xyz;
	o0.xyz = r0.xyz;
	o0.w = idx_uniforms1_ps.cb1[0].x;
	return;
}

