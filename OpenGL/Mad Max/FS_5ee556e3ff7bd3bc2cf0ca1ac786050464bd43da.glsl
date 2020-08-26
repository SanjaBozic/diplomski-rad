#version 460 core
// ps_5_0
// Checksum: ccf12e61_97b83237_35d49597_5f51b466
// Name: downscale4x4

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[16]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = v1.v.xy + idx_uniforms1_ps.cb1[1].xy;
	r0 = (texture(resourceSamplerPair_0_ps, r0.xy));
	r0 = r0 * vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[0].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[2].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[3].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[4].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[5].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[6].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[7].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[8].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[9].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[10].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[11].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[12].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[13].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[14].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	r1.xy = v1.v.xy + idx_uniforms1_ps.cb1[15].xy;
	r1 = (texture(resourceSamplerPair_0_ps, r1.xy));
	o0 = fma(r1, vec4(0.0625000000f, 0.0625000000f, 0.0625000000f, 0.0625000000f), r0);
	return;
}

