#version 460 core
// ps_5_0
// Checksum: 5e0f9a7d_cae8a268_e845b992_a481f463
// Name: guiperimeter

vec4 v0 = vec4(gl_FragCoord.xyz, 1.0 / gl_FragCoord.w);
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[9]; } idx_uniforms0_ps;

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = v0.xy * idx_uniforms0_ps.cb0[8].zw;
	r0.xy = r0.xy * idx_uniforms1_ps.cb1[1].xy;
	r0 = (texture(resourceSamplerPair_0_ps, r0.xy));
	r0 = r0 * idx_uniforms1_ps.cb1[0];
	r0.xyz = log2(r0.xyz);
	o0.w = r0.w;
	r0.xyz = r0.xyz * idx_uniforms2_ps.cb2[1].xxx;
	o0.xyz = exp2(r0.xyz);
	return;
}

