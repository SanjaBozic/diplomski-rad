#version 460 core
// ps_5_0
// Checksum: 74e42b1a_2fcad6a7_005c2e43_0389bf09
// Name: blurdof

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = v1.v.xyxy + idx_uniforms1_ps.cb1[0];
	r1.xyz = ((textureLod(resourceSamplerPair_0_ps, r0.xy, idx_uniforms2_ps.cb2[0].x))).xyz;
	r0.xyz = ((textureLod(resourceSamplerPair_0_ps, r0.zw, idx_uniforms2_ps.cb2[0].x))).xyz;
	r1.xyz = r1.xyz * vec3(0.349999994f, 0.349999994f, 0.349999994f);
	r2 = v1.v.xyxy + -idx_uniforms1_ps.cb1[0];
	r3.xyz = ((textureLod(resourceSamplerPair_0_ps, r2.xy, idx_uniforms2_ps.cb2[0].x))).xyz;
	r2.xyz = ((textureLod(resourceSamplerPair_0_ps, r2.zw, idx_uniforms2_ps.cb2[0].x))).xyz;
	r1.xyz = fma(r3.xyz, vec3(0.349999994f, 0.349999994f, 0.349999994f), r1.xyz);
	r1.xyz = fma(r2.xyz, vec3(0.150000006f, 0.150000006f, 0.150000006f), r1.xyz);
	o0.xyz = fma(r0.xyz, vec3(0.150000006f, 0.150000006f, 0.150000006f), r1.xyz);
	r0.xyz = ((textureLod(resourceSamplerPair_1_ps, v1.v.xy, idx_uniforms2_ps.cb2[0].y))).xyz;
	o0.w = dot(r0.xyz, idx_uniforms2_ps.cb2[1].xyz);
	return;
}

