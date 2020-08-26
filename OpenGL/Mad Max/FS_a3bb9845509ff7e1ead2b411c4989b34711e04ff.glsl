#version 460 core
// ps_5_0
// Checksum: 94fbbc41_e0a6436b_9fc441c5_abc647d8
// Name: blursep

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[1]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = v1.v.xyxy + idx_uniforms1_ps.cb1[0];
	r1 = (textureLod(resourceSamplerPair_0_ps, r0.xy, idx_uniforms2_ps.cb2[0].x));
	r0 = (textureLod(resourceSamplerPair_0_ps, r0.zw, idx_uniforms2_ps.cb2[0].x));
	r1 = r1 * vec4(0.349999994f, 0.349999994f, 0.349999994f, 0.349999994f);
	r2 = v1.v.xyxy + -idx_uniforms1_ps.cb1[0];
	r3 = (textureLod(resourceSamplerPair_0_ps, r2.xy, idx_uniforms2_ps.cb2[0].x));
	r2 = (textureLod(resourceSamplerPair_0_ps, r2.zw, idx_uniforms2_ps.cb2[0].x));
	r1 = fma(r3, vec4(0.349999994f, 0.349999994f, 0.349999994f, 0.349999994f), r1);
	r1 = fma(r2, vec4(0.150000006f, 0.150000006f, 0.150000006f, 0.150000006f), r1);
	o0 = fma(r0, vec4(0.150000006f, 0.150000006f, 0.150000006f, 0.150000006f), r1);
	return;
}

