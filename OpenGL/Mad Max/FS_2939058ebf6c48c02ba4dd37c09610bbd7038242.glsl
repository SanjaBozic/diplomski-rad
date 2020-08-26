#version 460 core
// ps_5_0
// Checksum: 5f3ee9bc_4c9889e7_91769575_421033bf
// Name: scope

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
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
	r0.xy = ((texture(resourceSamplerPair_0_ps, v1.v.zw))).xy;
	r0.xy = r0.xy + vec2(-0.500000000f, -0.500000000f);
	r0.xy = r0.xy * idx_uniforms1_ps.cb1[0].xx;
	r0.xy = r0.xy + r0.xy;
	r0.zw = ((texture(resourceSamplerPair_1_ps, v1.v.xy)).zwxy).zw;
	r0.zw = r0.zw + vec2(-0.500000000f, -0.500000000f);
	r0.zw = r0.zw * idx_uniforms1_ps.cb1[0].zz;
	r0.xy = fma(r0.zw, vec2(2.00000000f, 2.00000000f), r0.xy);
	r0.xy = r0.xy + v2.v.xy;
	r0.xyz = ((texture(resourceSamplerPair_2_ps, r0.xy))).xyz;
	o0.xyz = r0.xyz;
	o0.w = idx_uniforms1_ps.cb1[0].w;
	return;
}

