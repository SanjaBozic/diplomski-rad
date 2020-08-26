#version 460 core
// ps_5_0
// Checksum: 638cbdb8_a09f200b_10790b85_065513d7
// Name: twister

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1, r2;

// Uniform buffer declarations (dcl_constant_buffer)

layout (std140) uniform cb_ps0 { vec4 cb0[14]; } idx_uniforms0_ps;


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0


void Initialise()
{
}


void main()
{
	Initialise();
	r0.x = uintBitsToFloat(uint(0x3f800000));
	r0.yzw = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0 = r0 * -v2.v.zzzz;
	r0 = exp2(r0);
	r0 = min(r0, vec4(1.00000000f, 1.00000000f, 1.00000000f, 1.00000000f));
	r0.x = -r0.x + float(1.00000000f);
	r1.xyz = r0.xxx * idx_uniforms0_ps.cb0[13].xyz;
	r2 = (texture(resourceSamplerPair_0_ps, v2.v.xy));
	r2 = r2 * v1.v;
	o0.xyz = fma(r2.xyz, r0.yzw, r1.xyz);
	o0.w = r2.w;
	return;
}

