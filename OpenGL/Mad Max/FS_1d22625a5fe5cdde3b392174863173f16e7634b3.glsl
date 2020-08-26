#version 460 core
// ps_5_0
// Checksum: 83fd68cd_96f116b2_25c965f3_4cadfd15
// Name: ssao_reconstructz

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
	r0.xy = min(v1.v.xy, idx_uniforms1_ps.cb1[0].zw);
	r0.x = ((textureLod(resourceSamplerPair_0_ps, r0.xy, float(0.00000000f)))).x;
	r0.x = fma(r0.x, idx_uniforms1_ps.cb1[0].x, idx_uniforms1_ps.cb1[0].y);
	o0 = vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f) / r0.xxxx;
	return;
}
