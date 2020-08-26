#version 460 core
// ps_5_0
// Checksum: 91d6e592_2a53c519_349d224f_4a5b75e5
// Name: openmrt

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
layout(location = 1) out vec4 o1;
layout(location = 2) out vec4 o2;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps1 { vec4 cb1[2]; } idx_uniforms1_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0 = (texture(resourceSamplerPair_0_ps, v1.v.xy));
	r1 = -r0 + vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f);
	r0 = fma(idx_uniforms1_ps.cb1[1].xxxx, r1, r0);
	r0 = r0 * idx_uniforms1_ps.cb1[0];
	o0 = r0 * v2.v;
	o1 = uintBitsToFloat(uvec4(0x3f000000, 0x3f000000, 0x3f000000, 0x00000000));
	o2 = uintBitsToFloat(uvec4(0x00000000, 0x00000000, 0x00000000, 0x00000000));
	return;
}

