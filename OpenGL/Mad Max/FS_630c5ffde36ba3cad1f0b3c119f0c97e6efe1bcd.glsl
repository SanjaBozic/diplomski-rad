#version 460 core
// ps_5_0
// Checksum: 68eb5397_bedd32f9_7d226ee7_6db12d12
// Name: ssao_packz

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 0) out vec4 o0;
vec4 r0;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
}


#define saturate(rhs)  clamp(rhs, float(0), float(1))
void main()
{
	Initialise();
	r0.x = ((textureLod(resourceSamplerPair_0_ps, v1.v.xy, float(0.00000000f)))).x;
	r0.x = saturate(r0.x / idx_uniforms1_ps.cb1[1].z);
	r0.y = r0.x * float(256.000000f);
	r0.y = floor(r0.y);
	o0.z = fma(r0.x, float(256.000000f), -r0.y);
	o0.y = r0.y * float(0.00390625000f);
	r0.x = ((textureLod(resourceSamplerPair_1_ps, v1.v.xy, float(0.00000000f)))).x;
	o0.x = r0.x;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

