#version 460 core
// ps_5_0
// Checksum: e485b08e_67890130_147f0460_4e5cf888
// Name: characteremissive

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 6) in idx_Varying6 { vec4 v; } v6;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;

layout (std140) uniform cb_ps2 { vec4 cb2[2]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res3, s3

uniform sampler2D resourceSamplerPair_1_ps; // res0, s0

uniform sampler2D resourceSamplerPair_2_ps; // res7, s7


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.xy = v6.v.xy * idx_uniforms2_ps.cb2[1].xy;
	r0.xyz = ((texture(resourceSamplerPair_0_ps, r0.xy))).xyz;
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * vec3(4.69999981f, 4.69999981f, 4.69999981f);
	r1.xyz = ((texture(resourceSamplerPair_2_ps, v1.v.zw))).xyz;
	r1.xyz = r1.xyz * idx_uniforms2_ps.cb2[1].zzz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = saturate(float(1.00000000f) + -idx_uniforms1_ps.cb1[0].w);
	o0.xyz = fma(r0.xyz, r0.www, idx_uniforms1_ps.cb1[0].xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

