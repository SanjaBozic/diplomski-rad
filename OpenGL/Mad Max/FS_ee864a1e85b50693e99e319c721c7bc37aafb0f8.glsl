#version 460 core
// ps_5_0
// Checksum: df9bdbaa_96d1af4a_33ee0d89_bd5d04ee
// Name: lensflare

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


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
	o0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xyz;
	r0.x = ((texture(resourceSamplerPair_1_ps, v1.v.zw)).wxyz).x;
	o0.w = r0.x;
	return;
}

