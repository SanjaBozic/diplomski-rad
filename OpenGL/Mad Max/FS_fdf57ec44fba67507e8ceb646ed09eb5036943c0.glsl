#version 460 core
// ps_5_0
// Checksum: b0ddb4ff_5be36d45_435882f7_d25c2a6c
// Name: video

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res1, s1

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res2, s2


void Initialise()
{
}


void main()
{
	Initialise();
	r0.x = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).x;
	r0.xyz = r0.xxx * vec3(1.59500003f, -0.813000023f, 0.00000000f);
	r0.w = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).yzwx).w;
	r0.xyz = fma(r0.www, vec3(1.16400003f, 1.16400003f, 1.16400003f), r0.xyz);
	r0.w = ((texture(resourceSamplerPair_2_ps, v1.v.xy)).yzwx).w;
	r0.xyz = fma(r0.www, vec3(0.00000000f, -0.391000003f, 2.01699996f), r0.xyz);
	o0.xyz = r0.xyz + vec3(-0.870000005f, 0.528999984f, -1.08159995f);
	o0.w = idx_uniforms1_ps.cb1[0].w;
	return;
}
