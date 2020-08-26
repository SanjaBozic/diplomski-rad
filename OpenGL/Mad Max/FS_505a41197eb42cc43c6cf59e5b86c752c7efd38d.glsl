#version 460 core
// ps_5_0
// Checksum: a9011e59_bea8797a_2a709665_e6098639
// Name: fogvolumecompositenear

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps2 { vec4 cb2[10]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s2


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xywz).xyz;
	r0.x = fma(r0.z, float(8.00000000f), r0.x);
	r0.yzw = r0.yyy * idx_uniforms2_ps.cb2[9].xyz;
	o0.xyz = fma(idx_uniforms2_ps.cb2[8].xyz, r0.xxx, r0.yzw);
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

