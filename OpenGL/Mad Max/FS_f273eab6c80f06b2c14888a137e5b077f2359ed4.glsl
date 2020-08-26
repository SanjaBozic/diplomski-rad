#version 460 core
// ps_5_0
// Checksum: 1bc1c5ee_d354e3d5_02ee2615_bda8f333
// Name: skyboxfade

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


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
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy))).xyz;
	r0.w = max(r0.z, r0.y);
	r0.w = max(r0.w, r0.x);
	r0.w = max(r0.w, float(0.00100000005f));
	r0.xyz = r0.xyz / r0.www;
	r0.w = log2(r0.w);
	r0.w = r0.w * idx_uniforms1_ps.cb1[1].z;
	r0.w = exp2(r0.w);
	r0.xyz = r0.xyz * r0.www;
	r0.xyz = fma(r0.xyz, idx_uniforms1_ps.cb1[1].yyy, idx_uniforms1_ps.cb1[1].xxx);
	r1.xyz = ((texture(resourceSamplerPair_1_ps, v1.v.xy))).xyz;
	r0.w = max(r1.z, r1.y);
	r0.w = max(r0.w, r1.x);
	r0.w = max(r0.w, float(0.00100000005f));
	r1.xyz = r1.xyz / r0.www;
	r0.w = log2(r0.w);
	r0.w = r0.w * idx_uniforms1_ps.cb1[0].z;
	r0.w = exp2(r0.w);
	r1.xyz = r1.xyz * r0.www;
	r1.xyz = fma(r1.xyz, idx_uniforms1_ps.cb1[0].yyy, idx_uniforms1_ps.cb1[0].xxx);
	r0.xyz = r0.xyz + -r1.xyz;
	r0.w = -v1.v.y + float(0.500000000f);
	r0.w = fma(r0.w, idx_uniforms1_ps.cb1[0].w, idx_uniforms1_ps.cb1[1].w);
	r2.y = -r0.w + float(0.500000000f);
	r2.x = uintBitsToFloat(uint(0x00000000));
	r0.w = ((texture(resourceSamplerPair_2_ps, r2.xy)).yzwx).w;
	o0.xyz = fma(r0.www, r0.xyz, r1.xyz);
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

