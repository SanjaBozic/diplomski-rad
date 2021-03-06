#version 460 core
// ps_5_0
// Checksum: ba13ec35_1bd86ea2_e4f38c75_1e859640
// Name: fogvolumecompositefar

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps2 { vec4 cb2[11]; } idx_uniforms2_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res2, s2


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).zwxy).xy;
	r0.x = fma(r0.y, float(8.00000000f), r0.x);
	o0.xyz = r0.xxx * idx_uniforms2_ps.cb2[10].xyz;
	o0.w = uintBitsToFloat(uint(0x00000000));
	return;
}

