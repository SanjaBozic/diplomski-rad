#version 460 core
// ps_5_0
// Checksum: 3eb019c8_1d0d1802_d3fe2c20_dbffbe00
// Name: highpass_pg

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[1]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r0.w = dot(r0.xyz, idx_uniforms1_ps.cb1[0].yyy);
	r0.w = r0.w + -idx_uniforms1_ps.cb1[0].z;
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = max(r0.xyz, vec3(0.00000000f, 0.00000000f, 0.00000000f));
	r0.xyz = log2(r0.xyz);
	r0.xyz = r0.xyz * idx_uniforms1_ps.cb1[0].xxx;
	r0.xyz = exp2(r0.xyz);
	r0.xyz = min(r0.xyz, vec3(4094.00000f, 4094.00000f, 4094.00000f));
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	o0.xyz = r0.xyz * r1.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

