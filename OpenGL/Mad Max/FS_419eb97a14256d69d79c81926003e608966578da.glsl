#version 460 core
// ps_5_0
// Checksum: e95b6020_395c232b_f38fa450_536f85b1
// Name: blur

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

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
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1 = fma(idx_uniforms1_ps.cb1[0].xyxy, vec4(1.00000000f, 0.00000000f, -0.500000000f, 0.865999997f), v1.v.xyxy);
	r2 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r1 = (texture(resourceSamplerPair_0_ps, r1.zw));
	r2 = r2 * vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f);
	r0 = fma(r0, vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f), r2);
	r0 = fma(r1, vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f), r0);
	r1 = fma(idx_uniforms1_ps.cb1[0].xyxy, vec4(-0.500000000f, -0.865999997f, 1.50000000f, 0.865999997f), v1.v.xyxy);
	r2 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r1 = (texture(resourceSamplerPair_0_ps, r1.zw));
	r0 = fma(r2, vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f), r0);
	r0 = fma(r1, vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f), r0);
	r1 = fma(idx_uniforms1_ps.cb1[0].xyxy, vec4(-1.50000000f, 0.865999997f, 0.00000000f, -1.73199999f), v1.v.xyxy);
	r2 = (texture(resourceSamplerPair_0_ps, r1.xy));
	r1 = (texture(resourceSamplerPair_0_ps, r1.zw));
	r0 = fma(r2, vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f), r0);
	o0 = fma(r1, vec4(0.142857149f, 0.142857149f, 0.142857149f, 0.142857149f), r0);
	return;
}

