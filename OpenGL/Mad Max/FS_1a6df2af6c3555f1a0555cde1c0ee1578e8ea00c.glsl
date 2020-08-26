#version 460 core
// ps_5_0
// Checksum: a395fece_2b29a61a_26058404_8f558bb0
// Name: guiregiontint

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = (texture(resourceSamplerPair_0_ps, idx_uniforms1_ps.cb1[1].zz));
	r0 = r0 * idx_uniforms1_ps.cb1[0];
	r1 = (texture(resourceSamplerPair_1_ps, v1.v.xy));
	r2 = fma(idx_uniforms1_ps.cb1[1].yyyy, r1, -r0);
	r1.x = r1.w * idx_uniforms1_ps.cb1[1].y;
	r0 = fma(r1.xxxx, r2, r0);
	r0.xyz = log2(r0.xyz);
	o0.w = r0.w;
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	return;
}

