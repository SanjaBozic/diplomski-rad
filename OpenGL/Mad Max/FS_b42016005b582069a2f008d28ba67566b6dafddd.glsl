#version 460 core
// ps_5_0
// Checksum: 10788f0d_d66bab57_533dc600_f6bdf39a
// Name: fogvolumeblur

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2, r3;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s2


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = v1.v.xyxy / v1.v.wwww;
	r1 = fma(idx_uniforms1_ps.cb1[0].xyxy, vec4(1.00000000f, 0.00000000f, -0.500000000f, 0.865999997f), r0.zwzw);
	r2 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r1 = (texture(resourceSamplerPair_0_ps, r1.zw));
	r3 = (texture(resourceSamplerPair_0_ps, r0.zw));
	r2 = r2 + r3;
	r1 = r1 + r2;
	r2 = fma(idx_uniforms1_ps.cb1[0].xyxy, vec4(-0.500000000f, -0.865999997f, 1.50000000f, 0.865999997f), r0.zwzw);
	r0 = fma(idx_uniforms1_ps.cb1[0].xyxy, vec4(-1.50000000f, 0.865999997f, 0.00000000f, -1.73199999f), r0);
	r3 = (texture(resourceSamplerPair_0_ps, r2.xy));
	r2 = (texture(resourceSamplerPair_0_ps, r2.zw));
	r1 = r1 + r3;
	r1 = r2 + r1;
	r2 = (texture(resourceSamplerPair_0_ps, r0.xy));
	r0 = (texture(resourceSamplerPair_0_ps, r0.zw));
	r1 = r1 + r2;
	r0 = r0 + r1;
	o0 = r0 * vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f);
	return;
}

