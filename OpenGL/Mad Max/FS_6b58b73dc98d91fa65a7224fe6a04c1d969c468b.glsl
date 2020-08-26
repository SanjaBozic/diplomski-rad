#version 460 core
// ps_5_0
// Checksum: 1563057e_385ff2ef_513a7776_7b13b8d1
// Name: lightsource

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

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
	r0.xyz = fma(idx_uniforms0_ps.cb0[13].www, vec3(1.00000000f, 1.79999995f, 2.79999995f), vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.xyz = r0.xyz * -v2.v.www;
	r0.xyz = exp2(r0.xyz);
	r0.xyz = min(r0.xyz, vec3(1.00000000f, 1.00000000f, 1.00000000f));
	r0.w = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).yzwx).w;
	r1.xyz = r0.www * v2.v.xyz;
	o0.xyz = r0.xyz * r1.xyz;
	o0.w = uintBitsToFloat(uint(0x3f800000));
	return;
}

