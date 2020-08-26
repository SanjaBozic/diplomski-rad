#version 460 core
// ps_5_0
// Checksum: 1bf3b004_c625fcb8_a2644aba_fc7df1cb
// Name: particlerefractioneffect

layout(location = 1) in idx_Varying1 { vec4 v; } v1;
layout(location = 2) in idx_Varying2 { vec4 v; } v2;
layout(location = 0) out vec4 o0;
vec4 r0, r1;

// Uniform buffer declarations (dcl_constant_buffer)


// Sampler/resource pairs

uniform sampler2D resourceSamplerPair_0_ps; // res0, s0

uniform sampler2D resourceSamplerPair_1_ps; // res1, s1


void Initialise()
{
}


void main()
{
	Initialise();
	r0.xy = v2.v.xy / v2.v.ww;
	r1.xyz = ((texture(resourceSamplerPair_0_ps, v1.v.xy)).xywz).xyz;
	r0.zw = fma(r1.yz, vec2(2.00000000f, 2.00000000f), vec2(-1.00000000f, -1.00000000f));
	o0.w = r1.x * v1.v.w;
	r0.xy = fma(r0.zw, v1.v.zz, r0.xy);
	r0.xyz = ((texture(resourceSamplerPair_1_ps, r0.xy))).xyz;
	o0.xyz = r0.xyz;
	return;
}

